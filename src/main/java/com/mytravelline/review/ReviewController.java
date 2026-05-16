package com.mytravelline.review;

import com.mytravelline.common.PageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class ReviewController {

    private final ReviewService reviewService;

    // ===== Public endpoints =====

    @GetMapping("/api/reviews")
    public ResponseEntity<PageResponse<ReviewDto>> getApprovedReviews(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        return ResponseEntity.ok(reviewService.getApprovedReviews(page, size));
    }

    @GetMapping("/api/reviews/tour/{tourId}")
    public ResponseEntity<List<ReviewDto>> getReviewsByTour(@PathVariable Long tourId) {
        return ResponseEntity.ok(reviewService.getApprovedReviewsByTour(tourId));
    }

    // ===== Admin endpoints =====

    @GetMapping("/api/admin/reviews")
    public ResponseEntity<PageResponse<ReviewDto>> getAllReviews(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        return ResponseEntity.ok(reviewService.getAllReviews(page, size));
    }

    @GetMapping("/api/admin/reviews/{id}")
    public ResponseEntity<ReviewDto> getReviewById(@PathVariable Long id) {
        return ResponseEntity.ok(reviewService.getReviewById(id));
    }

    @PatchMapping("/api/admin/reviews/{id}/approve")
    public ResponseEntity<ReviewDto> approveReview(@PathVariable Long id) {
        return ResponseEntity.ok(reviewService.approveReview(id));
    }

    @PatchMapping("/api/admin/reviews/{id}/reject")
    public ResponseEntity<ReviewDto> rejectReview(@PathVariable Long id) {
        return ResponseEntity.ok(reviewService.rejectReview(id));
    }

    @DeleteMapping("/api/admin/reviews/{id}")
    public ResponseEntity<Void> deleteReview(@PathVariable Long id) {
        reviewService.deleteReview(id);
        return ResponseEntity.noContent().build();
    }
}
