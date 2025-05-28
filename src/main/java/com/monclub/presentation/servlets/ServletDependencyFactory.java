package com.monclub.presentation.servlets;

import com.monclub.application.services.AuthenticationService;
import com.monclub.domain.repositories.MembreRepository;
import com.monclub.domain.usecases.AuthenticateUserUseCase;
import com.monclub.domain.usecases.GetAllMembersUseCase;
import com.monclub.domain.usecases.GetMembreByIdUseCase;
import com.monclub.domain.usecases.ModifierMembreUseCase;
import com.monclub.domain.usecases.RegisterUserUseCase;
import com.monclub.domain.usecases.SupprimerMembreUseCase;
import com.monclub.infrastructure.database.MySQLMembreRepository;
import com.monclub.infrastructure.security.PasswordEncoder;
import com.monclub.presentation.controllers.AdminController;
import com.monclub.presentation.controllers.AuthController;
import com.monclub.presentation.controllers.HomeController;

public class ServletDependencyFactory {
    private static PasswordEncoder passwordEncoder;
    private static AuthenticationService authenticationService;
    private static AuthController authController;
    private static AdminController adminController;
    private static HomeController homeController;

    static {
        initializeDependencies();
    }

    private static void initializeDependencies() {
        // Infrastructure
        MembreRepository membreRepository = new MySQLMembreRepository();
        passwordEncoder = new PasswordEncoder();

        // Use Cases
        AuthenticateUserUseCase authenticateUserUseCase = new AuthenticateUserUseCase(membreRepository, passwordEncoder);
        RegisterUserUseCase registerUserUseCase = new RegisterUserUseCase(membreRepository, passwordEncoder);
        GetAllMembersUseCase getAllMembersUseCase = new GetAllMembersUseCase(membreRepository);
        ModifierMembreUseCase modifierMembreUseCase = new ModifierMembreUseCase(membreRepository);
        SupprimerMembreUseCase supprimerMembreUseCase = new SupprimerMembreUseCase(membreRepository);
        GetMembreByIdUseCase getMembreByIdUseCase = new GetMembreByIdUseCase(membreRepository);

        // Application Services
        authenticationService = new AuthenticationService(authenticateUserUseCase, registerUserUseCase);

        // Controllers
        authController = new AuthController(authenticationService);
        adminController = new AdminController(getAllMembersUseCase, modifierMembreUseCase, supprimerMembreUseCase, getMembreByIdUseCase);
        homeController = new HomeController();
    }

    public static AuthController getAuthController() {
        return authController;
    }

    public static AdminController getAdminController() {
        return adminController;
    }

    public static HomeController getHomeController() {
        return homeController;
    }
}