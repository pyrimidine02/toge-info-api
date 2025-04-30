package org.pyrimidines.toge_info.controller

import org.pyrimidines.toge_info.entity.Appearance
import org.pyrimidines.toge_info.entity.AppearanceId
import org.pyrimidines.toge_info.service.AppearanceService
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/appearances")
class AppearanceController(private val service: AppearanceService) {

    @PostMapping
    fun create(@RequestBody appearance: Appearance): ResponseEntity<Appearance> {
        val saved = service.create(appearance)
        return ResponseEntity(saved, HttpStatus.CREATED)
    }

    @GetMapping("/{placeId}/{episodeId}/{characterId}")
    fun get(
        @PathVariable placeId: Int,
        @PathVariable episodeId: Int,
        @PathVariable characterId: Int
    ): ResponseEntity<Appearance> {
        val id = AppearanceId(placeId, episodeId, characterId)
        val app = service.getById(id)
        return if (app != null) ResponseEntity(app, HttpStatus.OK)
        else ResponseEntity(HttpStatus.NOT_FOUND)
    }

    @GetMapping
    fun getAll(): ResponseEntity<List<Appearance>> =
        ResponseEntity(service.getAll(), HttpStatus.OK)

    @PutMapping("/{placeId}/{episodeId}/{characterId}")
    fun update(
        @PathVariable placeId: Int,
        @PathVariable episodeId: Int,
        @PathVariable characterId: Int,
        @RequestBody appearance: Appearance
    ): ResponseEntity<Appearance> {
        val id = AppearanceId(placeId, episodeId, characterId)
        val updated = service.update(id, appearance)
        return if (updated != null) ResponseEntity(updated, HttpStatus.OK)
        else ResponseEntity(HttpStatus.NOT_FOUND)
    }

    @DeleteMapping("/{placeId}/{episodeId}/{characterId}")
    fun delete(
        @PathVariable placeId: Int,
        @PathVariable episodeId: Int,
        @PathVariable characterId: Int
    ): ResponseEntity<Void> {
        val id = AppearanceId(placeId, episodeId, characterId)
        service.delete(id)
        return ResponseEntity(HttpStatus.NO_CONTENT)
    }
}
