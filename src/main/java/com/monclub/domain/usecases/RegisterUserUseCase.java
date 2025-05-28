package com.monclub.domain.usecases;

import com.monclub.domain.entities.Membre;
import com.monclub.domain.repositories.MembreRepository;
import com.monclub.infrastructure.security.PasswordEncoder;

public class RegisterUserUseCase {
    private final MembreRepository membreRepository;
    private final PasswordEncoder passwordEncoder;

    public RegisterUserUseCase(MembreRepository membreRepository, PasswordEncoder passwordEncoder) {
        this.membreRepository = membreRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public void execute(Membre membre) {
        // Validate business rules
        if (!membre.hasValidEmail()) {
            throw new IllegalArgumentException("Email invalide");
        }

        // Check if user already exists
        if (membreRepository.findByEmail(membre.getEmail()).isPresent()) {
            throw new IllegalArgumentException("Un utilisateur avec cet email existe déjà");
        }

        // Encode password
        String encodedPassword = passwordEncoder.encode(membre.getMotDePasse());
        membre.setMotDePasse(encodedPassword);

        // Save member
        membreRepository.save(membre);
    }
}