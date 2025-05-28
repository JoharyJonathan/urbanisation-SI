package com.monclub.domain.usecases;

import com.monclub.domain.entities.Membre;
import com.monclub.domain.repositories.MembreRepository;

public class ModifierMembreUseCase {
    private final MembreRepository membreRepository;

    public ModifierMembreUseCase(MembreRepository membreRepository) {
        this.membreRepository = membreRepository;
    }

    public void execute(Membre membre) {
        if (membre != null && membre.getId() > 0) {
            membreRepository.update(membre);
        } else {
            throw new IllegalArgumentException("Membre invalide pour la modification.");
        }
    }
}