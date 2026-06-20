package com.mytravelline.tour.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TourDepartureDto {
    private Long id;
    private LocalDate departureDate;
    private Integer availableSlots;
}
