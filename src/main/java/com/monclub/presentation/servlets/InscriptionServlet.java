package com.monclub.presentation.servlets;

import java.io.IOException;
import com.monclub.application.dto.RegisterRequest;
import com.monclub.application.dto.AuthenticationResult;
import com.monclub.presentation.controllers.AuthController;
import com.monclub.domain.entities.Membre;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/inscription")
public class InscriptionServlet extends HttpServlet {
    private AuthController authController;

    @Override
    public void init() throws ServletException {
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
        
        RegisterRequest registerRequest = new RegisterRequest();
        registerRequest.setNom(request.getParameter("nom"));
        registerRequest.setPrenom(request.getParameter("prenom"));
        registerRequest.setEmail(request.getParameter("email"));
        registerRequest.setMotDePasse(request.getParameter("motDePasse"));
        registerRequest.setTypeAbonnement(request.getParameter("typeAbonnement"));

        AuthenticationResult result = authController.register(registerRequest);

        if (result.isSuccess()) {
            Membre membre = result.getMembre();
            authController.createUserSession(request.getSession(), membre);
            response.sendRedirect(request.getContextPath() + "/accueil");
        } else {
            request.setAttribute("errorMessage", result.getErrorMessage());
            request.getRequestDispatcher("/WEB-INF/connexionXinscription.jsp").forward(request, response);
        }
    }
}