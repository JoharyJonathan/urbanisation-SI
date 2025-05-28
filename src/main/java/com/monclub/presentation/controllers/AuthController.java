package com.monclub.presentation.controllers;

import com.monclub.application.dto.LoginRequest;
import com.monclub.application.dto.RegisterRequest;
import com.monclub.application.dto.AuthenticationResult;
import com.monclub.application.services.AuthenticationService;
import com.monclub.domain.entities.Membre;
import jakarta.servlet.http.HttpSession;

public class AuthController {
    private final AuthenticationService authenticationService;

    public AuthController(AuthenticationService authenticationService) {
        this.authenticationService = authenticationService;
    }

    public AuthenticationResult login(LoginRequest request) {
        return authenticationService.login(request);
    }

    public AuthenticationResult register(RegisterRequest request) {
        return authenticationService.register(request);
    }

    public void createUserSession(HttpSession session, Membre membre) {
        session.setAttribute("utilisateurId", membre.getId());
        session.setAttribute("nom", membre.getNom());
        session.setAttribute("prenom", membre.getPrenom());
        session.setAttribute("email", membre.getEmail());
        session.setAttribute("typeAbonnement", membre.getTypeAbonnement());
        session.setAttribute("utilisateurRole", membre.getRole());
    }

    public void destroyUserSession(HttpSession session) {
        if (session != null) {
            session.invalidate();
        }
    }
}