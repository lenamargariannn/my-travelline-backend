package com.mytravelline.security;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class SignupGuard {

    private final boolean requireAdmin;

    public SignupGuard(@Value("${app.signup.require-admin:true}") boolean requireAdmin) {
        this.requireAdmin = requireAdmin;
    }

    public boolean isAdminRequired() {
        return requireAdmin;
    }
}
