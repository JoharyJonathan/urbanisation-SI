package com.monclub.presentation.servlets;

import java.io.IOException;
import com.monclub.presentation.controllers.AuthController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deconnexion")
public class DeconnexionServlet extends HttpServlet {
    private AuthController authController;

    @Override
    public void init() throws ServletException {
        authController = ServletDependencyFactory.getAuthController();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        authController.destroyUserSession(request.getSession(false));
        response.sendRedirect(request.getContextPath() + "/connexion");
    }
}