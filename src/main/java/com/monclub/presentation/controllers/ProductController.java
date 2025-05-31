package com.monclub.presentation.controllers;

import java.util.List;

import com.monclub.domain.entities.Product;
import com.monclub.domain.usecases.AddProductUseCase;
import com.monclub.domain.usecases.DeleteProductUseCase;
import com.monclub.domain.usecases.GetAllProductsUseCase;
import com.monclub.domain.usecases.GetProductByIdUseCase;
import com.monclub.domain.usecases.UpdateProductUseCase;

public class ProductController {
    private final GetAllProductsUseCase getAllProductsUseCase;
    private final UpdateProductUseCase updateProductUseCase;
    private final DeleteProductUseCase deleteProductUseCase;
    private final GetProductByIdUseCase getProductByIdUseCase;
    private final AddProductUseCase addProductUseCase;

    public ProductController(
        GetAllProductsUseCase getAllProductsUseCase,
        UpdateProductUseCase updateProductUseCase,
        DeleteProductUseCase deleteProductUseCase,
        GetProductByIdUseCase getProductByIdUseCase,
        AddProductUseCase addProductUseCase
    ) {
        this.getAllProductsUseCase = getAllProductsUseCase;
        this.updateProductUseCase = updateProductUseCase;
        this.deleteProductUseCase = deleteProductUseCase;
        this.getProductByIdUseCase = getProductByIdUseCase;
        this.addProductUseCase = addProductUseCase;
    }

    public List<Product> getAllProducts() {
        return getAllProductsUseCase.execute();
    }

    public void modifierProduct(Product product) {
        updateProductUseCase.execute(product);
    }

    public void supprimerProduct(int id) {
        deleteProductUseCase.execute(id);
    }

    public Product getProductById(int id) {
        return getProductByIdUseCase.execute(id);
    }

    public void addProduct(Product product) {
        addProductUseCase.execute(product);
    }
}
