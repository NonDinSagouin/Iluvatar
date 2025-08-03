.PHONY: help install-oh-my-zsh setup-zsh install-plugins

ZSHRC_FILE = $(HOME)/.zshrc
BACKUP_FILE = $(HOME)/.zshrc.backup
OH_MY_ZSH_DIR = $(HOME)/.oh-my-zsh

# Installation complète de zsh avec oh-my-zsh
setup-zsh: install-oh-my-zsh install-plugins
	@echo "🎉 Configuration zsh terminée!"
	@echo "⚠️ Redémarrez votre terminal ou exécutez 'exec zsh' pour activer oh-my-zsh"

# Installer oh-my-zsh avec le thème bira
install-oh-my-zsh:
	@echo "🔄 Installation de oh-my-zsh..."
	@if [ ! -d $(OH_MY_ZSH_DIR) ]; then \
		echo "🔄 Téléchargement et installation de oh-my-zsh..."; \
		sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended; \
		echo "✅ oh-my-zsh installé avec succès!"; \
	else \
		echo "❌ oh-my-zsh est déjà installé"; \
	fi
	@echo "🔄 Configuration du thème bira..."
	@sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="bira"/' $(ZSHRC_FILE) || true

# Installer les plugins populaires pour oh-my-zsh
install-plugins:
	@echo "🔄 Installation des plugins zsh..."
	@if [ -d $(OH_MY_ZSH_DIR) ]; then \
		echo "🔄 Installation de zsh-autosuggestions..."; \
		git clone https://github.com/zsh-users/zsh-autosuggestions $${ZSH_CUSTOM:-$(OH_MY_ZSH_DIR)/custom}/plugins/zsh-autosuggestions 2>/dev/null || echo "zsh-autosuggestions déjà installé"; \
		echo "🔄 Installation de zsh-syntax-highlighting..."; \
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $${ZSH_CUSTOM:-$(OH_MY_ZSH_DIR)/custom}/plugins/zsh-syntax-highlighting 2>/dev/null || echo "zsh-syntax-highlighting déjà installé"; \
		echo "🔄 Configuration des plugins dans .zshrc..."; \
		sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker docker-compose npm node)/' $(ZSHRC_FILE) || true; \
		echo "✅ Plugins installés et configurés!"; \
	else \
		echo "❌ oh-my-zsh n'est pas installé. Exécutez 'make install-oh-my-zsh' d'abord"; \
	fi

# Désinstaller oh-my-zsh
uninstall-oh-my-zsh:
	@if [ -d $(OH_MY_ZSH_DIR) ]; then \
		echo "🗑️ Désinstallation de oh-my-zsh..."; \
		rm -rf $(OH_MY_ZSH_DIR); \
		echo "✅ oh-my-zsh désinstallé"; \
	else \
		echo "❌ oh-my-zsh n'est pas installé"; \
	fi

# Afficher l'aide
help:
	@echo "Commandes disponibles:"
	@echo "  make setup-zsh          	- 	Installation complète (oh-my-zsh)"
	@echo "  make install-oh-my-zsh  	- 	Installer oh-my-zsh avec le thème bira"
	@echo "  make install-plugins    	- 	Installer les plugins populaires"
	@echo "  make uninstall-oh-my-zsh	- 	Désinstaller oh-my-zsh"
	@echo "  make help               	- 	Afficher cette aide"