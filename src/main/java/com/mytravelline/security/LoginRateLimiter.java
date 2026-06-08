package com.mytravelline.security;

import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.Instant;
import java.util.concurrent.ConcurrentHashMap;

@Slf4j
@Component
public class LoginRateLimiter {

    private static final int MAX_ATTEMPTS = 5;
    private static final long WINDOW_SECONDS = 900;  // 15 minutes

    private record Attempt(int count, Instant windowStart) {
        boolean isExpired() {
            return Instant.now().isAfter(windowStart.plusSeconds(WINDOW_SECONDS));
        }
        boolean isBlocked() {
            return !isExpired() && count >= MAX_ATTEMPTS;
        }
    }

    private final ConcurrentHashMap<String, Attempt> attempts = new ConcurrentHashMap<>();

    public boolean isBlocked(String ip) {
        Attempt a = attempts.get(ip);
        return a != null && a.isBlocked();
    }

    public void recordFailure(String ip) {
        attempts.compute(ip, (key, existing) -> {
            if (existing == null || existing.isExpired()) {
                return new Attempt(1, Instant.now());
            }
            return new Attempt(existing.count() + 1, existing.windowStart());
        });

        Attempt a = attempts.get(ip);
        if (a != null && a.count() >= MAX_ATTEMPTS) {
            log.warn("Login rate limit reached for IP {} ({} failures in 15 min) — blocked for 15 min",
                    ip, a.count());
        }
    }

    public void reset(String ip) {
        attempts.remove(ip);
    }

    @Scheduled(fixedDelay = 300_000)
    public void evictExpired() {
        attempts.entrySet().removeIf(e -> e.getValue().isExpired());
    }
}
