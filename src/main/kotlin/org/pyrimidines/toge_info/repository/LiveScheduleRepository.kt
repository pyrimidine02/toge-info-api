package org.pyrimidines.toge_info.repository


import org.pyrimidines.toge_info.entity.LiveSchedule
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface LiveScheduleRepository : JpaRepository<LiveSchedule, Int> {
    fun findByCategory(category: String): List<LiveSchedule>
}