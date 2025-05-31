<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.monclub.domain.entities.Product" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Produits - Liste</title>
    
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
            --warning-gradient: linear-gradient(135deg, #fdbb2d 0%, #22c1c3 100%);
            --danger-gradient: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
        }
        
        .main-header {
            background: var(--primary-gradient);
            color: white;
            padding: 60px 0 40px;
            position: relative;
            overflow: hidden;
        }
        
        .main-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="20" cy="20" r="2" fill="rgba(255,255,255,0.1)"/><circle cx="80" cy="80" r="2" fill="rgba(255,255,255,0.1)"/></svg>');
            opacity: 0.3;
        }
        
        .header-content {
            position: relative;
            z-index: 2;
        }
        
        .page-title {
            font-weight: 700;
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        
        .page-subtitle {
            opacity: 0.9;
            font-size: 1.1rem;
            margin-bottom: 0;
        }
        
        .content-wrapper {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
            margin: -30px 0 40px;
            position: relative;
            z-index: 3;
            overflow: hidden;
        }
        
        .toolbar {
            background: #f8f9fa;
            padding: 25px 30px;
            border-bottom: 1px solid #e9ecef;
            display: flex;
            justify-content: between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        .btn-gradient {
            background: var(--primary-gradient);
            border: none;
            color: white;
            font-weight: 600;
            padding: 12px 25px;
            border-radius: 50px;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
        }
        
        .btn-gradient:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 35px rgba(102, 126, 234, 0.4);
            color: white;
        }
        
        .btn-success-gradient {
            background: var(--success-gradient);
            box-shadow: 0 8px 25px rgba(79, 172, 254, 0.3);
        }
        
        .btn-success-gradient:hover {
            box-shadow: 0 12px 35px rgba(79, 172, 254, 0.4);
        }
        
        .btn-warning-gradient {
            background: var(--warning-gradient);
            box-shadow: 0 8px 25px rgba(253, 187, 45, 0.3);
        }
        
        .btn-warning-gradient:hover {
            box-shadow: 0 12px 35px rgba(253, 187, 45, 0.4);
        }
        
        .btn-danger-gradient {
            background: var(--danger-gradient);
            box-shadow: 0 8px 25px rgba(255, 107, 107, 0.3);
        }
        
        .btn-danger-gradient:hover {
            box-shadow: 0 12px 35px rgba(255, 107, 107, 0.4);
        }
        
        .search-box {
            position: relative;
            flex-grow: 1;
            max-width: 400px;
        }
        
        .search-box input {
            background: white;
            border: 2px solid #e9ecef;
            border-radius: 50px;
            padding: 12px 50px 12px 20px;
            font-size: 14px;
            transition: all 0.3s ease;
            width: 100%;
        }
        
        .search-box input:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
            outline: none;
        }
        
        .search-box .search-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
        }
        
        .products-table {
            margin: 0;
        }
        
        .products-table thead th {
            background: #f8f9fa;
            border: none;
            padding: 20px 15px;
            font-weight: 600;
            color: #495057;
            text-transform: uppercase;
            font-size: 13px;
            letter-spacing: 0.5px;
        }
        
        .products-table tbody tr {
            transition: all 0.3s ease;
            border-bottom: 1px solid #f1f3f4;
        }
        
        .products-table tbody tr:hover {
            background: #f8f9fa;
            transform: scale(1.01);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .products-table tbody td {
            padding: 20px 15px;
            vertical-align: middle;
            border: none;
        }
        
        .product-image-container {
            width: 80px;
            height: 80px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        
        .product-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        
        .product-image:hover {
            transform: scale(1.1);
        }
        
        .no-image-placeholder {
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #e9ecef, #f8f9fa);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #6c757d;
            font-size: 24px;
        }
        
        .product-name {
            font-weight: 600;
            color: #2d3748;
            font-size: 16px;
        }
        
        .product-type {
            display: inline-block;
            background: var(--primary-gradient);
            color: white;
            padding: 4px 12px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .quantity-badge {
            background: var(--success-gradient);
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 14px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        
        .quantity-low {
            background: var(--warning-gradient);
        }
        
        .quantity-critical {
            background: var(--danger-gradient);
        }
        
        .product-description {
            color: #6c757d;
            font-size: 14px;
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        
        .action-buttons {
            display: flex;
            gap: 8px;
            align-items: center;
        }
        
        .btn-sm-gradient {
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            border: none;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        
        .empty-state {
            text-align: center;
            padding: 80px 30px;
            color: #6c757d;
        }
        
        .empty-state-icon {
            font-size: 4rem;
            color: #dee2e6;
            margin-bottom: 20px;
        }
        
        .stats-cards {
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border: 1px solid #f1f3f4;
            transition: all 0.3s ease;
            height: 100%;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }
        
        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: white;
            margin-bottom: 15px;
        }
        
        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 5px;
        }
        
        .stat-label {
            color: #6c757d;
            font-size: 14px;
            font-weight: 500;
        }
        
        .breadcrumb-custom {
            background: transparent;
            padding: 0;
            margin-bottom: 20px;
        }
        
        .breadcrumb-custom .breadcrumb-item a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
        }
        
        .breadcrumb-custom .breadcrumb-item.active {
            color: white;
        }
        
        @media (max-width: 768px) {
            .page-title {
                font-size: 2rem;
            }
            
            .toolbar {
                flex-direction: column;
                align-items: stretch;
            }
            
            .search-box {
                max-width: none;
                margin-bottom: 15px;
            }
            
            .action-buttons {
                flex-direction: column;
                gap: 5px;
            }
            
            .products-table {
                font-size: 14px;
            }
            
            .product-image-container {
                width: 60px;
                height: 60px;
            }
        }
    </style>
</head>
<body>
    <!-- En-tête Principal -->
    <header class="main-header">
        <div class="container">
            <div class="header-content">
                <!-- Fil d'Ariane -->
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb breadcrumb-custom">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/accueil">
                                <i class="bi bi-house-door"></i> Accueil
                            </a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <i class="bi bi-box-seam"></i> Produits
                        </li>
                    </ol>
                </nav>
                
                <h1 class="page-title">
                    <i class="bi bi-box-seam me-3"></i>Gestion des Produits
                </h1>
                <p class="page-subtitle">
                    Gérez efficacement votre inventaire avec des outils modernes
                </p>
            </div>
        </div>
    </header>

    <div class="container">
        <!-- Statistiques -->
        <div class="row stats-cards">
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="stat-card">
                    <div class="stat-icon" style="background: var(--primary-gradient);">
                        <i class="bi bi-box-seam"></i>
                    </div>
                    <div class="stat-number">
                        <c:choose>
                            <c:when test="${not empty products}">
                                ${products.size()}
                            </c:when>
                            <c:otherwise>0</c:otherwise>
                        </c:choose>
                    </div>
                    <div class="stat-label">Produits Total</div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="stat-card">
                    <div class="stat-icon" style="background: var(--success-gradient);">
                        <i class="bi bi-check-circle"></i>
                    </div>
                    <div class="stat-number">
                        <c:set var="stockCount" value="0"/>
                        <c:forEach var="product" items="${products}">
                            <c:if test="${product.quantite > 10}">
                                <c:set var="stockCount" value="${stockCount + 1}"/>
                            </c:if>
                        </c:forEach>
                        ${stockCount}
                    </div>
                    <div class="stat-label">En Stock</div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="stat-card">
                    <div class="stat-icon" style="background: var(--warning-gradient);">
                        <i class="bi bi-exclamation-triangle"></i>
                    </div>
                    <div class="stat-number">
                        <c:set var="lowStockCount" value="0"/>
                        <c:forEach var="product" items="${products}">
                            <c:if test="${product.quantite <= 10 && product.quantite > 0}">
                                <c:set var="lowStockCount" value="${lowStockCount + 1}"/>
                            </c:if>
                        </c:forEach>
                        ${lowStockCount}
                    </div>
                    <div class="stat-label">Stock Faible</div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="stat-card">
                    <div class="stat-icon" style="background: var(--danger-gradient);">
                        <i class="bi bi-x-circle"></i>
                    </div>
                    <div class="stat-number">
                        <c:set var="outOfStockCount" value="0"/>
                        <c:forEach var="product" items="${products}">
                            <c:if test="${product.quantite == 0}">
                                <c:set var="outOfStockCount" value="${outOfStockCount + 1}"/>
                            </c:if>
                        </c:forEach>
                        ${outOfStockCount}
                    </div>
                    <div class="stat-label">Rupture</div>
                </div>
            </div>
        </div>

        <!-- Contenu Principal -->
        <div class="content-wrapper">
            <!-- Barre d'outils -->
            <div class="toolbar">
                <div class="d-flex align-items-center gap-3">
                    <a href="<c:url value='/products/ajouter'/>" class="btn-gradient btn-success-gradient">
                        <i class="bi bi-plus-circle"></i>
                        <span>Nouveau Produit</span>
                    </a>
                </div>
                
                <div class="search-box">
                    <input type="text" id="searchInput" placeholder="Rechercher des produits..." class="form-control">
                    <i class="bi bi-search search-icon"></i>
                </div>
            </div>

            <!-- Tableau des Produits -->
            <div class="table-responsive">
                <c:if test="${not empty products}">
                    <table class="table products-table" id="productsTable">
                        <thead>
                            <tr>
                                <th><i class="bi bi-hash me-2"></i>ID</th>
                                <th><i class="bi bi-image me-2"></i>Image</th>
                                <th><i class="bi bi-tag me-2"></i>Nom</th>
                                <th><i class="bi bi-collection me-2"></i>Type</th>
                                <th><i class="bi bi-box me-2"></i>Quantité</th>
                                <th><i class="bi bi-text-left me-2"></i>Description</th>
                                <th><i class="bi bi-gear me-2"></i>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${products}">
                                <tr class="product-row">
                                    <td>
                                        <span class="badge bg-light text-dark">#${product.id}</span>
                                    </td>
                                    <td>
                                        <div class="product-image-container">
                                            <c:choose>
                                                <c:when test="${not empty product.image}">
                                                    <img src="<c:url value='${product.image}'/>" 
                                                         alt="<c:out value='${product.nom}'/>" 
                                                         class="product-image"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="no-image-placeholder">
                                                        <i class="bi bi-image"></i>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="product-name"><c:out value="${product.nom}"/></div>
                                    </td>
                                    <td>
                                        <span class="product-type"><c:out value="${product.type}"/></span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${product.quantite == 0}">
                                                <span class="quantity-badge quantity-critical">
                                                    <i class="bi bi-x-circle"></i>
                                                    ${product.quantite}
                                                </span>
                                            </c:when>
                                            <c:when test="${product.quantite <= 10}">
                                                <span class="quantity-badge quantity-low">
                                                    <i class="bi bi-exclamation-triangle"></i>
                                                    ${product.quantite}
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="quantity-badge">
                                                    <i class="bi bi-check-circle"></i>
                                                    ${product.quantite}
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <div class="product-description" title="<c:out value='${product.description}'/>">
                                            <c:out value="${product.description}"/>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <a href="<c:url value='/products/modifier'><c:param name='id' value='${product.id}'/></c:url>" 
                                               class="btn-sm-gradient btn-warning-gradient" 
                                               title="Modifier">
                                                <i class="bi bi-pencil"></i>
                                                <span class="d-none d-md-inline">Modifier</span>
                                            </a>
                                            <form action="<c:url value='/products'/>" method="post" style="display:inline;" 
                                                  onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer ce produit ?');">
                                                <input type="hidden" name="action" value="supprimer">
                                                <input type="hidden" name="id" value="${product.id}">
                                                <button type="submit" class="btn-sm-gradient btn-danger-gradient" title="Supprimer">
                                                    <i class="bi bi-trash"></i>
                                                    <span class="d-none d-md-inline">Supprimer</span>
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>

                <!-- État Vide -->
                <c:if test="${empty products}">
                    <div class="empty-state">
                        <div class="empty-state-icon">
                            <i class="bi bi-box-seam"></i>
                        </div>
                        <h3>Aucun produit trouvé</h3>
                        <p class="mb-4">Commencez par ajouter votre premier produit à l'inventaire.</p>
                        <a href="<c:url value='/products/ajouter'/>" class="btn-gradient btn-success-gradient">
                            <i class="bi bi-plus-circle"></i>
                            <span>Ajouter le Premier Produit</span>
                        </a>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Script personnalisé -->
    <script>
        // Recherche en temps réel
        document.getElementById('searchInput').addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const rows = document.querySelectorAll('.product-row');
            
            rows.forEach(row => {
                const productName = row.querySelector('.product-name').textContent.toLowerCase();
                const productType = row.querySelector('.product-type').textContent.toLowerCase();
                const productDesc = row.querySelector('.product-description').textContent.toLowerCase();
                
                if (productName.includes(searchTerm) || 
                    productType.includes(searchTerm) || 
                    productDesc.includes(searchTerm)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
        
        // Animation au chargement
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.stat-card');
            const rows = document.querySelectorAll('.product-row');
            
            // Animation des cartes statistiques
            cards.forEach((card, index) => {
                setTimeout(() => {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 100);
            });
            
            // Animation des lignes du tableau
            rows.forEach((row, index) => {
                setTimeout(() => {
                    row.style.opacity = '1';
                    row.style.transform = 'translateX(0)';
                }, index * 50);
            });
        });
        
        // Style initial pour les animations
        document.querySelectorAll('.stat-card, .product-row').forEach(element => {
            element.style.opacity = '0';
            element.style.transform = element.classList.contains('stat-card') ? 'translateY(20px)' : 'translateX(-20px)';
            element.style.transition = 'all 0.6s ease';
        });
    </script>
</body>
</html>
