package com.mytravelline.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpMethod;
import org.springframework.lang.NonNull;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private final JwtService jwtService;
    private final UserDetailsService userDetailsService;

    private static final AntPathMatcher PATH_MATCHER = new AntPathMatcher();

    private static final List<String> PUBLIC_GET_PATTERNS = List.of(
            "/api/tours/**", "/api/categories/**", "/api/destinations/**",
            "/api/blog/**", "/api/gallery/**", "/api/reviews/**", "/api/currencies", "/healthz"
    );

    private static final List<String> PUBLIC_POST_PATTERNS = List.of(
            "/api/bookings", "/api/contact"
    );

    private static final List<String> PUBLIC_POST_AUTH_PATTERNS = List.of(
            "/api/admin/auth/login", "/api/admin/auth/refresh"
    );

    private static final List<String> PUBLIC_ANY_PATTERNS = List.of(
            "/actuator/**", "/api-docs/**", "/swagger-ui/**", "/swagger-ui.html"
    );

    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) {
        String method = request.getMethod();
        String path = request.getServletPath();

        if (HttpMethod.OPTIONS.name().equals(method)) return true;

        if (HttpMethod.GET.name().equals(method) &&
                PUBLIC_GET_PATTERNS.stream().anyMatch(p -> PATH_MATCHER.match(p, path))) return true;

        if (HttpMethod.POST.name().equals(method) &&
                PUBLIC_POST_PATTERNS.stream().anyMatch(p -> PATH_MATCHER.match(p, path))) return true;

        if (HttpMethod.POST.name().equals(method) &&
                PUBLIC_POST_AUTH_PATTERNS.stream().anyMatch(p -> PATH_MATCHER.match(p, path))) return true;

        return PUBLIC_ANY_PATTERNS.stream().anyMatch(p -> PATH_MATCHER.match(p, path));
    }

    @Override
    protected void doFilterInternal(
            @NonNull HttpServletRequest request,
            @NonNull HttpServletResponse response,
            @NonNull FilterChain filterChain
    ) throws ServletException, IOException {
        final String authHeader = request.getHeader("Authorization");

        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            filterChain.doFilter(request, response);
            return;
        }

        final String jwt = authHeader.substring(7).trim();

        if (!jwt.contains(".")) {
            log.warn("Malformed token on {} {} — not a JWT (no periods). Length={}, starts='{}'",
                    request.getMethod(), request.getServletPath(),
                    jwt.length(), jwt.length() > 10 ? jwt.substring(0, 10) + "…" : jwt);
            filterChain.doFilter(request, response);
            return;
        }

        try {
            final String userEmail = jwtService.extractUsername(jwt);

            if (userEmail != null && SecurityContextHolder.getContext().getAuthentication() == null) {
                UserDetails userDetails = this.userDetailsService.loadUserByUsername(userEmail);

                if (jwtService.isTokenValid(jwt, userDetails)) {
                    List<SimpleGrantedAuthority> authorities = jwtService.extractRoles(jwt).stream()
                            .map(SimpleGrantedAuthority::new)
                            .toList();
                    UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(
                            userDetails,
                            null,
                            authorities
                    );
                    authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                    SecurityContextHolder.getContext().setAuthentication(authToken);
                } else {
                    log.warn("Invalid JWT token for user '{}' on {} {}", userEmail, request.getMethod(), request.getServletPath());
                }
            }
        } catch (Exception e) {
            log.warn("JWT processing failed on {} {}: {}", request.getMethod(), request.getServletPath(), e.getMessage());
        }

        filterChain.doFilter(request, response);
    }
}
