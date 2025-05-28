package com.monclub.application.services;

import java.util.Optional;

import com.monclub.application.dto.AuthenticationResult;
import com.monclub.application.dto.LoginRequest;
import com.monclub.application.dto.RegisterRequest;
import com.monclub.domain.entities.Membre;
import com.monclub.domain.usecases.AuthenticateUserUseCase;
import com.monclub.domain.usecases.RegisterUserUseCase;

public class AuthenticationService {
    private final AuthenticateUserUseCase authenticateUserUseCase;
    private final RegisterUserUseCase registerUserUseCase;

    public AuthenticationService(AuthenticateUserUseCase authenticateUserUseCase, 
                               RegisterUserUseCase registerUserUseCase) {
        this.authenticateUserUseCase = authenticateUserUseCase;
        this.registerUserUseCase = registerUserUseCase;
    }

    public AuthenticationResult login(LoginRequest request) {
        try {
            Optional<Membre> membre = authenticateUserUseCase.execute(request.getEmail(), request.getMotDePasse());
            
            if (membre.isPresent()) {
                return new AuthenticationResult(true, membre.get());
            } else {
                return new AuthenticationResult(false, "Email ou mot de passe incorrect");
            }
        } catch (Exception e) {
            return new AuthenticationResult(false, "Erreur lors de la connexion");
        }
    }

    public AuthenticationResult register(RegisterRequest request) {
        try {
            Membre membre = new Membre(
                request.getNom(),
                request.getPrenom(),
                request.getEmail(),
                request.getMotDePasse(),
                request.getTypeAbonnement(),
                "membre"
            );

            registerUserUseCase.execute(membre);
            return new AuthenticationResult(true, membre);
        } catch (IllegalArgumentException e) {
            return new AuthenticationResult(false, e.getMessage());
        } catch (Exception e) {
            return new AuthenticationResult(false, "Erreur lors de l'inscription");
        }
    }
}