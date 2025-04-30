package org.pyrimidines.toge_info.entity

import jakarta.persistence.*
import java.time.LocalDate
import java.time.LocalTime
import com.fasterxml.jackson.module.kotlin.jacksonObjectMapper
import com.fasterxml.jackson.module.kotlin.readValue

@Entity
@Table(name = "live_schedule")
data class LiveSchedule(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int = 0,

    @Column(length = 255, nullable = false)
    val category: String,

    @Column(length = 255, nullable = false)
    val title: String,

    @Column(name = "event_date", nullable = false)
    val date: LocalDate,

    @Column(length = 255, nullable = false)
    val location: String,

    @Column(name = "event_time")
    val time: LocalTime? = null,

    @Column(columnDefinition = "TEXT")
    val description: String? = null,

    @Convert(converter = StringListConverter::class)
    @Column(columnDefinition = "JSON")
    val guests: List<String>? = null,

    @Column
    val ticketLink: String? = null,

    var imageUrl: String
)

@Converter
class StringListConverter : AttributeConverter<List<String>, String> {
    private val objectMapper = jacksonObjectMapper()

    override fun convertToDatabaseColumn(attribute: List<String>?): String? {
        return attribute?.let { objectMapper.writeValueAsString(it) }
    }

    override fun convertToEntityAttribute(dbData: String?): List<String>? {
        return dbData?.let { objectMapper.readValue(it) }
    }
}
