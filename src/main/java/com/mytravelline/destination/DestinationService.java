package com.mytravelline.destination;

import com.mytravelline.common.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class DestinationService {

    private final DestinationRepository destinationRepository;
    private final DestinationMapper destinationMapper;

    public List<DestinationDto> getAllActiveDestinations() {
        return destinationMapper.toDtoList(destinationRepository.findByActiveTrue());
    }

    public List<DestinationDto> getAllDestinations() {
        return destinationMapper.toDtoList(destinationRepository.findAll());
    }

    public DestinationDto getDestinationBySlug(String slug) {
        Destination destination = destinationRepository.findBySlug(slug)
                .orElseThrow(() -> new ResourceNotFoundException("Destination", "slug", slug));
        return destinationMapper.toDto(destination);
    }

    public DestinationDto getDestinationById(Long id) {
        Destination destination = destinationRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Destination", "id", id));
        return destinationMapper.toDto(destination);
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
        destinationRepository.deleteById(id);
    }
}
