package com.mytravelline.admin.dto;

public record AuthResponse(
        String accessToken,
        String refreshToken,
        String name,
        String role
) {
}
