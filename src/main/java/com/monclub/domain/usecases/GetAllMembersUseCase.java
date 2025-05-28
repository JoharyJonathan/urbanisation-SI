package com.monclub.domain.usecases;

import java.util.List;

import com.monclub.domain.entities.Membre;
import com.monclub.domain.repositories.MembreRepository;

public class GetAllMembersUseCase {
    private final MembreRepository membreRepository;

    public GetAllMembersUseCase(MembreRepository membreRepository) {
        this.membreRepository = membreRepository;
    }

    public List<Membre> execute() {
        return membreRepository.findAll();
    }
}