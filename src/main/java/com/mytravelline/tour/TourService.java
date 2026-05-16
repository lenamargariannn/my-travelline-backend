package com.mytravelline.tour;

import com.mytravelline.category.Category;
import com.mytravelline.category.CategoryRepository;
import com.mytravelline.common.PageResponse;
import com.mytravelline.common.exception.BadRequestException;
import com.mytravelline.common.exception.ResourceNotFoundException;
import com.mytravelline.destination.Destination;
import com.mytravelline.destination.DestinationRepository;
import com.mytravelline.tour.dto.CreateTourRequest;
import com.mytravelline.tour.dto.TourDto;
import com.mytravelline.tour.dto.TourImageDto;
import com.mytravelline.tour.dto.TourItineraryDayDto;
import com.mytravelline.tour.dto.TourSummaryDto;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class TourService {

    private final TourRepository tourRepository;
    private final CategoryRepository categoryRepository;
    private final DestinationRepository destinationRepository;

    // ===== Public methods =====

    public PageResponse<TourSummaryDto> getPublishedTours(int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Tour> tours = tourRepository.findPublishedTours(pageable);
        return toPageResponse(tours);
    }

    public List<TourSummaryDto> getFeaturedTours() {
        return tourRepository.findFeaturedTours().stream()
                .map(this::toSummaryDto)
                .toList();
    }

    public TourDto getTourBySlug(String slug) {
        Tour tour = tourRepository.findBySlug(slug)
                .orElseThrow(() -> new ResourceNotFoundException("Tour", "slug", slug));
        return toFullDto(tour);
    }

    public PageResponse<TourSummaryDto> getToursByCategory(String categorySlug, int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Tour> tours = tourRepository.findPublishedToursByCategory(categorySlug, pageable);
        return toPageResponse(tours);
    }

    public PageResponse<TourSummaryDto> getToursByDestination(String destinationSlug, int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Tour> tours = tourRepository.findPublishedToursByDestination(destinationSlug, pageable);
        return toPageResponse(tours);
    }

    public PageResponse<TourSummaryDto> searchTours(String query, int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Tour> tours = tourRepository.searchPublishedTours(query, pageable);
        return toPageResponse(tours);
    }

    // ===== Admin methods =====

    public PageResponse<TourSummaryDto> getAllTours(int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Tour> tours = tourRepository.findAll(pageable);
        return toPageResponse(tours);
    }

    public TourDto getTourById(Long id) {
        Tour tour = tourRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Tour", "id", id));
        return toFullDto(tour);
    }

    @Transactional
    public TourDto createTour(CreateTourRequest request) {
        if (tourRepository.existsBySlug(request.getSlug())) {
            throw new BadRequestException("Tour with slug '" + request.getSlug() + "' already exists");
        }

        Tour tour = Tour.builder()
                .title(request.getTitle())
                .slug(request.getSlug())
                .summary(request.getSummary())
                .description(request.getDescription())
                .price(request.getPrice())
                .durationDays(request.getDurationDays())
                .maxGroupSize(request.getMaxGroupSize())
                .coverImage(request.getCoverImage())
                .featured(request.isFeatured())
                .status(TourStatus.DRAFT)
                .build();

        if (request.getCategoryId() != null) {
            Category category = categoryRepository.findById(request.getCategoryId())
                    .orElseThrow(() -> new ResourceNotFoundException("Category", "id", request.getCategoryId()));
            tour.setCategory(category);
        }

        if (request.getDestinationId() != null) {
            Destination destination = destinationRepository.findById(request.getDestinationId())
                    .orElseThrow(() -> new ResourceNotFoundException("Destination", "id", request.getDestinationId()));
            tour.setDestination(destination);
        }

        if (request.getItineraryDays() != null) {
            request.getItineraryDays().forEach(dayDto -> {
                TourItineraryDay day = TourItineraryDay.builder()
                        .dayNumber(dayDto.getDayNumber())
                        .title(dayDto.getTitle())
                        .description(dayDto.getDescription())
                        .tour(tour)
                        .build();
                tour.getItineraryDays().add(day);
            });
        }

        Tour saved = tourRepository.save(tour);
        return toFullDto(saved);
    }

    @Transactional
    public TourDto updateTourStatus(Long id, TourStatus status) {
        Tour tour = tourRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Tour", "id", id));
        tour.setStatus(status);
        return toFullDto(tourRepository.save(tour));
    }

    @Transactional
    public void deleteTour(Long id) {
        if (!tourRepository.existsById(id)) {
            throw new ResourceNotFoundException("Tour", "id", id);
        }
        tourRepository.deleteById(id);
    }

    // ===== Mapping helpers =====

    private TourSummaryDto toSummaryDto(Tour tour) {
        return TourSummaryDto.builder()
                .id(tour.getId())
                .slug(tour.getSlug())
                .title(tour.getTitle())
                .summary(tour.getSummary())
                .price(tour.getPrice())
                .durationDays(tour.getDurationDays())
                .coverImage(tour.getCoverImage())
                .featured(tour.isFeatured())
                .categoryName(tour.getCategory() != null ? tour.getCategory().getName() : null)
                .destinationName(tour.getDestination() != null ? tour.getDestination().getName() : null)
                .build();
    }

    private TourDto toFullDto(Tour tour) {
        return TourDto.builder()
                .id(tour.getId())
                .slug(tour.getSlug())
                .title(tour.getTitle())
                .summary(tour.getSummary())
                .description(tour.getDescription())
                .price(tour.getPrice())
                .durationDays(tour.getDurationDays())
                .maxGroupSize(tour.getMaxGroupSize())
                .coverImage(tour.getCoverImage())
                .featured(tour.isFeatured())
                .status(tour.getStatus())
                .categoryId(tour.getCategory() != null ? tour.getCategory().getId() : null)
                .categoryName(tour.getCategory() != null ? tour.getCategory().getName() : null)
                .destinationId(tour.getDestination() != null ? tour.getDestination().getId() : null)
                .destinationName(tour.getDestination() != null ? tour.getDestination().getName() : null)
                .images(tour.getImages().stream().map(img -> TourImageDto.builder()
                        .id(img.getId())
                        .s3Key(img.getS3Key())
                        .caption(img.getCaption())
                        .sortOrder(img.getSortOrder())
                        .build()).toList())
                .itineraryDays(tour.getItineraryDays().stream().map(day -> TourItineraryDayDto.builder()
                        .id(day.getId())
                        .dayNumber(day.getDayNumber())
                        .title(day.getTitle())
                        .description(day.getDescription())
                        .build()).toList())
                .build();
    }

    private PageResponse<TourSummaryDto> toPageResponse(Page<Tour> page) {
        List<TourSummaryDto> content = page.getContent().stream()
                .map(this::toSummaryDto)
                .toList();
        return PageResponse.of(content, page.getNumber(), page.getSize(),
                page.getTotalElements(), page.getTotalPages(), page.isLast());
    }
}
