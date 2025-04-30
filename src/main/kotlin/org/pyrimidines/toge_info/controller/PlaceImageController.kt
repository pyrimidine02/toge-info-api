package org.pyrimidines.toge_info.controller

import org.pyrimidines.toge_info.entity.PlaceImage
import org.pyrimidines.toge_info.service.PlaceImageService
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/place-image")
class PlaceImageController(private val service: PlaceImageService) {

    @PostMapping
    fun create(@RequestBody placeImage: PlaceImage): ResponseEntity<PlaceImage> {
        val saved = service.create(placeImage)
        return ResponseEntity(saved, HttpStatus.CREATED)
    }

    @GetMapping("/{id}")
    fun get(@PathVariable id: Int): ResponseEntity<PlaceImage> {
        val placeImage = service.getById(id)
        return if (placeImage != null) ResponseEntity(placeImage, HttpStatus.OK)
        else ResponseEntity(HttpStatus.NOT_FOUND)
    }

    @GetMapping("/search")
    fun getByPlacesId(@RequestParam("placeid") placeId: Int): ResponseEntity<List<PlaceImage>> {
        val placeImages = service.getByPlaceId(placeId)
        return if (placeImages.isNullOrEmpty()) {
            ResponseEntity(HttpStatus.NOT_FOUND)
        } else {
            ResponseEntity(placeImages, HttpStatus.OK)
        }
    }


    @GetMapping
    fun getAll(): ResponseEntity<List<PlaceImage>> =
        ResponseEntity(service.getAll(), HttpStatus.OK)

    @PutMapping("/{id}")
    fun update(@PathVariable id: Int, @RequestBody placeImage: PlaceImage): ResponseEntity<PlaceImage> {
        val updated = service.update(id, placeImage)
        return if (updated != null) ResponseEntity(updated, HttpStatus.OK)
        else ResponseEntity(HttpStatus.NOT_FOUND)
    }

    @DeleteMapping("/{id}")
    fun delete(@PathVariable id: Int): ResponseEntity<Void> {
        service.delete(id)
        return ResponseEntity(HttpStatus.NO_CONTENT)
    }
}
