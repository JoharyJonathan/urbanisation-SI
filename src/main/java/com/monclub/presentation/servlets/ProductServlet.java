package com.monclub.presentation.servlets;

import java.io.IOException;
import java.util.List;

import com.monclub.domain.entities.Product;
import com.monclub.presentation.controllers.ProductController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet({"/products", "/products/modifier", "/products/ajouter"})
public class ProductServlet extends HttpServlet {
    private ProductController productController;

    @Override
    public void init() throws ServletException {
        productController = ServletDependencyFactory.getProductController();
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
            if ("/products/modifier".equals(path)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Product product = productController.getProductById(id);
                request.setAttribute("product", product);
                request.getRequestDispatcher("/WEB-INF/modifier-product.jsp").forward(request, response);

            } else if ("/products/ajouter".equals(path)) {
                request.getRequestDispatcher("/WEB-INF/ajouter-product.jsp").forward(request, response);

            } else {
                List<Product> products = productController.getAllProducts();
                request.setAttribute("products", products);
                request.getRequestDispatcher("/WEB-INF/products.jsp").forward(request, response);
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
                productController.supprimerProduct(id);

            } else if ("modifier".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String nom = request.getParameter("nom");
                String type = request.getParameter("type");
                int quantite = Integer.parseInt(request.getParameter("quantite"));
                String description = request.getParameter("description");
                String image = request.getParameter("image");

                Product product = new Product();
                product.setId(id);
                product.setNom(nom);
                product.setType(type);
                product.setQuantite(quantite);
                product.setDescription(description);
                product.setImage(image);

                productController.modifierProduct(product);

            } else if ("ajouter".equals(action)) {
                String nom = request.getParameter("nom");
                String type = request.getParameter("type");
                int quantite = Integer.parseInt(request.getParameter("quantite"));
                String description = request.getParameter("description");
                String image = request.getParameter("image");

                Product newProduct = new Product(nom, type, quantite, description, image);
                productController.addProduct(newProduct);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Erreur lors de l'ajout, mise à jour ou suppression.");
            return;
        }

        response.sendRedirect(request.getContextPath() + "/products");
    }
}