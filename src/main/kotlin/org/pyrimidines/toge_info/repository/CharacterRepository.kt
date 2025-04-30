package org.pyrimidines.toge_info.repository

import org.pyrimidines.toge_info.entity.Character
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface CharacterRepository : JpaRepository<Character, Int>{

}
