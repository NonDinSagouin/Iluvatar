.PHONY: install-all check-tools install-git install-curl install-vim install-python3 update-system help

# Installation de tous les outils
install-all: update-system install-git install-curl install-vim install-python3
	@echo "Installation de tous les outils terminée!"

# Vérifier les outils installés
check-tools:
	@echo "Vérification des outils installés..."
	@echo -n "Git: "
	@which git >/dev/null 2>&1 && echo "✓ Installé ($(shell git --version))" || echo "✗ Non installé"
	@echo -n "Curl: "
	@which curl >/dev/null 2>&1 && echo "✓ Installé ($(shell curl --version | head -n1))" || echo "✗ Non installé"
	@echo -n "Vim: "
	@which vim >/dev/null 2>&1 && echo "✓ Installé ($(shell vim --version | head -n1))" || echo "✗ Non installé"
	@echo -n "Python3: "
	@which python3 >/dev/null 2>&1 && echo "✓ Installé ($(shell python3 --version))" || echo "✗ Non installé"
	@echo -n "Pip3: "
	@which pip3 >/dev/null 2>&1 && echo "✓ Installé ($(shell pip3 --version))" || echo "✗ Non installé"

# Mettre à jour le système
update-system:
	@echo "Mise à jour du système..."
	@sudo apt update -y
	@sudo apt upgrade -y

# Installer Git
install-git:
	@echo "Vérification de Git..."
	@if ! which git >/dev/null 2>&1; then \
		echo "Installation de Git..."; \
		sudo apt install -y git; \
		echo "Git installé avec succès!"; \
	else \
		echo "Git est déjà installé: $(shell git --version)"; \
	fi

# Installer Curl
install-curl:
	@echo "Vérification de Curl..."
	@if ! which curl >/dev/null 2>&1; then \
		echo "Installation de Curl..."; \
		sudo apt install -y curl; \
		echo "Curl installé avec succès!"; \
	else \
		echo "Curl est déjà installé: $(shell curl --version | head -n1)"; \
	fi

# Installer Vim
install-vim:
	@echo "Vérification de Vim..."
	@if ! which vim >/dev/null 2>&1; then \
		echo "Installation de Vim..."; \
		sudo apt install -y vim; \
		echo "Vim installé avec succès!"; \
	else \
		echo "Vim est déjà installé: $(shell vim --version | head -n1)"; \
	fi

# Installer Python3 et pip3
install-python3:
	@echo "Vérification de Python3..."
	@if ! which python3 >/dev/null 2>&1; then \
		echo "Installation de Python3..."; \
		sudo apt install -y python3 python3-pip python3-dev python3-venv; \
		echo "Python3 installé avec succès!"; \
	else \
		echo "Python3 est déjà installé: $(shell python3 --version)"; \
	fi
	@if ! which pip3 >/dev/null 2>&1; then \
		echo "Installation de pip3..."; \
		sudo apt install -y python3-pip; \
		echo "pip3 installé avec succès!"; \
	else \
		echo "pip3 est déjà installé: $(shell pip3 --version)"; \
	fi

# Installer des outils de développement supplémentaires
install-dev-tools:
	@echo "Installation d'outils de développement supplémentaires..."
	@sudo apt install -y build-essential software-properties-common apt-transport-https ca-certificates gnupg lsb-release
	@echo "Outils de développement installés!"

# Configurer Git (optionnel)
configure-git:
	@echo "Configuration de Git..."
	@read -p "Nom d'utilisateur Git: " name && git config --global user.name "$$name"
	@read -p "Email Git: " email && git config --global user.email "$$email"
	@git config --global init.defaultBranch main
	@echo "Git configuré avec succès!"

# Nettoyer le système
clean-system:
	@echo "Nettoyage du système..."
	@sudo apt autoremove -y
	@sudo apt autoclean
	@echo "Nettoyage terminé!"

# Afficher l'aide
help:
	@echo "Commandes disponibles:"
	@echo "  make install-all       	- 	Installer tous les outils (git, curl, vim, python3)"
	@echo "  make check-tools       	- 	Vérifier quels outils sont installés"
	@echo "  make install-git       	- 	Installer Git uniquement"
	@echo "  make install-curl      	- 	Installer Curl uniquement"
	@echo "  make install-vim       	- 	Installer Vim uniquement"
	@echo "  make install-python3   	- 	Installer Python3 et pip3 uniquement"
	@echo "  make install-dev-tools 	- 	Installer des outils de développement"
	@echo "  make configure-git     	- 	Configurer Git (nom et email)"
	@echo "  make update-system     	- 	Mettre à jour le système"
	@echo "  make clean-system      	- 	Nettoyer le système"
	@echo "  make help              	- 	Afficher cette aide"