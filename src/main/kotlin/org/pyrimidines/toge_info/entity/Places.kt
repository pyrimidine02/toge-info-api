package org.pyrimidines.toge_info.entity

import jakarta.persistence.Entity
import jakarta.persistence.Id
import jakarta.persistence.Table

@Entity
@Table(name = "places")
data class Places(
    @Id
    val id: Int,
    var title: String,
    var description: String? = null,
    var lat: Double,
    var lng: Double,
    var region: String? = null,
    var season: String?= null,
)
