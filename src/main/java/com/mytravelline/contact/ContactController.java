package com.mytravelline.contact;

import com.mytravelline.common.PageResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequiredArgsConstructor
public class ContactController {

    private final ContactService contactService;

    // ===== Public endpoint =====

    @PostMapping("/api/contact")
    public ResponseEntity<Map<String, String>> submitContactForm(@Valid @RequestBody CreateContactRequest request) {
        contactService.createMessage(request);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(Map.of("message", "Thank you for your message. We will get back to you soon!"));
    }

    // ===== Admin endpoints =====

    @GetMapping("/api/admin/contacts")
    public ResponseEntity<PageResponse<ContactMessageDto>> getAllMessages(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestParam(required = false, defaultValue = "false") boolean unreadOnly) {

        if (unreadOnly) {
            return ResponseEntity.ok(contactService.getUnreadMessages(page, size));
        }
        return ResponseEntity.ok(contactService.getAllMessages(page, size));
    }

    @GetMapping("/api/admin/contacts/{id}")
    public ResponseEntity<ContactMessageDto> getMessageById(@PathVariable Long id) {
        return ResponseEntity.ok(contactService.getMessageById(id));
    }

    @PatchMapping("/api/admin/contacts/{id}/read")
    public ResponseEntity<ContactMessageDto> markAsRead(@PathVariable Long id) {
        return ResponseEntity.ok(contactService.markAsRead(id));
    }

    @DeleteMapping("/api/admin/contacts/{id}")
    public ResponseEntity<Void> deleteMessage(@PathVariable Long id) {
        contactService.deleteMessage(id);
        return ResponseEntity.noContent().build();
    }
}
