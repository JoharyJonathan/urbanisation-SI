<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.monclub.domain.entities.Product" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un Produit - GestProd</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --success-gradient: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            --danger-gradient: linear-gradient(135deg, #dc3545 0%, #fd7e14 100%);
            --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            --card-shadow-hover: 0 20px 50px rgba(0, 0, 0, 0.15);
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            min-height: 100vh;
            padding: 0;
            margin: 0;
        }
        
        .header-section {
            background: var(--primary-gradient);
            color: white;
            padding: 60px 0 40px;
            position: relative;
            overflow: hidden;
        }
        
        .header-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="75" cy="75" r="1" fill="rgba(255,255,255,0.1)"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            opacity: 0.3;
        }
        
        .header-content {
            position: relative;
            z-index: 2;
        }
        
        .breadcrumb-custom {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 50px;
            padding: 8px 20px;
            margin-bottom: 20px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .breadcrumb-custom a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: color 0.3s ease;
        }
        
        .breadcrumb-custom a:hover {
            color: white;
        }
        
        .form-card {
            background: white;
            border-radius: 20px;
            box-shadow: var(--card-shadow);
            border: 1px solid rgba(0, 0, 0, 0.05);
            overflow: hidden;
            transition: all 0.3s ease;
            margin-top: -40px;
            position: relative;
            z-index: 10;
        }
        
        .form-card:hover {
            box-shadow: var(--card-shadow-hover);
        }
        
        .form-header {
            background: var(--primary-gradient);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .form-header h2 {
            margin: 0;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
        }
        
        .form-body {
            padding: 40px;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-label {
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .form-control-custom {
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            padding: 15px 20px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }
        
        .form-control-custom:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
            background: white;
            outline: none;
        }
        
        .form-control-custom:hover:not(:focus) {
            border-color: #cbd5e0;
            background: white;
        }
        
        .current-image-container {
            background: #f8f9fa;
            border: 2px dashed #e2e8f0;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            margin-bottom: 15px;
            transition: all 0.3s ease;
        }
        
        .current-image-container:hover {
            border-color: #667eea;
            background: rgba(102, 126, 234, 0.05);
        }
        
        .current-image {
            max-width: 200px;
            max-height: 200px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        
        .current-image:hover {
            transform: scale(1.05);
        }
        
        .btn-custom {
            padding: 15px 30px;
            border-radius: 12px;
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
            background: var(--success-gradient);
            color: white;
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.4);
        }
        
        .btn-primary-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(40, 167, 69, 0.6);
            color: white;
        }
        
        .btn-secondary-custom {
            background: #6c757d;
            color: white;
            box-shadow: 0 5px 15px rgba(108, 117, 125, 0.4);
        }
        
        .btn-secondary-custom:hover {
            background: #5a6268;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(108, 117, 125, 0.6);
            color: white;
        }
        
        .alert-custom {
            border: none;
            border-radius: 12px;
            padding: 20px;
            background: var(--danger-gradient);
            color: white;
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.3);
        }
        
        .input-group-custom {
            position: relative;
        }
        
        .input-icon {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: #a0aec0;
            z-index: 5;
            font-size: 18px;
        }
        
        .form-control-with-icon {
            padding-left: 55px;
        }
        
        .form-actions {
            background: #f8f9fa;
            margin: -40px -40px 0;
            padding: 30px 40px;
            border-top: 1px solid #e2e8f0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        .loading-spinner {
            display: none;
        }
        
        .form-card.loading .loading-spinner {
            display: inline-block;
        }
        
        .form-card.loading .btn-text {
            display: none;
        }
        
        @media (max-width: 768px) {
            .form-body {
                padding: 30px 20px;
            }
            
            .form-actions {
                margin: -30px -20px 0;
                padding: 20px;
                flex-direction: column;
                align-items: stretch;
            }
            
            .btn-custom {
                justify-content: center;
                margin-bottom: 10px;
            }
        }
        
        .floating-elements {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
        }
        
        .floating-icon {
            position: absolute;
            font-size: 20px;
            color: rgba(102, 126, 234, 0.1);
            animation: float 6s ease-in-out infinite;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(5deg); }
        }
        
        .floating-icon:nth-child(1) { top: 20%; left: 10%; animation-delay: 0s; }
        .floating-icon:nth-child(2) { top: 60%; left: 80%; animation-delay: 2s; }
        .floating-icon:nth-child(3) { top: 30%; left: 70%; animation-delay: 4s; }
        .floating-icon:nth-child(4) { top: 80%; left: 20%; animation-delay: 1s; }
    </style>
</head>
<body>
    <!-- Éléments flottants décoratifs -->
    <div class="floating-elements">
        <i class="bi bi-box-seam floating-icon"></i>
        <i class="bi bi-gear-fill floating-icon"></i>
        <i class="bi bi-graph-up floating-icon"></i>
        <i class="bi bi-shield-check floating-icon"></i>
    </div>

    <!-- Header Section -->
    <section class="header-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="header-content text-center">
                        <!-- Breadcrumb -->
                        <nav class="breadcrumb-custom d-inline-flex">
                            <a href="<c:url value='/'/>" class="me-2">
                                <i class="bi bi-house-fill"></i> Accueil
                            </a>
                            <span class="me-2">/</span>
                            <a href="<c:url value='/products'/>" class="me-2">
                                <i class="bi bi-box-seam"></i> Produits
                            </a>
                            <span class="me-2">/</span>
                            <span>Modification</span>
                        </nav>
                        
                        <h1 class="display-6 fw-bold mb-0">
                            <i class="bi bi-pencil-square me-3"></i>
                            Modifier le Produit
                        </h1>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Form Section -->
    <section class="py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-7">
                    <c:if test="${not empty product}">
                        <div class="form-card">
                            <div class="form-header">
                                <h2>
                                    <i class="bi bi-box-seam"></i>
                                    <c:out value='${product.nom}'/>
                                </h2>
                            </div>
                            
                            <div class="form-body">
                                <form action="<c:url value='/products'/>" method="post" id="editProductForm">
                                    <input type="hidden" name="action" value="modifier">
                                    <input type="hidden" name="id" value="<c:out value='${product.id}'/>">

                                    <!-- Nom du produit -->
                                    <div class="form-group">
                                        <label for="nom" class="form-label">
                                            <i class="bi bi-tag-fill text-primary"></i>
                                            Nom du produit
                                        </label>
                                        <div class="input-group-custom">
                                            <i class="bi bi-tag-fill input-icon"></i>
                                            <input type="text" 
                                                   id="nom" 
                                                   name="nom" 
                                                   class="form-control form-control-custom form-control-with-icon" 
                                                   value="<c:out value='${product.nom}'/>" 
                                                   required 
                                                   placeholder="Entrez le nom du produit">
                                        </div>
                                    </div>

                                    <!-- Type -->
                                    <div class="form-group">
                                        <label for="type" class="form-label">
                                            <i class="bi bi-grid-3x3-gap-fill text-info"></i>
                                            Type
                                        </label>
                                        <div class="input-group-custom">
                                            <i class="bi bi-grid-3x3-gap-fill input-icon"></i>
                                            <input type="text" 
                                                   id="type" 
                                                   name="type" 
                                                   class="form-control form-control-custom form-control-with-icon" 
                                                   value="<c:out value='${product.type}'/>" 
                                                   required 
                                                   placeholder="Ex: Électronique, Vêtement, etc.">
                                        </div>
                                    </div>

                                    <!-- Quantité -->
                                    <div class="form-group">
                                        <label for="quantite" class="form-label">
                                            <i class="bi bi-123 text-warning"></i>
                                            Quantité en stock
                                        </label>
                                        <div class="input-group-custom">
                                            <i class="bi bi-123 input-icon"></i>
                                            <input type="number" 
                                                   id="quantite" 
                                                   name="quantite" 
                                                   class="form-control form-control-custom form-control-with-icon" 
                                                   value="<c:out value='${product.quantite}'/>" 
                                                   required 
                                                   min="0" 
                                                   placeholder="0">
                                        </div>
                                    </div>

                                    <!-- Description -->
                                    <div class="form-group">
                                        <label for="description" class="form-label">
                                            <i class="bi bi-card-text text-success"></i>
                                            Description
                                        </label>
                                        <textarea id="description" 
                                                  name="description" 
                                                  class="form-control form-control-custom" 
                                                  rows="4" 
                                                  placeholder="Décrivez votre produit en détail..."><c:out value='${product.description}'/></textarea>
                                    </div>

                                    <!-- Image -->
                                    <div class="form-group">
                                        <label for="image" class="form-label">
                                            <i class="bi bi-image text-danger"></i>
                                            URL de l'image
                                        </label>
                                        
                                        <c:if test="${not empty product.image}">
                                            <div class="current-image-container">
                                                <p class="text-muted mb-2">
                                                    <i class="bi bi-eye-fill"></i> Aperçu actuel
                                                </p>
                                                <img src="<c:url value='${product.image}'/>" 
                                                     alt="Image actuelle" 
                                                     class="current-image"
                                                     onerror="this.style.display='none'; this.nextElementSibling.style.display='block';">
                                                <div style="display: none;" class="text-muted">
                                                    <i class="bi bi-image-alt"></i>
                                                    Image non disponible
                                                </div>
                                            </div>
                                        </c:if>
                                        
                                        <div class="input-group-custom">
                                            <i class="bi bi-image input-icon"></i>
                                            <input type="text" 
                                                   id="image" 
                                                   name="image" 
                                                   class="form-control form-control-custom form-control-with-icon" 
                                                   value="<c:out value='${product.image}'/>" 
                                                   placeholder="Ex: /images/produit.jpg ou https://example.com/image.png">
                                        </div>
                                        <small class="text-muted mt-1 d-block">
                                            <i class="bi bi-info-circle"></i>
                                            Entrez l'URL complète de l'image ou le chemin relatif
                                        </small>
                                    </div>
                                </form>
                            </div>
                            
                            <div class="form-actions">
                                <div>
                                    <a href="<c:url value='/products'/>" class="btn btn-custom btn-secondary-custom">
                                        <i class="bi bi-arrow-left"></i>
                                        <span>Retour à la liste</span>
                                    </a>
                                </div>
                                
                                <div>
                                    <button type="submit" form="editProductForm" class="btn btn-custom btn-primary-custom">
                                        <div class="loading-spinner spinner-border spinner-border-sm me-2" role="status">
                                            <span class="visually-hidden">Chargement...</span>
                                        </div>
                                        <i class="bi bi-check-circle-fill btn-icon"></i>
                                        <span class="btn-text">Enregistrer les Modifications</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${empty product}">
                        <div class="form-card">
                            <div class="form-body text-center py-5">
                                <div class="alert-custom">
                                    <i class="bi bi-exclamation-triangle-fill fs-1 mb-3 d-block"></i>
                                    <h3>Produit non trouvé</h3>
                                    <p class="mb-3">Le produit que vous tentez de modifier n'existe pas ou a été supprimé.</p>
                                    <a href="<c:url value='/products'/>" class="btn btn-custom btn-secondary-custom">
                                        <i class="bi bi-arrow-left"></i>
                                        <span>Retour à la liste des produits</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Script personnalisé -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('editProductForm');
            const formCard = document.querySelector('.form-card');
            
            // Animation d'entrée
            formCard.style.opacity = '0';
            formCard.style.transform = 'translateY(30px)';
            
            setTimeout(() => {
                formCard.style.transition = 'all 0.6s ease';
                formCard.style.opacity = '1';
                formCard.style.transform = 'translateY(0)';
            }, 100);
            
            // Gestion du formulaire
            if (form) {
                form.addEventListener('submit', function(e) {
                    // Animation de chargement
                    formCard.classList.add('loading');
                    
                    // Validation basique
                    const nom = document.getElementById('nom').value.trim();
                    const type = document.getElementById('type').value.trim();
                    const quantite = document.getElementById('quantite').value;
                    
                    if (!nom || !type || quantite < 0) {
                        e.preventDefault();
                        formCard.classList.remove('loading');
                        
                        // Afficher un message d'erreur
                        showAlert('Veuillez remplir tous les champs obligatoires correctement.', 'danger');
                        return;
                    }
                    
                    // Petit délai pour l'UX
                    setTimeout(() => {
                        // Le formulaire sera soumis naturellement
                    }, 500);
                });
            }
            
            // Prévisualisation d'image en temps réel
            const imageInput = document.getElementById('image');
            if (imageInput) {
                imageInput.addEventListener('input', function() {
                    const url = this.value.trim();
                    const currentImage = document.querySelector('.current-image');
                    
                    if (url && currentImage) {
                        currentImage.src = url;
                        currentImage.onerror = function() {
                            this.style.display = 'none';
                            this.nextElementSibling.style.display = 'block';
                        };
                        currentImage.onload = function() {
                            this.style.display = 'block';
                            this.nextElementSibling.style.display = 'none';
                        };
                    }
                });
            }
            
            // Animation des inputs au focus
            const inputs = document.querySelectorAll('.form-control-custom');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'scale(1.02)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'scale(1)';
                });
            });
        });
        
        // Fonction pour afficher des alertes
        function showAlert(message, type = 'info') {
            const alertDiv = document.createElement('div');
            alertDiv.className = `alert alert-${type} alert-dismissible fade show position-fixed`;
            alertDiv.style.cssText = 'top: 20px; right: 20px; z-index: 9999; min-width: 300px;';
            
            alertDiv.innerHTML = `
                <i class="bi bi-info-circle-fill me-2"></i>
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            `;
            
            document.body.appendChild(alertDiv);
            
            // Auto-suppression après 5 secondes
            setTimeout(() => {
                if (alertDiv.parentNode) {
                    alertDiv.remove();
                }
            }, 5000);
        }
    </script>
</body>
</html>
