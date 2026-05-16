package com.mytravelline.tour;

import com.mytravelline.tour.dto.TourDto;
import org.springframework.stereotype.Component;

@Component
public class TourMapper {

    public TourDto toDto(Tour t) {
        if (t == null) return null;
        return new TourDto(
                t.getId(),
                t.getSlug(),
                t.getTitle(),
                t.getSummary(),
                t.getDescription(),
                t.getPrice(),
                t.getDurationDays(),
                t.isFeatured(),
                t.getStatus().name(),
                t.getCoverImageKey(),
                t.getCategory() != null ? t.getCategory().getSlug() : null,
                t.getDestination() != null ? t.getDestination().getSlug() : null
        );
    }
}
