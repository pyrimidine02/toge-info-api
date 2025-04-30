package org.pyrimidines.toge_info.service

import org.pyrimidines.toge_info.entity.PlaceImage
import org.pyrimidines.toge_info.repository.PlaceImageRepository
import org.springframework.stereotype.Service

@Service
class PlaceImageService(private val repository: PlaceImageRepository) {
    fun create(placeImage: PlaceImage): PlaceImage = repository.save(placeImage)
    fun getById(id: Int): PlaceImage? = repository.findById(id).orElse(null)
    fun getByPlaceId(placeId: Int): List<PlaceImage> = repository.findPlaceImagesByPlaces_Id(placeId)
    fun getAll(): List<PlaceImage> = repository.findAll()
    fun update(id: Int, placeImage: PlaceImage): PlaceImage? =
        if (repository.existsById(id)) repository.save(placeImage) else null
    fun delete(id: Int) = repository.deleteById(id)
}
