package org.pyrimidines.toge_info.service

import org.pyrimidines.toge_info.entity.Appearance
import org.pyrimidines.toge_info.entity.AppearanceId
import org.pyrimidines.toge_info.repository.AppearanceRepository
import org.springframework.stereotype.Service

@Service
class AppearanceService(private val repository: AppearanceRepository) {
    fun create(appearance: Appearance): Appearance = repository.save(appearance)
    fun getById(id: AppearanceId): Appearance? = repository.findById(id).orElse(null)
    fun getAll(): List<Appearance> = repository.findAll()
    fun update(id: AppearanceId, appearance: Appearance): Appearance? =
        if (repository.existsById(id)) repository.save(appearance) else null
    fun delete(id: AppearanceId) = repository.deleteById(id)
}
