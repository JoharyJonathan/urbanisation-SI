<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Accueil - Club de Sport</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="dashboard">
        <header>
            <h1><%= request.getAttribute("welcomeMessage") != null ? 
                    request.getAttribute("welcomeMessage") : 
                    "Bienvenue au Club de Sport!" %></h1>
            <div class="user-info">
                <span>Connecté en tant que: <%= session.getAttribute("prenom") %> <%= session.getAttribute("nom") %></span>
                <a href="${pageContext.request.contextPath}/deconnexion" class="btn logout">Déconnexion</a>
            </div>
        </header>
        
        <main>
            <div class="member-info">
                <h2>Vos informations</h2>
                <p><strong>Email:</strong> <%= session.getAttribute("email") %></p>
                <p><strong>Abonnement:</strong> <%= session.getAttribute("typeAbonnement") %></p>
                <p><strong>Rôle:</strong> <%= session.getAttribute("utilisateurRole") %></p>
            </div>
            
            <% if ("admin".equals(session.getAttribute("utilisateurRole"))) { %>
                <div class="admin-section">
                    <h2>Administration</h2>
                    <a href="${pageContext.request.contextPath}/admin" class="btn admin">Gérer les membres</a>
                </div>
            <% } %>
        </main>
    </div>
</body>
</html>