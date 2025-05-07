
#les commandes a entrer

 docker-compose up -d
 docker ps
 docker exec -it mariadb bash

 # creation bd
  mariadb -u user -p 
  userpass
  USE projetdb
  CREATE TABLE users ( 
id INT AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(100)
);
INSERT INTO users (nom)
 VALUES ('CHAMS'), ('YAHYA'), ('YASSINE'), ('ABDELLAH
'), ('ASMAE');

# monitoring des containers
 docker stats
 docker top mariadb