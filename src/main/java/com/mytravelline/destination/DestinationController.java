package com.mytravelline.destination;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class DestinationController {

    private final DestinationService destinationService;

    // ===== Public endpoints =====

    @GetMapping("/api/destinations")
    public ResponseEntity<List<DestinationDto>> getActiveDestinations() {
        return ResponseEntity.ok(destinationService.getAllActiveDestinations());
    }

    @GetMapping("/api/destinations/{slug}")
    public ResponseEntity<DestinationDto> getDestinationBySlug(@PathVariable String slug) {
        return ResponseEntity.ok(destinationService.getDestinationBySlug(slug));
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

    @PostMapping("/api/admin/destinations")
    public ResponseEntity<DestinationDto> createDestination(@Valid @RequestBody DestinationDto dto) {
        return ResponseEntity.status(HttpStatus.CREATED).body(destinationService.createDestination(dto));
    }

    @PutMapping("/api/admin/destinations/{id}")
    public ResponseEntity<DestinationDto> updateDestination(@PathVariable Long id, @Valid @RequestBody DestinationDto dto) {
        return ResponseEntity.ok(destinationService.updateDestination(id, dto));
    }

    @DeleteMapping("/api/admin/destinations/{id}")
    public ResponseEntity<Void> deleteDestination(@PathVariable Long id) {
        destinationService.deleteDestination(id);
        return ResponseEntity.noContent().build();
    }
}
