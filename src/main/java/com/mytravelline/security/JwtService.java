package com.mytravelline.security;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Service;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.Date;
import java.util.Map;

@Service
public class JwtService {

    private final JwtProperties props;
    private final SecretKey signingKey;

    public JwtService(JwtProperties props) {
        this.props = props;
        this.signingKey = Keys.hmacShaKeyFor(props.secret().getBytes(StandardCharsets.UTF_8));
    }

    public String generateAccessToken(String subject, Map<String, Object> claims) {
        Instant now = Instant.now();
        return Jwts.builder()
                .issuer(props.issuer())
                .subject(subject)
                .claims(claims)
                .issuedAt(Date.from(now))
                .expiration(Date.from(now.plusMillis(props.accessTokenExpirationMs())))
                .signWith(signingKey)
                .compact();
    }

    public String generateRefreshToken(String subject) {
        Instant now = Instant.now();
        return Jwts.builder()
                .issuer(props.issuer())
                .subject(subject)
                .issuedAt(Date.from(now))
                .expiration(Date.from(now.plusMillis(props.refreshTokenExpirationMs())))
                .signWith(signingKey)
                .compact();
    }

    public Claims parse(String token) {
        return Jwts.parser()
                .verifyWith(signingKey)
                .requireIssuer(props.issuer())
                .build()
                .parseSignedClaims(token)
                .getPayload();
    }
}
