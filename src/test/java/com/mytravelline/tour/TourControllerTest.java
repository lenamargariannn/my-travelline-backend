package com.mytravelline.tour;

import com.mytravelline.category.Category;
import com.mytravelline.category.CategoryRepository;
import com.mytravelline.destination.Destination;
import com.mytravelline.destination.DestinationRepository;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.Matchers.hasSize;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class TourControllerTest {

    @Autowired
    MockMvc mockMvc;

    @Autowired
    TourRepository tourRepository;

    @Autowired
    DestinationRepository destinationRepository;

    @Autowired
    CategoryRepository categoryRepository;

    private final List<Long> tourIds = new ArrayList<>();
    private final List<Long> destinationIds = new ArrayList<>();

    @BeforeEach
    void setUp() {
        Destination paris = destinationRepository.save(Destination.builder()
                .name("Paris")
                .slug("paris-test")
                .country("France")
                .build());
        destinationIds.add(paris.getId());

        Destination rome = destinationRepository.save(Destination.builder()
                .name("Rome")
                .slug("rome-test")
                .country("Italy")
                .build());
        destinationIds.add(rome.getId());

        // Tour A: paris, maxGroupSize=10, departure in the future
        Tour tourA = tourRepository.save(Tour.builder()
                .title("Paris Highlights")
                .slug("paris-highlights-test")
                .price(BigDecimal.valueOf(1200))
                .status(TourStatus.PUBLISHED)
                .destination(paris)
                .maxGroupSize(10)
                .departureDate(LocalDate.of(2026, 8, 1))
                .build());
        tourIds.add(tourA.getId());

        // Tour B: rome, maxGroupSize=5, departure in the future
        Tour tourB = tourRepository.save(Tour.builder()
                .title("Rome Essentials")
                .slug("rome-essentials-test")
                .price(BigDecimal.valueOf(900))
                .status(TourStatus.PUBLISHED)
                .destination(rome)
                .maxGroupSize(5)
                .departureDate(LocalDate.of(2026, 8, 1))
                .build());
        tourIds.add(tourB.getId());

        // Tour C: paris, maxGroupSize=3, departure in the past
        Tour tourC = tourRepository.save(Tour.builder()
                .title("Paris Weekend")
                .slug("paris-weekend-test")
                .price(BigDecimal.valueOf(600))
                .status(TourStatus.PUBLISHED)
                .destination(paris)
                .maxGroupSize(3)
                .departureDate(LocalDate.of(2026, 1, 1))
                .build());
        tourIds.add(tourC.getId());

        // Tour D: draft — must never appear in public results
        Tour tourD = tourRepository.save(Tour.builder()
                .title("Draft Paris Tour")
                .slug("draft-paris-test")
                .price(BigDecimal.valueOf(800))
                .status(TourStatus.DRAFT)
                .destination(paris)
                .maxGroupSize(10)
                .departureDate(LocalDate.of(2026, 8, 1))
                .build());
        tourIds.add(tourD.getId());
    }

    @AfterEach
    void tearDown() {
        tourRepository.deleteAllById(tourIds);
        destinationRepository.deleteAllById(destinationIds);
        tourIds.clear();
        destinationIds.clear();
    }

    @Test
    void getTours_destinationSlug_returnsMatchingPublishedTours() throws Exception {
        mockMvc.perform(get("/api/tours").param("destinationSlug", "paris-test"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.content", hasSize(2)))
                .andExpect(jsonPath("$.content[?(@.title == 'Draft Paris Tour')]").doesNotExist());
    }

    @Test
    void getTours_travelers_returnsToursWithSufficientGroupSize() throws Exception {
        // Only Tour A has maxGroupSize >= 6
        mockMvc.perform(get("/api/tours").param("travelers", "6"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.content", hasSize(1)))
                .andExpect(jsonPath("$.content[0].title").value("Paris Highlights"));
    }

    @Test
    void getTours_startDate_returnsToursOnOrAfterDate() throws Exception {
        // Tours A and B depart on 2026-08-01; Tour C departs 2026-01-01 (before filter)
        mockMvc.perform(get("/api/tours").param("startDate", "2026-06-21"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.content", hasSize(2)));
    }

    @Test
    void getTours_allThreeCombined_returnsIntersection() throws Exception {
        // paris-test + startDate >= 2026-06-21 + travelers >= 6 → only Tour A
        mockMvc.perform(get("/api/tours")
                        .param("destinationSlug", "paris-test")
                        .param("startDate", "2026-06-21")
                        .param("travelers", "6"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.content", hasSize(1)))
                .andExpect(jsonPath("$.content[0].title").value("Paris Highlights"));
    }

    @Test
    void getTours_travelersZero_returnsBadRequest() throws Exception {
        mockMvc.perform(get("/api/tours").param("travelers", "0"))
                .andExpect(status().isBadRequest());
    }

    @Test
    void getTours_travelersOverMax_returnsBadRequest() throws Exception {
        mockMvc.perform(get("/api/tours").param("travelers", "51"))
                .andExpect(status().isBadRequest());
    }

    @Test
    void getTours_unknownDestinationSlug_returnsEmptyPage() throws Exception {
        mockMvc.perform(get("/api/tours").param("destinationSlug", "no-such-place"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.content", hasSize(0)))
                .andExpect(jsonPath("$.totalElements").value(0));
    }

    @Test
    void getTours_legacyDestinationParam_stillWorks() throws Exception {
        mockMvc.perform(get("/api/tours").param("destination", "rome-test"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.content", hasSize(1)))
                .andExpect(jsonPath("$.content[0].title").value("Rome Essentials"));
    }
}
