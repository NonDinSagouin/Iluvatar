.PHONY: install-docker install-docker-compose setup-docker start-docker stop-docker status help uninstall-docker

# Installation complète de Docker
setup-docker: install-docker install-docker-compose
	@echo "Installation Docker terminée!"
	@echo "Docker et Docker Compose sont maintenant installés"

# Installer Docker
install-docker:
	@echo "Installation de Docker..."
	@echo "Mise à jour des paquets..."
	@sudo apt-get update -y
	@echo "Installation des dépendances..."
	@sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
	@echo "Ajout de la clé GPG officielle de Docker..."
	@curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	@echo "Ajout du dépôt Docker..."
	@echo "deb [arch=$$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	@echo "Mise à jour des paquets avec le nouveau dépôt..."
	@sudo apt-get update -y
	@echo "Installation de Docker Engine..."
	@sudo apt-get install -y docker-ce docker-ce-cli containerd.io
	@echo "Ajout de l'utilisateur au groupe docker..."
	@sudo usermod -aG docker $$USER
	@echo "Activation et démarrage du service Docker..."
	@sudo systemctl enable docker
	@sudo systemctl start docker
	@echo "✓ Docker installé avec succès!"
	@echo "Redémarrez votre session ou exécutez 'newgrp docker' pour utiliser Docker sans sudo"

# Installer Docker Compose
install-docker-compose:
	@echo "Installation de Docker Compose..."
	@DOCKER_COMPOSE_VERSION=$$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*?(?=")'); \
	echo "Installation de Docker Compose version $$DOCKER_COMPOSE_VERSION..."; \
	sudo curl -L "https://github.com/docker/compose/releases/download/$$DOCKER_COMPOSE_VERSION/docker-compose-$$(uname -s)-$$(uname -m)" -o /usr/local/bin/docker-compose
	@sudo chmod +x /usr/local/bin/docker-compose
	@echo "✓ Docker Compose installé avec succès!"

# Démarrer Docker
start-docker:
	@echo "Démarrage du service Docker..."
	@sudo systemctl start docker
	@echo "✓ Docker démarré"

# Arrêter Docker
stop-docker:
	@echo "Arrêt du service Docker..."
	@sudo systemctl stop docker
	@echo "✓ Docker arrêté"

# Vérifier le statut de Docker
status:
	@echo "=== Statut du service Docker ==="
	@sudo systemctl status docker --no-pager -l
	@echo ""
	@echo "=== Version Docker ==="
	@docker --version 2>/dev/null || echo "Docker non accessible (redémarrez votre session)"
	@echo ""
	@echo "=== Version Docker Compose ==="
	@docker-compose --version 2>/dev/null || echo "Docker Compose non installé"
	@echo ""
	@echo "=== Test Docker ==="
	@docker run --rm hello-world 2>/dev/null || echo "Impossible d'exécuter des conteneurs (redémarrez votre session)"

# Désinstaller Docker
uninstall-docker:
	@echo "Désinstallation de Docker..."
	@sudo systemctl stop docker 2>/dev/null || true
	@sudo systemctl disable docker 2>/dev/null || true
	@sudo apt-get purge -y docker-ce docker-ce-cli containerd.io
	@sudo rm -rf /var/lib/docker
	@sudo rm -rf /var/lib/containerd
	@sudo rm -f /usr/local/bin/docker-compose
	@sudo rm -f /etc/apt/sources.list.d/docker.list
	@sudo rm -f /usr/share/keyrings/docker-archive-keyring.gpg
	@echo "✓ Docker désinstallé"

# Nettoyer Docker (supprimer les conteneurs, images, volumes non utilisés)
clean-docker:
	@echo "Nettoyage Docker..."
	@docker system prune -af --volumes 2>/dev/null || echo "Docker non accessible"
	@echo "✓ Nettoyage terminé"

# Afficher l'aide
help:
	@echo "Commandes disponibles:"
	@echo "  make setup-docker       		- 	Installation complète (Docker + Docker Compose)"
	@echo "  make install-docker     		- 	Installer Docker uniquement"
	@echo "  make install-docker-compose		- 	Installer Docker Compose uniquement"
	@echo "  make start-docker       		- 	Démarrer le service Docker"
	@echo "  make stop-docker        		- 	Arrêter le service Docker"
	@echo "  make status             		- 	Vérifier le statut et les versions"
	@echo "  make clean-docker       		- 	Nettoyer Docker (supprimer conteneurs/images inutilisés)"
	@echo "  make uninstall-docker   		- 	Désinstaller Docker complètement"
	@echo "  make help               		- 	Afficher cette aide"
	@echo ""
	@echo "Usage recommandé:"
	@echo "  1. make setup-docker    # Installation complète"
	@echo "  2. Redémarrer votre session ou exécuter 'newgrp docker'"
	@echo "  3. make status          # Vérifier l'installation"