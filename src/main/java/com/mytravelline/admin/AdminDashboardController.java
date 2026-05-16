package com.mytravelline.admin;

import com.mytravelline.booking.BookingService;
import com.mytravelline.contact.ContactService;
import com.mytravelline.review.ReviewService;
import com.mytravelline.tour.TourRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/admin/dashboard")
@RequiredArgsConstructor
public class AdminDashboardController {

    private final TourRepository tourRepository;
    private final BookingService bookingService;
    private final ContactService contactService;
    private final ReviewService reviewService;

    @GetMapping
    public ResponseEntity<Map<String, Object>> getDashboardStats() {
        Map<String, Object> stats = Map.of(
                "totalTours", tourRepository.count(),
                "newBookings", bookingService.countNewBookings(),
                "unreadMessages", contactService.countUnread(),
                "pendingReviews", reviewService.countPendingReviews()
        );
        return ResponseEntity.ok(stats);
    }
}
