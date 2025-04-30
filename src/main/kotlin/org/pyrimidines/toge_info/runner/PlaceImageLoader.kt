package org.pyrimidines.toge_info.runner

import org.pyrimidines.toge_info.entity.PlaceImage
import org.pyrimidines.toge_info.repository.PlaceImageRepository
import org.pyrimidines.toge_info.repository.PlaceRepository
import org.springframework.boot.CommandLineRunner
import org.springframework.stereotype.Component
import java.io.File

@Component
class PlaceImageLoader(
    private val placeRepository: PlaceRepository,
    private val placeImageRepository: PlaceImageRepository
) : CommandLineRunner {
    override fun run(vararg args: String?) {
        // 이미지가 저장된 루트 디렉터리 (예: src/main/resources/static/pilgrimage)
        val rootDir = File("src/main/resources/static/pilgrimage")

        // 모든 Place 엔티티 (places 테이블) 순회
        val places = placeRepository.findAll()
        places.forEach { place ->
            // 각 Place의 id에 해당하는 폴더 경로 생성
            val placeDir = File(rootDir, place.id.toString())
            if (placeDir.exists() && placeDir.isDirectory) {
                // 폴더 내의 파일 중 HTML 파일은 제외하고 이름 순으로 정렬 (이미지 파일 기준)
                val imageFiles = placeDir.listFiles { file ->
                    file.isFile && file.extension.lowercase() == "webp"
                }?.sortedBy { it.name } ?: emptyList()

                imageFiles.forEachIndexed { index, file ->
                    // URL 경로는 nginx가 서빙할 때 사용 (예: /pilgrimage/1/파일명)
                    val imageUrl = "/pilgrimage/${place.id}/${file.name}"

                    // 이미지와 동일한 기본 이름의 HTML 파일 체크 (예: image.jpg -> image.html)
                    val baseName = file.nameWithoutExtension
                    val htmlFile = File(placeDir, "$baseName.html")
                    val descriptionUrl = if (htmlFile.exists()) {
                        "/pilgrimage/${place.id}/${htmlFile.name}"
                    } else null

                    // 기존에 동일 imageUrl의 레코드가 있는지 확인
                    val existingPlaceImage = placeImageRepository.findByPlacesAndImageUrl(place, imageUrl)
                    if (existingPlaceImage == null) {
                        // 레코드가 없으면 새로 생성
                        val placeImage = PlaceImage(
                            imageUrl = imageUrl,
                            displayOrder = index, // 정렬 순서를 index로 지정 (낮은 숫자가 우선)
                            caption = file.name,  // 예시로 파일명을 캡션으로 사용
                            description = descriptionUrl,
                            places = place
                        )
                        placeImageRepository.save(placeImage)
                    } else {
                        // 레코드가 존재하지만 description이 null인 경우 업데이트
                        if (existingPlaceImage.description == null && descriptionUrl != null) {
                            existingPlaceImage.description = descriptionUrl
                            placeImageRepository.save(existingPlaceImage)
                        }
                    }
                }
                println("Place id ${place.id}: ${imageFiles.size}개의 이미지 스캔 완료.")
            } else {
                println("Place id ${place.id}에 해당하는 폴더가 존재하지 않습니다: ${placeDir.absolutePath}")
            }
        }
    }
}
