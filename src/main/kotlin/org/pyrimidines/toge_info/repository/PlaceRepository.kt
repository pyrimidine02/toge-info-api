package org.pyrimidines.toge_info.repository

import org.pyrimidines.toge_info.entity.Places
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface PlaceRepository : JpaRepository<Places, Int>{
    fun findByRegion(region: String): List<Places>
    fun findBySeason(season: String): List<Places>
}
