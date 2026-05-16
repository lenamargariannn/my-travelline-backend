package com.mytravelline.review;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ReviewRepository extends JpaRepository<Review, UUID> {

    Page<Review> findByApprovedTrueOrderByCreatedAtDesc(Pageable pageable);

    List<Review> findByTourIdAndApprovedTrue(UUID tourId);

    Page<Review> findAllByOrderByCreatedAtDesc(Pageable pageable);

    long countByApproved(Boolean approved);
}
