// Script moderne pour le Club de Sport
document.addEventListener('DOMContentLoaded', function() {
    
    // Gestion du basculement entre connexion et inscription
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');
    
    if (signUpButton && signInButton && container) {
        // Animation de basculement vers l'inscription
        signUpButton.addEventListener('click', () => {
            container.classList.add("right-panel-active");
            
            // Effet de vibration subtile
            signUpButton.style.animation = 'pulse 0.3s ease-out';
            setTimeout(() => {
                signUpButton.style.animation = '';
            }, 300);
        });
        
        // Animation de basculement vers la connexion
        signInButton.addEventListener('click', () => {
            container.classList.remove("right-panel-active");
            
            // Effet de vibration subtile
            signInButton.style.animation = 'pulse 0.3s ease-out';
            setTimeout(() => {
                signInButton.style.animation = '';
            }, 300);
        });
    }
    
    // Animation des inputs au focus
    const inputs = document.querySelectorAll('input, select');
    inputs.forEach(input => {
        // Effet de focus avec animation
        input.addEventListener('focus', function() {
            this.style.transform = 'scale(1.02)';
            this.style.transition = 'all 0.3s ease';
        });
        
        input.addEventListener('blur', function() {
            this.style.transform = 'scale(1)';
        });
        
        // Animation de saisie
        input.addEventListener('input', function() {
            if (this.value.length > 0) {
                this.style.borderColor = 'rgba(255, 255, 255, 0.6)';
                this.style.background = 'rgba(255, 255, 255, 0.15)';
            } else {
                this.style.borderColor = 'rgba(255, 255, 255, 0.2)';
                this.style.background = 'rgba(255, 255, 255, 0.1)';
            }
        });
    });
    
    // Animation des boutons
    const buttons = document.querySelectorAll('.btn, button');
    buttons.forEach(button => {
        // Effet de hover amélioré
        button.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-3px) scale(1.02)';
        });
        
        button.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
        
        // Effet de clic
        button.addEventListener('mousedown', function() {
            this.style.transform = 'translateY(-1px) scale(0.98)';
        });
        
        button.addEventListener('mouseup', function() {
            this.style.transform = 'translateY(-3px) scale(1.02)';
        });
    });
    
    // Animation des cartes au scroll
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
                entry.target.style.transition = 'all 0.6s ease-out';
            }
        });
    }, observerOptions);
    
    // Appliquer l'observer aux éléments
    const animatedElements = document.querySelectorAll(
        '.member-info, .admin-section, .members-list, .architecture-info'
    );
    
    animatedElements.forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        observer.observe(el);
    });
    
    // Animation de la table
    const tableRows = document.querySelectorAll('.members-table tbody tr');
    tableRows.forEach((row, index) => {
        row.style.opacity = '0';
        row.style.transform = 'translateX(-20px)';
        
        setTimeout(() => {
            row.style.opacity = '1';
            row.style.transform = 'translateX(0)';
            row.style.transition = 'all 0.4s ease-out';
        }, index * 100);
        
        // Effet de hover amélioré pour les lignes
        row.addEventListener('mouseenter', function() {
            this.style.background = 'rgba(255, 255, 255, 0.1)';
            this.style.transform = 'scale(1.01)';
            this.style.transition = 'all 0.2s ease';
        });
        
        row.addEventListener('mouseleave', function() {
            this.style.background = 'rgba(255, 255, 255, 0.05)';
            this.style.transform = 'scale(1)';
        });
    });
    
    // Validation de formulaire en temps réel
    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        const inputs = form.querySelectorAll('input[required], select[required]');
        const submitButton = form.querySelector('button[type="submit"]');
        
        function validateForm() {
            let isValid = true;
            inputs.forEach(input => {
                if (!input.value.trim()) {
                    isValid = false;
                    input.style.borderColor = 'rgba(255, 107, 107, 0.6)';
                } else {
                    input.style.borderColor = 'rgba(76, 175, 80, 0.6)';
                }
            });
            
            if (submitButton) {
                if (isValid) {
                    submitButton.style.opacity = '1';
                    submitButton.style.transform = 'scale(1)';
                    submitButton.disabled = false;
                } else {
                    submitButton.style.opacity = '0.7';
                    submitButton.style.transform = 'scale(0.95)';
                }
            }
        }
        
        inputs.forEach(input => {
            input.addEventListener('input', validateForm);
            input.addEventListener('blur', validateForm);
        });
        
        // Animation de soumission
        form.addEventListener('submit', function(e) {
            if (submitButton) {
                submitButton.innerHTML = '<span>Chargement...</span>';
                submitButton.style.background = 'linear-gradient(135deg, #4facfe 0%, #00f2fe 100%)';
                
                // Animation de rotation
                submitButton.style.animation = 'pulse 1s infinite';
            }
        });
    });
    
    // Effet de parallaxe subtil pour les éléments de fond
    window.addEventListener('scroll', () => {
        const scrolled = window.pageYOffset;
        const parallaxElements = document.querySelectorAll('.architecture-info');
        
        parallaxElements.forEach(el => {
            const speed = 0.5;
            el.style.transform = `translateY(${scrolled * speed}px)`;
        });
    });
    
    // Animation de typewriter pour les titres (optionnel)
    function typeWriter(element, text, speed = 100) {
        let i = 0;
        element.innerHTML = '';
        
        function type() {
            if (i < text.length) {
                element.innerHTML += text.charAt(i);
                i++;
                setTimeout(type, speed);
            }
        }
        type();
    }
    
    // Appliquer l'effet typewriter aux titres principaux
    const mainTitles = document.querySelectorAll('h1');
    mainTitles.forEach((title, index) => {
        const originalText = title.textContent;
        setTimeout(() => {
            typeWriter(title, originalText, 50);
        }, index * 1000);
    });
    
    // Gestion des notifications toast (pour les messages d'erreur/succès)
    function showToast(message, type = 'info') {
        const toast = document.createElement('div');
        toast.className = `toast toast-${type}`;
        toast.innerHTML = `
            <div class="toast-content">
                <span class="toast-icon">${type === 'error' ? '⚠️' : type === 'success' ? '✅' : 'ℹ️'}</span>
                <span class="toast-message">${message}</span>
            </div>
        `;
        
        // Styles pour le toast
        toast.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            background: ${type === 'error' ? 'rgba(255, 107, 107, 0.9)' : 
                          type === 'success' ? 'rgba(76, 175, 80, 0.9)' : 
                          'rgba(33, 150, 243, 0.9)'};
            color: white;
            padding: 1rem 1.5rem;
            border-radius: 10px;
            backdrop-filter: blur(10px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            z-index: 1000;
            transform: translateX(100%);
            transition: transform 0.3s ease-out;
            max-width: 300px;
        `;
        
        document.body.appendChild(toast);
        
        // Animation d'entrée
        setTimeout(() => {
            toast.style.transform = 'translateX(0)';
        }, 100);
        
        // Animation de sortie
        setTimeout(() => {
            toast.style.transform = 'translateX(100%)';
            setTimeout(() => {
                document.body.removeChild(toast);
            }, 300);
        }, 4000);
    }
    
    // Vérifier s'il y a des messages d'erreur et les afficher
    const errorMessage = document.querySelector('.error');
    if (errorMessage) {
        showToast(errorMessage.textContent, 'error');
    }
    
    // Animation de loading pour les liens
    const links = document.querySelectorAll('a[href]');
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            // Ne pas appliquer aux liens avec des ancres ou JavaScript
            if (!this.href.includes('#') && !this.href.includes('javascript:')) {
                // Créer un indicateur de chargement
                const loader = document.createElement('div');
                loader.className = 'page-loader';
                loader.innerHTML = `
                    <div class="loader-content">
                        <div class="loader-spinner"></div>
                        <p>Chargement...</p>
                    </div>
                `;
                
                loader.style.cssText = `
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: rgba(102, 126, 234, 0.9);
                    backdrop-filter: blur(10px);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    z-index: 9999;
                    opacity: 0;
                    transition: opacity 0.3s ease;
                `;
                
                const loaderContent = `
                    <style>
                        .loader-spinner {
                            width: 50px;
                            height: 50px;
                            border: 4px solid rgba(255,255,255,0.3);
                            border-top: 4px solid white;
                            border-radius: 50%;
                            animation: spin 1s linear infinite;
                            margin-bottom: 1rem;
                        }
                        @keyframes spin {
                            0% { transform: rotate(0deg); }
                            100% { transform: rotate(360deg); }
                        }
                        .loader-content {
                            text-align: center;
                            color: white;
                            font-size: 1.2rem;
                        }
                    </style>
                `;
                
                document.head.insertAdjacentHTML('beforeend', loaderContent);
                document.body.appendChild(loader);
                
                setTimeout(() => {
                    loader.style.opacity = '1';
                }, 50);
            }
        });
    });
    
    // Gestion du thème sombre/clair (bonus)
    function toggleTheme() {
        const body = document.body;
        const isDark = body.classList.contains('dark-theme');
        
        if (isDark) {
            body.classList.remove('dark-theme');
            localStorage.setItem('theme', 'light');
        } else {
            body.classList.add('dark-theme');
            localStorage.setItem('theme', 'dark');
        }
    }
    
    // Charger le thème sauvegardé
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'dark') {
        document.body.classList.add('dark-theme');
    }
    
    // Ajouter un bouton de changement de thème (si souhaité)
    const themeToggle = document.createElement('button');
    themeToggle.innerHTML = '🌙';
    themeToggle.className = 'theme-toggle';
    themeToggle.style.cssText = `
        position: fixed;
        bottom: 20px;
        right: 20px;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        border: none;
        background: rgba(255, 255, 255, 0.2);
        backdrop-filter: blur(10px);
        color: white;
        font-size: 1.5rem;
        cursor: pointer;
        transition: all 0.3s ease;
        z-index: 1000;
        display: flex;
        align-items: center;
        justify-content: center;
    `;
    
    themeToggle.addEventListener('click', toggleTheme);
    themeToggle.addEventListener('mouseenter', function() {
        this.style.transform = 'scale(1.1)';
        this.style.background = 'rgba(255, 255, 255, 0.3)';
    });
    
    themeToggle.addEventListener('mouseleave', function() {
        this.style.transform = 'scale(1)';
        this.style.background = 'rgba(255, 255, 255, 0.2)';
    });
    
    document.body.appendChild(themeToggle);
    
    // Animation de progression pour les formulaires longs
    function updateFormProgress() {
        const forms = document.querySelectorAll('form');
        forms.forEach(form => {
            const inputs = form.querySelectorAll('input[required], select[required]');
            const progressBar = document.createElement('div');
            progressBar.className = 'form-progress';
            
            progressBar.style.cssText = `
                position: absolute;
                top: 0;
                left: 0;
                height: 3px;
                background: linear-gradient(90deg, #4facfe, #00f2fe);
                border-radius: 2px;
                transition: width 0.3s ease;
                width: 0%;
            `;
            
            form.style.position = 'relative';
            form.insertBefore(progressBar, form.firstChild);
            
            function updateProgress() {
                let completed = 0;
                inputs.forEach(input => {
                    if (input.value.trim()) completed++;
                });
                
                const progress = (completed / inputs.length) * 100;
                progressBar.style.width = progress + '%';
            }
            
            inputs.forEach(input => {
                input.addEventListener('input', updateProgress);
            });
        });
    }
    
    updateFormProgress();
    
    // Effet de particules flottantes (optionnel - peut être désactivé pour de meilleures performances)
    function createFloatingParticles() {
        const particleCount = 20;
        const particles = [];
        
        for (let i = 0; i < particleCount; i++) {
            const particle = document.createElement('div');
            particle.className = 'floating-particle';
            particle.style.cssText = `
                position: fixed;
                width: ${Math.random() * 4 + 2}px;
                height: ${Math.random() * 4 + 2}px;
                background: rgba(255, 255, 255, ${Math.random() * 0.5 + 0.2});
                border-radius: 50%;
                pointer-events: none;
                z-index: -1;
                left: ${Math.random() * 100}vw;
                top: ${Math.random() * 100}vh;
                animation: float ${Math.random() * 10 + 10}s linear infinite;
            `;
            
            document.body.appendChild(particle);
            particles.push(particle);
        }
        
        // Animation des particules
        function animateParticles() {
            particles.forEach(particle => {
                const currentTop = parseFloat(particle.style.top);
                const currentLeft = parseFloat(particle.style.left);
                
                particle.style.top = (currentTop - 0.5) + 'vh';
                particle.style.left = (currentLeft + Math.sin(Date.now() * 0.001) * 0.5) + 'vw';
                
                // Recycler les particules qui sortent de l'écran
                if (currentTop < -10) {
                    particle.style.top = '110vh';
                    particle.style.left = Math.random() * 100 + 'vw';
                }
            });
            
            requestAnimationFrame(animateParticles);
        }
        
        animateParticles();
    }
    
    // Activer les particules seulement sur les appareils performants
    if (window.innerWidth > 768 && !window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
        createFloatingParticles();
    }
    
    // Gestion du retour haptique (pour les appareils qui le supportent)
    function addHapticFeedback() {
        const buttons = document.querySelectorAll('button, .btn');
        buttons.forEach(button => {
            button.addEventListener('click', () => {
                if (navigator.vibrate) {
                    navigator.vibrate(50); // Vibration courte
                }
            });
        });
    }
    
    addHapticFeedback();
    
    // Optimisation des performances - Lazy loading des animations
    const lazyAnimations = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const element = entry.target;
                element.classList.add('animate-in');
                lazyAnimations.unobserve(element);
            }
        });
    });
    
    // Observer tous les éléments qui nécessitent une animation
    document.querySelectorAll('.member-info, .admin-section, .architecture-info')
        .forEach(el => lazyAnimations.observe(el));
    
    // Fonction de nettoyage pour éviter les fuites mémoire
    window.addEventListener('beforeunload', () => {
        if (observer) observer.disconnect();
        if (lazyAnimations) lazyAnimations.disconnect();
    });
    
    console.log('🎨 Interface moderne du Club de Sport chargée avec succès!');
});

// Fonctions utilitaires globales
window.ClubSportUtils = {
    showToast: function(message, type = 'info') {
        // Réutilisation de la fonction toast définie plus haut
        const toast = document.createElement('div');
        toast.className = `toast toast-${type}`;
        toast.innerHTML = `
            <div class="toast-content">
                <span class="toast-icon">${type === 'error' ? '⚠️' : type === 'success' ? '✅' : 'ℹ️'}</span>
                <span class="toast-message">${message}</span>
            </div>
        `;
        
        toast.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            background: ${type === 'error' ? 'rgba(255, 107, 107, 0.9)' : 
                          type === 'success' ? 'rgba(76, 175, 80, 0.9)' : 
                          'rgba(33, 150, 243, 0.9)'};
            color: white;
            padding: 1rem 1.5rem;
            border-radius: 10px;
            backdrop-filter: blur(10px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            z-index: 1000;
            transform: translateX(100%);
            transition: transform 0.3s ease-out;
            max-width: 300px;
        `;
        
        document.body.appendChild(toast);
        
        setTimeout(() => {
            toast.style.transform = 'translateX(0)';
        }, 100);
        
        setTimeout(() => {
            toast.style.transform = 'translateX(100%)';
            setTimeout(() => {
                if (document.body.contains(toast)) {
                    document.body.removeChild(toast);
                }
            }, 300);
        }, 4000);
    }
};