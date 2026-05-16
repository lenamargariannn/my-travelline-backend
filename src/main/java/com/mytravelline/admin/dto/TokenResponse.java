package com.mytravelline.admin.dto;

public record TokenResponse(
        String accessToken,
        String refreshToken,
        String tokenType,
        long expiresInMs,
        String email,
        String role
) {
}
