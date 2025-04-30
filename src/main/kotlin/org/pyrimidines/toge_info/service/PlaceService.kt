package org.pyrimidines.toge_info.service

import org.pyrimidines.toge_info.entity.Places
import org.pyrimidines.toge_info.repository.PlaceRepository
import org.springframework.stereotype.Service

@Service
class PlaceService(private val repository: PlaceRepository) {
    fun create(places: Places): Places = repository.save(places)
    fun getById(id: Int): Places? = repository.findById(id).orElse(null)
    fun getAll(): List<Places> = repository.findAll()
    fun getByRegion(region: String): List<Places> = repository.findByRegion(region)
    fun getBySeason(season: String): List<Places> = repository.findBySeason(season)
    fun update(id: Int, places: Places): Places? =
        if (repository.existsById(id)) repository.save(places) else null
    fun delete(id: Int) = repository.deleteById(id)
}
