package com.mytravelline.gallery;

import com.mytravelline.common.PageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class GalleryController {

    private final GalleryService galleryService;

    // ===== Public endpoints =====

    @GetMapping("/api/gallery")
    public ResponseEntity<PageResponse<GalleryImageDto>> getAllImages(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        return ResponseEntity.ok(galleryService.getAllImages(page, size));
    }

    @GetMapping("/api/gallery/destination/{destinationId}")
    public ResponseEntity<List<GalleryImageDto>> getImagesByDestination(@PathVariable Long destinationId) {
        return ResponseEntity.ok(galleryService.getImagesByDestination(destinationId));
    }

    // ===== Admin endpoints =====

    @GetMapping("/api/admin/gallery")
    public ResponseEntity<PageResponse<GalleryImageDto>> getAllImagesAdmin(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        return ResponseEntity.ok(galleryService.getAllImages(page, size));
    }

    @GetMapping("/api/admin/gallery/{id}")
    public ResponseEntity<GalleryImageDto> getImageById(@PathVariable Long id) {
        return ResponseEntity.ok(galleryService.getImageById(id));
    }

    @DeleteMapping("/api/admin/gallery/{id}")
    public ResponseEntity<Void> deleteImage(@PathVariable Long id) {
        galleryService.deleteImage(id);
        return ResponseEntity.noContent().build();
    }
}
