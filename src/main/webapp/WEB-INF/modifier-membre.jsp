<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.monclub.domain.entities.Membre" %>
<%
    Membre membre = (Membre) request.getAttribute("membre");
    if (membre == null) {
        out.println("Aucun membre trouvé.");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier Membre</title>
</head>
<body>
    <h1>Modifier le membre</h1>
    <form method="post" action="${pageContext.request.contextPath}/admin">
        <input type="hidden" name="action" value="modifier" />
        <input type="hidden" name="id" value="<%= membre.getId() %>" />
    
        <label>Nom:</label>
        <input type="text" name="nom" value="<%= membre.getNom() %>" /><br>
    
        <label>Prénom:</label>
        <input type="text" name="prenom" value="<%= membre.getPrenom() %>" /><br>
    
        <label>Email:</label>
        <input type="text" name="email" value="<%= membre.getEmail() %>" /><br>

        <label>Abonnement:</label>
        <input type="text" name="typeabonnement" value="<%= membre.getTypeAbonnement() %>"><br>

        <label>Role:</label>
        <input type="text" name="role" value="<%= membre.getRole() %>"><br>
    
        <button type="submit">Enregistrer</button>
        <a href="${pageContext.request.contextPath}/admin">Annuler</a>
    </form>    
</body>
</html>