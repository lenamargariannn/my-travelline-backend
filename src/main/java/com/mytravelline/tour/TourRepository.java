package com.mytravelline.tour;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface TourRepository extends JpaRepository<Tour, Long>, JpaSpecificationExecutor<Tour> {

    Optional<Tour> findBySlug(String slug);

    @Query("SELECT t FROM Tour t WHERE t.status = 'PUBLISHED' AND t.featured = true")
    List<Tour> findFeaturedTours();

    @Query("SELECT t FROM Tour t WHERE t.status = 'PUBLISHED'")
    Page<Tour> findPublishedTours(Pageable pageable);

    @Query("SELECT t FROM Tour t WHERE t.status = 'PUBLISHED' AND t.category.slug = :categorySlug")
    Page<Tour> findPublishedToursByCategory(@Param("categorySlug") String categorySlug, Pageable pageable);

    @Query("SELECT t FROM Tour t WHERE t.status = 'PUBLISHED' AND t.destination.slug = :destinationSlug")
    Page<Tour> findPublishedToursByDestination(@Param("destinationSlug") String destinationSlug, Pageable pageable);

    @Query("SELECT t FROM Tour t WHERE t.status = 'PUBLISHED' AND " +
           "(LOWER(t.title) LIKE LOWER(CONCAT('%', :search, '%')) OR " +
           "LOWER(t.summary) LIKE LOWER(CONCAT('%', :search, '%')))")
    Page<Tour> searchPublishedTours(@Param("search") String search, Pageable pageable);

    boolean existsBySlug(String slug);

    boolean existsBySlugAndIdNot(String slug, Long id);

    @Query("SELECT DISTINCT t.departureDate FROM Tour t " +
           "WHERE t.status = 'PUBLISHED' AND t.departureDate IS NOT NULL " +
           "AND t.departureDate >= CURRENT_DATE " +
           "ORDER BY t.departureDate ASC")
    List<LocalDate> findAvailableDates();

    @Query("SELECT DISTINCT t.departureDate FROM Tour t " +
           "WHERE t.status = 'PUBLISHED' AND t.departureDate IS NOT NULL " +
           "AND t.departureDate >= CURRENT_DATE " +
           "AND t.destination.slug = :destinationSlug " +
           "ORDER BY t.departureDate ASC")
    List<LocalDate> findAvailableDatesByDestination(@Param("destinationSlug") String destinationSlug);

    @Query("SELECT DISTINCT t.destination.slug FROM Tour t " +
           "WHERE t.status = 'PUBLISHED' AND t.departureDate IS NOT NULL " +
           "AND t.departureDate >= :firstDay AND t.departureDate <= :lastDay")
    List<String> findAvailableDestinationSlugs(@Param("firstDay") LocalDate firstDay,
                                               @Param("lastDay") LocalDate lastDay);
}
