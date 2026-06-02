package com.mytravelline.admin;

import com.mytravelline.admin.dto.AdminUserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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
}
