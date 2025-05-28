<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.monclub.domain.entities.Membre" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Administration - Club de Sport</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="admin-dashboard">
        <header>
            <h1>Administration - Gestion des Membres</h1>
            <div class="nav">
                <a href="${pageContext.request.contextPath}/accueil" class="btn">Retour à l'accueil</a>
                <a href="${pageContext.request.contextPath}/deconnexion" class="btn logout">Déconnexion</a>
            </div>
        </header>
        
        <main>
            <div class="members-list">
                <h2>Liste des Membres</h2>
                
                <% 
                List<Membre> membres = (List<Membre>) request.getAttribute("membres");
                if (membres != null && !membres.isEmpty()) { 
                %>
                    <table class="members-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nom</th>
                                <th>Prénom</th>
                                <th>Email</th>
                                <th>Abonnement</th>
                                <th>Rôle</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Membre membre : membres) { %>
                                <tr>
                                    <td><%= membre.getId() %></td>
                                    <td><%= membre.getNom() %></td>
                                    <td><%= membre.getPrenom() %></td>
                                    <td><%= membre.getEmail() %></td>
                                    <td><%= membre.getTypeAbonnement() %></td>
                                    <td><%= membre.getRole() %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                    
                    <div class="stats">
                        <p><strong>Total des membres:</strong> <%= membres.size() %></p>
                    </div>
                <% } else { %>
                    <p class="no-data">Aucun membre trouvé.</p>
                <% } %>
            </div>
        </main>
    </div>
</body>
</html>