#!/bin/bash

echo "=== MISE À JOUR DU SYSTÈME ==="
sudo apt update && sudo apt upgrade -y

echo "=== INSTALLATION D'OUTILS DE BASE ==="
sudo apt install -y curl wget unzip htop git net-tools

echo "=== INSTALLATION D'OPENSSH SERVER ==="
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

echo "=== INSTALLATION DE DOCKER ==="
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

echo "=== INSTALLATION DE DOCKER COMPOSE ==="
sudo apt install -y docker-compose

echo "=== CRÉATION DE L'UTILISATEUR dockeruser ==="
if id "dockeruser" &>/dev/null; then
    echo "Utilisateur dockeruser existe déjà"
else
    sudo useradd -m -s /bin/bash dockeruser
    echo "dockeruser:dockeruser" | sudo chpasswd
    sudo usermod -aG docker dockeruser
    echo "Utilisateur dockeruser créé avec mot de passe dockeruser"
fi

echo "=== VÉRIFICATIONS ==="
docker --version
docker-compose --version
id dockeruser

echo "=== INSTALLATION TERMINÉE ==="
