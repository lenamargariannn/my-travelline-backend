package com.mytravelline.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

@Configuration
@ConfigurationProperties(prefix = "app")
@Getter
@Setter
public class AppProperties {

    private Jwt jwt = new Jwt();
    private Cors cors = new Cors();
    private S3 s3 = new S3();
    private Ses ses = new Ses();
    private Map<String, BigDecimal> exchangeRates = new HashMap<>();

    @Getter
    @Setter
    public static class Jwt {
        private String secret;
        private long accessTokenExpiration = 900000; // 15 minutes
        private long refreshTokenExpiration = 604800000; // 7 days
    }

    @Getter
    @Setter
    public static class Cors {
        private String allowedOrigins = "http://localhost:5173";
    }

    @Getter
    @Setter
    public static class S3 {
        private String bucket;
        private String region = "us-east-1";
        private String cdnUrl;
    }

    @Getter
    @Setter
    public static class Ses {
        private String fromEmail = "noreply@mytravelline.com";
        private String region = "us-east-1";
    }
}
