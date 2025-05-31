<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion & Inscription</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container" id="container">
        <!-- Formulaire de Connexion -->
        <div class="form-container sign-in-container">
            <form action="${pageContext.request.contextPath}/connexion" method="post">
                <h1>Se connecter</h1>
                <input type="email" name="email" placeholder="Email" required />
                <input type="password" name="motDePasse" placeholder="Mot de passe" required />
                <button type="submit">Se connecter</button>
                
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p class="error"><%= request.getAttribute("errorMessage") %></p>
                <% } %>
            </form>
        </div>
        
        <!-- Formulaire d'Inscription -->
        <div class="form-container sign-up-container">
            <form action="${pageContext.request.contextPath}/inscription" method="post">
                <h1>S'inscrire</h1>
                <input type="text" name="nom" placeholder="Nom" required />
                <input type="text" name="prenom" placeholder="Prénom" required />
                <input type="email" name="email" placeholder="Email" required />
                <input type="password" name="motDePasse" placeholder="Mot de passe" required />
                <select name="typeAbonnement" required>
                    <option value="">Type d'abonnement</option>
                    <option value="mensuel">Mensuel</option>
                    <option value="annuel">Annuel</option>
                </select>
                <button type="submit">S'inscrire</button>
            </form>
        </div>
        
        <!-- Overlay pour basculer entre les formulaires -->
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Bon retour!</h1>
                    <p>Pour rester connecté avec nous, connectez-vous avec vos informations personnelles</p>
                    <button class="ghost" id="signIn">Se connecter</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Bonjour!</h1>
                    <p>Entrez vos données personnelles et commencez votre parcours avec nous</p>
                    <button class="ghost" id="signUp">S'inscrire</button>
                </div>
            </div>
        </div>
    </div>
    
    <script src="script.js"></script>
</body>
</html>