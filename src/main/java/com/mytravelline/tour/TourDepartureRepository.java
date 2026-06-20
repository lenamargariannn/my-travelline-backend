package com.mytravelline.tour;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Collection;
import java.util.List;

@Repository
public interface TourDepartureRepository extends JpaRepository<TourDeparture, Long> {

    List<TourDeparture> findByTourIdOrderByDepartureDateAsc(Long tourId);

    void deleteByIdAndTourId(Long id, Long tourId);

    boolean existsByIdAndTourId(Long id, Long tourId);

    @Query("SELECT DISTINCT d.departureDate FROM TourDeparture d " +
           "WHERE d.tour.status = 'PUBLISHED' AND d.departureDate >= CURRENT_DATE " +
           "ORDER BY d.departureDate ASC")
    List<LocalDate> findUpcomingDates();

    @Query("SELECT DISTINCT d.departureDate FROM TourDeparture d " +
           "WHERE d.tour.status = 'PUBLISHED' AND d.departureDate >= CURRENT_DATE " +
           "AND d.tour.destination.slug = :destinationSlug " +
           "ORDER BY d.departureDate ASC")
    List<LocalDate> findUpcomingDatesByDestination(@Param("destinationSlug") String destinationSlug);

    @Query("SELECT DISTINCT d.tour.destination.slug FROM TourDeparture d " +
           "WHERE d.tour.status = 'PUBLISHED' AND d.tour.destination IS NOT NULL " +
           "AND d.departureDate >= :firstDay AND d.departureDate <= :lastDay")
    List<String> findDestinationSlugsByDateRange(@Param("firstDay") LocalDate firstDay,
                                                 @Param("lastDay") LocalDate lastDay);

    @Query("SELECT d.tour.id, MIN(d.departureDate) FROM TourDeparture d " +
           "WHERE d.tour.id IN :tourIds AND d.departureDate >= CURRENT_DATE " +
           "GROUP BY d.tour.id")
    List<Object[]> findNextDepartureDatesByTourIds(@Param("tourIds") Collection<Long> tourIds);
}
