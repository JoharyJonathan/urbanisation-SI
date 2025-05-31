package com.monclub.domain.usecases;

import java.util.Optional;

import com.monclub.domain.entities.Membre;
import com.monclub.domain.repositories.MembreRepository;
import com.monclub.infrastructure.security.PasswordEncoder;

public class AuthenticateUserUseCase {
    private final MembreRepository membreRepository;
    private final PasswordEncoder passwordEncoder;

    public AuthenticateUserUseCase(MembreRepository membreRepository, PasswordEncoder passwordEncoder) {
        this.membreRepository = membreRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public Optional<Membre> execute(String email, String password) {
        Optional<Membre> membre = membreRepository.findByEmail(email);
        
        if (membre.isPresent() && passwordEncoder.matches(password, membre.get().getMotDePasse())) {
            return membre;
        }
        
        return Optional.empty();
    }
}