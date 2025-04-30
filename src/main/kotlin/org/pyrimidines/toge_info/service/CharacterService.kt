package org.pyrimidines.toge_info.service

import org.pyrimidines.toge_info.entity.Character
import org.pyrimidines.toge_info.repository.CharacterRepository
import org.springframework.stereotype.Service

@Service
class CharacterService(private val repository: CharacterRepository) {
    fun create(character: Character): Character = repository.save(character)
    fun getById(id: Int): Character? = repository.findById(id).orElse(null)
    fun getAll(): List<Character> = repository.findAll()
    fun update(id: Int, character: Character): Character? =
        if (repository.existsById(id)) repository.save(character) else null
    fun delete(id: Int) = repository.deleteById(id)
}
