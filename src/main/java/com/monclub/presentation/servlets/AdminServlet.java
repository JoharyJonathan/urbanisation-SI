package com.monclub.presentation.servlets;

import java.io.IOException;
import java.util.List;

import com.monclub.domain.entities.Membre;
import com.monclub.presentation.controllers.AdminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet({"/admin", "/admin/modifier"})
public class AdminServlet extends HttpServlet {
    private AdminController adminController;

    @Override
    public void init() throws ServletException {
        adminController = ServletDependencyFactory.getAdminController();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || !"admin".equals(session.getAttribute("utilisateurRole"))) {
            response.sendRedirect(request.getContextPath() + "/accueil");
            return;
        }

        String path = request.getServletPath();
        
        try {
            if ("/admin/modifier".equals(path)) {
                // On veut modifier un membre
                int id = Integer.parseInt(request.getParameter("id"));
                Membre membre = adminController.getMembreById(id);
                request.setAttribute("membre", membre);
                request.getRequestDispatcher("/WEB-INF/modifier-membre.jsp").forward(request, response);
            } else {
                // Affichage de la liste des membres
                List<Membre> membres = adminController.getAllMembers();
                request.setAttribute("membres", membres);
                request.getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Erreur lors du traitement de la requête.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("supprimer".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                adminController.supprimerMembre(id);
            } else if ("modifier".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String nom = request.getParameter("nom");
                String prenom = request.getParameter("prenom");
                String email = request.getParameter("email");
                String abonnement = request.getParameter("typeabonnement");
                String role = request.getParameter("role");

                Membre membreModifie = new Membre();
                membreModifie.setId(id);
                membreModifie.setNom(nom);
                membreModifie.setPrenom(prenom);
                membreModifie.setEmail(email);
                membreModifie.setTypeAbonnement(abonnement);
                membreModifie.setRole(role);

                Membre membreExistant = adminController.getMembreById(id);
                membreModifie.setMotDePasse(membreExistant.getMotDePasse());
    
                adminController.modifierMembre(membreModifie);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Erreur lors de la mise à jour ou suppression.");
            return;
        }

        // Redirection vers la liste mise à jour
        response.sendRedirect(request.getContextPath() + "/admin");
    }
}