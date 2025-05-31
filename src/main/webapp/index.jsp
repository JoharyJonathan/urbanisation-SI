<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GestProd - Gestion de Produits Intelligente</title>
    
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
            --dark-bg: #1a1d29;
            --card-bg: rgba(255, 255, 255, 0.95);
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        
        .hero-section {
            background: var(--primary-gradient);
            color: white;
            padding: 100px 0 80px;
            position: relative;
            overflow: hidden;
        }
        
        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="75" cy="75" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="50" cy="10" r="0.5" fill="rgba(255,255,255,0.1)"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            opacity: 0.3;
        }
        
        .hero-content {
            position: relative;
            z-index: 2;
        }
        
        .hero-badge {
            display: inline-flex;
            align-items: center;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            padding: 8px 20px;
            border-radius: 50px;
            margin-bottom: 30px;
            font-size: 14px;
            font-weight: 500;
        }
        
        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            line-height: 1.2;
            margin-bottom: 25px;
        }
        
        .gradient-text {
            background: linear-gradient(45deg, #fff, #f0f8ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .hero-subtitle {
            font-size: 1.25rem;
            font-weight: 400;
            opacity: 0.9;
            margin-bottom: 40px;
            max-width: 600px;
        }
        
        .stats-row {
            margin: 50px 0;
        }
        
        .stat-card {
            background: var(--card-bg);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 30px 20px;
            text-align: center;
            margin-bottom: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        }
        
        .stat-number {
            font-size: 2.5rem;
            font-weight: 800;
            color: #667eea;
            margin-bottom: 5px;
        }
        
        .stat-label {
            font-size: 1rem;
            color: #6c757d;
            font-weight: 500;
        }
        
        .btn-custom {
            padding: 15px 35px;
            border-radius: 50px;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
            border: none;
            position: relative;
            overflow: hidden;
        }
        
        .btn-primary-custom {
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.4);
        }
        
        .btn-primary-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 15px 40px rgba(102, 126, 234, 0.6);
            color: white;
        }
        
        .btn-outline-custom {
            background: transparent;
            color: white;
            border: 2px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(10px);
        }
        
        .btn-outline-custom:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.5);
            color: white;
            transform: translateY(-2px);
        }
        
        .features-section {
            padding: 100px 0;
            background: #f8f9fa;
        }
        
        .feature-card {
            background: white;
            border-radius: 20px;
            padding: 40px 30px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            height: 100%;
            border: 1px solid rgba(0, 0, 0, 0.05);
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
        }
        
        .feature-icon {
            width: 80px;
            height: 80px;
            background: var(--primary-gradient);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            font-size: 2rem;
            color: white;
        }
        
        .feature-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 15px;
            color: #2d3748;
        }
        
        .feature-description {
            color: #6c757d;
            line-height: 1.6;
        }
        
        .architecture-section {
            padding: 100px 0;
            background: var(--dark-bg);
            color: white;
        }
        
        .arch-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }
        
        .arch-card:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.2);
            transform: translateX(10px);
        }
        
        .arch-icon {
            font-size: 2rem;
            margin-bottom: 15px;
            color: #667eea;
        }
        
        .cta-section {
            padding: 80px 0;
            background: var(--secondary-gradient);
            color: white;
            text-align: center;
        }
        
        .footer {
            background: #2d3748;
            color: white;
            padding: 50px 0 30px;
        }
        
        .footer-brand h3 {
            font-weight: 700;
            margin-bottom: 15px;
        }
        
        .footer-links a {
            color: #a0aec0;
            text-decoration: none;
            display: block;
            margin-bottom: 8px;
            transition: color 0.3s ease;
        }
        
        .footer-links a:hover {
            color: #667eea;
        }
        
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-subtitle {
                font-size: 1.1rem;
            }
            
            .stat-card {
                margin-bottom: 15px;
            }
        }
    </style>
</head>
<body>
    <!-- Section Hero -->
    <section class="hero-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <div class="hero-badge">
                        <i class="bi bi-trophy-fill me-2"></i>
                        <span>Plateforme de Gestion Premium</span>
                    </div>
                    
                    <h1 class="hero-title">
                        Gérez Vos <span class="gradient-text">Produits</span>
                        <br>Avec <span class="gradient-text">Intelligence</span>
                    </h1>
                    
                    <p class="hero-subtitle">
                        Découvrez une expérience de gestion révolutionnaire avec notre plateforme 
                        construite sur une architecture moderne. Votre efficacité commence ici.
                    </p>
                    
                    <!-- Statistiques -->
                    <div class="row stats-row">
                        <div class="col-md-4">
                            <div class="stat-card">
                                <div class="stat-number">1000+</div>
                                <div class="stat-label">Produits Gérés</div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stat-card">
                                <div class="stat-number">24/7</div>
                                <div class="stat-label">Support Actif</div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stat-card">
                                <div class="stat-number">99.9%</div>
                                <div class="stat-label">Disponibilité</div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Boutons d'action -->
                    <div class="d-flex flex-wrap justify-content-center gap-3">
                        <a href="${pageContext.request.contextPath}/inscription" class="btn btn-custom btn-primary-custom">
                            <i class="bi bi-rocket-takeoff"></i>
                            <span>Commencer Maintenant</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/connexion" class="btn btn-custom btn-outline-custom">
                            <i class="bi bi-person-circle"></i>
                            <span>Se Connecter</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Section Fonctionnalités -->
    <section class="features-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-lg-8 mx-auto text-center">
                    <h2 class="display-5 fw-bold mb-3">Pourquoi Choisir Notre Plateforme ?</h2>
                    <p class="lead text-muted">Une solution complète alliant technologie moderne et simplicité d'utilisation</p>
                </div>
            </div>
            
            <div class="row g-4">
                <div class="col-lg-3 col-md-6">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-box-seam"></i>
                        </div>
                        <h3 class="feature-title">Gestion Avancée</h3>
                        <p class="feature-description">
                            Gérez vos produits avec des outils sophistiqués et une interface intuitive
                        </p>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-graph-up-arrow"></i>
                        </div>
                        <h3 class="feature-title">Analytics Temps Réel</h3>
                        <p class="feature-description">
                            Suivez les performances de vos produits avec des rapports détaillés
                        </p>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-shield-check"></i>
                        </div>
                        <h3 class="feature-title">Sécurité Maximale</h3>
                        <p class="feature-description">
                            Vos données sont protégées par les dernières technologies de sécurité
                        </p>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-people-fill"></i>
                        </div>
                        <h3 class="feature-title">Collaboration</h3>
                        <p class="feature-description">
                            Travaillez en équipe avec des outils de collaboration intégrés
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Section Architecture -->
    <section class="architecture-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h2 class="display-6 fw-bold mb-4">
                        Architecture <span class="gradient-text">Moderne</span>
                    </h2>
                    <p class="lead mb-4">
                        Notre plateforme est construite avec une architecture moderne et scalable, 
                        garantissant performance et évolutivité.
                    </p>
                    
                    <div class="arch-card">
                        <div class="arch-icon">
                            <i class="bi bi-display"></i>
                        </div>
                        <h4>Interface Utilisateur</h4>
                        <p class="mb-0">Design responsive et expérience utilisateur optimisée</p>
                    </div>
                    
                    <div class="arch-card">
                        <div class="arch-icon">
                            <i class="bi bi-gear-fill"></i>
                        </div>
                        <h4>Logique Métier</h4>
                        <p class="mb-0">Services robustes et règles de gestion avancées</p>
                    </div>
                    
                    <div class="arch-card">
                        <div class="arch-icon">
                            <i class="bi bi-database-fill"></i>
                        </div>
                        <h4>Persistance des Données</h4>
                        <p class="mb-0">Base de données optimisée et sécurisée</p>
                    </div>
                </div>
                
                <div class="col-lg-6">
                    <div class="text-center">
                        <div class="position-relative">
                            <i class="bi bi-diagram-3-fill" style="font-size: 15rem; color: #667eea; opacity: 0.1;"></i>
                            <div class="position-absolute top-50 start-50 translate-middle">
                                <i class="bi bi-cpu-fill" style="font-size: 4rem; color: #667eea;"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Section Call-to-Action -->
    <section class="cta-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center">
                    <h2 class="display-5 fw-bold mb-3">Prêt à Optimiser Votre Gestion ?</h2>
                    <p class="lead mb-4">
                        Rejoignez des centaines d'entreprises qui ont déjà transformé leur gestion de produits
                    </p>
                    <a href="${pageContext.request.contextPath}/inscription" class="btn btn-custom btn-primary-custom btn-lg">
                        <i class="bi bi-arrow-right-circle-fill"></i>
                        <span>Commencer Gratuitement</span>
                    </a>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <div class="footer-brand">
                        <h3><i class="bi bi-box-seam me-2"></i>GestProd</h3>
                        <p class="text-muted">Votre partenaire pour une gestion de produits intelligente et efficace.</p>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 mb-4">
                    <h5>Plateforme</h5>
                    <div class="footer-links">
                        <a href="${pageContext.request.contextPath}/connexion">
                            <i class="bi bi-box-arrow-in-right me-2"></i>Connexion
                        </a>
                        <a href="${pageContext.request.contextPath}/inscription">
                            <i class="bi bi-person-plus me-2"></i>Inscription
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 mb-4">
                    <h5>Fonctionnalités</h5>
                    <div class="footer-links">
                        <a href="#"><i class="bi bi-box me-2"></i>Gestion Produits</a>
                        <a href="#"><i class="bi bi-graph-up me-2"></i>Analytics</a>
                        <a href="#"><i class="bi bi-people me-2"></i>Collaboration</a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 mb-4">
                    <h5>Support</h5>
                    <div class="footer-links">
                        <a href="#"><i class="bi bi-question-circle me-2"></i>Aide</a>
                        <a href="#"><i class="bi bi-chat-dots me-2"></i>Contact</a>
                        <a href="#"><i class="bi bi-file-text me-2"></i>Documentation</a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 mb-4">
                    <h5>Suivez-nous</h5>
                    <div class="d-flex gap-3">
                        <a href="#" class="text-muted fs-4"><i class="bi bi-twitter"></i></a>
                        <a href="#" class="text-muted fs-4"><i class="bi bi-linkedin"></i></a>
                        <a href="#" class="text-muted fs-4"><i class="bi bi-github"></i></a>
                    </div>
                </div>
            </div>
            <hr class="my-4">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <p class="mb-0 text-muted">
                        &copy; 2024 GestProd. Développé avec <i class="bi bi-heart-fill text-danger"></i> et Bootstrap
                    </p>
                </div>
                <div class="col-md-6 text-md-end">
                    <span class="badge bg-primary">
                        <i class="bi bi-shield-check me-1"></i>Architecture Moderne
                    </span>
                </div>
            </div>
        </div>
    </footer>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Script personnalisé -->
    <script>
        // Animation au scroll
        document.addEventListener('DOMContentLoaded', function() {
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };
            
            const observer = new IntersectionObserver(function(entries) {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateY(0)';
                    }
                });
            }, observerOptions);
            
            // Appliquer l'animation aux cartes
            document.querySelectorAll('.feature-card, .stat-card, .arch-card').forEach(card => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px)';
                card.style.transition = 'all 0.6s ease';
                observer.observe(card);
            });
        });
        
        // Effet de parallaxe léger sur les icônes
        document.addEventListener('mousemove', function(e) {
            const icons = document.querySelectorAll('.feature-icon');
            const mouseX = e.clientX / window.innerWidth;
            const mouseY = e.clientY / window.innerHeight;
            
            icons.forEach(icon => {
                const speed = 2;
                const x = (mouseX - 0.5) * speed;
                const y = (mouseY - 0.5) * speed;
                icon.style.transform = `translate(${x}px, ${y}px)`;
            });
        });
    </script>
</body>
</html>
