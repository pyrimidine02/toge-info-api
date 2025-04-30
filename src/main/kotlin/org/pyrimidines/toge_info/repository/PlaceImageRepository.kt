package org.pyrimidines.toge_info.repository

import org.pyrimidines.toge_info.entity.Places
import org.pyrimidines.toge_info.entity.PlaceImage
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface PlaceImageRepository : JpaRepository<PlaceImage, Int>{
    fun existsByPlacesAndImageUrl(places: Places, imageUrl: String): Boolean
    fun findByPlacesAndImageUrl(places: Places, imageUrl: String): PlaceImage?
    fun findPlaceImagesByPlaces_Id(placeId: Int): List<PlaceImage>
}
