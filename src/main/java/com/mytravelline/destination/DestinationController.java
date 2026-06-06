package com.mytravelline.destination;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class DestinationController {

    private final DestinationService destinationService;

    // ===== Public endpoints =====

    @GetMapping("/api/destinations")
    public ResponseEntity<List<DestinationDto>> getActiveDestinations(HttpServletRequest request) {
        return ResponseEntity.ok(destinationService.getAllActiveDestinations(request));
    }

    @GetMapping("/api/destinations/{slug}")
    public ResponseEntity<DestinationDto> getDestinationBySlug(@PathVariable String slug,
                                                                HttpServletRequest request) {
        return ResponseEntity.ok(destinationService.getDestinationBySlug(slug, request));
    }

    // ===== Admin endpoints =====

    @GetMapping("/api/admin/destinations")
    public ResponseEntity<List<DestinationDto>> getAllDestinations() {
        return ResponseEntity.ok(destinationService.getAllDestinations());
    }

    @GetMapping("/api/admin/destinations/{id}")
    public ResponseEntity<DestinationDto> getDestinationById(@PathVariable Long id) {
        return ResponseEntity.ok(destinationService.getDestinationById(id));
    }

    @GetMapping("/api/admin/destinations/{id}/translations")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<Map<String, Map<String, String>>> getDestinationTranslations(@PathVariable Long id) {
        return ResponseEntity.ok(destinationService.getDestinationTranslations(id));
    }

    @PutMapping("/api/admin/destinations/{id}/translations")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<Void> saveDestinationTranslations(
            @PathVariable Long id,
            @RequestBody Map<String, Map<String, String>> translations) {
        destinationService.saveDestinationTranslations(id, translations);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/api/admin/destinations")
    public ResponseEntity<DestinationDto> createDestination(@Valid @RequestBody DestinationDto dto) {
        return ResponseEntity.status(HttpStatus.CREATED).body(destinationService.createDestination(dto));
    }

    @PutMapping("/api/admin/destinations/{id}")
    public ResponseEntity<DestinationDto> updateDestination(@PathVariable Long id,
                                                             @Valid @RequestBody DestinationDto dto) {
        return ResponseEntity.ok(destinationService.updateDestination(id, dto));
    }

    @DeleteMapping("/api/admin/destinations/{id}")
    public ResponseEntity<Void> deleteDestination(@PathVariable Long id) {
        destinationService.deleteDestination(id);
        return ResponseEntity.noContent().build();
    }
}
