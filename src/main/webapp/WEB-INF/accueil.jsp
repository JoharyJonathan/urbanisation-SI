<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - GestProd</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #667eea;
            --secondary-color: #764ba2;
            --success-color: #10b981;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
            --info-color: #3b82f6;
            --dark-color: #1f2937;
            --light-bg: #f8fafc;
            --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --card-shadow-hover: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background: var(--light-bg);
            color: #374151;
        }
        
        .navbar {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            padding: 1rem 0;
            box-shadow: var(--card-shadow);
        }
        
        .navbar-brand {
            font-weight: 800;
            font-size: 1.5rem;
            color: white !important;
        }
        
        .welcome-message {
            color: white;
            font-size: 1.1rem;
            font-weight: 500;
        }
        
        .user-info {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            padding: 0.75rem 1.25rem;
            color: white;
        }
        
        .btn-logout {
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            border-radius: 10px;
            padding: 0.5rem 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-logout:hover {
            background: rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.4);
            color: white;
            transform: translateY(-1px);
        }
        
        .dashboard-container {
            padding: 2rem 0;
        }
        
        .info-card {
            background: white;
            border-radius: 20px;
            padding: 2rem;
            box-shadow: var(--card-shadow);
            border: 1px solid rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            height: 100%;
        }
        
        .info-card:hover {
            box-shadow: var(--card-shadow-hover);
            transform: translateY(-2px);
        }
        
        .info-card-header {
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #f1f5f9;
        }
        
        .info-card-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            margin-right: 1rem;
        }
        
        .info-card-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--dark-color);
            margin: 0;
        }
        
        .info-item {
            display: flex;
            align-items: center;
            padding: 0.75rem 0;
            border-bottom: 1px solid #f1f5f9;
        }
        
        .info-item:last-child {
            border-bottom: none;
        }
        
        .info-label {
            font-weight: 600;
            color: #6b7280;
            min-width: 120px;
            display: flex;
            align-items: center;
        }
        
        .info-label i {
            margin-right: 0.5rem;
            color: var(--primary-color);
        }
        
        .info-value {
            font-weight: 500;
            color: var(--dark-color);
        }
        
        .role-badge {
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.875rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .role-admin {
            background: linear-gradient(135deg, #dc2626, #ef4444);
            color: white;
        }
        
        .role-user {
            background: linear-gradient(135deg, var(--info-color), #60a5fa);
            color: white;
        }
        
        .admin-section {
            background: white;
            border-radius: 20px;
            padding: 2rem;
            box-shadow: var(--card-shadow);
            border: 1px solid rgba(0, 0, 0, 0.05);
        }
        
        .admin-header {
            display: flex;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #f1f5f9;
        }
        
        .admin-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #dc2626, #ef4444);
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            margin-right: 1rem;
        }
        
        .admin-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--dark-color);
            margin: 0;
        }
        
        .action-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.5rem;
        }
        
        .action-card {
            background: linear-gradient(135deg, #f8fafc, #e2e8f0);
            border: 2px solid transparent;
            border-radius: 15px;
            padding: 1.5rem;
            text-decoration: none;
            color: inherit;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
        }
        
        .action-card:hover {
            background: white;
            border-color: var(--primary-color);
            color: inherit;
            transform: translateY(-3px);
            box-shadow: var(--card-shadow-hover);
        }
        
        .action-card-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            margin-right: 1rem;
            flex-shrink: 0;
        }
        
        .action-card-content h3 {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--dark-color);
        }
        
        .action-card-content p {
            color: #6b7280;
            margin: 0;
            font-size: 0.875rem;
        }
        
        .stats-section {
            margin-bottom: 2rem;
        }
        
        .stat-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            text-align: center;
            box-shadow: var(--card-shadow);
            border: 1px solid rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: var(--card-shadow-hover);
        }
        
        .stat-icon {
            width: 50px;
            height: 50px;
            margin: 0 auto 1rem;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.25rem;
        }
        
        .stat-number {
            font-size: 2rem;
            font-weight: 800;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
        }
        
        .stat-label {
            color: #6b7280;
            font-weight: 500;
            font-size: 0.875rem;
        }
        
        @media (max-width: 768px) {
            .user-info {
                text-align: center;
                margin-top: 1rem;
            }
            
            .info-label {
                min-width: auto;
                margin-bottom: 0.25rem;
            }
            
            .info-item {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center w-100">
                <div class="d-flex align-items-center">
                    <span class="navbar-brand">
                        <i class="bi bi-box-seam me-2"></i>GestProd
                    </span>
                    <div class="welcome-message ms-4 d-none d-md-block">
                        <%= request.getAttribute("welcomeMessage") != null ? 
                            request.getAttribute("welcomeMessage") : 
                            "Bienvenue dans votre espace de gestion !" %>
                    </div>
                </div>
                
                <div class="user-info d-flex align-items-center">
                    <div class="me-3">
                        <i class="bi bi-person-circle me-2"></i>
                        <span><%= session.getAttribute("prenom") %> <%= session.getAttribute("nom") %></span>
                    </div>
                    <a href="${pageContext.request.contextPath}/deconnexion" class="btn btn-logout">
                        <i class="bi bi-box-arrow-right me-2"></i>Déconnexion
                    </a>
                </div>
            </div>
        </div>
    </nav>
    
    <!-- Dashboard Content -->
    <div class="container dashboard-container">
        <!-- Stats Section -->
        <div class="stats-section">
            <div class="row g-3 mb-4">
                <div class="col-md-3 col-sm-6">
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="bi bi-box-seam"></i>
                        </div>
                        <div class="stat-number">1,247</div>
                        <div class="stat-label">Produits Gérés</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="bi bi-graph-up"></i>
                        </div>
                        <div class="stat-number">+23%</div>
                        <div class="stat-label">Croissance</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="bi bi-people"></i>
                        </div>
                        <div class="stat-number">56</div>
                        <div class="stat-label">Utilisateurs Actifs</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="bi bi-clock"></i>
                        </div>
                        <div class="stat-number">99.9%</div>
                        <div class="stat-label">Disponibilité</div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row g-4">
            <!-- User Information Card -->
            <div class="col-lg-6">
                <div class="info-card">
                    <div class="info-card-header">
                        <div class="info-card-icon">
                            <i class="bi bi-person-badge"></i>
                        </div>
                        <h2 class="info-card-title">Vos Informations</h2>
                    </div>
                    
                    <div class="info-item">
                        <div class="info-label">
                            <i class="bi bi-envelope"></i>
                            Email:
                        </div>
                        <div class="info-value"><%= session.getAttribute("email") %></div>
                    </div>
                    
                    <div class="info-item">
                        <div class="info-label">
                            <i class="bi bi-card-checklist"></i>
                            Abonnement:
                        </div>
                        <div class="info-value">
                            <span class="badge bg-success"><%= session.getAttribute("typeAbonnement") %></span>
                        </div>
                    </div>
                    
                    <div class="info-item">
                        <div class="info-label">
                            <i class="bi bi-shield-check"></i>
                            Rôle:
                        </div>
                        <div class="info-value">
                            <span class="role-badge 
                                <%= "admin".equals(session.getAttribute("utilisateurRole")) ? "role-admin" : "role-user" %>">
                                <%= session.getAttribute("utilisateurRole") %>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Quick Actions -->
            <div class="col-lg-6">
                <div class="info-card">
                    <div class="info-card-header">
                        <div class="info-card-icon">
                            <i class="bi bi-lightning"></i>
                        </div>
                        <h2 class="info-card-title">Actions Rapides</h2>
                    </div>
                    
                    <div class="d-grid gap-3">
                        <a href="#" class="btn btn-outline-primary d-flex align-items-center">
                            <i class="bi bi-plus-circle me-2"></i>
                            Nouveau Produit
                        </a>
                        <a href="#" class="btn btn-outline-info d-flex align-items-center">
                            <i class="bi bi-search me-2"></i>
                            Rechercher Produits
                        </a>
                        <a href="#" class="btn btn-outline-success d-flex align-items-center">
                            <i class="bi bi-bar-chart me-2"></i>
                            Voir Rapports
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Admin Section -->
        <% if ("admin".equals(session.getAttribute("utilisateurRole"))) { %>
            <div class="row mt-4">
                <div class="col-12">
                    <div class="admin-section">
                        <div class="admin-header">
                            <div class="admin-icon">
                                <i class="bi bi-gear-fill"></i>
                            </div>
                            <h2 class="admin-title">Panneau d'Administration</h2>
                        </div>
                        
                        <div class="action-grid">
                            <a href="${pageContext.request.contextPath}/admin" class="action-card">
                                <div class="action-card-icon">
                                    <i class="bi bi-people-fill"></i>
                                </div>
                                <div class="action-card-content">
                                    <h3>Gérer les Membres</h3>
                                    <p>Ajouter, modifier ou supprimer des utilisateurs</p>
                                </div>
                            </a>
                            
                            <a href="${pageContext.request.contextPath}/products" class="action-card">
                                <div class="action-card-icon">
                                    <i class="bi bi-box-seam-fill"></i>
                                </div>
                                <div class="action-card-content">
                                    <h3>Gérer les Produits</h3>
                                    <p>Administrer le catalogue de produits</p>
                                </div>
                            </a>
                            
                            <a href="#" class="action-card">
                                <div class="action-card-icon">
                                    <i class="bi bi-graph-up"></i>
                                </div>
                                <div class="action-card-content">
                                    <h3>Analytics</h3>
                                    <p>Consulter les statistiques détaillées</p>
                                </div>
                            </a>
                            
                            <a href="#" class="action-card">
                                <div class="action-card-icon">
                                    <i class="bi bi-gear-wide"></i>
                                </div>
                                <div class="action-card-content">
                                    <h3>Paramètres</h3>
                                    <p>Configuration du système</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Script personnalisé -->
    <script>
        // Animation d'entrée
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.info-card, .admin-section, .stat-card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                card.style.transition = 'all 0.6s ease';
                
                setTimeout(() => {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 100);
            });
        });
        
        // Animation des statistiques au chargement
        document.addEventListener('DOMContentLoaded', function() {
            const statNumbers = document.querySelectorAll('.stat-number');
            statNumbers.forEach(stat => {
                const finalValue = stat.textContent;
                if (!isNaN(finalValue.replace(/[^0-9]/g, ''))) {
                    const numericValue = parseInt(finalValue.replace(/[^0-9]/g, ''));
                    let currentValue = 0;
                    const increment = numericValue / 30;
                    
                    const timer = setInterval(() => {
                        currentValue += increment;
                        if (currentValue >= numericValue) {
                            stat.textContent = finalValue;
                            clearInterval(timer);
                        } else {
                            stat.textContent = Math.floor(currentValue).toLocaleString();
                        }
                    }, 50);
                }
            });
        });
    </script>
</body>
</html>
