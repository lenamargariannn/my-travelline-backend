package com.mytravelline.review;

import com.mytravelline.common.PageResponse;
import com.mytravelline.common.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ReviewService {

    private final ReviewRepository reviewRepository;

    // ===== Public methods =====

    public PageResponse<ReviewDto> getApprovedReviews(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Review> reviews = reviewRepository.findByApprovedTrueOrderByCreatedAtDesc(pageable);
        return toPageResponse(reviews);
    }

    public List<ReviewDto> getApprovedReviewsByTour(Long tourId) {
        return reviewRepository.findByTourIdAndApprovedTrue(tourId).stream()
                .map(this::toDto)
                .toList();
    }

    // ===== Admin methods =====

    public PageResponse<ReviewDto> getAllReviews(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Review> reviews = reviewRepository.findAllByOrderByCreatedAtDesc(pageable);
        return toPageResponse(reviews);
    }

    public ReviewDto getReviewById(Long id) {
        Review review = reviewRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Review", "id", id));
        return toDto(review);
    }

    @Transactional
    public ReviewDto approveReview(Long id) {
        Review review = reviewRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Review", "id", id));
        review.setApproved(true);
        review = reviewRepository.save(review);
        return toDto(review);
    }

    @Transactional
    public ReviewDto rejectReview(Long id) {
        Review review = reviewRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Review", "id", id));
        review.setApproved(false);
        review = reviewRepository.save(review);
        return toDto(review);
    }

    @Transactional
    public void deleteReview(Long id) {
        if (!reviewRepository.existsById(id)) {
            throw new ResourceNotFoundException("Review", "id", id);
        }
        reviewRepository.deleteById(id);
    }

    public long countPendingReviews() {
        return reviewRepository.countByApprovedFalse();
    }

    private ReviewDto toDto(Review review) {
        return ReviewDto.builder()
                .id(review.getId())
                .authorName(review.getAuthorName())
                .authorLocation(review.getAuthorLocation())
                .rating(review.getRating())
                .content(review.getContent())
                .approved(review.isApproved())
                .tourId(review.getTour() != null ? review.getTour().getId() : null)
                .tourTitle(review.getTour() != null ? review.getTour().getTitle() : null)
                .createdAt(review.getCreatedAt())
                .build();
    }

    private PageResponse<ReviewDto> toPageResponse(Page<Review> page) {
        List<ReviewDto> content = page.getContent().stream()
                .map(this::toDto)
                .toList();
        return PageResponse.of(content, page.getNumber(), page.getSize(),
                page.getTotalElements(), page.getTotalPages(), page.isLast());
    }
}
