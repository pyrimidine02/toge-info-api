package org.pyrimidines.toge_info.entity

import com.fasterxml.jackson.annotation.JsonProperty
import jakarta.persistence.Entity
import jakarta.persistence.Id
import jakarta.persistence.Table
import java.time.LocalDate

@Entity
@Table(name = "characters")
data class Character(
    @Id
    val id: Int,
    var name: String,
    var japaneseName: String,
    var birthday: LocalDate? = null,
    var birthplace: String? = null,
    var height: Double? = null,
    var bloodType: String? = null,
    var favoriteFood: String? = null,
    var hobby: String? = null,
    var affiliation: String? = null,
    var position: String? = null,
    var voiceActor: String? = null
)
