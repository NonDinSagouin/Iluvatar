.PHONY: help setup-all setup-console setup-docker setup-tools setup-command clean-all

# Installation complète de l'environnement
setup-all: setup-tools setup-docker setup-console setup-command
	@echo "🎉 Installation complète terminée!"
	@echo "Redémarrez votre terminal pour activer toutes les configurations"

# Configuration du terminal
setup-console:
	@echo "📱 Configuration du terminal..."
	@$(MAKE) -C console setup-zsh

# Installation Docker
setup-docker:
	@echo "🐳 Installation Docker..."
	@$(MAKE) -C docker setup-docker

# Installation des outils de base
setup-tools:
	@echo "🛠️  Installation des outils..."
	@$(MAKE) -C tools install-all

# Configuration des alias
setup-command:
	@echo "💻 Configuration des alias..."
	@$(MAKE) -C command add-aliases

# Vérification de l'état de tous les composants
status:
	@echo "=== 🛠️  Outils ==="
	@$(MAKE) -C tools check-tools
	@echo ""
	@echo "=== 🐳 Docker ==="
	@$(MAKE) -C docker status
	@echo ""
	@echo "=== 📱 Console ==="
	@test -d ~/.oh-my-zsh && echo "✓ oh-my-zsh installé" || echo "✗ oh-my-zsh non installé"
	@echo ""
	@echo "=== 💻 Alias ==="
	@if grep -q "Custom aliases added by Makefile" ~/.zshrc 2>/dev/null; then \
		echo "✓ Alias personnalisés configurés"; \
	else \
		echo "✗ Alias personnalisés non configurés"; \
	fi

# Nettoyage général
clean-all:
	@echo "🧹 Nettoyage général..."
	@$(MAKE) -C docker clean-docker 2>/dev/null || true
	@$(MAKE) -C tools clean-system 2>/dev/null || true
	@$(MAKE) -C console clean 2>/dev/null || true
	@$(MAKE) -C command clean 2>/dev/null || true

# Aide générale
help:
	@echo "🎯 Makefile principal - Gestion de l'environnement de développement"
	@echo ""
	@echo "Commandes principales:"
	@echo "  make setup-all	  		- 🚀 Installation complète (outils + docker + console + alias)"
	@echo "  make setup-tools		- 🛠️  Installer les outils de base"
	@echo "  make setup-docker   	- 🐳 Installer Docker"
	@echo "  make setup-console  	- 📱 Configurer le terminal (zsh + oh-my-zsh)"
	@echo "  make setup-command  	- 💻 Configurer les alias personnalisés"
	@echo "  make status		 	- 📊 Vérifier l'état de tous les composants"
	@echo "  make clean-all	  		- 🧹 Nettoyage général"
	@echo ""
	@echo "Makefiles spécialisés:"
	@echo "  make -C tools help	  - Aide pour les outils"
	@echo "  make -C docker help	 - Aide pour Docker"
	@echo "  make -C console help	- Aide pour la console"
	@echo "  make -C command help	- Aide pour les alias"