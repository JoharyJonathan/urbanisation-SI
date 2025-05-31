package com.monclub.domain.usecases;

import com.monclub.domain.repositories.ProductRepository;

public class DeleteProductUseCase {
    private final ProductRepository productRepository;

    public DeleteProductUseCase(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public void execute(int productId) {
        if (productId <= 0) {
            throw new IllegalArgumentException("L'identifiant du produit est invalide.");
        }

        productRepository.deleteById(productId);
    }
}