package com.monclub.domain.usecases;

import com.monclub.domain.repositories.MembreRepository;

public class SupprimerMembreUseCase {
    private final MembreRepository membreRepository;

    public SupprimerMembreUseCase(MembreRepository membreRepository) {
        this.membreRepository = membreRepository;
    }

    public void execute(int id) {
        if (id > 0) {
            membreRepository.delete(id);
        } else {
            throw new IllegalArgumentException("ID invalide pour la suppression.");
        }
    }
}