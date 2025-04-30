package org.pyrimidines.toge_info.controller

import org.pyrimidines.toge_info.entity.Places
import org.pyrimidines.toge_info.service.PlaceService
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/places")
class PlaceController(private val service: PlaceService) {

    @PostMapping
    fun create(@RequestBody places: Places): ResponseEntity<Places> {
        val saved = service.create(places)
        return ResponseEntity(saved, HttpStatus.CREATED)
    }

    @GetMapping("/{id}")
    fun get(@PathVariable id: Int): ResponseEntity<Places> {
        val place = service.getById(id)
        return place?.let { ResponseEntity(it, HttpStatus.OK) }
            ?: ResponseEntity.notFound().build()
    }

    @GetMapping("/search")
    fun searchPlaces(
        @RequestParam(required = false) region: String?,
        @RequestParam(required = false) season: String?
    ): ResponseEntity<List<Places>> {
        val places = when {
            region != null -> service.getByRegion(region)
            season != null -> service.getBySeason(season)
            else -> return ResponseEntity.badRequest().build() // 둘 다 없으면 Bad Request 반환
        }
        return ResponseEntity(places, HttpStatus.OK)
    }


    @GetMapping
    fun getAll(): ResponseEntity<List<Places>> =
        ResponseEntity(service.getAll(), HttpStatus.OK)

    @PutMapping("/{id}")
    fun update(@PathVariable id: Int, @RequestBody places: Places): ResponseEntity<Places> {
        val updated = service.update(id, places)
        return if (updated != null) ResponseEntity(updated, HttpStatus.OK)
        else ResponseEntity(HttpStatus.NOT_FOUND)
    }

    @DeleteMapping("/{id}")
    fun delete(@PathVariable id: Int): ResponseEntity<Void> {
        service.delete(id)
        return ResponseEntity(HttpStatus.NO_CONTENT)
    }
}
