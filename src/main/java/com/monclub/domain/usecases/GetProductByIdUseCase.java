package com.monclub.domain.usecases;

import com.monclub.domain.entities.Product;
import com.monclub.domain.repositories.ProductRepository;

public class GetProductByIdUseCase {
    private final ProductRepository productRepository;

    public GetProductByIdUseCase(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product execute(int id) {
        return productRepository.findById(id).orElse(null);
    }
}