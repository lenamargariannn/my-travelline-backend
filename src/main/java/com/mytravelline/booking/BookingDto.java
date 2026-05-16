package com.mytravelline.booking;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BookingDto {

    private Long id;
    private String customerName;
    private String email;
    private String phone;
    private LocalDate travelDate;
    private Integer guests;
    private String message;
    private BookingStatus status;
    private Long tourId;
    private String tourTitle;
    private LocalDateTime createdAt;
}
