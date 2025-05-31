<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.monclub.domain.entities.Membre" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administration - GestProd Dashboard</title>
    
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
            --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --warning-gradient: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
            --danger-gradient: linear-gradient(135deg, #ff9a9e 0%, #fecfef 100%);
            --sidebar-bg: #2d3748;
            --main-bg: #f7fafc;
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background: var(--main-bg);
            margin: 0;
            padding: 0;
        }
        
        .admin-wrapper {
            display: flex;
            min-height: 100vh;
        }
        
        .sidebar {
            width: 280px;
            background: var(--sidebar-bg);
            color: white;
            padding: 0;
            box-shadow: 4px 0 15px rgba(0, 0, 0, 0.1);
            position: fixed;
            height: 100vh;
            overflow-y: auto;
            transition: transform 0.3s ease;
            z-index: 1000;
        }
        
        .sidebar-header {
            padding: 25px 20px;
            background: var(--primary-gradient);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .sidebar-brand {
            display: flex;
            align-items: center;
            font-size: 1.5rem;
            font-weight: 700;
            color: white;
            text-decoration: none;
        }
        
        .sidebar-brand i {
            margin-right: 10px;
            font-size: 1.8rem;
        }
        
        .sidebar-nav {
            padding: 20px 0;
        }
        
        .nav-item {
            margin-bottom: 5px;
        }
        
        .nav-link {
            display: flex;
            align-items: center;
            padding: 15px 25px;
            color: #a0aec0;
            text-decoration: none;
            transition: all 0.3s ease;
            border-left: 3px solid transparent;
        }
        
        .nav-link:hover,
        .nav-link.active {
            color: white;
            background: rgba(255, 255, 255, 0.1);
            border-left-color: #667eea;
        }
        
        .nav-link i {
            margin-right: 12px;
            font-size: 1.2rem;
            width: 20px;
        }
        
        .main-content {
            flex: 1;
            margin-left: 280px;
            padding: 0;
            background: var(--main-bg);
        }
        
        .top-navbar {
            background: white;
            padding: 15px 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            display: flex;
            justify-content: between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 999;
        }
        
        .page-title {
            margin: 0;
            font-size: 1.8rem;
            font-weight: 600;
            color: #2d3748;
        }
        
        .navbar-actions {
            display: flex;
            gap: 15px;
            align-items: center;
            margin-left: auto;
        }
        
        .content-area {
            padding: 30px;
        }
        
        .stats-cards {
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }
        
        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
            font-size: 1.5rem;
            color: white;
        }
        
        .stat-icon.primary { background: var(--primary-gradient); }
        .stat-icon.success { background: var(--success-gradient); }
        .stat-icon.warning { background: var(--warning-gradient); color: #d69e2e !important; }
        .stat-icon.danger { background: var(--danger-gradient); color: #e53e3e !important; }
        
        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 5px;
        }
        
        .stat-label {
            color: #6c757d;
            font-size: 0.9rem;
            font-weight: 500;
        }
        
        .data-table-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }
        
        .table-header {
            padding: 25px 30px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-bottom: 1px solid #dee2e6;
            display: flex;
            justify-content: between;
            align-items: center;
        }
        
        .table-title {
            margin: 0;
            font-size: 1.4rem;
            font-weight: 600;
            color: #2d3748;
        }
        
        .table-actions {
            display: flex;
            gap: 10px;
            margin-left: auto;
        }
        
        .table-responsive {
            max-height: 600px;
            overflow-y: auto;
        }
        
        .members-table {
            margin: 0;
        }
        
        .members-table th {
            background: #f8f9fa;
            color: #495057;
            font-weight: 600;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 15px 20px;
            border: none;
            position: sticky;
            top: 0;
            z-index: 10;
        }
        
        .members-table td {
            padding: 15px 20px;
            vertical-align: middle;
            border-top: 1px solid #eee;
        }
        
        .members-table tbody tr:hover {
            background: #f8f9fa;
        }
        
        .member-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--primary-gradient);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 0.9rem;
        }
        
        .member-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }
        
        .member-name {
            font-weight: 600;
            color: #2d3748;
            margin: 0;
        }
        
        .member-email {
            font-size: 0.85rem;
            color: #6c757d;
            margin: 0;
        }
        
        .badge {
            font-size: 0.75rem;
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 500;
        }
        
        .badge.role-admin {
            background: var(--danger-gradient);
            color: #e53e3e;
        }
        
        .badge.role-user {
            background: var(--success-gradient);
            color: #38a169;
        }
        
        .badge.abonnement-premium {
            background: var(--warning-gradient);
            color: #d69e2e;
        }
        
        .badge.abonnement-basic {
            background: #e2e8f0;
            color: #4a5568;
        }
        
        .action-buttons {
            display: flex;
            gap: 8px;
            align-items: center;
        }
        
        .btn-action {
            padding: 6px 12px;
            border: none;
            border-radius: 8px;
            font-size: 0.8rem;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        
        .btn-edit {
            background: var(--primary-gradient);
            color: white;
        }
        
        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
            color: white;
        }
        
        .btn-delete {
            background: var(--danger-gradient);
            color: #e53e3e;
            border: 1px solid #fed7d7;
        }
        
        .btn-delete:hover {
            background: #fed7d7;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(229, 62, 62, 0.3);
        }
        
        .no-data {
            text-align: center;
            padding: 60px 20px;
            color: #6c757d;
        }
        
        .no-data i {
            font-size: 4rem;
            margin-bottom: 20px;
            color: #cbd5e0;
        }
        
        .search-bar {
            position: relative;
            max-width: 300px;
        }
        
        .search-bar input {
            padding-left: 40px;
            border-radius: 25px;
            border: 1px solid #e2e8f0;
        }
        
        .search-bar i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #a0aec0;
        }
        
        .mobile-toggle {
            display: none;
            background: none;
            border: none;
            font-size: 1.5rem;
            color: #2d3748;
            margin-right: 15px;
        }
        
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }
            
            .sidebar.show {
                transform: translateX(0);
            }
            
            .main-content {
                margin-left: 0;
            }
            
            .mobile-toggle {
                display: block;
            }
            
            .content-area {
                padding: 20px 15px;
            }
            
            .top-navbar {
                padding: 15px 20px;
            }
            
            .table-header {
                padding: 20px 15px;
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
            
            .table-actions {
                margin-left: 0;
                width: 100%;
            }
            
            .search-bar {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="admin-wrapper">
        <!-- Sidebar -->
        <aside class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <a href="#" class="sidebar-brand">
                    <i class="bi bi-box-seam"></i>
                    GestProd Admin
                </a>
            </div>
            
            <nav class="sidebar-nav">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a href="#" class="nav-link active">
                            <i class="bi bi-speedometer2"></i>
                            Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="bi bi-people-fill"></i>
                            Gestion Membres
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/products" class="nav-link">
                            <i class="bi bi-box-seam-fill"></i>
                            Produits
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="bi bi-graph-up"></i>
                            Analytics
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="bi bi-gear-fill"></i>
                            Paramètres
                        </a>
                    </li>
                </ul>
            </nav>
        </aside>
        
        <!-- Main Content -->
        <main class="main-content">
            <!-- Top Navbar -->
            <div class="top-navbar">
                <button class="mobile-toggle" id="mobileToggle">
                    <i class="bi bi-list"></i>
                </button>
                <h1 class="page-title">Gestion des Membres</h1>
                <div class="navbar-actions">
                    <a href="${pageContext.request.contextPath}/accueil" class="btn btn-outline-primary btn-sm">
                        <i class="bi bi-house-fill me-1"></i>
                        Accueil
                    </a>
                    <a href="${pageContext.request.contextPath}/deconnexion" class="btn btn-outline-danger btn-sm">
                        <i class="bi bi-box-arrow-right me-1"></i>
                        Déconnexion
                    </a>
                </div>
            </div>
            
            <!-- Content Area -->
            <div class="content-area">
                <% 
                List<Membre> membres = (List<Membre>) request.getAttribute("membres");
                int totalMembres = (membres != null) ? membres.size() : 0;
                int admins = 0, users = 0, premium = 0;
                
                if (membres != null) {
                    for (Membre membre : membres) {
                        if ("ADMIN".equals(membre.getRole())) admins++;
                        else users++;
                        if ("PREMIUM".equals(membre.getTypeAbonnement())) premium++;
                    }
                }
                %>
                
                <!-- Stats Cards -->
                <div class="row stats-cards">
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="stat-card">
                            <div class="stat-icon primary">
                                <i class="bi bi-people-fill"></i>
                            </div>
                            <div class="stat-number"><%= totalMembres %></div>
                            <div class="stat-label">Total Membres</div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="stat-card">
                            <div class="stat-icon success">
                                <i class="bi bi-person-check-fill"></i>
                            </div>
                            <div class="stat-number"><%= users %></div>
                            <div class="stat-label">Utilisateurs</div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="stat-card">
                            <div class="stat-icon warning">
                                <i class="bi bi-shield-fill-check"></i>
                            </div>
                            <div class="stat-number"><%= admins %></div>
                            <div class="stat-label">Administrateurs</div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="stat-card">
                            <div class="stat-icon danger">
                                <i class="bi bi-star-fill"></i>
                            </div>
                            <div class="stat-number"><%= premium %></div>
                            <div class="stat-label">Membres Premium</div>
                        </div>
                    </div>
                </div>
                
                <!-- Members Table -->
                <div class="data-table-container">
                    <div class="table-header">
                        <h3 class="table-title">
                            <i class="bi bi-people me-2"></i>
                            Liste des Membres
                        </h3>
                        <div class="table-actions">
                            <div class="search-bar">
                                <input type="text" class="form-control" placeholder="Rechercher..." id="searchInput">
                                <i class="bi bi-search"></i>
                            </div>
                            <button class="btn btn-primary btn-sm">
                                <i class="bi bi-plus-circle me-1"></i>
                                Nouveau Membre
                            </button>
                        </div>
                    </div>
                    
                    <% if (membres != null && !membres.isEmpty()) { %>
                        <div class="table-responsive">
                            <table class="table members-table mb-0">
                                <thead>
                                    <tr>
                                        <th>Membre</th>
                                        <th>Email</th>
                                        <th>Abonnement</th>
                                        <th>Rôle</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Membre membre : membres) { %>
                                        <tr>
                                            <td>
                                                <div class="member-info">
                                                    <div class="member-avatar">
                                                        <%= membre.getPrenom().substring(0,1).toUpperCase() + membre.getNom().substring(0,1).toUpperCase() %>
                                                    </div>
                                                    <div>
                                                        <div class="member-name"><%= membre.getPrenom() %> <%= membre.getNom() %></div>
                                                        <small class="text-muted">ID: <%= membre.getId() %></small>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="member-email"><%= membre.getEmail() %></div>
                                            </td>
                                            <td>
                                                <span class="badge abonnement-<%= membre.getTypeAbonnement().toLowerCase() %>">
                                                    <% if ("PREMIUM".equals(membre.getTypeAbonnement())) { %>
                                                        <i class="bi bi-star-fill me-1"></i>
                                                    <% } else { %>
                                                        <i class="bi bi-person-fill me-1"></i>
                                                    <% } %>
                                                    <%= membre.getTypeAbonnement() %>
                                                </span>
                                            </td>
                                            <td>
                                                <span class="badge role-<%= membre.getRole().toLowerCase() %>">
                                                    <% if ("ADMIN".equals(membre.getRole())) { %>
                                                        <i class="bi bi-shield-fill-check me-1"></i>
                                                    <% } else { %>
                                                        <i class="bi bi-person-fill me-1"></i>
                                                    <% } %>
                                                    <%= membre.getRole() %>
                                                </span>
                                            </td>
                                            <td>
                                                <div class="action-buttons">
                                                    <a href="${pageContext.request.contextPath}/admin/modifier?id=<%= membre.getId() %>" 
                                                       class="btn-action btn-edit" title="Modifier">
                                                        <i class="bi bi-pencil-fill"></i>
                                                        Modifier
                                                    </a>
                                                    <form method="post" action="admin" style="display: inline;" 
                                                          onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer ce membre ?');">
                                                        <input type="hidden" name="action" value="supprimer" />
                                                        <input type="hidden" name="id" value="<%= membre.getId() %>" />
                                                        <button type="submit" class="btn-action btn-delete" title="Supprimer">
                                                            <i class="bi bi-trash-fill"></i>
                                                            Supprimer
                                                        </button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    <% } else { %>
                        <div class="no-data">
                            <i class="bi bi-people"></i>
                            <h4>Aucun membre trouvé</h4>
                            <p>Commencez par ajouter votre premier membre au système.</p>
                            <button class="btn btn-primary">
                                <i class="bi bi-plus-circle me-2"></i>
                                Ajouter un membre
                            </button>
                        </div>
                    <% } %>
                </div>
            </div>
        </main>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom Scripts -->
    <script>
        // Mobile sidebar toggle
        document.getElementById('mobileToggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('show');
        });
        
        // Search functionality
        document.getElementById('searchInput').addEventListener('keyup', function() {
            const searchTerm = this.value.toLowerCase();
            const tableRows = document.querySelectorAll('.members-table tbody tr');
            
            tableRows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(searchTerm) ? '' : 'none';
            });
        });
        
        // Close sidebar when clicking outside on mobile
        document.addEventListener('click', function(event) {
            const sidebar = document.getElementById('sidebar');
            const toggle = document.getElementById('mobileToggle');
            
            if (window.innerWidth <= 768 && 
                !sidebar.contains(event.target) && 
                !toggle.contains(event.target)) {
                sidebar.classList.remove('show');
            }
        });
        
        // Animate stats on load
        document.addEventListener('DOMContentLoaded', function() {
            const statNumbers = document.querySelectorAll('.stat-number');
            
            statNumbers.forEach(stat => {
                const finalValue = parseInt(stat.textContent);
                let currentValue = 0;
                const increment = finalValue / 30;
                
                const timer = setInterval(() => {
                    currentValue += increment;
                    if (currentValue >= finalValue) {
                        stat.textContent = finalValue;
                        clearInterval(timer);
                    } else {
                        stat.textContent = Math.floor(currentValue);
                    }
                }, 50);
            });
        });
        
        // Tooltip initialization for actions
        document.addEventListener('DOMContentLoaded', function() {
            const tooltipTriggerList = [].slice.call(document.querySelectorAll('[title]'));
            tooltipTriggerList.map(function(tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
        });
    </script>
</body>
</html>
