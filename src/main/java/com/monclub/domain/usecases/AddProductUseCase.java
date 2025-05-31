package com.monclub.domain.usecases;

import com.monclub.domain.entities.Product;
import com.monclub.domain.repositories.ProductRepository;

public class AddProductUseCase {
    private final ProductRepository productRepository;

    public AddProductUseCase(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public void execute(Product product) {
        if (product == null) {
            throw new IllegalArgumentException("Le produit ne peut pas être nul.");
        }

        productRepository.save(product);
    }
}
