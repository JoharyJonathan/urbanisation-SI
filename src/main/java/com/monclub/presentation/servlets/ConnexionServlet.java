package com.monclub.presentation.servlets;

import java.io.IOException;
import com.monclub.application.dto.LoginRequest;
import com.monclub.application.dto.AuthenticationResult;
import com.monclub.presentation.controllers.AuthController;
import com.monclub.domain.entities.Membre;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/connexion")
public class ConnexionServlet extends HttpServlet {
    private AuthController authController;

    @Override
    public void init() throws ServletException {
        // Dependency injection would be handled by a DI container in a real application
        authController = ServletDependencyFactory.getAuthController();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/connexionXinscription.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");

        LoginRequest loginRequest = new LoginRequest(email, motDePasse);
        AuthenticationResult result = authController.login(loginRequest);

        if (result.isSuccess()) {
            Membre membre = result.getMembre();
            authController.createUserSession(request.getSession(), membre);

            // Redirection selon le rôle
            if (membre.isAdmin()) {
                response.sendRedirect(request.getContextPath() + "/admin");
            } else {
                response.sendRedirect(request.getContextPath() + "/accueil");
            }
        } else {
            request.setAttribute("errorMessage", result.getErrorMessage());
            request.getRequestDispatcher("/WEB-INF/connexionXinscription.jsp").forward(request, response);
        }
    }
}