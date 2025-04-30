package org.pyrimidines.toge_info.runner

import org.pyrimidines.toge_info.repository.LiveScheduleRepository
import org.springframework.boot.CommandLineRunner
import org.springframework.stereotype.Component
import java.io.File

@Component
class PosterImageLoader(
    private val liveScheduleRepository: LiveScheduleRepository,
) : CommandLineRunner {
    override fun run(vararg args: String?) {
        val rootDir = File("src/main/resources/static/poster")

        val liveSchedules = liveScheduleRepository.findAll()
        liveSchedules.forEach { liveSchedule ->
            // imageUrl이 null이면 업데이트 진행
            if (liveSchedule.imageUrl == null) {
                // liveSchedule의 id를 폴더명으로 갖는 디렉터리 경로 생성
                val posterDir = File(rootDir, liveSchedule.id.toString())
                if (posterDir.exists() && posterDir.isDirectory) {
                    // 폴더 내의 파일들을 이름 순으로 정렬
                    val imageFiles = posterDir.listFiles { file -> file.isFile }?.sortedBy { it.name } ?: emptyList()
                    if (imageFiles.isNotEmpty()) {
                        // 첫 번째 파일의 이름을 사용하여 URL 경로 생성 (예: /poster/1/파일명)
                        val imageUrl = "/poster/${liveSchedule.id}/${imageFiles.first().name}"
                        liveSchedule.imageUrl = imageUrl
                        liveScheduleRepository.save(liveSchedule)
                        println("LiveSchedule id ${liveSchedule.id} 이미지 스캔 완료.: $imageUrl")
                    } else {
                        println("LiveSchedule id ${liveSchedule.id} 폴더에 이미지 파일이 없습니다.")
                    }
                } else {
                    println("LiveSchedule id ${liveSchedule.id}에 해당하는 폴더가 존재하지 않습니다: ${posterDir.absolutePath}")
                }
            }
        }
    }
}
