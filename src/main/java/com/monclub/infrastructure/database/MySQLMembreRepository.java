package com.monclub.infrastructure.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.monclub.domain.entities.Membre;
import com.monclub.domain.repositories.MembreRepository;

public class MySQLMembreRepository implements MembreRepository {

    @Override
    public Optional<Membre> findByEmail(String email) {
        String sql = "SELECT * FROM membres WHERE email = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                return Optional.of(mapResultSetToMembre(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la recherche par email", e);
        }
        
        return Optional.empty();
    }

    @Override
    public List<Membre> findAll() {
        List<Membre> membres = new ArrayList<>();
        String sql = "SELECT * FROM membres";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            
            while (resultSet.next()) {
                membres.add(mapResultSetToMembre(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération des membres", e);
        }
        
        return membres;
    }

    @Override
    public void save(Membre membre) {
        String sql = "INSERT INTO membres (nom, prenom, email, mot_de_passe, type_abonnement, role) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            statement.setString(1, membre.getNom());
            statement.setString(2, membre.getPrenom());
            statement.setString(3, membre.getEmail());
            statement.setString(4, membre.getMotDePasse());
            statement.setString(5, membre.getTypeAbonnement());
            statement.setString(6, membre.getRole());
            
            int affectedRows = statement.executeUpdate();
            
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        membre.setId(generatedKeys.getInt(1));
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la sauvegarde du membre", e);
        }
    }

    @Override
    public Optional<Membre> findById(int id) {
        String sql = "SELECT * FROM membres WHERE id = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                return Optional.of(mapResultSetToMembre(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la recherche par ID", e);
        }
        
        return Optional.empty();
    }

    @Override
    public void update(Membre membre) {
        String sql = "UPDATE membres SET nom = ?, prenom = ?, email = ?, mot_de_passe = ?, type_abonnement = ?, role = ? WHERE id = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setString(1, membre.getNom());
            statement.setString(2, membre.getPrenom());
            statement.setString(3, membre.getEmail());
            statement.setString(4, membre.getMotDePasse());
            statement.setString(5, membre.getTypeAbonnement());
            statement.setString(6, membre.getRole());
            statement.setInt(7, membre.getId());
            
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la mise à jour du membre", e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM membres WHERE id = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la suppression du membre", e);
        }
    }

    private Membre mapResultSetToMembre(ResultSet resultSet) throws SQLException {
        Membre membre = new Membre();
        membre.setId(resultSet.getInt("id"));
        membre.setNom(resultSet.getString("nom"));
        membre.setPrenom(resultSet.getString("prenom"));
        membre.setEmail(resultSet.getString("email"));
        membre.setMotDePasse(resultSet.getString("mot_de_passe"));
        membre.setTypeAbonnement(resultSet.getString("type_abonnement"));
        membre.setRole(resultSet.getString("role"));
        return membre;
    }
}