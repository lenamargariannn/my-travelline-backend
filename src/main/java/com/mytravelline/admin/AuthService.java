package com.mytravelline.admin;

import com.mytravelline.admin.dto.LoginRequest;
import com.mytravelline.admin.dto.TokenResponse;
import com.mytravelline.security.JwtProperties;
import com.mytravelline.security.JwtService;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class AuthService {

    private final AdminUserRepository repo;
    private final PasswordEncoder encoder;
    private final JwtService jwtService;
    private final JwtProperties jwtProps;

    public AuthService(AdminUserRepository repo,
                       PasswordEncoder encoder,
                       JwtService jwtService,
                       JwtProperties jwtProps) {
        this.repo = repo;
        this.encoder = encoder;
        this.jwtService = jwtService;
        this.jwtProps = jwtProps;
    }

    public TokenResponse login(LoginRequest request) {
        AdminUser user = repo.findByEmailIgnoreCase(request.email())
                .orElseThrow(() -> new BadCredentialsException("Invalid credentials"));

        if (!user.isEnabled() || !encoder.matches(request.password(), user.getPasswordHash())) {
            throw new BadCredentialsException("Invalid credentials");
        }

        String access = jwtService.generateAccessToken(
                user.getEmail(),
                Map.of("role", user.getRole().name(), "uid", user.getId())
        );
        String refresh = jwtService.generateRefreshToken(user.getEmail());

        return new TokenResponse(
                access,
                refresh,
                "Bearer",
                jwtProps.accessTokenExpirationMs(),
                user.getEmail(),
                user.getRole().name()
        );
    }
}
