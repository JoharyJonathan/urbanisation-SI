package com.monclub;

import java.util.List;
import java.util.Scanner;

import com.monclub.application.dto.AuthenticationResult;
import com.monclub.application.dto.LoginRequest;
import com.monclub.application.dto.RegisterRequest;
import com.monclub.application.services.AuthenticationService;
import com.monclub.domain.entities.Membre;
import com.monclub.domain.repositories.MembreRepository;
import com.monclub.domain.usecases.AuthenticateUserUseCase;
import com.monclub.domain.usecases.GetAllMembersUseCase;
import com.monclub.domain.usecases.RegisterUserUseCase;
import com.monclub.infrastructure.database.MySQLMembreRepository;
import com.monclub.infrastructure.security.PasswordEncoder;

public class Main {
    private static AuthenticationService authenticationService;
    private static GetAllMembersUseCase getAllMembersUseCase;
    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        System.out.println("=== Application Club de Sport ===");
        System.out.println("Initialisation de l'application...");
        
        initializeApplication();
        
        System.out.println("Application initialisée avec succès!");
        System.out.println("Vous pouvez maintenant démarrer votre serveur web.");
        
        runDemo();
    }

    private static void initializeApplication() {
        try {
            MembreRepository membreRepository = new MySQLMembreRepository();
            PasswordEncoder passwordEncoder = new PasswordEncoder();

            AuthenticateUserUseCase authenticateUserUseCase = 
                new AuthenticateUserUseCase(membreRepository, passwordEncoder);
            RegisterUserUseCase registerUserUseCase = 
                new RegisterUserUseCase(membreRepository, passwordEncoder);
            getAllMembersUseCase = new GetAllMembersUseCase(membreRepository);

            authenticationService = new AuthenticationService(
                authenticateUserUseCase, 
                registerUserUseCase
            );

            System.out.println("✓ Couches d'architecture initialisées");
            System.out.println("✓ Base de données connectée");
            System.out.println("✓ Services configurés");
            
        } catch (Exception e) {
            System.err.println("Erreur lors de l'initialisation: " + e.getMessage());
            System.err.println("Vérifiez votre configuration de base de données.");
        }
    }

    private static void runDemo() {
        System.out.println("\n=== Mode Démonstration ===");
        System.out.println("Voulez-vous tester les fonctionnalités ? (y/n)");
        
        String choice = scanner.nextLine();
        if (!"y".equalsIgnoreCase(choice)) {
            System.out.println("Démonstration ignorée. Application prête.");
            return;
        }

        boolean running = true;
        while (running) {
            showMenu();
            String option = scanner.nextLine();
            
            switch (option) {
                case "1":
                    testRegistration();
                    break;
                case "2":
                    testLogin();
                    break;
                case "3":
                    listAllMembers();
                    break;
                case "4":
                    showArchitectureInfo();
                    break;
                case "0":
                    running = false;
                    break;
                default:
                    System.out.println("Option invalide.");
            }
        }
        
        System.out.println("Démonstration terminée. L'application web est prête à être utilisée.");
    }

    private static void showMenu() {
        System.out.println("\n--- Menu de Démonstration ---");
        System.out.println("1. Tester l'inscription");
        System.out.println("2. Tester la connexion");
        System.out.println("3. Lister tous les membres");
        System.out.println("4. Afficher l'architecture");
        System.out.println("0. Quitter la démonstration");
        System.out.print("Votre choix: ");
    }

    private static void testRegistration() {
        System.out.println("\n--- Test d'Inscription ---");
        System.out.print("Nom: ");
        String nom = scanner.nextLine();
        System.out.print("Prénom: ");
        String prenom = scanner.nextLine();
        System.out.print("Email: ");
        String email = scanner.nextLine();
        System.out.print("Mot de passe: ");
        String motDePasse = scanner.nextLine();
        System.out.print("Type d'abonnement (mensuel/annuel): ");
        String typeAbonnement = scanner.nextLine();

        RegisterRequest request = new RegisterRequest();
        request.setNom(nom);
        request.setPrenom(prenom);
        request.setEmail(email);
        request.setMotDePasse(motDePasse);
        request.setTypeAbonnement(typeAbonnement);

        try {
            AuthenticationResult result = authenticationService.register(request);
            
            if (result.isSuccess()) {
                System.out.println("✓ Inscription réussie pour: " + result.getMembre().getEmail());
            } else {
                System.out.println("✗ Erreur: " + result.getErrorMessage());
            }
        } catch (Exception e) {
            System.out.println("✗ Erreur technique: " + e.getMessage());
        }
    }

    private static void testLogin() {
        System.out.println("\n--- Test de Connexion ---");
        System.out.print("Email: ");
        String email = scanner.nextLine();
        System.out.print("Mot de passe: ");
        String motDePasse = scanner.nextLine();

        LoginRequest request = new LoginRequest(email, motDePasse);

        try {
            AuthenticationResult result = authenticationService.login(request);
            
            if (result.isSuccess()) {
                Membre membre = result.getMembre();
                System.out.println("✓ Connexion réussie!");
                System.out.println("  Nom: " + membre.getNom() + " " + membre.getPrenom());
                System.out.println("  Rôle: " + membre.getRole());
                System.out.println("  Type d'abonnement: " + membre.getTypeAbonnement());
            } else {
                System.out.println("✗ Erreur: " + result.getErrorMessage());
            }
        } catch (Exception e) {
            System.out.println("✗ Erreur technique: " + e.getMessage());
        }
    }

    private static void listAllMembers() {
        System.out.println("\n--- Liste des Membres ---");
        
        try {
            List<Membre> membres = getAllMembersUseCase.execute();
            
            if (membres.isEmpty()) {
                System.out.println("Aucun membre trouvé.");
            } else {
                System.out.println("Nombre total de membres: " + membres.size());
                System.out.println();
                
                for (Membre membre : membres) {
                    System.out.printf("ID: %d | %s %s | %s | Rôle: %s | Abonnement: %s%n",
                        membre.getId(),
                        membre.getPrenom(),
                        membre.getNom(),
                        membre.getEmail(),
                        membre.getRole(),
                        membre.getTypeAbonnement()
                    );
                }
            }
        } catch (Exception e) {
            System.out.println("✗ Erreur lors de la récupération: " + e.getMessage());
        }
    }

    private static void showArchitectureInfo() {
        System.out.println("\n=== Architecture Clean du Projet ===");
        System.out.println();
        System.out.println("📁 COUCHES DE L'APPLICATION:");
        System.out.println();
        
        System.out.println("1️⃣  DOMAIN LAYER (Cœur métier)");
        System.out.println("   ├── Entities: Membre");
        System.out.println("   ├── Repositories: MembreRepository (interface)");
        System.out.println("   └── Use Cases: AuthenticateUser, RegisterUser, GetAllMembers");
        System.out.println();
        
        System.out.println("2️⃣  APPLICATION LAYER (Services applicatifs)");
        System.out.println("   ├── Services: AuthenticationService");
        System.out.println("   └── DTOs: LoginRequest, RegisterRequest, AuthenticationResult");
        System.out.println();
        
        System.out.println("3️⃣  INFRASTRUCTURE LAYER (Détails techniques)");
        System.out.println("   ├── Database: MySQLMembreRepository, DatabaseConnection");
        System.out.println("   ├── Security: PasswordEncoder (BCrypt)");
        System.out.println("   └── Config: DatabaseConfig");
        System.out.println();
        
        System.out.println("4️⃣  PRESENTATION LAYER (Interface utilisateur)");
        System.out.println("   ├── Controllers: AuthController, AdminController, HomeController");
        System.out.println("   ├── Servlets: ConnexionServlet, InscriptionServlet, AdminServlet");
        System.out.println("   ├── Filters: SecurityFilter");
        System.out.println("   └── Views: JSP files");
        System.out.println();
        
        System.out.println("🔄 FLUX DE DONNÉES:");
        System.out.println("   Web Request → Servlet → Controller → Service → Use Case → Repository → Database");
        System.out.println();
        
        System.out.println("✅ AVANTAGES DE CETTE ARCHITECTURE:");
        System.out.println("   • Séparation claire des responsabilités");
        System.out.println("   • Testabilité améliorée");
        System.out.println("   • Indépendance des couches");
        System.out.println("   • Facilité de maintenance");
        System.out.println("   • Évolutivité du code");
        System.out.println();
    }
}