package com.mytravelline.destination;

import com.mytravelline.common.RequestLocaleResolver;
import com.mytravelline.common.exception.ResourceNotFoundException;
import com.mytravelline.translation.LocaleCode;
import com.mytravelline.translation.TranslationService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class DestinationService {

    private static final String ENTITY_TYPE = "destination";

    private final DestinationRepository destinationRepository;
    private final DestinationMapper destinationMapper;
    private final TranslationService translationService;
    private final RequestLocaleResolver localeResolver;

    public List<DestinationDto> getAllActiveDestinations(HttpServletRequest request) {
        LocaleCode locale = localeResolver.resolve(request);
        return destinationRepository.findByActiveTrue().stream()
                .map(d -> overlayTranslations(destinationMapper.toDto(d), d.getId(), locale))
                .toList();
    }

    public List<DestinationDto> getAllDestinations() {
        return destinationMapper.toDtoList(destinationRepository.findAll());
    }

    public DestinationDto getDestinationBySlug(String slug, HttpServletRequest request) {
        Destination destination = destinationRepository.findBySlug(slug)
                .orElseThrow(() -> new ResourceNotFoundException("Destination", "slug", slug));
        LocaleCode locale = localeResolver.resolve(request);
        return overlayTranslations(destinationMapper.toDto(destination), destination.getId(), locale);
    }

    public DestinationDto getDestinationById(Long id) {
        Destination destination = destinationRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Destination", "id", id));
        return destinationMapper.toDto(destination);
    }

    public Map<String, Map<String, String>> getDestinationTranslations(Long id) {
        if (!destinationRepository.existsById(id)) {
            throw new ResourceNotFoundException("Destination", "id", id);
        }
        return translationService.getAll(ENTITY_TYPE, id);
    }

    @Transactional
    public void saveDestinationTranslations(Long id, Map<String, Map<String, String>> translations) {
        if (!destinationRepository.existsById(id)) {
            throw new ResourceNotFoundException("Destination", "id", id);
        }
        translationService.saveAll(ENTITY_TYPE, id, translations);
    }

    @Transactional
    public DestinationDto createDestination(DestinationDto dto) {
        Destination destination = destinationMapper.toEntity(dto);
        destination = destinationRepository.save(destination);
        return destinationMapper.toDto(destination);
    }

    @Transactional
    public DestinationDto updateDestination(Long id, DestinationDto dto) {
        Destination destination = destinationRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Destination", "id", id));
        destinationMapper.updateEntity(dto, destination);
        destination = destinationRepository.save(destination);
        return destinationMapper.toDto(destination);
    }

    @Transactional
    public void deleteDestination(Long id) {
        if (!destinationRepository.existsById(id)) {
            throw new ResourceNotFoundException("Destination", "id", id);
        }
        translationService.deleteAll(ENTITY_TYPE, id);
        destinationRepository.deleteById(id);
    }

    private DestinationDto overlayTranslations(DestinationDto dto, Long id, LocaleCode locale) {
        if (locale == LocaleCode.EN) return dto;
        String name = translationService.get(ENTITY_TYPE, id, "name", locale);
        String description = translationService.get(ENTITY_TYPE, id, "description", locale);
        if (name != null) dto.setName(name);
        if (description != null) dto.setDescription(description);
        return dto;
    }
}
