package com.mytravelline.gallery;

import com.mytravelline.common.PageResponse;
import com.mytravelline.common.exception.ResourceNotFoundException;
import com.mytravelline.storage.S3StorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class GalleryService {

    private final GalleryImageRepository galleryImageRepository;
    private final S3StorageService s3StorageService;

    public PageResponse<GalleryImageDto> getAllImages(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<GalleryImage> images = galleryImageRepository.findAllByOrderBySortOrderAsc(pageable);
        return toPageResponse(images);
    }

    public List<GalleryImageDto> getImagesByDestination(Long destinationId) {
        return galleryImageRepository.findByDestinationIdOrderBySortOrderAsc(destinationId).stream()
                .map(this::toDto)
                .toList();
    }

    public GalleryImageDto getImageById(Long id) {
        GalleryImage image = galleryImageRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Gallery image", "id", id));
        return toDto(image);
    }

    @Transactional
    public void deleteImage(Long id) {
        GalleryImage image = galleryImageRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Gallery image", "id", id));
        s3StorageService.deleteFile(image.getS3Key());
        galleryImageRepository.deleteById(id);
    }

    private GalleryImageDto toDto(GalleryImage image) {
        return GalleryImageDto.builder()
                .id(image.getId())
                .s3Key(image.getS3Key())
                .imageUrl(s3StorageService.getImageUrl(image.getS3Key()))
                .caption(image.getCaption())
                .sortOrder(image.getSortOrder())
                .destinationId(image.getDestination() != null ? image.getDestination().getId() : null)
                .destinationName(image.getDestination() != null ? image.getDestination().getName() : null)
                .createdAt(image.getCreatedAt())
                .build();
    }

    private PageResponse<GalleryImageDto> toPageResponse(Page<GalleryImage> page) {
        List<GalleryImageDto> content = page.getContent().stream()
                .map(this::toDto)
                .toList();
        return PageResponse.of(content, page.getNumber(), page.getSize(),
                page.getTotalElements(), page.getTotalPages(), page.isLast());
    }
}
