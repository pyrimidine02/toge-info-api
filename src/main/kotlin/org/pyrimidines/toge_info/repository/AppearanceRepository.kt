package org.pyrimidines.toge_info.repository

import org.pyrimidines.toge_info.entity.Appearance
import org.pyrimidines.toge_info.entity.AppearanceId
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface AppearanceRepository : JpaRepository<Appearance, AppearanceId>{

}
