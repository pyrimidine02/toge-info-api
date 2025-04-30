package org.pyrimidines.toge_info.service

import org.pyrimidines.toge_info.entity.Episode
import org.pyrimidines.toge_info.repository.EpisodeRepository
import org.springframework.stereotype.Service

@Service
class EpisodeService(private val repository: EpisodeRepository) {
    fun create(episode: Episode): Episode = repository.save(episode)
    fun getById(id: Int): Episode? = repository.findById(id).orElse(null)
    fun getAll(): List<Episode> = repository.findAll()
    fun update(id: Int, episode: Episode): Episode? =
        if (repository.existsById(id)) repository.save(episode) else null
    fun delete(id: Int) = repository.deleteById(id)
}
