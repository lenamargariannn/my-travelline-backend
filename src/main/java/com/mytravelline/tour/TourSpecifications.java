package com.mytravelline.tour;

import org.springframework.data.jpa.domain.Specification;

import java.time.LocalDate;

public class TourSpecifications {

    private TourSpecifications() {}

    public static Specification<Tour> isPublished() {
        return (root, query, cb) -> cb.equal(root.get("status"), TourStatus.PUBLISHED);
    }

    public static Specification<Tour> hasCategory(String categorySlug) {
        return (root, query, cb) -> cb.equal(root.get("category").get("slug"), categorySlug);
    }

    public static Specification<Tour> hasDestination(String destinationSlug) {
        return (root, query, cb) -> cb.equal(root.get("destination").get("slug"), destinationSlug);
    }

    public static Specification<Tour> matchesSearch(String search) {
        return (root, query, cb) -> {
            String pattern = "%" + search.toLowerCase() + "%";
            return cb.or(
                    cb.like(cb.lower(root.get("title")), pattern),
                    cb.like(cb.lower(root.get("summary")), pattern)
            );
        };
    }

    public static Specification<Tour> departsOnOrAfter(LocalDate date) {
        return (root, query, cb) -> {
            var sub = query.subquery(Long.class);
            var dep = sub.from(TourDeparture.class);
            sub.select(dep.get("id")).where(cb.and(
                    cb.equal(dep.get("tour"), root),
                    cb.greaterThanOrEqualTo(dep.get("departureDate"), date)
            ));
            return cb.exists(sub);
        };
    }

    public static Specification<Tour> hasMinGroupSize(int travelers) {
        return (root, query, cb) -> cb.greaterThanOrEqualTo(root.get("maxGroupSize"), travelers);
    }
}
