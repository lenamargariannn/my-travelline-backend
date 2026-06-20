package com.mytravelline.tour.dto;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
public class CreateDepartureRequest {

    @NotNull
    private LocalDate departureDate;

    @Min(1)
    private Integer availableSlots;
}
