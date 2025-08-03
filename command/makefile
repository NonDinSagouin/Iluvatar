.PHONY: add-aliases backup-zshrc restore-zshrc clean help help-aliases

ZSHRC_FILE = $(HOME)/.zshrc
BACKUP_FILE = $(HOME)/.zshrc.backup
ALIASES_FILE = aliases.txt

# Ajouter les alias au .zshrc
add-aliases: backup-zshrc
	@echo "🔄 Ajout des alias dans $(ZSHRC_FILE)..."
	@echo "" >> $(ZSHRC_FILE)
	@echo "# ================================" >> $(ZSHRC_FILE)
	@echo "# Custom aliases added by Makefile" >> $(ZSHRC_FILE)
	@echo "# ================================" >> $(ZSHRC_FILE)
	@echo "" >> $(ZSHRC_FILE)
	@echo "# === Alias Système ===" >> $(ZSHRC_FILE)
	@echo "alias ll='ls -alF'" >> $(ZSHRC_FILE)
	@echo "alias la='ls -A'" >> $(ZSHRC_FILE)
	@echo "alias l='ls -CF'" >> $(ZSHRC_FILE)
	@echo "alias grep='grep --color=auto'" >> $(ZSHRC_FILE)
	@echo "alias fgrep='fgrep --color=auto'" >> $(ZSHRC_FILE)
	@echo "alias egrep='egrep --color=auto'" >> $(ZSHRC_FILE)
	@echo "alias ..='cd ..'" >> $(ZSHRC_FILE)
	@echo "alias ...='cd ../..'" >> $(ZSHRC_FILE)
	@echo "alias ....='cd ../../..'" >> $(ZSHRC_FILE)
	@echo "alias h='history'" >> $(ZSHRC_FILE)
	@echo "alias c='clear'" >> $(ZSHRC_FILE)
	@echo "alias zshconfig='code ~/.zshrc'" >> $(ZSHRC_FILE)
	@echo "alias reload='source ~/.zshrc'" >> $(ZSHRC_FILE)
	@echo "alias help='make -C ~/Ilúvatar/command help-aliases'" >> $(ZSHRC_FILE)
	@echo "" >> $(ZSHRC_FILE)
	@echo "# === Alias Docker ===" >> $(ZSHRC_FILE)
	@echo "alias d='docker'" >> $(ZSHRC_FILE)
	@echo "alias dc='docker-compose'" >> $(ZSHRC_FILE)
	@echo "alias dps='docker ps'" >> $(ZSHRC_FILE)
	@echo "alias dpsa='docker ps -a'" >> $(ZSHRC_FILE)
	@echo "alias di='docker images'" >> $(ZSHRC_FILE)
	@echo "alias dv='docker volume ls'" >> $(ZSHRC_FILE)
	@echo "alias dn='docker network ls'" >> $(ZSHRC_FILE)
	@echo "alias dstop='docker stop \$$(docker ps -q)'" >> $(ZSHRC_FILE)
	@echo "alias drm='docker rm \$$(docker ps -aq)'" >> $(ZSHRC_FILE)
	@echo "alias drmi='docker rmi \$$(docker images -q)'" >> $(ZSHRC_FILE)
	@echo "alias dclean='docker system prune -f'" >> $(ZSHRC_FILE)
	@echo "alias dcleanall='docker system prune -af --volumes'" >> $(ZSHRC_FILE)
	@echo "alias dlog='docker logs'" >> $(ZSHRC_FILE)
	@echo "alias dexec='docker exec -it'" >> $(ZSHRC_FILE)
	@echo "" >> $(ZSHRC_FILE)
	@echo "# === Alias Git ===" >> $(ZSHRC_FILE)
	@echo "alias g='git'" >> $(ZSHRC_FILE)
	@echo "alias gs='git status'" >> $(ZSHRC_FILE)
	@echo "alias ga='git add'" >> $(ZSHRC_FILE)
	@echo "alias gaa='git add .'" >> $(ZSHRC_FILE)
	@echo "alias gc='git commit'" >> $(ZSHRC_FILE)
	@echo "alias gcm='git commit -m'" >> $(ZSHRC_FILE)
	@echo "alias gp='git push'" >> $(ZSHRC_FILE)
	@echo "alias gl='git pull'" >> $(ZSHRC_FILE)
	@echo "alias glog='git log --oneline --graph --decorate'" >> $(ZSHRC_FILE)
	@echo "alias gb='git branch'" >> $(ZSHRC_FILE)
	@echo "alias gco='git checkout'" >> $(ZSHRC_FILE)
	@echo "alias gcb='git checkout -b'" >> $(ZSHRC_FILE)
	@echo "alias gd='git diff'" >> $(ZSHRC_FILE)
	@echo "alias gst='git stash'" >> $(ZSHRC_FILE)
	@echo "alias gstp='git stash pop'" >> $(ZSHRC_FILE)
	@echo "" >> $(ZSHRC_FILE)
	@echo "# === Alias Python ===" >> $(ZSHRC_FILE)
	@echo "alias py='python3'" >> $(ZSHRC_FILE)
	@echo "alias python='python3'" >> $(ZSHRC_FILE)
	@echo "alias pip='pip3'" >> $(ZSHRC_FILE)
	@echo "alias venv='python3 -m venv'" >> $(ZSHRC_FILE)
	@echo "alias activate='source venv/bin/activate'" >> $(ZSHRC_FILE)
	@echo "alias deactivate='deactivate'" >> $(ZSHRC_FILE)
	@echo "alias pipi='pip install'" >> $(ZSHRC_FILE)
	@echo "alias pipr='pip install -r requirements.txt'" >> $(ZSHRC_FILE)
	@echo "alias pipf='pip freeze > requirements.txt'" >> $(ZSHRC_FILE)
	@echo "alias piplist='pip list'" >> $(ZSHRC_FILE)
	@echo "alias pipshow='pip show'" >> $(ZSHRC_FILE)
	@echo "alias pytest='python -m pytest'" >> $(ZSHRC_FILE)
	@echo "alias serve='python -m http.server'" >> $(ZSHRC_FILE)
	@echo "" >> $(ZSHRC_FILE)
	@echo "🎉 Alias ajoutés avec succès!"
	@echo "⚠️ Exécutez 'source ~/.zshrc' ou redémarrez votre terminal pour activer les alias."

# Créer une sauvegarde du .zshrc
backup-zshrc:
	@if [ -f $(ZSHRC_FILE) ]; then \
		cp $(ZSHRC_FILE) $(BACKUP_FILE); \
		echo "✅ Sauvegarde créée: $(BACKUP_FILE)"; \
	else \
		touch $(ZSHRC_FILE); \
		echo "✅ Fichier .zshrc créé: $(ZSHRC_FILE)"; \
	fi

# Restaurer la sauvegarde
restore-zshrc:
	@if [ -f $(BACKUP_FILE) ]; then \
		cp $(BACKUP_FILE) $(ZSHRC_FILE); \
		echo "✅ Fichier .zshrc restauré depuis la sauvegarde"; \
	else \
		echo "❌ Aucune sauvegarde trouvée"; \
	fi

# Ajouter des alias personnalisés depuis un fichier
add-custom-aliases: backup-zshrc
	@if [ -f $(ALIASES_FILE) ]; then \
		echo "" >> $(ZSHRC_FILE); \
		echo "# Custom aliases from $(ALIASES_FILE)" >> $(ZSHRC_FILE); \
		cat $(ALIASES_FILE) >> $(ZSHRC_FILE); \
		echo "✅ Alias personnalisés ajoutés depuis $(ALIASES_FILE)"; \
	else \
		echo "❌ Fichier $(ALIASES_FILE) non trouvé"; \
		echo "Créez un fichier $(ALIASES_FILE) avec vos alias (format: alias nom='commande')"; \
	fi

# Nettoyer les sauvegardes
clean:
	@if [ -f $(BACKUP_FILE) ]; then \
		rm $(BACKUP_FILE); \
		echo "✅ Sauvegarde supprimée"; \
	fi

# Aide détaillée pour les alias
help-aliases:
	@echo "🎨 Guide des Alias - Projet Ilúvatar"
	@echo ""
	@echo "🛠️  === ALIAS SYSTÈME ==="
	@echo "  ll                       - ls -alF (listing détaillé avec types)"
	@echo "  la                       - ls -A (listing avec fichiers cachés)"
	@echo "  l                        - ls -CF (listing compact avec types)"
	@echo "  grep/fgrep/egrep         - Recherche avec couleurs"
	@echo "  ..                       - cd .. (remonter d'un niveau)"
	@echo "  ...                      - cd ../.. (remonter de 2 niveaux)"
	@echo "  ....                     - cd ../../.. (remonter de 3 niveaux)"
	@echo "  h                        - history (historique des commandes)"
	@echo "  c                        - clear (nettoyer l'écran)"
	@echo "  reload                   - source ~/.zshrc (recharger config)"
	@echo "  zshconfig                - code ~/.zshrc (éditer config zsh)"
	@echo "  help                     - Afficher l'aide des alias (help-aliases)"
	@echo ""
	@echo "🐳 === ALIAS DOCKER ==="
	@echo "  d                        - docker"
	@echo "  dc                       - docker-compose"
	@echo "  dps                      - docker ps (conteneurs actifs)"
	@echo "  dpsa                     - docker ps -a (tous les conteneurs)"
	@echo "  di                       - docker images (lister les images)"
	@echo "  dv                       - docker volume ls (lister les volumes)"
	@echo "  dn                       - docker network ls (lister les réseaux)"
	@echo "  dstop                    - Arrêter tous les conteneurs actifs"
	@echo "  drm                      - Supprimer tous les conteneurs"
	@echo "  drmi                     - Supprimer toutes les images"
	@echo "  dclean                   - docker system prune -f (nettoyage)"
	@echo "  dcleanall                - Nettoyage complet avec volumes"
	@echo "  dlog                     - docker logs (voir les logs)"
	@echo "  dexec                    - docker exec -it (exécuter dans conteneur)"
	@echo ""
	@echo "📝 === ALIAS GIT ==="
	@echo "  g                        - git"
	@echo "  gs                       - git status (état du repo)"
	@echo "  ga                       - git add (ajouter fichier)"
	@echo "  gaa                      - git add . (ajouter tous les fichiers)"
	@echo "  gc                       - git commit"
	@echo "  gcm                      - git commit -m (commit avec message)"
	@echo "  gp                       - git push (pousser vers remote)"
	@echo "  gl                       - git pull (tirer depuis remote)"
	@echo "  glog                     - git log graphique (historique visuel)"
	@echo "  gb                       - git branch (lister les branches)"
	@echo "  gco                      - git checkout (changer de branche)"
	@echo "  gcb                      - git checkout -b (créer nouvelle branche)"
	@echo "  gd                       - git diff (voir les différences)"
	@echo "  gst                      - git stash (mettre de côté)"
	@echo "  gstp                     - git stash pop (récupérer stash)"
	@echo ""
	@echo "🐍 === ALIAS PYTHON ==="
	@echo "  py                       - python3"
	@echo "  python                   - python3 (alias de compatibilité)"
	@echo "  pip                      - pip3 (gestionnaire de paquets)"
	@echo "  venv                     - python3 -m venv (créer env virtuel)"
	@echo "  activate                 - source venv/bin/activate"
	@echo "  deactivate               - Désactiver environnement virtuel"
	@echo "  pipi                     - pip install (installer paquet)"
	@echo "  pipr                     - pip install -r requirements.txt"
	@echo "  pipf                     - pip freeze > requirements.txt"
	@echo "  piplist                  - pip list (lister paquets installés)"
	@echo "  pipshow                  - pip show (info sur un paquet)"
	@echo "  pytest                   - python -m pytest (lancer tests)"
	@echo "  serve                    - python -m http.server (serveur HTTP)"
	@echo ""
	@echo "💡 EXEMPLES D'UTILISATION :"
	@echo "  dps                      # Voir conteneurs Docker actifs"
	@echo "  gcm 'Fix bug'            # Commit rapide avec message"
	@echo "  pipi requests            # Installer le paquet requests"
	@echo "  serve 8080               # Serveur HTTP sur port 8080"
	@echo "  gco main                 # Changer vers branche main"
	@echo "  dexec mycontainer bash   # Entrer dans un conteneur"

# Afficher l'aide
help:
	@echo "🎯 Makefile Command - Gestion des alias"
	@echo ""
	@echo "📋 Commandes disponibles:"
	@echo "  make add-aliases           - 📝 Ajouter des alias par défaut au .zshrc"
	@echo "  make add-custom-aliases    - 📁 Ajouter des alias depuis aliases.txt"
	@echo "  make backup-zshrc          - 💾 Créer une sauvegarde du .zshrc"
	@echo "  make restore-zshrc         - 🔄 Restaurer la sauvegarde du .zshrc"
	@echo "  make clean                 - 🧹 Supprimer les fichiers de sauvegarde"
	@echo "  make help-aliases          - 🎨 Aide détaillée sur tous les alias"
	@echo "  make help                  - 📋 Afficher cette aide"
	@echo ""
	@echo "🎨 Alias ajoutés par défaut:"
	@echo "  🛠️  Système  : ll, la, l, .., ..., h, c, reload, help"
	@echo "  🐳 Docker   : d, dc, dps, di, dclean, dexec, etc."
	@echo "  📝 Git      : g, gs, ga, gc, gp, gl, glog, etc."
	@echo "  🐍 Python   : py, pip, venv, activate, pytest, etc."
	@echo ""
	@echo "💡 Pour voir la description détaillée de tous les alias :"
	@echo "   make help-aliases  OU  help (après installation des alias)"