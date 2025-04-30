package org.pyrimidines.toge_info.entity

import jakarta.persistence.*
import org.hibernate.annotations.CreationTimestamp
import java.time.LocalDateTime

@Entity
@Table(name = "place_image")
data class PlaceImage(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int = 0,
    var imageUrl: String,
    var displayOrder: Int = 0,
    var caption: String? = null,
    var description: String? = null,
    @CreationTimestamp
    @Column(name = "upload_date", nullable = false, updatable = false)
    var uploadDate: LocalDateTime? = null,
    @ManyToOne
    @JoinColumn(name = "place_id")
    var places: Places
)
