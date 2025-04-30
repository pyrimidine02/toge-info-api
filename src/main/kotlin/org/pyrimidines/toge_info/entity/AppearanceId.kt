package org.pyrimidines.toge_info.entity

import jakarta.persistence.Embeddable
import java.io.Serializable

@Embeddable
data class AppearanceId(
    val placeId: Int = 0,
    val episodeId: Int = 0,
    val characterId: Int = 0
) : Serializable
