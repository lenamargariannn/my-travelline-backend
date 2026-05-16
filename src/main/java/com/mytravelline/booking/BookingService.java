package com.mytravelline.booking;

import com.mytravelline.common.PageResponse;
import com.mytravelline.common.exception.ResourceNotFoundException;
import com.mytravelline.tour.Tour;
import com.mytravelline.tour.TourRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class BookingService {

    private final BookingRepository bookingRepository;
    private final TourRepository tourRepository;

    @Transactional
    public BookingDto createBooking(CreateBookingRequest request) {
        Tour tour = tourRepository.findById(request.getTourId())
                .orElseThrow(() -> new ResourceNotFoundException("Tour", "id", request.getTourId()));

        Booking booking = Booking.builder()
                .customerName(request.getCustomerName())
                .email(request.getEmail())
                .phone(request.getPhone())
                .travelDate(request.getTravelDate())
                .guests(request.getGuests())
                .message(request.getMessage())
                .status(BookingStatus.NEW)
                .tour(tour)
                .build();

        booking = bookingRepository.save(booking);
        log.info("New booking created: id={}, tour={}, customer={}", booking.getId(), tour.getTitle(), booking.getCustomerName());

        return toDto(booking);
    }

    public PageResponse<BookingDto> getAllBookings(int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Booking> bookings = bookingRepository.findAll(pageable);
        return toPageResponse(bookings);
    }

    public PageResponse<BookingDto> getBookingsByStatus(BookingStatus status, int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Booking> bookings = bookingRepository.findByStatus(status, pageable);
        return toPageResponse(bookings);
    }

    public BookingDto getBookingById(Long id) {
        Booking booking = bookingRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Booking", "id", id));
        return toDto(booking);
    }

    @Transactional
    public BookingDto updateBookingStatus(Long id, BookingStatus status) {
        Booking booking = bookingRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Booking", "id", id));
        booking.setStatus(status);
        booking = bookingRepository.save(booking);
        log.info("Booking status updated: id={}, status={}", id, status);
        return toDto(booking);
    }

    public long countNewBookings() {
        return bookingRepository.countByStatus(BookingStatus.NEW);
    }

    private BookingDto toDto(Booking booking) {
        return BookingDto.builder()
                .id(booking.getId())
                .customerName(booking.getCustomerName())
                .email(booking.getEmail())
                .phone(booking.getPhone())
                .travelDate(booking.getTravelDate())
                .guests(booking.getGuests())
                .message(booking.getMessage())
                .status(booking.getStatus())
                .tourId(booking.getTour() != null ? booking.getTour().getId() : null)
                .tourTitle(booking.getTour() != null ? booking.getTour().getTitle() : null)
                .createdAt(booking.getCreatedAt())
                .build();
    }

    private PageResponse<BookingDto> toPageResponse(Page<Booking> page) {
        List<BookingDto> content = page.getContent().stream()
                .map(this::toDto)
                .toList();
        return PageResponse.of(content, page.getNumber(), page.getSize(),
                page.getTotalElements(), page.getTotalPages(), page.isLast());
    }
}
