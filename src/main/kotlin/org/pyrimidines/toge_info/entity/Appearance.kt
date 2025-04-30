package org.pyrimidines.toge_info.entity

import jakarta.persistence.*

@Entity
@Table(name = "appearance")
data class Appearance(
    @EmbeddedId
    val id: AppearanceId,
    @ManyToOne
    @MapsId("placeId")
    @JoinColumn(name = "place_id")
    val places: Places,
    @ManyToOne
    @MapsId("episodeId")
    @JoinColumn(name = "episode_id")
    val episode: Episode,
    @ManyToOne
    @MapsId("characterId")
    @JoinColumn(name = "character_id")
    val character: Character
)
