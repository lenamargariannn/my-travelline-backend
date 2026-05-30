package com.mytravelline.config;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Slf4j
@Component
@RequiredArgsConstructor
public class StartupLogger {

    private static final Set<String> SENSITIVE_KEYS = Set.of(
            "secret", "password", "passwd", "pwd", "token", "key", "credential", "private", "auth"
    );

    private final AppProperties appProperties;

    @EventListener(ApplicationReadyEvent.class)
    public void onReady() {
        logEnvVars();
        logCorsConfig();
    }

    private void logEnvVars() {
        log.info("──────────────────────────── Environment Variables ────────────────────────────");
        System.getenv().entrySet().stream()
                .sorted(Map.Entry.comparingByKey())
                .forEach(e -> log.info("  {} = {}", e.getKey(), mask(e.getKey(), e.getValue())));
        log.info("────────────────────────────────────────────────────────────────────────────────");
    }

    private void logCorsConfig() {
        String rawOrigins = System.getenv("ALLOWED_ORIGINS");
        List<String> parsedOrigins = Arrays.stream(appProperties.getCors().getAllowedOrigins().split(","))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .toList();

        log.info("──────────────────────────────── CORS Config ───────────────────────────────────");
        log.info("  ALLOWED_ORIGINS env var : {}", rawOrigins != null ? rawOrigins : "(not set — falling back to default)");
        log.info("  Parsed origins ({})      :", parsedOrigins.size());
        parsedOrigins.forEach(o -> log.info("    ✓ {}", o));
        log.info("  Methods                 : GET, POST, PUT, PATCH, DELETE, OPTIONS");
        log.info("  Headers                 : Content-Type, Authorization");
        log.info("  Allow-Credentials       : true");
        log.info("  Max-Age                 : 3600 s");
        log.info("  Path pattern            : /**");
        log.info("  Filter order            : {} (before Spring Security)", org.springframework.core.Ordered.HIGHEST_PRECEDENCE);
        log.info("────────────────────────────────────────────────────────────────────────────────");
    }

    private String mask(String key, String value) {
        String lower = key.toLowerCase();
        boolean sensitive = SENSITIVE_KEYS.stream().anyMatch(lower::contains);
        return sensitive ? "***" : value;
    }
}
