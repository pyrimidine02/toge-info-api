package org.pyrimidines.toge_info.entity

import jakarta.persistence.Entity
import jakarta.persistence.Id
import jakarta.persistence.Table

@Entity
@Table(name = "episode")
data class Episode(
    @Id
    val id: Int,
    var episodeSeason: String,
    var episodeNumber: Int,
    var title: String,
    var japaneseTitle: String,
    var description: String? = null
)
