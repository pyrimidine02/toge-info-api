package org.pyrimidines.toge_info.service

import org.pyrimidines.toge_info.entity.LiveSchedule
import org.pyrimidines.toge_info.repository.LiveScheduleRepository
import org.springframework.stereotype.Service

@Service
class LiveScheduleService(private val repository: LiveScheduleRepository) {
    fun create(liveSchedule :LiveSchedule): LiveSchedule = repository.save(liveSchedule)
    fun getAll(): List<LiveSchedule> = repository.findAll()
    fun getById(id: Int): LiveSchedule? = repository.findById(id).orElse(null)
}