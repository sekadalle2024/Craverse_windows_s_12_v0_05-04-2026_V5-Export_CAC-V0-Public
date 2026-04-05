# -*- coding: utf-8 -*-
"""
Export direct de la liasse sans passer par l'API
Pour tester si le problème vient du backend ou du code
"""
from export_liasse import remplir_liasse_officielle
import json
import os

print("=" * 80)
print("EXPORT DIRECT LIASSE - SANS API")
print("=" * 80)
print()

# Charger des données de test
test_data_file = 'test_data_export_liasse.json'
if not os.path.exists(test_data_file):
    print(f"ERREUR: Fichier {test_data_file} non trouvé")
    print("Exécuter d'abord: python diagnostic_export_liasse.py")
    exit(1)

print(f"1. Chargement des données de test: {test_data_file}")
with open(test_data_file, 'r', encoding='utf-8') as f:
    test_data = json.load(f)

print(f"   OK Données chargées")
print(f"   - Clés: {list(test_data.keys())}")
print()

# Générer la liasse
print("2. Génération de la liasse avec remplir_liasse_officielle()...")
try:
    file_content = remplir_liasse_officielle(
        results=test_data,
        nom_entreprise="TEST ENTREPRISE",
        exercice="2024"
    )
    print("   OK Liasse générée")
except Exception as e:
    print(f"   ERREUR: {e}")
    import traceback
    traceback.print_exc()
    exit(1)

print()

# Sauvegarder
output_file = 'liasse_export_direct.xlsx'
print(f"3. Sauvegarde du fichier: {output_file}")
with open(output_file, 'wb') as f:
    f.write(file_content)

file_size = os.path.getsize(output_file) / 1024
print(f"   OK Fichier sauvegardé ({file_size:.2f} KB)")
print()

print("=" * 80)
print("EXPORT TERMINÉ")
print("=" * 80)
print()
print("VÉRIFICATION:")
print(f"  1. Ouvrir le fichier: {output_file}")
print("  2. Vérifier l'onglet ACTIF")
print("  3. Vérifier l'onglet PASSIF")
print("  4. Vérifier l'onglet RESULTAT")
print("  5. Vérifier l'onglet 'Contrôle de cohérence'")
print()
print("Si le fichier contient des données:")
print("  → Le code fonctionne, le problème vient du backend/API")
print("  → Solution: Redémarrer le backend")
print()
print("Si le fichier est vide:")
print("  → Le problème vient des mappings de cellules")
print("  → Solution: Vérifier les mappings dans export_liasse.py")
print()
