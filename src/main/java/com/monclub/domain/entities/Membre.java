package com.monclub.domain.entities;
public class Membre {
    private int id;
    private String nom;
    private String prenom;
    private String email;
    private String motDePasse;
    private String typeAbonnement;
    private String role;

    // Constructeurs
    public Membre() {}

    public Membre(String nom, String prenom, String email, String motDePasse, 
                  String typeAbonnement, String role) {
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.motDePasse = motDePasse;
        this.typeAbonnement = typeAbonnement;
        this.role = role;
    }

    // Business logic methods
    public boolean isAdmin() {
        return "admin".equalsIgnoreCase(this.role);
    }

    public boolean hasValidEmail() {
        return email != null && email.contains("@");
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }
    
    public String getPrenom() { return prenom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getMotDePasse() { return motDePasse; }
    public void setMotDePasse(String motDePasse) { this.motDePasse = motDePasse; }
    
    public String getTypeAbonnement() { return typeAbonnement; }
    public void setTypeAbonnement(String typeAbonnement) { this.typeAbonnement = typeAbonnement; }
    
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}