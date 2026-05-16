package com.mytravelline.tour;

import com.mytravelline.tour.dto.TourDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/tours")
public class TourController {

    private final TourService service;

    public TourController(TourService service) {
        this.service = service;
    }

    @GetMapping
    public Page<TourDto> list(Pageable pageable) {
        return service.listPublished(pageable);
    }

    @GetMapping("/{slug}")
    public TourDto getBySlug(@PathVariable String slug) {
        return service.getBySlug(slug);
    }
}
