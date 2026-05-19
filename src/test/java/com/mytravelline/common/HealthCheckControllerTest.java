package com.mytravelline.common;

import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;

class HealthCheckControllerTest {

    private final HealthCheckController controller = new HealthCheckController();

    @Test
    void healthzReturnsUp() {
        ResponseEntity<Map<String, String>> response = controller.healthz();

        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);
        assertThat(response.getBody()).containsEntry("status", "UP");
    }
}

