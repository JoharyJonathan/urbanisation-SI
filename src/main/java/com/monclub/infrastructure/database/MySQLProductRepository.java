package com.monclub.infrastructure.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.monclub.domain.entities.Product;
import com.monclub.domain.repositories.ProductRepository;

public class MySQLProductRepository implements ProductRepository {

    @Override
    public void save(Product product) {
        String sql = "INSERT INTO products (nom, type, quantite, description, image) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            statement.setString(1, product.getNom());
            statement.setString(2, product.getType());
            statement.setInt(3, product.getQuantite());
            statement.setString(4, product.getDescription());
            statement.setString(5, product.getImage());

            int affectedRows = statement.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        product.setId(generatedKeys.getInt(1));
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la sauvegarde du produit", e);
        }
    }

    @Override
    public Optional<Product> findById(int id) {
        String sql = "SELECT * FROM products WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return Optional.of(mapResultSetToProduct(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la recherche du produit par ID", e);
        }

        return Optional.empty();
    }

    @Override
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                products.add(mapResultSetToProduct(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération des produits", e);
        }

        return products;
    }

    @Override
    public void update(Product product) {
        String sql = "UPDATE products SET nom = ?, type = ?, quantite = ?, description = ?, image = ? WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, product.getNom());
            statement.setString(2, product.getType());
            statement.setInt(3, product.getQuantite());
            statement.setString(4, product.getDescription());
            statement.setString(5, product.getImage());
            statement.setInt(6, product.getId());

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la mise à jour du produit", e);
        }
    }

    @Override
    public void deleteById(int id) {
        String sql = "DELETE FROM products WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la suppression du produit", e);
        }
    }

    private Product mapResultSetToProduct(ResultSet resultSet) throws SQLException {
        Product product = new Product();
        product.setId(resultSet.getInt("id"));
        product.setNom(resultSet.getString("nom"));
        product.setType(resultSet.getString("type"));
        product.setQuantite(resultSet.getInt("quantite"));
        product.setDescription(resultSet.getString("description"));
        product.setImage(resultSet.getString("image"));
        return product;
    }
}