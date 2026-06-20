package com.mytravelline.tour.dto;

import com.mytravelline.tour.TourStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TourDto {

    private Long id;
    private String slug;
    private String title;
    private String summary;
    private String description;
    private BigDecimal price;
    private String currency;
    private BigDecimal convertedPrice;
    private String convertedCurrency;
    private Integer durationDays;
    private Integer maxGroupSize;
    private String coverImage;
    private boolean featured;
    private TourStatus status;
    private Long categoryId;
    private String categoryName;
    private Long destinationId;
    private String destinationName;
    private List<TourImageDto> images;
    private List<TourItineraryDayDto> itineraryDays;
    private List<TourDepartureDto> departures;
}
