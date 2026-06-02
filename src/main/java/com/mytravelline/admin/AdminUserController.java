package com.mytravelline.admin;

import com.mytravelline.admin.dto.AdminUserDto;
import com.mytravelline.common.exception.BadRequestException;
import com.mytravelline.common.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/admin/users")
@RequiredArgsConstructor
public class AdminUserController {

    private final AdminUserRepository adminUserRepository;

    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<AdminUserDto>> getUsers(
            @RequestParam(required = false, defaultValue = "") String email) {
        List<AdminUserDto> users = adminUserRepository
                .findByEmailContainingIgnoreCaseOrderByCreatedAtDesc(email)
                .stream()
                .map(u -> AdminUserDto.builder()
                        .id(u.getId())
                        .email(u.getEmail())
                        .name(u.getName())
                        .role(u.getRole())
                        .active(u.isActive())
                        .createdAt(u.getCreatedAt())
                        .updatedAt(u.getUpdatedAt())
                        .build())
                .toList();
        return ResponseEntity.ok(users);
    }

    @DeleteMapping
    @PreAuthorize("hasRole('ADMIN')")
    @Transactional
    public ResponseEntity<Void> deleteUser(
            @RequestParam String email,
            @AuthenticationPrincipal UserDetails currentUser) {

        if (currentUser.getUsername().equalsIgnoreCase(email)) {
            throw new BadRequestException("You cannot delete your own account");
        }

        if (!adminUserRepository.existsByEmail(email)) {
            throw new ResourceNotFoundException("AdminUser", "email", email);
        }

        adminUserRepository.deleteByEmail(email);
        log.info("Admin user deleted: email={}, deletedBy={}", email, currentUser.getUsername());

        return ResponseEntity.noContent().build();
    }
}
