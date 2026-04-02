# Documentation Menu Contextuel ClaraVerse

## Vue d'Ensemble

Ce dossier contient toute la documentation relative aux problèmes rencontrés, solutions appliquées, et bonnes pratiques pour la maintenance et l'évolution du menu contextuel ClaraVerse.

## Contexte

Le menu contextuel ClaraVerse est un composant JavaScript vanilla qui s'affiche au clic droit sur les tables HTML dans l'interface de chat. Il offre des fonctionnalités avancées d'édition, de calcul, d'analyse et d'export.

**Fichier principal**: `public/menu.js`  
**Version actuelle**: 9.3  
**Architecture**: Classe `ContextualMenuManager` avec pattern accordéon

## Historique des Modifications Majeures

### 2 Avril 2026 - Évaluation des Risques
- **Ajout**: 22 méthodes pour 6 types de matrices de criticité
- **Durée**: ~30 minutes
- **Problème**: Erreurs répétées avec l'outil `strReplace`
- **Solution**: Script PowerShell direct (`insert-risk-methods-v3.ps1`)

## Structure de la Documentation

1. **ARCHITECTURE.md** - Comprendre la structure du code
2. **PROBLEMES_RENCONTRES.md** - Problèmes documentés avec contexte
3. **SOLUTIONS_APPLIQUEES.md** - Solutions détaillées et reproductibles
4. **BONNES_PRATIQUES.md** - Recommandations pour le développement
5. **ERREURS_A_EVITER.md** - Pièges courants et comment les éviter
6. **GUIDE_MISE_A_JOUR.md** - Procédure pas à pas
7. **SCRIPTS_AUTOMATISATION.md** - Scripts PowerShell réutilisables

## Utilisation

### Pour Ajouter une Nouvelle Fonctionnalité

1. Lire l'architecture pour comprendre où insérer le code
2. Créer un fichier d'extension séparé (ex: `menu_nouvelle_feature.js`)
3. Utiliser les scripts d'automatisation pour l'insertion
4. Tester avec une page HTML dédiée
5. Documenter les changements

### Pour Résoudre un Problème

1. Consulter `PROBLEMES_RENCONTRES.md`
2. Vérifier si une solution existe dans `SOLUTIONS_APPLIQUEES.md`
3. Appliquer la solution ou créer un nouveau script
4. Documenter le nouveau problème/solution

## Principes Clés

- **Séparation des préoccupations**: Créer des fichiers d'extension séparés
- **Automatisation**: Utiliser des scripts PowerShell pour les insertions
- **Documentation**: Documenter chaque modification majeure
- **Tests**: Créer des pages HTML de test pour chaque fonctionnalité
- **Backup**: Toujours créer un backup avant modification

## Contribution

Lors de l'ajout de nouvelles fonctionnalités:

1. Suivre les bonnes pratiques documentées
2. Créer des scripts réutilisables
3. Documenter les problèmes rencontrés
4. Mettre à jour cette documentation

## Ressources

- Fichier principal: `public/menu.js`
- Fichiers d'extension: `public/menu_*_extension.js`
- Scripts: `Doc menu contextuel issues/Scripts/`
- Tests: `test-*.html`
