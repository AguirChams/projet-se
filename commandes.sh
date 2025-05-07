# ========================================================
# Script de déploiement du projet SE (Docker + MariaDB + App)
# ========================================================

# === Étape 1 : Donner les droits d'exécution au script d'installation ===
chmod +x install_env.sh

# === Étape 2 : Exécuter le script d'installation des dépendances (Docker, Docker Compose...) ===
./install_env.sh

# === Étape 3 : Build et lancement des conteneurs avec Docker Compose ===
sudo docker-compose up --build -d

# === Étape 4 : Vérification des conteneurs en cours d'exécution ===
docker ps

# === Étape 5 : Tester si le service web répond localement ===
curl http://localhost
curl http://localhost:8080

# === Étape 6 (option 1 - recommandée) : Injection automatique du fichier SQL init.db dans MariaDB ===
# Copie du fichier dans le conteneur
docker cp db/init.db mariadb:/init.db

# Exécution du script SQL directement dans la base de données projetdb
docker exec -it mariadb bash -c "mariadb -u user -p'userpass' projetdb < /init.db"

# === Vérification optionnelle depuis le shell MariaDB (manuel) ===
docker exec -it mariadb bash
# Une fois dans le conteneur :
#   mariadb -u user -p
#   (mot de passe : userpass)
#   USE projetdb;
#   SHOW TABLES;
#   SELECT * FROM users;

# === Étape 6 (option 2 - alternative manuelle) ===
# Connexion interactive pour ceux qui veulent le faire à la main :
# docker exec -it mariadb bash
# Puis dans le conteneur :
#   mariadb -u user -p
#   (mot de passe : userpass)
#   USE projetdb;
#   CREATE TABLE users (
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     nom VARCHAR(100)
#   );
#   INSERT INTO users (nom)
#   VALUES ('CHAMS'), ('YAHYA'), ('YASSINE'), ('ABDELLAH'), ('ASMAE');
#   SELECT * FROM users;

# === Étape 7 : Monitorer les conteneurs en temps réel ===
docker stats
# Pour voir les processus internes de MariaDB :
docker top mariadb
