package com.mytravelline.tour.dto;

import java.math.BigDecimal;

public record TourDto(
        Long id,
        String slug,
        String title,
        String summary,
        String description,
        BigDecimal price,
        Integer durationDays,
        boolean featured,
        String status,
        String coverImageKey,
        String categorySlug,
        String destinationSlug
) {
}
