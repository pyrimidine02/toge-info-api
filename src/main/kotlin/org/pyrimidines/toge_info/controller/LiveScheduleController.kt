package org.pyrimidines.toge_info.controller

import org.pyrimidines.toge_info.entity.LiveSchedule
import org.pyrimidines.toge_info.entity.PlaceImage
import org.pyrimidines.toge_info.service.LiveScheduleService
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*


@RestController
@RequestMapping("/lives")
class LiveScheduleController(private val service: LiveScheduleService) {

    @GetMapping
    fun getAll(): ResponseEntity<List<LiveSchedule>> =
        ResponseEntity(service.getAll(), HttpStatus.OK)

    @GetMapping("/{id}")
    fun get(@PathVariable id: Int): ResponseEntity<LiveSchedule> {
        val liveSchedule = service.getById(id)
        return if (liveSchedule != null) ResponseEntity(liveSchedule, HttpStatus.OK)
        else ResponseEntity(HttpStatus.NOT_FOUND)
    }
}