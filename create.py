import os

project_structure = [
    "src/main/java/com/monclub/domain/entities/Membre.java",
    "src/main/java/com/monclub/domain/repositories/MembreRepository.java",
    "src/main/java/com/monclub/domain/usecases/AuthenticateUserUseCase.java",
    "src/main/java/com/monclub/domain/usecases/RegisterUserUseCase.java",
    "src/main/java/com/monclub/domain/usecases/GetAllMembersUseCase.java",
    
    "src/main/java/com/monclub/application/services/AuthenticationService.java",
    "src/main/java/com/monclub/application/dto/LoginRequest.java",
    "src/main/java/com/monclub/application/dto/RegisterRequest.java",
    "src/main/java/com/monclub/application/dto/AuthenticationResult.java",
    
    "src/main/java/com/monclub/infrastructure/database/DatabaseConnection.java",
    "src/main/java/com/monclub/infrastructure/database/MySQLMembreRepository.java",
    "src/main/java/com/monclub/infrastructure/security/PasswordEncoder.java",
    "src/main/java/com/monclub/infrastructure/config/DatabaseConfig.java",
    
    "src/main/java/com/monclub/presentation/controllers/AuthController.java",
    "src/main/java/com/monclub/presentation/controllers/AdminController.java",
    "src/main/java/com/monclub/presentation/controllers/HomeController.java",
    "src/main/java/com/monclub/presentation/filters/SecurityFilter.java",
    "src/main/java/com/monclub/presentation/servlets/ConnexionServlet.java",
    "src/main/java/com/monclub/presentation/servlets/InscriptionServlet.java",
    "src/main/java/com/monclub/presentation/servlets/AdminServlet.java",
    "src/main/java/com/monclub/presentation/servlets/AccueilServlet.java",
    "src/main/java/com/monclub/presentation/servlets/DeconnexionServlet.java",
    
    "src/main/java/com/monclub/Main.java",
    
    "src/main/webapp/WEB-INF/web.xml",
    "src/main/webapp/WEB-INF/accueil.jsp",
    "src/main/webapp/WEB-INF/admin.jsp",
    "src/main/webapp/WEB-INF/connexionXinscription.jsp",
    
    "src/main/webapp/index.jsp",
    "src/main/webapp/style.css",
    "src/main/webapp/script.js",
    
    "resources/db.properties"
]

def create_structure(base_path="."):
    for path in project_structure:
        full_path = os.path.join(base_path, path)
        os.makedirs(os.path.dirname(full_path), exist_ok=True)
        with open(full_path, "w") as f:
            f.write(f"// {os.path.basename(full_path)}\n")

if __name__ == "__main__":
    create_structure()
    print("Structure de projet Java créée avec succès.")
