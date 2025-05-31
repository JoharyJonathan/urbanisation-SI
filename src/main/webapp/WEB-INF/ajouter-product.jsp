<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Produit - GestProd</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --danger-gradient: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
            --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            --card-shadow-hover: 0 20px 50px rgba(0, 0, 0, 0.15);
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px 0;
        }
        
        .page-header {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 30px;
            color: white;
            text-align: center;
        }
        
        .page-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
        }
        
        .page-subtitle {
            opacity: 0.9;
            font-size: 1.1rem;
            margin-bottom: 0;
        }
        
        .form-card {
            background: white;
            border-radius: 25px;
            box-shadow: var(--card-shadow);
            padding: 40px;
            margin-bottom: 30px;
            border: 1px solid rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }
        
        .form-card:hover {
            box-shadow: var(--card-shadow-hover);
            transform: translateY(-2px);
        }
        
        .form-section-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 25px;
            padding-bottom: 10px;
            border-bottom: 2px solid #e2e8f0;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .form-label {
            font-weight: 600;
            color: #4a5568;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .form-control {
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            padding: 15px 20px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
        }
        
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
            background-color: white;
            transform: translateY(-1px);
        }
        
        .form-control:hover {
            border-color: #cbd5e0;
            background-color: white;
        }
        
        .input-group {
            position: relative;
        }
        
        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #a0aec0;
            z-index: 3;
            font-size: 1.1rem;
        }
        
        .form-control.with-icon {
            padding-left: 50px;
        }
        
        .form-text {
            color: #6c757d;
            font-size: 0.875rem;
            margin-top: 5px;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .btn-custom {
            padding: 15px 30px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1rem;
            border: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
            text-decoration: none;
            position: relative;
            overflow: hidden;
        }
        
        .btn-primary-custom {
            background: var(--primary-gradient);
            color: white;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
        }
        
        .btn-primary-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 35px rgba(102, 126, 234, 0.4);
            color: white;
        }
        
        .btn-outline-custom {
            background: transparent;
            color: #6c757d;
            border: 2px solid #e2e8f0;
        }
        
        .btn-outline-custom:hover {
            background: #f8f9fa;
            border-color: #cbd5e0;
            color: #495057;
            transform: translateY(-1px);
        }
        
        .btn-success-custom {
            background: var(--success-gradient);
            color: white;
            box-shadow: 0 8px 25px rgba(79, 172, 254, 0.3);
        }
        
        .btn-success-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 35px rgba(79, 172, 254, 0.4);
            color: white;
        }
        
        .image-preview {
            border: 2px dashed #e2e8f0;
            border-radius: 12px;
            padding: 30px;
            text-align: center;
            background-color: #f8f9fa;
            transition: all 0.3s ease;
            margin-top: 15px;
        }
        
        .image-preview:hover {
            border-color: #cbd5e0;
            background-color: #ffffff;
        }
        
        .image-preview-content {
            color: #a0aec0;
        }
        
        .image-preview img {
            max-width: 200px;
            max-height: 200px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        .quantity-controls {
            display: flex;
            align-items: center;
            background: #f8f9fa;
            border-radius: 12px;
            border: 2px solid #e2e8f0;
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .quantity-controls:hover {
            border-color: #cbd5e0;
        }
        
        .quantity-btn {
            background: none;
            border: none;
            padding: 15px 20px;
            color: #6c757d;
            font-size: 1.2rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .quantity-btn:hover {
            background: #e9ecef;
            color: #495057;
        }
        
        .quantity-input {
            border: none;
            background: none;
            text-align: center;
            font-weight: 600;
            font-size: 1.1rem;
            width: 80px;
            padding: 15px 10px;
        }
        
        .quantity-input:focus {
            outline: none;
            background: white;
        }
        
        .breadcrumb {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 50px;
            padding: 12px 25px;
            margin-bottom: 20px;
        }
        
        .breadcrumb-item a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
        }
        
        .breadcrumb-item.active {
            color: white;
        }
        
        .breadcrumb-item + .breadcrumb-item::before {
            color: rgba(255, 255, 255, 0.6);
        }
        
        .alert-custom {
            border-radius: 15px;
            border: none;
            padding: 20px;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .alert-info-custom {
            background: rgba(102, 126, 234, 0.1);
            color: #667eea;
            border-left: 4px solid #667eea;
        }
        
        @media (max-width: 768px) {
            .form-card {
                margin: 0 15px;
                padding: 25px 20px;
            }
            
            .page-title {
                font-size: 2rem;
            }
            
            .btn-custom {
                width: 100%;
                justify-content: center;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Navigation breadcrumb -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="<c:url value='/products'/>">
                        <i class="bi bi-house-fill me-1"></i>Accueil
                    </a>
                </li>
                <li class="breadcrumb-item">
                    <a href="<c:url value='/products'/>">
                        <i class="bi bi-box-seam me-1"></i>Produits
                    </a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Ajouter</li>
            </ol>
        </nav>

        <!-- En-tête de la page -->
        <div class="page-header">
            <h1 class="page-title">
                <i class="bi bi-plus-circle-fill"></i>
                Ajouter un Nouveau Produit
            </h1>
            <p class="page-subtitle">
                Remplissez les informations ci-dessous pour créer un nouveau produit dans votre inventaire
            </p>
        </div>

        <!-- Alerte d'information -->
        <div class="alert alert-custom alert-info-custom">
            <i class="bi bi-info-circle-fill fs-4"></i>
            <div>
                <strong>Information :</strong> Tous les champs marqués d'un astérisque (*) sont obligatoires. 
                Assurez-vous de bien remplir toutes les informations pour optimiser la gestion de votre produit.
            </div>
        </div>

        <!-- Formulaire principal -->
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <form action="<c:url value='/products'/>" method="post" id="productForm">
                    <input type="hidden" name="action" value="ajouter">

                    <!-- Section Informations générales -->
                    <div class="form-card">
                        <h3 class="form-section-title">
                            <i class="bi bi-info-circle"></i>
                            Informations Générales
                        </h3>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="nom" class="form-label">
                                    <i class="bi bi-tag"></i>
                                    Nom du produit *
                                </label>
                                <div class="input-group">
                                    <i class="bi bi-box input-icon"></i>
                                    <input type="text" 
                                           class="form-control with-icon" 
                                           id="nom" 
                                           name="nom" 
                                           placeholder="Ex: iPhone 15 Pro"
                                           required>
                                </div>
                                <div class="form-text">
                                    <i class="bi bi-lightbulb"></i>
                                    Choisissez un nom clair et descriptif
                                </div>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="type" class="form-label">
                                    <i class="bi bi-bookmark"></i>
                                    Catégorie *
                                </label>
                                <div class="input-group">
                                    <i class="bi bi-grid-3x3-gap input-icon"></i>
                                    <input type="text" 
                                           class="form-control with-icon" 
                                           id="type" 
                                           name="type" 
                                           placeholder="Ex: Électronique, Vêtements..."
                                           required>
                                </div>
                                <div class="form-text">
                                    <i class="bi bi-info-circle"></i>
                                    Définissez la catégorie du produit
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">
                                <i class="bi bi-text-paragraph"></i>
                                Description
                            </label>
                            <textarea class="form-control" 
                                      id="description" 
                                      name="description" 
                                      rows="4"
                                      placeholder="Décrivez les caractéristiques, avantages et spécificités de ce produit..."></textarea>
                            <div class="form-text">
                                <i class="bi bi-chat-text"></i>
                                Une description détaillée aide vos clients à mieux comprendre le produit
                            </div>
                        </div>
                    </div>

                    <!-- Section Stock et Image -->
                    <div class="form-card">
                        <h3 class="form-section-title">
                            <i class="bi bi-image"></i>
                            Stock et Présentation
                        </h3>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="quantite" class="form-label">
                                    <i class="bi bi-boxes"></i>
                                    Quantité en stock *
                                </label>
                                <div class="quantity-controls">
                                    <button type="button" class="quantity-btn" onclick="decreaseQuantity()">
                                        <i class="bi bi-dash"></i>
                                    </button>
                                    <input type="number" 
                                           class="quantity-input" 
                                           id="quantite" 
                                           name="quantite" 
                                           min="0" 
                                           value="1" 
                                           required>
                                    <button type="button" class="quantity-btn" onclick="increaseQuantity()">
                                        <i class="bi bi-plus"></i>
                                    </button>
                                </div>
                                <div class="form-text">
                                    <i class="bi bi-bar-chart"></i>
                                    Quantité disponible dans votre inventaire
                                </div>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="image" class="form-label">
                                    <i class="bi bi-camera"></i>
                                    URL de l'image
                                </label>
                                <div class="input-group">
                                    <i class="bi bi-link-45deg input-icon"></i>
                                    <input type="url" 
                                           class="form-control with-icon" 
                                           id="image" 
                                           name="image" 
                                           placeholder="https://example.com/image.jpg"
                                           onchange="previewImage()">
                                </div>
                                <div class="form-text">
                                    <i class="bi bi-image"></i>
                                    Lien vers une image représentative du produit
                                </div>
                            </div>
                        </div>

                        <!-- Aperçu de l'image -->
                        <div class="image-preview" id="imagePreview">
                            <div class="image-preview-content" id="imagePreviewContent">
                                <i class="bi bi-image" style="font-size: 3rem; color: #cbd5e0;"></i>
                                <p class="mt-3 mb-0">Aperçu de l'image</p>
                                <small>L'image apparaîtra ici une fois l'URL saisie</small>
                            </div>
                        </div>
                    </div>

                    <!-- Actions -->
                    <div class="form-card">
                        <div class="row">
                            <div class="col-md-6 mb-2">
                                <button type="submit" class="btn btn-custom btn-success-custom w-100">
                                    <i class="bi bi-check-circle-fill"></i>
                                    <span>Ajouter le Produit</span>
                                </button>
                            </div>
                            <div class="col-md-6">
                                <a href="<c:url value='/products'/>" class="btn btn-custom btn-outline-custom w-100">
                                    <i class="bi bi-arrow-left-circle"></i>
                                    <span>Retour à la liste</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Scripts personnalisés -->
    <script>
        // Gestion de la quantité
        function increaseQuantity() {
            const input = document.getElementById('quantite');
            input.value = parseInt(input.value) + 1;
        }
        
        function decreaseQuantity() {
            const input = document.getElementById('quantite');
            if (parseInt(input.value) > 0) {
                input.value = parseInt(input.value) - 1;
            }
        }
        
        // Aperçu de l'image
        function previewImage() {
            const imageUrl = document.getElementById('image').value;
            const preview = document.getElementById('imagePreview');
            const content = document.getElementById('imagePreviewContent');
            
            if (imageUrl && isValidUrl(imageUrl)) {
                content.innerHTML = `
                    <img src="${imageUrl}" alt="Aperçu du produit" style="max-width: 200px; max-height: 200px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                    <p class="mt-3 mb-0 text-success">
                        <i class="bi bi-check-circle-fill me-2"></i>
                        Image chargée avec succès
                    </p>
                `;
                preview.style.borderColor = '#28a745';
                preview.style.backgroundColor = 'rgba(40, 167, 69, 0.1)';
            } else if (imageUrl) {
                content.innerHTML = `
                    <i class="bi bi-exclamation-triangle" style="font-size: 3rem; color: #ffc107;"></i>
                    <p class="mt-3 mb-0 text-warning">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                        URL d'image non valide
                    </p>
                    <small>Vérifiez que l'URL est correcte et accessible</small>
                `;
                preview.style.borderColor = '#ffc107';
                preview.style.backgroundColor = 'rgba(255, 193, 7, 0.1)';
            } else {
                content.innerHTML = `
                    <i class="bi bi-image" style="font-size: 3rem; color: #cbd5e0;"></i>
                    <p class="mt-3 mb-0">Aperçu de l'image</p>
                    <small>L'image apparaîtra ici une fois l'URL saisie</small>
                `;
                preview.style.borderColor = '#e2e8f0';
                preview.style.backgroundColor = '#f8f9fa';
            }
        }
        
        function isValidUrl(string) {
            try {
                new URL(string);
                return true;
            } catch (_) {
                return false;
            }
        }
        
        // Validation du formulaire
        document.getElementById('productForm').addEventListener('submit', function(e) {
            const nom = document.getElementById('nom').value.trim();
            const type = document.getElementById('type').value.trim();
            const quantite = document.getElementById('quantite').value;
            
            if (!nom || !type || !quantite) {
                e.preventDefault();
                alert('Veuillez remplir tous les champs obligatoires (*)');
                return false;
            }
            
            if (parseInt(quantite) < 0) {
                e.preventDefault();
                alert('La quantité ne peut pas être négative');
                return false;
            }
        });
        
        // Animation des champs au focus
        document.querySelectorAll('.form-control').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'scale(1.02)';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'scale(1)';
            });
        });
        
        // Animation d'entrée des cartes
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.form-card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                
                setTimeout(() => {
                    card.style.transition = 'all 0.6s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 150);
            });
        });
    </script>
</body>
</html>
