package com.mytravelline.tour;

import com.mytravelline.common.exception.ResourceNotFoundException;
import com.mytravelline.tour.dto.TourDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class TourService {

    private final TourRepository repo;
    private final TourMapper mapper;

    public TourService(TourRepository repo, TourMapper mapper) {
        this.repo = repo;
        this.mapper = mapper;
    }

    public Page<TourDto> listPublished(Pageable pageable) {
        return repo.findAllByStatus(TourStatus.PUBLISHED, pageable).map(mapper::toDto);
    }

    public TourDto getBySlug(String slug) {
        return repo.findBySlug(slug)
                .map(mapper::toDto)
                .orElseThrow(() -> ResourceNotFoundException.of("Tour", slug));
    }
}
