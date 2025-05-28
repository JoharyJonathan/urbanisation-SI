package com.monclub.domain.repositories;

import java.util.List;
import java.util.Optional;

import com.monclub.domain.entities.Membre;

public interface MembreRepository {
    Optional<Membre> findByEmail(String email);
    List<Membre> findAll();
    void save(Membre membre);
    Optional<Membre> findById(int id);
    void update(Membre membre);
    void delete(int id);
}