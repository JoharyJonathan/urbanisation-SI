package com.monclub.domain.repositories;

import java.util.List;
import java.util.Optional;

import com.monclub.domain.entities.Product;

public interface ProductRepository {
    void save(Product product);
    Optional<Product> findById(int id);
    List<Product> findAll();
    void deleteById(int id);
    void update(Product product);
}
