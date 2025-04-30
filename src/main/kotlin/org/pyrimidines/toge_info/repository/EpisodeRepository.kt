package org.pyrimidines.toge_info.repository

import org.pyrimidines.toge_info.entity.Episode
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface EpisodeRepository : JpaRepository<Episode, Int>{

}
