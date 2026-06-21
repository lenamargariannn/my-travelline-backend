package com.mytravelline.tour;

import com.mytravelline.category.Category;
import com.mytravelline.category.CategoryRepository;
import com.mytravelline.common.RequestLocaleResolver;
import com.mytravelline.common.PageResponse;
import com.mytravelline.common.exception.BadRequestException;
import com.mytravelline.common.exception.ResourceNotFoundException;
import com.mytravelline.currency.CurrencyService;
import com.mytravelline.destination.Destination;
import com.mytravelline.destination.DestinationRepository;
import com.mytravelline.storage.S3StorageService;
import com.mytravelline.tour.dto.CreateDepartureRequest;
import com.mytravelline.tour.dto.CreateTourRequest;
import com.mytravelline.tour.dto.TourDepartureDto;
import com.mytravelline.tour.dto.TourDto;
import com.mytravelline.tour.dto.UpdateTourRequest;
import com.mytravelline.tour.dto.TourImageDto;
import com.mytravelline.tour.dto.TourItineraryDayDto;
import com.mytravelline.tour.dto.TourSummaryDto;
import com.mytravelline.translation.LocaleCode;
import com.mytravelline.translation.TranslationService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class TourService {

    private static final String ENTITY_TYPE = "tour";

    private final TourRepository tourRepository;
    private final TourImageRepository tourImageRepository;
    private final TourDepartureRepository tourDepartureRepository;
    private final CategoryRepository categoryRepository;
    private final DestinationRepository destinationRepository;
    private final S3StorageService s3StorageService;
    private final CurrencyService currencyService;
    private final TranslationService translationService;
    private final RequestLocaleResolver localeResolver;

    // ===== Public methods =====

    public PageResponse<TourSummaryDto> getPublishedTours(int page, int size, String currency,
                                                          HttpServletRequest request) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Tour> tours = tourRepository.findPublishedTours(pageable);
        LocaleCode locale = localeResolver.resolve(request);
        return toPageResponse(tours, currency, locale);
    }

    public List<TourSummaryDto> getFeaturedTours(String currency, HttpServletRequest request) {
        LocaleCode locale = localeResolver.resolve(request);
        List<Tour> tours = tourRepository.findFeaturedTours();
        List<Long> ids = tours.stream().map(Tour::getId).toList();
        Map<Long, LocalDate> nextDepartures = ids.isEmpty() ? Map.of() : loadNextDepartures(ids);
        return tours.stream()
                .map(t -> toSummaryDto(t, currency, locale, nextDepartures.get(t.getId())))
                .toList();
    }

    public TourDto getTourBySlug(String slug, String currency, HttpServletRequest request) {
        Tour tour = tourRepository.findBySlug(slug)
                .orElseThrow(() -> new ResourceNotFoundException("Tour", "slug", slug));
        LocaleCode locale = localeResolver.resolve(request);
        return toFullDto(tour, currency, locale);
    }

    public PageResponse<TourSummaryDto> getToursByCategory(String categorySlug, int page, int size,
                                                           String currency, HttpServletRequest request) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Tour> tours = tourRepository.findPublishedToursByCategory(categorySlug, pageable);
        LocaleCode locale = localeResolver.resolve(request);
        return toPageResponse(tours, currency, locale);
    }

    public PageResponse<TourSummaryDto> getToursByDestination(String destinationSlug, int page, int size,
                                                              String currency, HttpServletRequest request) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Tour> tours = tourRepository.findPublishedToursByDestination(destinationSlug, pageable);
        LocaleCode locale = localeResolver.resolve(request);
        return toPageResponse(tours, currency, locale);
    }

    public PageResponse<TourSummaryDto> searchTours(String query, int page, int size,
                                                     String currency, HttpServletRequest request) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Tour> tours = tourRepository.searchPublishedTours(query, pageable);
        LocaleCode locale = localeResolver.resolve(request);
        return toPageResponse(tours, currency, locale);
    }

    public PageResponse<TourSummaryDto> filterTours(String categorySlug, String destinationSlug,
                                                     String search, LocalDate startDate,
                                                     Integer travelers, int page, int size,
                                                     String currency, HttpServletRequest request) {
        if (travelers != null && (travelers < 1 || travelers > 50)) {
            throw new BadRequestException("travelers must be between 1 and 50");
        }

        Specification<Tour> spec = TourSpecifications.isPublished();
        if (categorySlug != null && !categorySlug.isBlank()) {
            spec = spec.and(TourSpecifications.hasCategory(categorySlug));
        }
        if (destinationSlug != null && !destinationSlug.isBlank()) {
            spec = spec.and(TourSpecifications.hasDestination(destinationSlug));
        }
        if (search != null && !search.isBlank()) {
            spec = spec.and(TourSpecifications.matchesSearch(search));
        }
        if (startDate != null) {
            spec = spec.and(TourSpecifications.departsOnOrAfter(startDate));
        }
        if (travelers != null) {
            spec = spec.and(TourSpecifications.hasMinGroupSize(travelers));
        }

        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Tour> tours = tourRepository.findAll(spec, pageable);
        LocaleCode locale = localeResolver.resolve(request);
        return toPageResponse(tours, currency, locale);
    }

    // ===== Admin methods =====

    public PageResponse<TourSummaryDto> getAllTours(int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Tour> tours = tourRepository.findAll(pageable);
        List<TourSummaryDto> content = tours.getContent().stream()
                .map(t -> toSummaryDto(t, null, LocaleCode.EN, null))
                .toList();
        return PageResponse.of(content, tours.getNumber(), tours.getSize(),
                tours.getTotalElements(), tours.getTotalPages(), tours.isLast());
    }

    public TourDto getTourById(Long id) {
        Tour tour = tourRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Tour", "id", id));
        return toFullDto(tour, null, LocaleCode.EN);
    }

    public Map<String, Map<String, String>> getTourTranslations(Long id) {
        if (!tourRepository.existsById(id)) {
            throw new ResourceNotFoundException("Tour", "id", id);
        }
        return translationService.getAll(ENTITY_TYPE, id);
    }

    @Transactional
    public void saveTourTranslations(Long id, Map<String, Map<String, String>> translations) {
        if (!tourRepository.existsById(id)) {
            throw new ResourceNotFoundException("Tour", "id", id);
        }
        translationService.saveAll(ENTITY_TYPE, id, translations);
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
                .currency("USD")
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

        if (request.getDepartures() != null) {
            request.getDepartures().stream()
                    .filter(dep -> dep.getDepartureDate() != null)
                    .forEach(dep -> tour.getDepartures().add(TourDeparture.builder()
                            .departureDate(dep.getDepartureDate())
                            .availableSlots(dep.getAvailableSlots())
                            .tour(tour)
                            .build()));
        }

        Tour saved = tourRepository.save(tour);
        return toFullDto(saved, null, LocaleCode.EN);
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

        if (request.getDepartures() != null) {
            tour.getDepartures().clear();
            request.getDepartures().stream()
                    .filter(dep -> dep.getDepartureDate() != null)
                    .forEach(dep -> tour.getDepartures().add(TourDeparture.builder()
                            .departureDate(dep.getDepartureDate())
                            .availableSlots(dep.getAvailableSlots())
                            .tour(tour)
                            .build()));
        }

        return toFullDto(tourRepository.save(tour), null, LocaleCode.EN);
    }

    @Transactional
    public TourDto updateTourStatus(Long id, TourStatus status) {
        Tour tour = tourRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Tour", "id", id));
        tour.setStatus(status);
        return toFullDto(tourRepository.save(tour), null, LocaleCode.EN);
    }

    @Transactional
    public void deleteTour(Long id) {
        if (!tourRepository.existsById(id)) {
            throw new ResourceNotFoundException("Tour", "id", id);
        }
        translationService.deleteAll(ENTITY_TYPE, id);
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

    private TourSummaryDto toSummaryDto(Tour tour, String targetCurrency, LocaleCode locale,
                                         LocalDate nextDeparture) {
        BigDecimal convertedPrice = resolveConvertedPrice(tour.getPrice(), targetCurrency);

        String title = tour.getTitle();
        String categoryName = tour.getCategory() != null ? tour.getCategory().getName() : null;
        String destinationName = tour.getDestination() != null ? tour.getDestination().getName() : null;
        if (locale != LocaleCode.EN) {
            String translated = translationService.get(ENTITY_TYPE, tour.getId(), "name", locale);
            if (translated != null) title = translated;
            if (tour.getCategory() != null) {
                String t = translationService.get("category", tour.getCategory().getId(), "name", locale);
                if (t != null) categoryName = t;
            }
            if (tour.getDestination() != null) {
                String t = translationService.get("destination", tour.getDestination().getId(), "name", locale);
                if (t != null) destinationName = t;
            }
        }

        return TourSummaryDto.builder()
                .id(tour.getId())
                .slug(tour.getSlug())
                .title(title)
                .summary(tour.getSummary())
                .price(tour.getPrice())
                .currency(tour.getCurrency())
                .convertedPrice(convertedPrice)
                .convertedCurrency(convertedPrice != null ? targetCurrency.toUpperCase() : null)
                .durationDays(tour.getDurationDays())
                .coverImage(tour.getCoverImage())
                .featured(tour.isFeatured())
                .categoryName(categoryName)
                .destinationName(destinationName)
                .nextDeparture(nextDeparture)
                .build();
    }

    private TourDto toFullDto(Tour tour, String targetCurrency, LocaleCode locale) {
        BigDecimal convertedPrice = resolveConvertedPrice(tour.getPrice(), targetCurrency);

        String title = tour.getTitle();
        String description = tour.getDescription();
        String categoryName = tour.getCategory() != null ? tour.getCategory().getName() : null;
        String destinationName = tour.getDestination() != null ? tour.getDestination().getName() : null;
        if (locale != LocaleCode.EN) {
            String translatedName = translationService.get(ENTITY_TYPE, tour.getId(), "name", locale);
            String translatedDesc = translationService.get(ENTITY_TYPE, tour.getId(), "description", locale);
            if (translatedName != null) title = translatedName;
            if (translatedDesc != null) description = translatedDesc;
            if (tour.getCategory() != null) {
                String t = translationService.get("category", tour.getCategory().getId(), "name", locale);
                if (t != null) categoryName = t;
            }
            if (tour.getDestination() != null) {
                String t = translationService.get("destination", tour.getDestination().getId(), "name", locale);
                if (t != null) destinationName = t;
            }
        }

        List<TourItineraryDayDto> itineraryDays = tour.getItineraryDays().stream().map(day -> {
            String dayTitle = day.getTitle();
            String dayDesc = day.getDescription();
            if (locale != LocaleCode.EN) {
                String tTitle = translationService.get(ENTITY_TYPE, tour.getId(),
                        "itinerary_day_" + day.getDayNumber() + "_title", locale);
                String tDesc = translationService.get(ENTITY_TYPE, tour.getId(),
                        "itinerary_day_" + day.getDayNumber() + "_description", locale);
                if (tTitle != null) dayTitle = tTitle;
                if (tDesc != null) dayDesc = tDesc;
            }
            return TourItineraryDayDto.builder()
                    .id(day.getId())
                    .dayNumber(day.getDayNumber())
                    .title(dayTitle)
                    .description(dayDesc)
                    .build();
        }).toList();

        return TourDto.builder()
                .id(tour.getId())
                .slug(tour.getSlug())
                .title(title)
                .summary(tour.getSummary())
                .description(description)
                .price(tour.getPrice())
                .currency(tour.getCurrency())
                .convertedPrice(convertedPrice)
                .convertedCurrency(convertedPrice != null ? targetCurrency.toUpperCase() : null)
                .durationDays(tour.getDurationDays())
                .maxGroupSize(tour.getMaxGroupSize())
                .coverImage(tour.getCoverImage())
                .featured(tour.isFeatured())
                .status(tour.getStatus())
                .categoryId(tour.getCategory() != null ? tour.getCategory().getId() : null)
                .categoryName(categoryName)
                .destinationId(tour.getDestination() != null ? tour.getDestination().getId() : null)
                .destinationName(destinationName)
                .images(tour.getImages().stream().map(img -> TourImageDto.builder()
                        .id(img.getId())
                        .s3Key(img.getS3Key())
                        .url(s3StorageService.getImageUrl(img.getS3Key()))
                        .caption(img.getCaption())
                        .sortOrder(img.getSortOrder())
                        .main(img.getS3Key().equals(tour.getCoverImage()))
                        .build()).toList())
                .itineraryDays(itineraryDays)
                .departures(tourDepartureRepository.findByTourIdOrderByDepartureDateAsc(tour.getId())
                        .stream().map(this::toDepartureDto).toList())
                .build();
    }

    private BigDecimal resolveConvertedPrice(BigDecimal usdPrice, String targetCurrency) {
        if (targetCurrency == null || "USD".equalsIgnoreCase(targetCurrency)) return null;
        currencyService.validateCurrency(targetCurrency);
        return currencyService.convert(usdPrice, targetCurrency.toUpperCase());
    }

    public List<String> getAvailableDates(String destination) {
        List<LocalDate> dates = (destination == null || destination.isBlank())
                ? tourDepartureRepository.findUpcomingDates()
                : tourDepartureRepository.findUpcomingDatesByDestination(destination);
        return dates.stream()
                .map(d -> String.format("%04d-%02d-01", d.getYear(), d.getMonthValue()))
                .distinct()
                .toList();
    }

    public List<String> getAvailableDestinations(String startDate) {
        if (startDate == null || startDate.isBlank()) return List.of();
        LocalDate parsed;
        try {
            parsed = LocalDate.parse(startDate);
        } catch (DateTimeParseException e) {
            throw new BadRequestException("Invalid date format, expected yyyy-MM-dd: " + startDate);
        }
        LocalDate first = parsed.withDayOfMonth(1);
        LocalDate last = first.withDayOfMonth(first.lengthOfMonth());
        return tourDepartureRepository.findDestinationSlugsByDateRange(first, last);
    }

    public List<TourDepartureDto> getDepartures(Long tourId) {
        if (!tourRepository.existsById(tourId)) {
            throw new ResourceNotFoundException("Tour", "id", tourId);
        }
        return tourDepartureRepository.findByTourIdOrderByDepartureDateAsc(tourId).stream()
                .map(this::toDepartureDto)
                .toList();
    }

    @Transactional
    public TourDepartureDto addDeparture(Long tourId, CreateDepartureRequest request) {
        Tour tour = tourRepository.findById(tourId)
                .orElseThrow(() -> new ResourceNotFoundException("Tour", "id", tourId));
        TourDeparture departure = TourDeparture.builder()
                .tour(tour)
                .departureDate(request.getDepartureDate())
                .availableSlots(request.getAvailableSlots())
                .build();
        return toDepartureDto(tourDepartureRepository.save(departure));
    }

    @Transactional
    public void deleteDeparture(Long tourId, Long departureId) {
        if (!tourRepository.existsById(tourId)) {
            throw new ResourceNotFoundException("Tour", "id", tourId);
        }
        if (!tourDepartureRepository.existsByIdAndTourId(departureId, tourId)) {
            throw new ResourceNotFoundException("TourDeparture", "id", departureId);
        }
        tourDepartureRepository.deleteByIdAndTourId(departureId, tourId);
    }

    private TourDepartureDto toDepartureDto(TourDeparture d) {
        return TourDepartureDto.builder()
                .id(d.getId())
                .departureDate(d.getDepartureDate())
                .availableSlots(d.getAvailableSlots())
                .build();
    }

    private PageResponse<TourSummaryDto> toPageResponse(Page<Tour> page, String currency, LocaleCode locale) {
        List<Long> ids = page.getContent().stream().map(Tour::getId).toList();
        Map<Long, LocalDate> nextDepartures = ids.isEmpty() ? Map.of() : loadNextDepartures(ids);
        List<TourSummaryDto> content = page.getContent().stream()
                .map(t -> toSummaryDto(t, currency, locale, nextDepartures.get(t.getId())))
                .toList();
        return PageResponse.of(content, page.getNumber(), page.getSize(),
                page.getTotalElements(), page.getTotalPages(), page.isLast());
    }

    private Map<Long, LocalDate> loadNextDepartures(List<Long> tourIds) {
        return tourDepartureRepository.findNextDepartureDatesByTourIds(tourIds).stream()
                .collect(Collectors.toMap(
                        row -> (Long) row[0],
                        row -> (LocalDate) row[1]
                ));
    }
}
