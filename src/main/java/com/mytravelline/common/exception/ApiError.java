package com.mytravelline.common.exception;

import lombok.Builder;
import lombok.Getter;

import java.time.Instant;
import java.util.List;

@Getter
@Builder
public class ApiError {
    private final Instant timestamp;
    private final int status;
    private final String error;
    private final String message;
    private final String path;
    private final List<FieldViolation> errors;

    @Getter
    @Builder
    public static class FieldViolation {
        private final String field;
        private final String message;
    }
}
