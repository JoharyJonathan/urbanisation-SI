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
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier Membre - GestProd</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            --card-shadow-hover: 0 20px 40px rgba(0, 0, 0, 0.15);
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding: 20px 0;
        }
        
        .page-header {
            background: var(--primary-gradient);
            color: white;
            padding: 60px 0;
            margin-bottom: 40px;
            position: relative;
            overflow: hidden;
        }
        
        .page-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1" fill="rgba(255,255,255,0.1)"/></pattern></defs><rect width="100" height="100" fill="url(%23dots)"/></svg>');
            opacity: 0.3;
        }
        
        .page-header .container {
            position: relative;
            z-index: 2;
        }
        
        .breadcrumb-custom {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 50px;
            padding: 8px 20px;
            display: inline-flex;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .breadcrumb-custom a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: color 0.3s ease;
        }
        
        .breadcrumb-custom a:hover {
            color: white;
        }
        
        .main-card {
            background: white;
            border-radius: 20px;
            box-shadow: var(--card-shadow);
            border: 1px solid rgba(0, 0, 0, 0.05);
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .main-card:hover {
            box-shadow: var(--card-shadow-hover);
            transform: translateY(-2px);
        }
        
        .card-header-custom {
            background: var(--primary-gradient);
            color: white;
            padding: 25px 30px;
            border: none;
        }
        
        .card-header-custom h2 {
            margin: 0;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .form-floating-custom {
            position: relative;
            margin-bottom: 25px;
        }
        
        .form-floating-custom .form-control {
            height: 60px;
            border: 2px solid #e9ecef;
            border-radius: 15px;
            padding: 20px 15px 10px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }
        
        .form-floating-custom .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.15);
            background: white;
        }
        
        .form-floating-custom label {
            position: absolute;
            top: 20px;
            left: 15px;
            font-size: 14px;
            font-weight: 500;
            color: #6c757d;
            transition: all 0.3s ease;
            pointer-events: none;
        }
        
        .form-floating-custom .form-control:focus + label,
        .form-floating-custom .form-control:not(:placeholder-shown) + label {
            top: 8px;
            font-size: 12px;
            color: #667eea;
        }
        
        .form-select-custom {
            height: 60px;
            border: 2px solid #e9ecef;
            border-radius: 15px;
            padding: 15px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }
        
        .form-select-custom:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.15);
            background: white;
        }
        
        .btn-custom {
            padding: 15px 30px;
            border-radius: 50px;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
            border: none;
            font-size: 16px;
        }
        
        .btn-primary-custom {
            background: var(--primary-gradient);
            color: white;
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        
        .btn-primary-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
            color: white;
        }
        
        .btn-secondary-custom {
            background: #6c757d;
            color: white;
            box-shadow: 0 5px 15px rgba(108, 117, 125, 0.4);
        }
        
        .btn-secondary-custom:hover {
            background: #5c636a;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(108, 117, 125, 0.6);
            color: white;
        }
        
        .member-info-card {
            background: linear-gradient(135deg, #667eea20, #764ba220);
            border: 1px solid rgba(102, 126, 234, 0.2);
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
        }
        
        .member-avatar {
            width: 80px;
            height: 80px;
            background: var(--primary-gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2rem;
            font-weight: 600;
            margin-right: 20px;
        }
        
        .form-section {
            padding: 40px;
        }
        
        .section-title {
            color: #2d3748;
            font-weight: 600;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .section-title::before {
            content: '';
            width: 4px;
            height: 25px;
            background: var(--primary-gradient);
            border-radius: 2px;
        }
        
        .alert-custom {
            border: none;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
        }
        
        .alert-info-custom {
            background: linear-gradient(135deg, #4facfe20, #00f2fe20);
            border-left: 4px solid #4facfe;
            color: #2d3748;
        }
        
        @media (max-width: 768px) {
            .page-header {
                padding: 40px 0;
            }
            
            .form-section {
                padding: 20px;
            }
            
            .member-avatar {
                width: 60px;
                height: 60px;
                font-size: 1.5rem;
                margin-right: 15px;
            }
            
            .btn-custom {
                width: 100%;
                justify-content: center;
                margin-bottom: 10px;
            }
        }
        
        /* Animation d'entrée */
        .fade-in {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.6s ease forwards;
        }
        
        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .form-floating-custom:nth-child(1) { animation-delay: 0.1s; }
        .form-floating-custom:nth-child(2) { animation-delay: 0.2s; }
        .form-floating-custom:nth-child(3) { animation-delay: 0.3s; }
        .form-floating-custom:nth-child(4) { animation-delay: 0.4s; }
        .form-floating-custom:nth-child(5) { animation-delay: 0.5s; }
    </style>
</head>
<body>
    <!-- En-tête de page -->
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb-custom">
                <a href="${pageContext.request.contextPath}/admin">
                    <i class="bi bi-house-fill me-2"></i>Administration
                </a>
                <i class="bi bi-chevron-right mx-2 text-white-50"></i>
                <span>Modifier Membre</span>
            </div>
            <h1 class="display-6 fw-bold mb-0">
                <i class="bi bi-person-gear me-3"></i>
                Modification du Membre
            </h1>
            <p class="lead mb-0 opacity-90">
                Modifiez les informations du membre sélectionné
            </p>
        </div>
    </div>
    
    <div class="container">
        <!-- Informations du membre -->
        <div class="member-info-card fade-in">
            <div class="d-flex align-items-center">
                <div class="member-avatar">
                    <%= membre.getPrenom().substring(0,1).toUpperCase() + membre.getNom().substring(0,1).toUpperCase() %>
                </div>
                <div>
                    <h4 class="mb-1 fw-bold"><%= membre.getPrenom() %> <%= membre.getNom() %></h4>
                    <p class="mb-1 text-muted">
                        <i class="bi bi-envelope me-2"></i><%= membre.getEmail() %>
                    </p>
                    <div class="d-flex gap-3">
                        <span class="badge bg-primary">
                            <i class="bi bi-tag me-1"></i><%= membre.getTypeAbonnement() %>
                        </span>
                        <span class="badge bg-success">
                            <i class="bi bi-person-badge me-1"></i><%= membre.getRole() %>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Alerte d'information -->
        <div class="alert alert-custom alert-info-custom fade-in">
            <div class="d-flex align-items-center">
                <i class="bi bi-info-circle-fill fs-4 me-3"></i>
                <div>
                    <strong>Information :</strong> Assurez-vous de vérifier toutes les informations avant de sauvegarder les modifications.
                </div>
            </div>
        </div>
        
        <!-- Formulaire principal -->
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="main-card fade-in">
                    <div class="card-header-custom">
                        <h2>
                            <i class="bi bi-pencil-square"></i>
                            Formulaire de Modification
                        </h2>
                    </div>
                    
                    <div class="form-section">
                        <form method="post" action="${pageContext.request.contextPath}/admin" id="memberForm">
                            <input type="hidden" name="action" value="modifier" />
                            <input type="hidden" name="id" value="<%= membre.getId() %>" />
                            
                            <!-- Section Informations personnelles -->
                            <h3 class="section-title">
                                <i class="bi bi-person-fill"></i>
                                Informations Personnelles
                            </h3>
                            
                            <div class="row g-4">
                                <div class="col-md-6">
                                    <div class="form-floating-custom fade-in">
                                        <input type="text" 
                                               class="form-control" 
                                               id="nom" 
                                               name="nom" 
                                               value="<%= membre.getNom() %>" 
                                               placeholder=" "
                                               required>
                                        <label for="nom">
                                            <i class="bi bi-person me-2"></i>Nom
                                        </label>
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="form-floating-custom fade-in">
                                        <input type="text" 
                                               class="form-control" 
                                               id="prenom" 
                                               name="prenom" 
                                               value="<%= membre.getPrenom() %>" 
                                               placeholder=" "
                                               required>
                                        <label for="prenom">
                                            <i class="bi bi-person me-2"></i>Prénom
                                        </label>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-floating-custom fade-in">
                                <input type="email" 
                                       class="form-control" 
                                       id="email" 
                                       name="email" 
                                       value="<%= membre.getEmail() %>" 
                                       placeholder=" "
                                       required>
                                <label for="email">
                                    <i class="bi bi-envelope me-2"></i>Adresse Email
                                </label>
                            </div>
                            
                            <!-- Section Abonnement et Rôle -->
                            <h3 class="section-title mt-5">
                                <i class="bi bi-gear-fill"></i>
                                Configuration du Compte
                            </h3>
                            
                            <div class="row g-4">
                                <div class="col-md-6">
                                    <label for="typeabonnement" class="form-label fw-semibold">
                                        <i class="bi bi-tag me-2"></i>Type d'Abonnement
                                    </label>
                                    <select class="form-select form-select-custom fade-in" 
                                            id="typeabonnement" 
                                            name="typeabonnement" 
                                            required>
                                        <option value="">Sélectionner un type</option>
                                        <option value="BASIC" <%= "BASIC".equals(membre.getTypeAbonnement()) ? "selected" : "" %>>
                                            Basic - Accès Standard
                                        </option>
                                        <option value="PREMIUM" <%= "PREMIUM".equals(membre.getTypeAbonnement()) ? "selected" : "" %>>
                                            Premium - Accès Complet
                                        </option>
                                        <option value="VIP" <%= "VIP".equals(membre.getTypeAbonnement()) ? "selected" : "" %>>
                                            VIP - Accès Privilégié
                                        </option>
                                        <option value="ENTERPRISE" <%= "ENTERPRISE".equals(membre.getTypeAbonnement()) ? "selected" : "" %>>
                                            Enterprise - Solution Entreprise
                                        </option>
                                    </select>
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="role" class="form-label fw-semibold">
                                        <i class="bi bi-person-badge me-2"></i>Rôle
                                    </label>
                                    <select class="form-select form-select-custom fade-in" 
                                            id="role" 
                                            name="role" 
                                            required>
                                        <option value="">Sélectionner un rôle</option>
                                        <option value="USER" <%= "USER".equals(membre.getRole()) ? "selected" : "" %>>
                                            <i class="bi bi-person"></i> Utilisateur
                                        </option>
                                        <option value="ADMIN" <%= "ADMIN".equals(membre.getRole()) ? "selected" : "" %>>
                                            <i class="bi bi-person-gear"></i> Administrateur
                                        </option>
                                        <option value="MODERATOR" <%= "MODERATOR".equals(membre.getRole()) ? "selected" : "" %>>
                                            <i class="bi bi-person-check"></i> Modérateur
                                        </option>
                                        <option value="MANAGER" <%= "MANAGER".equals(membre.getRole()) ? "selected" : "" %>>
                                            <i class="bi bi-person-workspace"></i> Manager
                                        </option>
                                    </select>
                                </div>
                            </div>
                            
                            <!-- Boutons d'action -->
                            <div class="d-flex flex-wrap gap-3 justify-content-end mt-5 pt-4 border-top">
                                <a href="${pageContext.request.contextPath}/admin" 
                                   class="btn btn-custom btn-secondary-custom">
                                    <i class="bi bi-x-circle"></i>
                                    <span>Annuler</span>
                                </a>
                                <button type="submit" class="btn btn-custom btn-primary-custom">
                                    <i class="bi bi-check-circle"></i>
                                    <span>Enregistrer les Modifications</span>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Script personnalisé -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Animation des éléments au chargement
            const elements = document.querySelectorAll('.fade-in');
            elements.forEach((el, index) => {
                setTimeout(() => {
                    el.style.animationDelay = (index * 0.1) + 's';
                }, 100);
            });
            
            // Validation du formulaire
            const form = document.getElementById('memberForm');
            const inputs = form.querySelectorAll('input[required], select[required]');
            
            inputs.forEach(input => {
                input.addEventListener('blur', function() {
                    validateField(this);
                });
                
                input.addEventListener('input', function() {
                    if (this.classList.contains('is-invalid')) {
                        validateField(this);
                    }
                });
            });
            
            form.addEventListener('submit', function(e) {
                let isValid = true;
                inputs.forEach(input => {
                    if (!validateField(input)) {
                        isValid = false;
                    }
                });
                
                if (!isValid) {
                    e.preventDefault();
                    showAlert('Veuillez corriger les erreurs dans le formulaire.', 'danger');
                }
            });
            
            function validateField(field) {
                const value = field.value.trim();
                let isValid = true;
                let message = '';
                
                // Validation basique
                if (field.hasAttribute('required') && !value) {
                    isValid = false;
                    message = 'Ce champ est obligatoire.';
                } else if (field.type === 'email' && value && !isValidEmail(value)) {
                    isValid = false;
                    message = 'Veuillez entrer une adresse email valide.';
                }
                
                // Mise à jour de l'affichage
                if (isValid) {
                    field.classList.remove('is-invalid');
                    field.classList.add('is-valid');
                    removeErrorMessage(field);
                } else {
                    field.classList.remove('is-valid');
                    field.classList.add('is-invalid');
                    showErrorMessage(field, message);
                }
                
                return isValid;
            }
            
            function isValidEmail(email) {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return emailRegex.test(email);
            }
            
            function showErrorMessage(field, message) {
                removeErrorMessage(field);
                const errorDiv = document.createElement('div');
                errorDiv.className = 'invalid-feedback';
                errorDiv.textContent = message;
                field.parentNode.appendChild(errorDiv);
            }
            
            function removeErrorMessage(field) {
                const errorDiv = field.parentNode.querySelector('.invalid-feedback');
                if (errorDiv) {
                    errorDiv.remove();
                }
            }
            
            function showAlert(message, type) {
                const alertDiv = document.createElement('div');
                alertDiv.className = `alert alert-${type} alert-dismissible fade show`;
                alertDiv.innerHTML = `
                    <i class="bi bi-exclamation-triangle me-2"></i>
                    ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                `;
                
                const container = document.querySelector('.container');
                container.insertBefore(alertDiv, container.firstChild);
                
                setTimeout(() => {
                    alertDiv.remove();
                }, 5000);
            }
            
            // Effet de focus sur les champs
            const formControls = document.querySelectorAll('.form-control, .form-select');
            formControls.forEach(control => {
                control.addEventListener('focus', function() {
                    this.parentNode.style.transform = 'scale(1.02)';
                    this.parentNode.style.transition = 'transform 0.2s ease';
                });
                
                control.addEventListener('blur', function() {
                    this.parentNode.style.transform = 'scale(1)';
                });
            });
        });
    </script>
</body>
</html>
