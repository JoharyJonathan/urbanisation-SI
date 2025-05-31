package com.monclub.domain.usecases;

import com.monclub.domain.entities.Product;
import com.monclub.domain.repositories.ProductRepository;

public class UpdateProductUseCase {
    private final ProductRepository productRepository;

    public UpdateProductUseCase(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public void execute(Product product) {
        if (product == null || product.getId() <= 0) {
            throw new IllegalArgumentException("Le produit est invalide pour la mise à jour.");
        }

        productRepository.update(product);
    }
}