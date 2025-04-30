package org.pyrimidines.toge_info.controller

import org.pyrimidines.toge_info.entity.Episode
import org.pyrimidines.toge_info.service.EpisodeService
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/episodes")
class EpisodeController(private val service: EpisodeService) {

    @PostMapping
    fun create(@RequestBody episode: Episode): ResponseEntity<Episode> {
        val saved = service.create(episode)
        return ResponseEntity(saved, HttpStatus.CREATED)
    }

    @GetMapping("/{id}")
    fun get(@PathVariable id: Int): ResponseEntity<Episode> {
        val episode = service.getById(id)
        return if (episode != null) ResponseEntity(episode, HttpStatus.OK)
        else ResponseEntity(HttpStatus.NOT_FOUND)
    }

    @GetMapping
    fun getAll(): ResponseEntity<List<Episode>> =
        ResponseEntity(service.getAll(), HttpStatus.OK)

    @PutMapping("/{id}")
    fun update(@PathVariable id: Int, @RequestBody episode: Episode): ResponseEntity<Episode> {
        val updated = service.update(id, episode)
        return if (updated != null) ResponseEntity(updated, HttpStatus.OK)
        else ResponseEntity(HttpStatus.NOT_FOUND)
    }

    @DeleteMapping("/{id}")
    fun delete(@PathVariable id: Int): ResponseEntity<Void> {
        service.delete(id)
        return ResponseEntity(HttpStatus.NO_CONTENT)
    }
}
