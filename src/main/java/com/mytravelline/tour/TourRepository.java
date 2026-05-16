package com.mytravelline.tour;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TourRepository extends JpaRepository<Tour, Long> {
    Optional<Tour> findBySlug(String slug);
    Page<Tour> findAllByStatus(TourStatus status, Pageable pageable);
}
