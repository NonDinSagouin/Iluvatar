# 🎯 Projet Finwë

**Finwë** est un système d'automatisation pour la configuration d'environnements de développement Linux. Il utilise des Makefiles modulaires pour installer et configurer automatiquement les outils essentiels, Docker et l'environnement terminal.

---

## 📊 Version

| Version | Date | Description |
|---------|------|-------------|
| **v1.0.0** | 2025-08-02 | Version initiale avec installation de base |
| **v1.1.0** | À venir | Ajout de configurations avancées |

### 🏷️ Version Actuelle : `v1.0.0`

**Fonctionnalités incluses :**
- ✅ Installation automatique des outils de base
- ✅ Configuration Docker complète
- ✅ Setup terminal avec oh-my-zsh et thème bira
- ✅ Gestion modulaire par Makefiles
- ✅ Documentation des icônes

---

## 📁 Structure du Projet

```
Finwë/
├── 📄 README.md              # Documentation principale
├── 📄 ICONS.md               # Guide des icônes utilisées
├── 📄 makefile               # Makefile principal d'orchestration
│
├── 🛠️  tools/               # Outils de développement
│   └── makefile              # Installation git, curl, vim, python3
│
├── 🐳 docker/               # Configuration Docker
│   └── makefile              # Installation Docker et Docker Compose
│
├── 📱 console/              # Configuration du terminal
│   └── makefile              # Setup zsh, oh-my-zsh, thème bira
│
└── 💻 command/              # Gestion des alias
    └── makefile              # Création d'alias personnalisés
```

---

## 📋 Description des Dossiers

### 🎯 **Racine du Projet**

| Fichier | Description |
|---------|-------------|
| `makefile` | **Orchestrateur principal** - Coordonne tous les autres Makefiles |
| `README.md` | Documentation complète du projet |
| `ICONS.md` | Guide de référence des icônes utilisées |

### 🛠️ **tools/** - Outils de Développement

**Objectif :** Installation des outils essentiels pour le développement

**Fonctionnalités :**
- ✅ Installation de Git (contrôle de version)
- ✅ Installation de Curl (transfert de données)
- ✅ Installation de Vim (éditeur de texte)
- ✅ Installation de Python3 + pip3
- 🔧 Configuration automatique de Git
- 📦 Installation d'outils de développement supplémentaires

**Commandes principales :**
```bash
make -C tools install-all    # Installation complète
make -C tools check-tools    # Vérification des outils
make -C tools configure-git  # Configuration Git
```

### 🐳 **docker/** - Containerisation

**Objectif :** Installation et configuration complète de Docker

**Fonctionnalités :**
- 🐳 Installation de Docker Engine
- 📦 Installation de Docker Compose
- 🚀 Configuration et démarrage automatique des services
- 👥 Ajout de l'utilisateur au groupe docker
- 🧹 Outils de nettoyage et maintenance

**Commandes principales :**
```bash
make -C docker setup-docker    # Installation complète
make -C docker start-docker    # Démarrer Docker
make -C docker clean-docker    # Nettoyage
```

### 📱 **console/** - Terminal et Shell

**Objectif :** Configuration avancée du terminal avec zsh et oh-my-zsh

**Fonctionnalités :**
- 📱 Installation de oh-my-zsh
- 🎨 Configuration du thème "bira"
- 🔌 Installation de plugins utiles (autosuggestions, syntax-highlighting)
- 💾 Système de sauvegarde des configurations
- 🔧 Configuration automatique du .zshrc

**Commandes principales :**
```bash
make -C console setup-zsh       # Configuration complète
make -C console install-plugins # Installation des plugins
make -C console backup-zshrc    # Sauvegarde
```

### 💻 **command/** - Gestion des Alias

**Objectif :** Création et gestion d'alias personnalisés

**Fonctionnalités :**
- 📝 Création d'alias personnalisés pour le shell
- 📁 Import d'alias depuis fichier externe
- 💾 Sauvegarde et restauration des configurations
- 🔧 Ajout automatique d'alias utiles

**Commandes principales :**
```bash
make -C command add-aliases        # Ajouter des alias par défaut
make -C command add-custom-aliases # Ajouter des alias depuis aliases.txt
make -C command backup-zshrc       # Sauvegarder .zshrc
make -C command restore-zshrc      # Restaurer .zshrc
```

---

## 🚀 Installation Rapide
```bash
# Installation complète (recommandé)
make setup-all

# Redémarrer le terminal
exec zsh
```

---

## 📊 Commandes Principales

| Commande | Description |
|----------|-------------|
| `make help` | 📋 Afficher l'aide générale |
| `make setup-all` | 🚀 Installation complète de l'environnement |
| `make setup-tools` | 🛠️ Installer les outils de base |
| `make setup-docker` | 🐳 Installer et configurer Docker |
| `make setup-console` | 📱 Configurer le terminal (zsh + oh-my-zsh) |
| `make status` | 📊 Vérifier l'état de tous les composants |
| `make clean-all` | 🧹 Nettoyage général du système |

---

## ✅ Prérequis

- **OS :** Ubuntu/Debian Linux
- **Shell :** zsh (sera installé automatiquement)
- **Droits :** Accès sudo pour l'installation des paquets
- **Réseau :** Connexion internet pour télécharger les composants
