package com.monclub.domain.usecases;

import com.monclub.domain.entities.Membre;
import com.monclub.domain.repositories.MembreRepository;

public class GetMembreByIdUseCase {
    private final MembreRepository membreRepository;

    public GetMembreByIdUseCase(MembreRepository membreRepository) {
        this.membreRepository = membreRepository;
    }

    public Membre execute(int id) {
        return membreRepository.findById(id).orElse(null);
    }    
}