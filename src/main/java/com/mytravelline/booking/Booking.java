package com.mytravelline.booking;

import com.mytravelline.common.BaseEntity;
import com.mytravelline.tour.Tour;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Table(name = "booking")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Booking extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tour_id", nullable = false)
    private Tour tour;

    @Column(name = "customer_name", nullable = false)
    private String customerName;

    @Column(nullable = false)
    private String email;

    private String phone;

    @Column(name = "travel_date")
    private LocalDate travelDate;

    @Column(nullable = false)
    private Integer guests = 1;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private BookingStatus status = BookingStatus.NEW;

    @Column(columnDefinition = "TEXT")
    private String message;
}
