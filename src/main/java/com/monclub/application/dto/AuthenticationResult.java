package com.monclub.application.dto;

import com.monclub.domain.entities.Membre;

public class AuthenticationResult {
    private boolean success;
    private Membre membre;
    private String errorMessage;

    public AuthenticationResult(boolean success, Membre membre) {
        this.success = success;
        this.membre = membre;
    }

    public AuthenticationResult(boolean success, String errorMessage) {
        this.success = success;
        this.errorMessage = errorMessage;
    }

    public boolean isSuccess() { return success; }
    public Membre getMembre() { return membre; }
    public String getErrorMessage() { return errorMessage; }
}