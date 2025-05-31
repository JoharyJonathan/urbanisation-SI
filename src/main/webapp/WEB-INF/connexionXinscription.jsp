<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion & Inscription - GestProd</title>
    
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
            --card-bg: rgba(255, 255, 255, 0.95);
            --shadow-light: 0 10px 40px rgba(0, 0, 0, 0.1);
            --shadow-heavy: 0 20px 60px rgba(0, 0, 0, 0.15);
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background: var(--primary-gradient);
            min-height: 100vh;
            display: flex;
            align-items: center;
            position: relative;
            overflow-x: hidden;
        }
        
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="75" cy="75" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="50" cy="10" r="0.5" fill="rgba(255,255,255,0.1)"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            opacity: 0.3;
            z-index: -1;
        }
        
        .auth-container {
            background: var(--card-bg);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 25px;
            box-shadow: var(--shadow-heavy);
            overflow: hidden;
            position: relative;
            min-height: 600px;
        }
        
        .brand-section {
            background: var(--primary-gradient);
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 60px 40px;
            position: relative;
            overflow: hidden;
        }
        
        .brand-section::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 1px, transparent 1px);
            background-size: 50px 50px;
            animation: float 20s ease-in-out infinite;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }
        
        .brand-content {
            position: relative;
            z-index: 2;
        }
        
        .brand-logo {
            font-size: 3rem;
            margin-bottom: 20px;
            background: linear-gradient(45deg, #fff, #f0f8ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .brand-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 15px;
        }
        
        .brand-subtitle {
            font-size: 1rem;
            opacity: 0.9;
            line-height: 1.6;
        }
        
        .form-section {
            padding: 60px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .form-container {
            display: none;
        }
        
        .form-container.active {
            display: block;
            animation: slideIn 0.5s ease-out;
        }
        
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
        
        .form-title {
            font-size: 2rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 10px;
            text-align: center;
        }
        
        .form-subtitle {
            color: #6c757d;
            text-align: center;
            margin-bottom: 40px;
        }
        
        .form-floating {
            margin-bottom: 20px;
        }
        
        .form-floating > .form-control,
        .form-floating > .form-select {
            background: rgba(248, 249, 250, 0.8);
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            padding: 20px 15px 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-floating > .form-control:focus,
        .form-floating > .form-select:focus {
            background: white;
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        
        .form-floating > label {
            color: #6c757d;
            font-weight: 500;
        }
        
        .btn-auth {
            background: var(--primary-gradient);
            border: none;
            border-radius: 15px;
            padding: 15px;
            font-weight: 600;
            font-size: 1.1rem;
            color: white;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .btn-auth:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 35px rgba(102, 126, 234, 0.6);
            color: white;
        }
        
        .btn-auth:active {
            transform: translateY(0);
        }
        
        .btn-toggle {
            background: transparent;
            border: 2px solid #667eea;
            color: #667eea;
            border-radius: 25px;
            padding: 10px 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .btn-toggle:hover {
            background: #667eea;
            color: white;
            transform: translateY(-2px);
        }
        
        .toggle-section {
            text-align: center;
            margin-top: 30px;
            padding-top: 30px;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
        }
        
        .error-message {
            background: linear-gradient(135deg, #ff6b6b, #ee5a24);
            color: white;
            padding: 15px 20px;
            border-radius: 15px;
            margin-top: 20px;
            text-align: center;
            font-weight: 500;
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
            animation: shake 0.5s ease-in-out;
        }
        
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }
        
        .success-message {
            background: var(--success-gradient);
            color: white;
            padding: 15px 20px;
            border-radius: 15px;
            margin-top: 20px;
            text-align: center;
            font-weight: 500;
            box-shadow: 0 5px 15px rgba(79, 172, 254, 0.3);
        }
        
        .home-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            padding: 10px 20px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .home-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            color: white;
            transform: translateY(-2px);
        }
        
        .floating-elements {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            pointer-events: none;
            overflow: hidden;
        }
        
        .floating-icon {
            position: absolute;
            color: rgba(255, 255, 255, 0.1);
            font-size: 2rem;
            animation: floatIcon 15s ease-in-out infinite;
        }
        
        .floating-icon:nth-child(1) {
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }
        
        .floating-icon:nth-child(2) {
            top: 60%;
            right: 15%;
            animation-delay: 5s;
        }
        
        .floating-icon:nth-child(3) {
            bottom: 20%;
            left: 20%;
            animation-delay: 10s;
        }
        
        @keyframes floatIcon {
            0%, 100% {
                transform: translateY(0px) rotate(0deg);
                opacity: 0.1;
            }
            50% {
                transform: translateY(-30px) rotate(180deg);
                opacity: 0.3;
            }
        }
        
        @media (max-width: 768px) {
            .auth-container {
                margin: 20px;
                min-height: auto;
            }
            
            .brand-section {
                padding: 40px 30px;
            }
            
            .form-section {
                padding: 40px 30px;
            }
            
            .brand-title {
                font-size: 1.5rem;
            }
            
            .form-title {
                font-size: 1.5rem;
            }
            
            .home-btn {
                position: relative;
                top: auto;
                left: auto;
                margin-bottom: 20px;
                align-self: flex-start;
            }
        }
    </style>
</head>
<body>
    <a href="${pageContext.request.contextPath}/" class="home-btn">
        <i class="bi bi-arrow-left"></i>
        <span>Accueil</span>
    </a>
    
    <div class="container-fluid">
        <div class="row justify-content-center align-items-center min-vh-100 py-4">
            <div class="col-lg-10 col-xl-8">
                <div class="auth-container">
                    <div class="row g-0 h-100">
                        <!-- Section Brand/Info -->
                        <div class="col-lg-6">
                            <div class="brand-section h-100">
                                <div class="floating-elements">
                                    <i class="bi bi-box-seam floating-icon"></i>
                                    <i class="bi bi-graph-up floating-icon"></i>
                                    <i class="bi bi-shield-check floating-icon"></i>
                                </div>
                                
                                <div class="brand-content">
                                    <div class="brand-logo">
                                        <i class="bi bi-box-seam"></i>
                                    </div>
                                    <h2 class="brand-title">GestProd</h2>
                                    <p class="brand-subtitle">
                                        Gérez vos produits avec intelligence et simplicité. 
                                        Une plateforme moderne pour optimiser votre productivité.
                                    </p>
                                    
                                    <div class="mt-4">
                                        <div class="d-flex justify-content-center gap-4 mb-3">
                                            <div class="text-center">
                                                <div class="h4 mb-1">1000+</div>
                                                <small>Produits</small>
                                            </div>
                                            <div class="text-center">
                                                <div class="h4 mb-1">24/7</div>
                                                <small>Support</small>
                                            </div>
                                            <div class="text-center">
                                                <div class="h4 mb-1">99.9%</div>
                                                <small>Uptime</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Section Formulaires -->
                        <div class="col-lg-6">
                            <div class="form-section">
                                <!-- Formulaire de Connexion -->
                                <div id="loginForm" class="form-container active">
                                    <h2 class="form-title">
                                        <i class="bi bi-box-arrow-in-right me-2 text-primary"></i>
                                        Connexion
                                    </h2>
                                    <p class="form-subtitle">Accédez à votre espace de gestion</p>
                                    
                                    <form action="${pageContext.request.contextPath}/connexion" method="post">
                                        <div class="form-floating">
                                            <input type="email" class="form-control" id="loginEmail" name="email" 
                                                   placeholder="name@example.com" required>
                                            <label for="loginEmail">
                                                <i class="bi bi-envelope me-2"></i>Adresse email
                                            </label>
                                        </div>
                                        
                                        <div class="form-floating">
                                            <input type="password" class="form-control" id="loginPassword" 
                                                   name="motDePasse" placeholder="Mot de passe" required>
                                            <label for="loginPassword">
                                                <i class="bi bi-lock me-2"></i>Mot de passe
                                            </label>
                                        </div>
                                        
                                        <button type="submit" class="btn btn-auth w-100">
                                            <i class="bi bi-box-arrow-in-right me-2"></i>
                                            Se connecter
                                        </button>
                                    </form>
                                    
                                    <% if (request.getAttribute("errorMessage") != null) { %>
                                        <div class="error-message">
                                            <i class="bi bi-exclamation-triangle me-2"></i>
                                            <%= request.getAttribute("errorMessage") %>
                                        </div>
                                    <% } %>
                                    
                                    <div class="toggle-section">
                                        <p class="text-muted mb-3">Vous n'avez pas de compte ?</p>
                                        <button type="button" class="btn btn-toggle" onclick="toggleForm()">
                                            <i class="bi bi-person-plus me-2"></i>Créer un compte
                                        </button>
                                    </div>
                                </div>
                                
                                <!-- Formulaire d'Inscription -->
                                <div id="registerForm" class="form-container">
                                    <h2 class="form-title">
                                        <i class="bi bi-person-plus me-2 text-primary"></i>
                                        Inscription
                                    </h2>
                                    <p class="form-subtitle">Créez votre compte GestProd</p>
                                    
                                    <form action="${pageContext.request.contextPath}/inscription" method="post">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <input type="text" class="form-control" id="nom" name="nom" 
                                                           placeholder="Nom" required>
                                                    <label for="nom">
                                                        <i class="bi bi-person me-2"></i>Nom
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <input type="text" class="form-control" id="prenom" name="prenom" 
                                                           placeholder="Prénom" required>
                                                    <label for="prenom">
                                                        <i class="bi bi-person me-2"></i>Prénom
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="form-floating">
                                            <input type="email" class="form-control" id="registerEmail" name="email" 
                                                   placeholder="name@example.com" required>
                                            <label for="registerEmail">
                                                <i class="bi bi-envelope me-2"></i>Adresse email
                                            </label>
                                        </div>
                                        
                                        <div class="form-floating">
                                            <input type="password" class="form-control" id="registerPassword" 
                                                   name="motDePasse" placeholder="Mot de passe" required>
                                            <label for="registerPassword">
                                                <i class="bi bi-lock me-2"></i>Mot de passe
                                            </label>
                                        </div>
                                        
                                        <div class="form-floating">
                                            <select class="form-select" id="typeAbonnement" name="typeAbonnement" required>
                                                <option value=""></option>
                                                <option value="mensuel">📅 Mensuel - Flexibilité maximale</option>
                                                <option value="annuel">🎯 Annuel - Meilleur rapport qualité/prix</option>
                                            </select>
                                            <label for="typeAbonnement">
                                                <i class="bi bi-credit-card me-2"></i>Type d'abonnement
                                            </label>
                                        </div>
                                        
                                        <button type="submit" class="btn btn-auth w-100">
                                            <i class="bi bi-person-plus me-2"></i>
                                            Créer mon compte
                                        </button>
                                    </form>
                                    
                                    <div class="toggle-section">
                                        <p class="text-muted mb-3">Vous avez déjà un compte ?</p>
                                        <button type="button" class="btn btn-toggle" onclick="toggleForm()">
                                            <i class="bi bi-box-arrow-in-right me-2"></i>Se connecter
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        function toggleForm() {
            const loginForm = document.getElementById('loginForm');
            const registerForm = document.getElementById('registerForm');
            
            if (loginForm.classList.contains('active')) {
                loginForm.classList.remove('active');
                registerForm.classList.add('active');
            } else {
                registerForm.classList.remove('active');
                loginForm.classList.add('active');
            }
        }
        
        // Animation des éléments au chargement
        document.addEventListener('DOMContentLoaded', function() {
            // Animation des champs de formulaire
            const inputs = document.querySelectorAll('.form-control, .form-select');
            inputs.forEach((input, index) => {
                input.style.opacity = '0';
                input.style.transform = 'translateY(20px)';
                setTimeout(() => {
                    input.style.transition = 'all 0.5s ease';
                    input.style.opacity = '1';
                    input.style.transform = 'translateY(0)';
                }, index * 100);
            });
            
            // Effet de focus amélioré
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'scale(1.02)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'scale(1)';
                });
            });
        });
        
        // Validation en temps réel
        document.addEventListener('DOMContentLoaded', function() {
            const emailInputs = document.querySelectorAll('input[type="email"]');
            const passwordInputs = document.querySelectorAll('input[type="password"]');
            
            emailInputs.forEach(input => {
                input.addEventListener('input', function() {
                    const isValid = this.checkValidity();
                    this.classList.toggle('is-valid', isValid && this.value.length > 0);
                    this.classList.toggle('is-invalid', !isValid && this.value.length > 0);
                });
            });
            
            passwordInputs.forEach(input => {
                input.addEventListener('input', function() {
                    const isValid = this.value.length >= 6;
                    this.classList.toggle('is-valid', isValid);
                    this.classList.toggle('is-invalid', !isValid && this.value.length > 0);
                });
            });
        });
        
        // Effet de particules sur le côté brand
        function createParticle() {
            const brandSection = document.querySelector('.brand-section');
            const particle = document.createElement('div');
            particle.style.position = 'absolute';
            particle.style.width = '4px';
            particle.style.height = '4px';
            particle.style.background = 'rgba(255, 255, 255, 0.3)';
            particle.style.borderRadius = '50%';
            particle.style.pointerEvents = 'none';
            particle.style.left = Math.random() * 100 + '%';
            particle.style.top = '100%';
            particle.style.animation = 'particleFloat 8s linear forwards';
            
            brandSection.appendChild(particle);
            
            setTimeout(() => {
                particle.remove();
            }, 8000);
        }
        
        // Ajouter les styles pour l'animation des particules
        const particleStyle = document.createElement('style');
        particleStyle.textContent = `
            @keyframes particleFloat {
                to {
                    transform: translateY(-100vh) rotate(360deg);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(particleStyle);
        
        // Créer des particules périodiquement
        setInterval(createParticle, 2000);
    </script>
</body>
</html>
