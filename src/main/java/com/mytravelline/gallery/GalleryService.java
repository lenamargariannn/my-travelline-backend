package com.mytravelline.gallery;

import com.mytravelline.common.RequestLocaleResolver;
import com.mytravelline.common.PageResponse;
import com.mytravelline.common.exception.ResourceNotFoundException;
import com.mytravelline.storage.S3StorageService;
import com.mytravelline.translation.LocaleCode;
import com.mytravelline.translation.TranslationService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class GalleryService {

    private static final String ENTITY_TYPE = "gallery";

    private final GalleryImageRepository galleryImageRepository;
    private final S3StorageService s3StorageService;
    private final TranslationService translationService;
    private final RequestLocaleResolver localeResolver;

    public PageResponse<GalleryImageDto> getAllImages(int page, int size, HttpServletRequest request) {
        Pageable pageable = PageRequest.of(page, size);
        Page<GalleryImage> images = galleryImageRepository.findAllByOrderBySortOrderAsc(pageable);
        LocaleCode locale = localeResolver.resolve(request);
        List<GalleryImageDto> content = images.getContent().stream()
                .map(img -> overlayTranslations(toDto(img), img.getId(), locale))
                .toList();
        return PageResponse.of(content, images.getNumber(), images.getSize(),
                images.getTotalElements(), images.getTotalPages(), images.isLast());
    }

    public List<GalleryImageDto> getImagesByDestination(Long destinationId, HttpServletRequest request) {
        LocaleCode locale = localeResolver.resolve(request);
        return galleryImageRepository.findByDestinationIdOrderBySortOrderAsc(destinationId).stream()
                .map(img -> overlayTranslations(toDto(img), img.getId(), locale))
                .toList();
    }

    public PageResponse<GalleryImageDto> getAllImagesAdmin(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<GalleryImage> images = galleryImageRepository.findAllByOrderBySortOrderAsc(pageable);
        return toPageResponse(images);
    }

    public GalleryImageDto getImageById(Long id) {
        GalleryImage image = galleryImageRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Gallery image", "id", id));
        return toDto(image);
    }

    public Map<String, Map<String, String>> getImageTranslations(Long id) {
        if (!galleryImageRepository.existsById(id)) {
            throw new ResourceNotFoundException("Gallery image", "id", id);
        }
        return translationService.getAll(ENTITY_TYPE, id);
    }

    @Transactional
    public void saveImageTranslations(Long id, Map<String, Map<String, String>> translations) {
        if (!galleryImageRepository.existsById(id)) {
            throw new ResourceNotFoundException("Gallery image", "id", id);
        }
        translationService.saveAll(ENTITY_TYPE, id, translations);
    }

    @Transactional
    public void deleteImage(Long id) {
        GalleryImage image = galleryImageRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Gallery image", "id", id));
        translationService.deleteAll(ENTITY_TYPE, id);
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

    private GalleryImageDto overlayTranslations(GalleryImageDto dto, Long id, LocaleCode locale) {
        if (locale == LocaleCode.EN) return dto;
        String caption = translationService.get(ENTITY_TYPE, id, "caption", locale);
        if (caption != null) dto.setCaption(caption);
        return dto;
    }

    private PageResponse<GalleryImageDto> toPageResponse(Page<GalleryImage> page) {
        List<GalleryImageDto> content = page.getContent().stream()
                .map(this::toDto)
                .toList();
        return PageResponse.of(content, page.getNumber(), page.getSize(),
                page.getTotalElements(), page.getTotalPages(), page.isLast());
    }
}
