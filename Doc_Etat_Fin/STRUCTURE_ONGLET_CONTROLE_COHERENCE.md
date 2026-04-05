# Structure de l'Onglet "Contrôle de Cohérence"

**Version**: 2.2  
**Date**: 05 Avril 2026

---

## 📊 Vue d'Ensemble

L'onglet "Contrôle de cohérence" est automatiquement créé en **première position** dans chaque export de la liasse officielle Excel.

---

## 🎨 Structure Visuelle

```
┌─────────────────────────────────────────────────────────────────────────┐
│                                                                          │
│  CONTRÔLE DE COHÉRENCE DES ÉTATS FINANCIERS                            │
│  16 États de Contrôle - SYSCOHADA Révisé                              │
│                                                                          │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  SECTION 1 : CONTRÔLES BILAN ACTIF                                     │
│  ┌────────────────────────────────────────────────────────────────┐    │
│  │ 1. Etat de contrôle Bilan Actif (Exercice N)                  │    │
│  │ ┌─────┬──────────────────────┬─────────────┬─────────────┐    │    │
│  │ │ REF │ LIBELLÉ              │ EXERCICE N  │ EXERCICE N-1│    │    │
│  │ ├─────┼──────────────────────┼─────────────┼─────────────┤    │    │
│  │ │ CA  │ Total Actif          │ 150 000 000 │      -      │    │    │
│  │ │ CB  │ Nombre de postes     │      25     │      -      │    │    │
│  │ └─────┴──────────────────────┴─────────────┴─────────────┘    │    │
│  │                                                                │    │
│  │ 2. Etat de contrôle Bilan Actif (Exercice N-1)                │    │
│  │ ┌─────┬──────────────────────┬─────────────┬─────────────┐    │    │
│  │ │ REF │ LIBELLÉ              │ EXERCICE N  │ EXERCICE N-1│    │    │
│  │ ├─────┼──────────────────────┼─────────────┼─────────────┤    │    │
│  │ │ CC  │ Total Actif          │      -      │ 140 000 000 │    │    │
│  │ │ CD  │ Nombre de postes     │      -      │      23     │    │    │
│  │ └─────┴──────────────────────┴─────────────┴─────────────┘    │    │
│  │                                                                │    │
│  │ 3. Variation Bilan Actif                                       │    │
│  │ ┌─────┬──────────────────────┬─────────────┬─────────────┐    │    │
│  │ │ REF │ LIBELLÉ              │ EXERCICE N  │ EXERCICE N-1│    │    │
│  │ ├─────┼──────────────────────┼─────────────┼─────────────┤    │    │
│  │ │ CD  │ Variation Total      │  10 000 000 │      -      │    │    │
│  │ └─────┴──────────────────────┴─────────────┴─────────────┘    │    │
│  └────────────────────────────────────────────────────────────────┘    │
│                                                                          │
│  SECTION 2 : CONTRÔLES BILAN PASSIF                                    │
│  ┌────────────────────────────────────────────────────────────────┐    │
│  │ 4. Etat de contrôle Bilan Passif (Exercice N)                 │    │
│  │ 5. Etat de contrôle Bilan Passif (Exercice N-1)               │    │
│  │ 6. Variation Bilan Passif                                      │    │
│  └────────────────────────────────────────────────────────────────┘    │
│                                                                          │
│  SECTION 3 : CONTRÔLES COMPTE DE RÉSULTAT                              │
│  ┌────────────────────────────────────────────────────────────────┐    │
│  │ 7. Etat de contrôle Compte de Résultat (Exercice N)           │    │
│  │ 8. Etat de contrôle Compte de Résultat (Exercice N-1)         │    │
│  │ 9. Variation Compte de Résultat                                │    │
│  └────────────────────────────────────────────────────────────────┘    │
│                                                                          │
│  SECTION 4 : CONTRÔLES TABLEAU DES FLUX DE TRÉSORERIE                  │
│  ┌────────────────────────────────────────────────────────────────┐    │
│  │ 10. Etat de contrôle TFT (Exercice N)                         │    │
│  │ 11. Etat de contrôle TFT (Exercice N-1)                       │    │
│  │ 12. Variation TFT                                              │    │
│  └────────────────────────────────────────────────────────────────┘    │
│                                                                          │
│  SECTION 5 : CONTRÔLES SENS DES COMPTES                                │
│  ┌────────────────────────────────────────────────────────────────┐    │
│  │ 13. Etat de contrôle Sens des Comptes (Exercice N)            │    │
│  │ 14. Etat de contrôle Sens des Comptes (Exercice N-1)          │    │
│  └────────────────────────────────────────────────────────────────┘    │
│                                                                          │
│  SECTION 6 : CONTRÔLES ÉQUILIBRE BILAN                                 │
│  ┌────────────────────────────────────────────────────────────────┐    │
│  │ 15. Etat d'équilibre Bilan (Exercice N)                       │    │
│  │ 16. Etat d'équilibre Bilan (Exercice N-1)                     │    │
│  └────────────────────────────────────────────────────────────────┘    │
│                                                                          │
│  Note : Les montants sont exprimés en FCFA.                            │
│         Un tiret (-) indique un montant nul ou non applicable.         │
│                                                                          │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 📐 Dimensions

| Élément | Largeur | Description |
|---------|---------|-------------|
| **Colonne A** | 8 caractères | REF (Référence du poste) |
| **Colonne B** | 50 caractères | LIBELLÉ (Description) |
| **Colonne C** | 18 caractères | EXERCICE N (Montants année N) |
| **Colonne D** | 18 caractères | EXERCICE N-1 (Montants année N-1) |

---

## 🎨 Styles

### Titre Principal
- **Couleur fond** : Bleu foncé (#1F4E78)
- **Couleur texte** : Blanc
- **Taille** : 14pt
- **Style** : Gras
- **Hauteur ligne** : 30px

### Sections
- **Couleur fond** : Bleu moyen (#4472C4)
- **Couleur texte** : Blanc
- **Taille** : 12pt
- **Style** : Gras
- **Hauteur ligne** : 25px

### Sous-sections (États)
- **Couleur fond** : Bleu clair (#D9E1F2)
- **Couleur texte** : Noir
- **Taille** : 11pt
- **Style** : Gras
- **Hauteur ligne** : 20px

### En-têtes de colonnes
- **Couleur fond** : Bleu (#5B9BD5)
- **Couleur texte** : Blanc
- **Taille** : 10pt
- **Style** : Gras
- **Alignement** : Centré
- **Hauteur ligne** : 18px

### Données
- **Taille** : 10pt
- **Police** : Arial
- **Alignement** : 
  - REF : Centré
  - LIBELLÉ : Gauche (indent 1)
  - MONTANTS : Droite

### Bordures
- **Type** : Fines (thin)
- **Couleur** : Noir
- **Application** : Toutes les cellules

---

## 📊 Organisation des Données

### Format des Montants

```
Montant > 0    : "150 000 000" (séparateurs d'espaces)
Montant = 0    : "-" (tiret)
Montant < 0.01 : "-" (tiret)
```

### Exemple de Ligne

```
┌─────┬──────────────────────────────┬─────────────┬─────────────┐
│ REF │ LIBELLÉ                      │ EXERCICE N  │ EXERCICE N-1│
├─────┼──────────────────────────────┼─────────────┼─────────────┤
│ CA  │ Total Actif                  │ 150 000 000 │ 140 000 000 │
│ CB  │ Nombre de postes             │      25     │      23     │
│ CC  │ Équilibre                    │       0     │       0     │
│ CD  │ Variation                    │  10 000 000 │      -      │
└─────┴──────────────────────────────┴─────────────┴─────────────┘
```

---

## 🔢 Statistiques

| Élément | Quantité |
|---------|----------|
| **Sections** | 6 |
| **États de contrôle** | 16 |
| **Colonnes** | 4 |
| **Lignes approximatives** | 150-200 |
| **Styles différents** | 5 |

---

## 🎯 Cohérence avec le Frontend

L'onglet Excel reproduit **exactement** la structure du menu accordéon frontend :

| Frontend | Excel |
|----------|-------|
| Accordéon Section 1 | SECTION 1 : CONTRÔLES BILAN ACTIF |
| État 1 (sous-accordéon) | 1. Etat de contrôle Bilan Actif (Exercice N) |
| Table avec colonnes | Tableau Excel avec 4 colonnes |
| Montants formatés | Mêmes montants, même formatage |

---

## 📝 Notes Techniques

### Création de l'Onglet

```python
# L'onglet est créé en première position
ws = wb.create_sheet("Contrôle de cohérence", 0)
```

### Application des Styles

```python
# Exemple de style pour le titre principal
style_titre_principal = Font(name='Arial', size=14, bold=True, color='FFFFFF')
fill_titre_principal = PatternFill(start_color='1F4E78', end_color='1F4E78', fill_type='solid')
```

### Fusion des Cellules

```python
# Titre principal sur 4 colonnes
ws.merge_cells(f'A{row}:D{row}')
```

---

## ✅ Avantages de cette Structure

1. **Lisibilité** : Organisation claire par sections
2. **Navigation** : Facile de trouver un état spécifique
3. **Impression** : Format adapté pour l'impression
4. **Cohérence** : Identique au menu accordéon frontend
5. **Professionnel** : Styles soignés et harmonieux
6. **Traçabilité** : Tous les contrôles dans un seul onglet

---

**Version** : 2.2  
**Date** : 05 Avril 2026  
**Statut** : ✅ Opérationnel
