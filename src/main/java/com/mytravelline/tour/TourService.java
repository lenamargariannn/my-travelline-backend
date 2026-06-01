package com.mytravelline.tour;

import com.mytravelline.category.Category;
import com.mytravelline.category.CategoryRepository;
import com.mytravelline.common.PageResponse;
import com.mytravelline.common.exception.BadRequestException;
import com.mytravelline.common.exception.ResourceNotFoundException;
import com.mytravelline.destination.Destination;
import com.mytravelline.destination.DestinationRepository;
import com.mytravelline.storage.S3StorageService;
import com.mytravelline.tour.dto.CreateTourRequest;
import com.mytravelline.tour.dto.TourDto;
import com.mytravelline.tour.dto.UpdateTourRequest;
import com.mytravelline.tour.dto.TourImageDto;
import com.mytravelline.tour.dto.TourItineraryDayDto;
import com.mytravelline.tour.dto.TourSummaryDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class TourService {

    private final TourRepository tourRepository;
    private final TourImageRepository tourImageRepository;
    private final CategoryRepository categoryRepository;
    private final DestinationRepository destinationRepository;
    private final S3StorageService s3StorageService;

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
    public TourDto updateTour(Long id, UpdateTourRequest request) {
        Tour tour = tourRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Tour", "id", id));

        if (!tour.getSlug().equals(request.getSlug()) &&
                tourRepository.existsBySlugAndIdNot(request.getSlug(), id)) {
            throw new BadRequestException("Tour with slug '" + request.getSlug() + "' already exists");
        }

        tour.setTitle(request.getTitle());
        tour.setSlug(request.getSlug());
        tour.setSummary(request.getSummary());
        tour.setDescription(request.getDescription());
        tour.setPrice(request.getPrice());
        tour.setDurationDays(request.getDurationDays());
        tour.setMaxGroupSize(request.getMaxGroupSize());
        tour.setCoverImage(request.getCoverImage());
        tour.setFeatured(request.isFeatured());

        if (request.getCategoryId() != null) {
            Category category = categoryRepository.findById(request.getCategoryId())
                    .orElseThrow(() -> new ResourceNotFoundException("Category", "id", request.getCategoryId()));
            tour.setCategory(category);
        } else {
            tour.setCategory(null);
        }

        if (request.getDestinationId() != null) {
            Destination destination = destinationRepository.findById(request.getDestinationId())
                    .orElseThrow(() -> new ResourceNotFoundException("Destination", "id", request.getDestinationId()));
            tour.setDestination(destination);
        } else {
            tour.setDestination(null);
        }

        if (request.getItineraryDays() != null) {
            tour.getItineraryDays().clear();
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

        return toFullDto(tourRepository.save(tour));
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

    @Transactional
    public TourImageDto uploadTourImage(Long tourId, MultipartFile file, String caption, Integer sortOrder, boolean main) {
        Tour tour = tourRepository.findById(tourId)
                .orElseThrow(() -> new ResourceNotFoundException("Tour", "id", tourId));

        String s3Key = s3StorageService.uploadFile(file, "tours/" + tourId);

        TourImage image = TourImage.builder()
                .s3Key(s3Key)
                .caption(caption)
                .sortOrder(sortOrder != null ? sortOrder : 0)
                .tour(tour)
                .build();

        TourImage saved = tourImageRepository.save(image);

        if (main) {
            tour.setCoverImage(s3Key);
            tourRepository.save(tour);
        }

        log.info("Tour image uploaded: tourId={}, imageId={}, main={}, key={}", tourId, saved.getId(), main, s3Key);

        return TourImageDto.builder()
                .id(saved.getId())
                .s3Key(s3Key)
                .url(s3StorageService.getImageUrl(s3Key))
                .caption(caption)
                .sortOrder(saved.getSortOrder())
                .main(main)
                .build();
    }

    @Transactional
    public void deleteTourImage(Long tourId, Long imageId) {
        Tour tour = tourRepository.findById(tourId)
                .orElseThrow(() -> new ResourceNotFoundException("Tour", "id", tourId));

        TourImage image = tourImageRepository.findByIdAndTourId(imageId, tourId)
                .orElseThrow(() -> new ResourceNotFoundException("TourImage", "id", imageId));

        boolean wasMain = image.getS3Key().equals(tour.getCoverImage());
        if (wasMain) {
            tour.setCoverImage(null);
            tourRepository.save(tour);
        }

        s3StorageService.deleteFile(image.getS3Key());
        tourImageRepository.delete(image);

        log.info("Tour image deleted: tourId={}, imageId={}, wasMain={}", tourId, imageId, wasMain);
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
                        .url(s3StorageService.getImageUrl(img.getS3Key()))
                        .caption(img.getCaption())
                        .sortOrder(img.getSortOrder())
                        .main(img.getS3Key().equals(tour.getCoverImage()))
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
