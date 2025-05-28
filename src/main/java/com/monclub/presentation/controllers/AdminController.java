package com.monclub.presentation.controllers;

import java.util.List;

import com.monclub.domain.entities.Membre;
import com.monclub.domain.usecases.GetAllMembersUseCase;
import com.monclub.domain.usecases.GetMembreByIdUseCase;
import com.monclub.domain.usecases.ModifierMembreUseCase;
import com.monclub.domain.usecases.SupprimerMembreUseCase;

public class AdminController {
    private final GetAllMembersUseCase getAllMembersUseCase;
    private final ModifierMembreUseCase modifierMembreUseCase;
    private final SupprimerMembreUseCase supprimerMembreUseCase;
    private final GetMembreByIdUseCase getMembreByIdUseCase;

    public AdminController(
        GetAllMembersUseCase getAllMembersUseCase,
        ModifierMembreUseCase modifierMembreUseCase,
        SupprimerMembreUseCase supprimerMembreUseCase,
        GetMembreByIdUseCase getMembreByIdUseCase
    ) {
        this.getAllMembersUseCase = getAllMembersUseCase;
        this.modifierMembreUseCase = modifierMembreUseCase;
        this.supprimerMembreUseCase = supprimerMembreUseCase;
        this.getMembreByIdUseCase = getMembreByIdUseCase;
    }

    public List<Membre> getAllMembers() {
        return getAllMembersUseCase.execute();
    }

    public void modifierMembre(Membre membre) {
        modifierMembreUseCase.execute(membre);
    }

    public void supprimerMembre(int id) {
        supprimerMembreUseCase.execute(id);
    }

    public Membre getMembreById(int id) {
        return getMembreByIdUseCase.execute(id);
    }
}