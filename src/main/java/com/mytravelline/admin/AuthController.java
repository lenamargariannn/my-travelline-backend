package com.mytravelline.admin;

import com.mytravelline.admin.dto.LoginRequest;
import com.mytravelline.admin.dto.LoginResponse;
import com.mytravelline.admin.dto.SignupRequest;
import com.mytravelline.admin.dto.TokenRefreshRequest;
import com.mytravelline.common.exception.BadRequestException;
import com.mytravelline.security.JwtService;
import com.mytravelline.security.LoginRateLimiter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api/admin/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final UserDetailsService userDetailsService;
    private final JwtService jwtService;
    private final AdminUserRepository adminUserRepository;
    private final PasswordEncoder passwordEncoder;
    private final LoginRateLimiter rateLimiter;

    @PostMapping("/signup")
    @PreAuthorize("!${app.signup.require-admin:true} or hasRole('ADMIN')")
    public ResponseEntity<LoginResponse> signup(@Valid @RequestBody SignupRequest request) {
        if (adminUserRepository.existsByEmail(request.getEmail())) {
            throw new BadRequestException("Email already in use");
        }

        AdminUser newUser = AdminUser.builder()
                .email(request.getEmail())
                .passwordHash(passwordEncoder.encode(request.getPassword()))
                .name(request.getName())
                .role(request.getRole())
                .build();

        adminUserRepository.save(newUser);
        log.info("Admin user created: email={}, role={}", newUser.getEmail(), newUser.getRole());

        UserDetails userDetails = userDetailsService.loadUserByUsername(newUser.getEmail());
        String accessToken = jwtService.generateAccessToken(userDetails);
        String refreshToken = jwtService.generateRefreshToken(userDetails);

        LoginResponse response = LoginResponse.builder()
                .accessToken(accessToken)
                .refreshToken(refreshToken)
                .email(newUser.getEmail())
                .name(newUser.getName())
                .role(newUser.getRole().name())
                .build();

        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@Valid @RequestBody LoginRequest request,
                                               HttpServletRequest httpRequest) {
        String ip = httpRequest.getRemoteAddr();

        if (rateLimiter.isBlocked(ip)) {
            log.warn("Login blocked (rate limit) for IP {} attempting email={}", ip, request.getEmail());
            return ResponseEntity.status(HttpStatus.TOO_MANY_REQUESTS).build();
        }

        try {
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword())
            );
        } catch (BadCredentialsException e) {
            rateLimiter.recordFailure(ip);
            log.warn("Failed login attempt for email={} from IP {}", request.getEmail(), ip);
            throw e;
        }

        rateLimiter.reset(ip);

        UserDetails userDetails = userDetailsService.loadUserByUsername(request.getEmail());
        AdminUser adminUser = adminUserRepository.findByEmail(request.getEmail())
                .orElseThrow();

        String accessToken = jwtService.generateAccessToken(userDetails);
        String refreshToken = jwtService.generateRefreshToken(userDetails);

        LoginResponse response = LoginResponse.builder()
                .accessToken(accessToken)
                .refreshToken(refreshToken)
                .email(adminUser.getEmail())
                .name(adminUser.getName())
                .role(adminUser.getRole().name())
                .build();

        log.info("Admin login: email={} from IP {}", adminUser.getEmail(), ip);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/refresh")
    public ResponseEntity<LoginResponse> refresh(@Valid @RequestBody TokenRefreshRequest request) {
        String username = jwtService.extractUsername(request.getRefreshToken());
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);

        if (!jwtService.isTokenValid(request.getRefreshToken(), userDetails)) {
            return ResponseEntity.status(401).build();
        }

        AdminUser adminUser = adminUserRepository.findByEmail(username).orElseThrow();
        String newAccessToken = jwtService.generateAccessToken(userDetails);

        LoginResponse response = LoginResponse.builder()
                .accessToken(newAccessToken)
                .refreshToken(request.getRefreshToken())
                .email(adminUser.getEmail())
                .name(adminUser.getName())
                .role(adminUser.getRole().name())
                .build();

        return ResponseEntity.ok(response);
    }
}
