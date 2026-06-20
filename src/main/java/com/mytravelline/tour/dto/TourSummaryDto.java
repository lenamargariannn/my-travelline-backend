package com.mytravelline.tour.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TourSummaryDto {

    private Long id;
    private String slug;
    private String title;
    private String summary;
    private BigDecimal price;
    private String currency;
    private BigDecimal convertedPrice;
    private String convertedCurrency;
    private Integer durationDays;
    private String coverImage;
    private boolean featured;
    private String categoryName;
    private String destinationName;
    private LocalDate nextDeparture;
}
