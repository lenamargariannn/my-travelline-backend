package com.mytravelline.tour;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface TourRepository extends JpaRepository<Tour, UUID> {

    Optional<Tour> findBySlug(String slug);

    boolean existsBySlug(String slug);

    Page<Tour> findByStatus(TourStatus status, Pageable pageable);

    List<Tour> findByFeaturedTrueAndStatus(TourStatus status);

    @Query("SELECT t FROM Tour t WHERE t.status = :status " +
           "AND (:categoryId IS NULL OR t.category.id = :categoryId) " +
           "AND (:destinationId IS NULL OR t.destination.id = :destinationId)")
    Page<Tour> findWithFilters(
            @Param("status") TourStatus status,
            @Param("categoryId") UUID categoryId,
            @Param("destinationId") UUID destinationId,
            Pageable pageable
    );
}
