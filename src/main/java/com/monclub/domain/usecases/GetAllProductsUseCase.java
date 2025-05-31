package com.monclub.domain.usecases;

import java.util.List;

import com.monclub.domain.entities.Product;
import com.monclub.domain.repositories.ProductRepository;

public class GetAllProductsUseCase {
    private final ProductRepository productRepository;

    public GetAllProductsUseCase(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> execute() {
        return productRepository.findAll();
    }
}