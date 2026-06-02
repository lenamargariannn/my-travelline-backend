package com.mytravelline.tour;

import com.mytravelline.common.PageResponse;
import com.mytravelline.tour.dto.CreateTourRequest;
import com.mytravelline.tour.dto.TourDto;
import com.mytravelline.tour.dto.TourImageDto;
import com.mytravelline.tour.dto.TourSummaryDto;
import com.mytravelline.tour.dto.UpdateTourRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class TourController {

    private final TourService tourService;

    // ===== Public endpoints =====

    @GetMapping("/api/tours")
    public ResponseEntity<PageResponse<TourSummaryDto>> getTours(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "12") int size,
            @RequestParam(required = false) String category,
            @RequestParam(required = false) String destination,
            @RequestParam(required = false) String search,
            @RequestParam(required = false) String currency) {

        PageResponse<TourSummaryDto> response;

        if (search != null && !search.isBlank()) {
            response = tourService.searchTours(search, page, size, currency);
        } else if (category != null && !category.isBlank()) {
            response = tourService.getToursByCategory(category, page, size, currency);
        } else if (destination != null && !destination.isBlank()) {
            response = tourService.getToursByDestination(destination, page, size, currency);
        } else {
            response = tourService.getPublishedTours(page, size, currency);
        }

        return ResponseEntity.ok(response);
    }

    @GetMapping("/api/tours/featured")
    public ResponseEntity<List<TourSummaryDto>> getFeaturedTours(
            @RequestParam(required = false) String currency) {
        return ResponseEntity.ok(tourService.getFeaturedTours(currency));
    }

    @GetMapping("/api/tours/{slug}")
    public ResponseEntity<TourDto> getTourBySlug(
            @PathVariable String slug,
            @RequestParam(required = false) String currency) {
        return ResponseEntity.ok(tourService.getTourBySlug(slug, currency));
    }

    // ===== Admin endpoints =====

    @GetMapping("/api/admin/tours")
    public ResponseEntity<PageResponse<TourSummaryDto>> getAllTours(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        return ResponseEntity.ok(tourService.getAllTours(page, size));
    }

    @GetMapping("/api/admin/tours/{id}")
    public ResponseEntity<TourDto> getTourById(@PathVariable Long id) {
        return ResponseEntity.ok(tourService.getTourById(id));
    }

    @PostMapping("/api/admin/tours")
    public ResponseEntity<TourDto> createTour(@Valid @RequestBody CreateTourRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(tourService.createTour(request));
    }

    @PutMapping("/api/admin/tours/{id}")
    public ResponseEntity<TourDto> updateTour(
            @PathVariable Long id,
            @Valid @RequestBody UpdateTourRequest request) {
        return ResponseEntity.ok(tourService.updateTour(id, request));
    }

    @PatchMapping("/api/admin/tours/{id}/status")
    public ResponseEntity<TourDto> updateTourStatus(
            @PathVariable Long id,
            @RequestBody Map<String, String> body) {
        TourStatus status = TourStatus.valueOf(body.get("status").toUpperCase());
        return ResponseEntity.ok(tourService.updateTourStatus(id, status));
    }

    @PostMapping(value = "/api/admin/tours/{id}/images", consumes = "multipart/form-data")
    public ResponseEntity<TourImageDto> uploadTourImage(
            @PathVariable Long id,
            @RequestParam("file") MultipartFile file,
            @RequestParam(required = false) String caption,
            @RequestParam(defaultValue = "0") Integer sortOrder,
            @RequestParam(defaultValue = "false") boolean main) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(tourService.uploadTourImage(id, file, caption, sortOrder, main));
    }

    @DeleteMapping("/api/admin/tours/{tourId}/images/{imageId}")
    public ResponseEntity<Void> deleteTourImage(
            @PathVariable Long tourId,
            @PathVariable Long imageId) {
        tourService.deleteTourImage(tourId, imageId);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/api/admin/tours/{id}")
    public ResponseEntity<Void> deleteTour(@PathVariable Long id) {
        tourService.deleteTour(id);
        return ResponseEntity.noContent().build();
    }
}
