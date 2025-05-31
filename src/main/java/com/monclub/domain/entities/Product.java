package com.monclub.domain.entities;

public class Product {
    private int id;
    private String nom;
    private String type;
    private int quantite;
    private String description;
    private String image;

    
    public Product() {}

    public Product(String nom, String type, int quantite, String description, String image) {
        this.nom = nom;
        this.type = type;
        this.quantite = quantite;
        this.description = description;
        this.image = image;
    }

    public boolean isDisponible() {
        return quantite > 0;
    }

    public boolean hasImage() {
        return image != null && !image.trim().isEmpty();
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public int getQuantite() { return quantite; }
    public void setQuantite(int quantite) { this.quantite = quantite; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
}
