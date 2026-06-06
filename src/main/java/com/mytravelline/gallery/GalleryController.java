package com.mytravelline.gallery;

import com.mytravelline.common.PageResponse;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class GalleryController {

    private final GalleryService galleryService;

    // ===== Public endpoints =====

    @GetMapping("/api/gallery")
    public ResponseEntity<PageResponse<GalleryImageDto>> getAllImages(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            HttpServletRequest request) {
        return ResponseEntity.ok(galleryService.getAllImages(page, size, request));
    }

    @GetMapping("/api/gallery/destination/{destinationId}")
    public ResponseEntity<List<GalleryImageDto>> getImagesByDestination(
            @PathVariable Long destinationId,
            HttpServletRequest request) {
        return ResponseEntity.ok(galleryService.getImagesByDestination(destinationId, request));
    }

    // ===== Admin endpoints =====

    @GetMapping("/api/admin/gallery")
    public ResponseEntity<PageResponse<GalleryImageDto>> getAllImagesAdmin(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        return ResponseEntity.ok(galleryService.getAllImagesAdmin(page, size));
    }

    @GetMapping("/api/admin/gallery/{id}")
    public ResponseEntity<GalleryImageDto> getImageById(@PathVariable Long id) {
        return ResponseEntity.ok(galleryService.getImageById(id));
    }

    @GetMapping("/api/admin/gallery/{id}/translations")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<Map<String, Map<String, String>>> getImageTranslations(@PathVariable Long id) {
        return ResponseEntity.ok(galleryService.getImageTranslations(id));
    }

    @PutMapping("/api/admin/gallery/{id}/translations")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<Void> saveImageTranslations(
            @PathVariable Long id,
            @RequestBody Map<String, Map<String, String>> translations) {
        galleryService.saveImageTranslations(id, translations);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/api/admin/gallery/{id}")
    public ResponseEntity<Void> deleteImage(@PathVariable Long id) {
        galleryService.deleteImage(id);
        return ResponseEntity.noContent().build();
    }
}
