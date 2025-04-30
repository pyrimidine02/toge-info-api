package org.pyrimidines.toge_info.controller

import org.pyrimidines.toge_info.entity.Character
import org.pyrimidines.toge_info.service.CharacterService
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/characters")
class CharacterController(private val service: CharacterService) {

    @PostMapping
    fun create(@RequestBody character: Character): ResponseEntity<Character> {
        val saved = service.create(character)
        return ResponseEntity(saved, HttpStatus.CREATED)
    }

    @GetMapping("/{id}")
    fun get(@PathVariable id: Int): ResponseEntity<Character> {
        val character = service.getById(id)
        return if (character != null) ResponseEntity(character, HttpStatus.OK)
        else ResponseEntity.notFound().build()
    }

    @GetMapping
    fun getAll(): ResponseEntity<List<Character>> =
        ResponseEntity(service.getAll(), HttpStatus.OK)

    @PutMapping("/{id}")
    fun update(@PathVariable id: Int, @RequestBody character: Character): ResponseEntity<Character> {
        val updated = service.update(id, character)
        return if (updated != null) ResponseEntity(updated, HttpStatus.OK)
        else ResponseEntity.notFound().build()
    }

    @DeleteMapping("/{id}")
    fun delete(@PathVariable id: Int): ResponseEntity<Void> {
        service.delete(id)
        return ResponseEntity.noContent().build()
    }
}
