package com.mytravelline.review;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {

    Page<Review> findByApprovedTrueOrderByCreatedAtDesc(Pageable pageable);

    List<Review> findByTourIdAndApprovedTrue(Long tourId);

    Page<Review> findAllByOrderByCreatedAtDesc(Pageable pageable);

    long countByApprovedFalse();
}
