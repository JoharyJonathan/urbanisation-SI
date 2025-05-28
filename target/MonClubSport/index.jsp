<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Club de Sport - Votre Fitness, Notre Passion</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <meta name="description" content="Rejoignez notre club de sport moderne avec une architecture clean et une expérience utilisateur exceptionnelle">
</head>
<body>
    <div class="hero-section">
        <div class="hero-background">
            <div class="gradient-orb orb-1"></div>
            <div class="gradient-orb orb-2"></div>
            <div class="gradient-orb orb-3"></div>
        </div>
        
        <div class="container">
            <div class="hero-content">
                <div class="hero-badge">
                    <span class="badge-icon">🏆</span>
                    <span>Club de Sport Premium</span>
                </div>
                
                <h1 class="hero-title">
                    Transformez Votre <span class="gradient-text">Potentiel</span>
                    <br>en <span class="gradient-text">Performance</span>
                </h1>
                
                <p class="hero-subtitle">
                    Découvrez une expérience fitness révolutionnaire avec notre plateforme 
                    construite sur une architecture clean moderne. Votre voyage vers l'excellence commence ici.
                </p>
                
                <div class="hero-stats">
                    <div class="stat-item">
                        <div class="stat-number">500+</div>
                        <div class="stat-label">Membres Actifs</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">24/7</div>
                        <div class="stat-label">Accès Libre</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">15+</div>
                        <div class="stat-label">Programmes</div>
                    </div>
                </div>
                
                <div class="cta-section">
                    <a href="${pageContext.request.contextPath}/inscription" class="btn btn-primary">
                        <span class="btn-text">Commencer Maintenant</span>
                        <span class="btn-icon">→</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/connexion" class="btn btn-secondary">
                        <span class="btn-text">Se connecter</span>
                        <span class="btn-icon">👤</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <div class="features-section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Pourquoi Choisir Notre Club ?</h2>
                <p class="section-subtitle">Une expérience unique alliant technologie moderne et expertise fitness</p>
            </div>
            
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">💪</div>
                    <h3>Équipements Premium</h3>
                    <p>Matériel de dernière génération pour optimiser vos entraînements</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">🎯</div>
                    <h3>Programmes Personnalisés</h3>
                    <p>Des plans d'entraînement adaptés à vos objectifs spécifiques</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">📱</div>
                    <h3>Plateforme Digitale</h3>
                    <p>Interface moderne développée avec les meilleures pratiques tech</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">🏆</div>
                    <h3>Coaching Expert</h3>
                    <p>Encadrement professionnel pour atteindre vos objectifs</p>
                </div>
            </div>
        </div>
    </div>
    
    <div class="architecture-section">
        <div class="container">
            <div class="architecture-content">
                <div class="architecture-text">
                    <h2 class="architecture-title">
                        Architecture <span class="gradient-text">Clean</span>
                    </h2>
                    <p class="architecture-description">
                        Notre plateforme est construite avec une architecture clean moderne, 
                        garantissant performance, maintenabilité et évolutivité.
                    </p>
                    
                    <div class="architecture-layers">
                        <div class="layer-item">
                            <div class="layer-icon">🎯</div>
                            <div class="layer-content">
                                <h4>Domain Layer</h4>
                                <p>Entités métier et règles de gestion</p>
                            </div>
                        </div>
                        
                        <div class="layer-item">
                            <div class="layer-icon">⚙️</div>
                            <div class="layer-content">
                                <h4>Application Layer</h4>
                                <p>Services et cas d'usage</p>
                            </div>
                        </div>
                        
                        <div class="layer-item">
                            <div class="layer-icon">🔧</div>
                            <div class="layer-content">
                                <h4>Infrastructure Layer</h4>
                                <p>Base de données et sécurité</p>
                            </div>
                        </div>
                        
                        <div class="layer-item">
                            <div class="layer-icon">🖥️</div>
                            <div class="layer-content">
                                <h4>Presentation Layer</h4>
                                <p>Interface utilisateur moderne</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="architecture-visual">
                    <div class="arch-diagram">
                        <div class="arch-layer arch-presentation">
                            <span>Presentation</span>
                        </div>
                        <div class="arch-layer arch-application">
                            <span>Application</span>
                        </div>
                        <div class="arch-layer arch-domain">
                            <span>Domain</span>
                        </div>
                        <div class="arch-layer arch-infrastructure">
                            <span>Infrastructure</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="cta-bottom-section">
        <div class="container">
            <div class="cta-content">
                <h2>Prêt à Commencer Votre Transformation ?</h2>
                <p>Rejoignez des centaines de membres qui ont déjà transformé leur vie</p>
                <div class="cta-buttons">
                    <a href="${pageContext.request.contextPath}/inscription" class="btn btn-primary btn-large">
                        <span class="btn-text">Inscription Gratuite</span>
                        <span class="btn-icon">🚀</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <footer class="modern-footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-brand">
                    <h3>Club de Sport</h3>
                    <p>Votre partenaire fitness avec une technologie de pointe</p>
                </div>
                <div class="footer-links">
                    <div class="footer-section">
                        <h4>Plateforme</h4>
                        <a href="${pageContext.request.contextPath}/connexion">Connexion</a>
                        <a href="${pageContext.request.contextPath}/inscription">Inscription</a>
                    </div>
                    <div class="footer-section">
                        <h4>Architecture</h4>
                        <span>Clean Architecture</span>
                        <span>Modern Design</span>
                        <span>Responsive</span>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 Club de Sport. Développé avec ❤️ et Clean Architecture</p>
            </div>
        </div>
    </footer>
    
    <script src="script.js"></script>
</body>
</html>