package com.monclub.presentation.servlets;

import java.io.IOException;
import com.monclub.presentation.controllers.HomeController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/accueil")
public class AccueilServlet extends HttpServlet {
    private HomeController homeController;

    @Override
    public void init() throws ServletException {
        homeController = ServletDependencyFactory.getHomeController();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String userRole = (session != null) ? (String) session.getAttribute("utilisateurRole") : null;
        
        String welcomeMessage = homeController.getWelcomeMessage(userRole);
        request.setAttribute("welcomeMessage", welcomeMessage);
        
        request.getRequestDispatcher("/WEB-INF/accueil.jsp").forward(request, response);
    }
}