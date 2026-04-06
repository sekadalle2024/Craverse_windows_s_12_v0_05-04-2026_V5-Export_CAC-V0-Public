#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Test simple pour vérifier les corrections
"""

import pandas as pd
import sys
import os

print("="*80)
print("TEST SIMPLE - PROBLÈMES 1 ET 3")
print("="*80)

try:
    # Test 1: Vérifier que les imports fonctionnent
    print("\n1. Test des imports...")
    from export_liasse import remplir_liasse_officielle
    print("   ✅ export_liasse importé")
    
    from etats_financiers_v2 import process_balance_to_liasse_format
    print("   ✅ etats_financiers_v2 importé")
    
    import json
    with open('correspondances_syscohada.json', 'r', encoding='utf-8') as f:
        correspondances = json.load(f)
    print("   ✅ correspondances chargées")
    
    # Test 2: Charger les balances
    print("\n2. Chargement des balances...")
    balance_n = pd.read_excel("P000 -BALANCE DEMO N_N-1_N-2.xls", sheet_name="BALANCE N")
    balance_n1 = pd.read_excel("P000 -BALANCE DEMO N_N-1_N-2.xls", sheet_name="BALANCE N-1")
    balance_n2 = pd.read_excel("P000 -BALANCE DEMO N_N-1_N-2.xls", sheet_name="BALANCE N-2")
    print(f"   ✅ Balance N: {len(balance_n)} lignes")
    print(f"   ✅ Balance N-1: {len(balance_n1)} lignes")
    print(f"   ✅ Balance N-2: {len(balance_n2)} lignes")
    
    # Test 3: Générer les états financiers
    print("\n3. Génération des états financiers...")
    results = process_balance_to_liasse_format(
        balance_n, balance_n1, balance_n2, correspondances
    )
    print("   ✅ États générés")
    
    # Ajouter les balances aux résultats
    results['balance_n_df'] = balance_n
    results['balance_n1_df'] = balance_n1
    
    # Test 4: Vérifier le contenu
    print("\n4. Vérification du contenu...")
    print(f"   - Clés dans results: {list(results.keys())}")
    
    if 'bilan_actif' in results:
        bilan_actif = results['bilan_actif']
        print(f"   - Bilan actif: {len(bilan_actif)} postes")
        
        # Chercher un poste d'immobilisation
        if isinstance(bilan_actif, list) and len(bilan_actif) > 0:
            for poste in bilan_actif[:5]:
                ref = poste.get('ref', 'N/A')
                libelle = poste.get('libelle', 'N/A')
                montant_n = poste.get('montant_n', 0)
                print(f"      {ref}: {libelle[:30]:30s} = {montant_n:>15,.0f}")
    
    if 'tft' in results:
        tft = results['tft']
        if isinstance(tft, dict):
            print(f"   - TFT: {len(tft)} clés")
            for i, (cle, valeur) in enumerate(list(tft.items())[:3]):
                print(f"      {cle}: {valeur:,.0f}")
        else:
            print(f"   - TFT: type={type(tft)}")
    
    # Test 5: Exporter la liasse
    print("\n5. Export de la liasse...")
    file_content = remplir_liasse_officielle(
        results=results,
        nom_entreprise="TEST",
        exercice="2024"
    )
    
    # Sauvegarder
    output_file = "test_simple_export.xlsx"
    with open(output_file, "wb") as f:
        f.write(file_content)
    
    print(f"   ✅ Fichier exporté: {output_file}")
    print(f"   ✅ Taille: {len(file_content):,} bytes")
    
    print("\n" + "="*80)
    print("✅ TOUS LES TESTS ONT RÉUSSI!")
    print("="*80)
    print(f"\nFichier généré: py_backend/{output_file}")
    print("Vérifiez manuellement les colonnes dans l'onglet ACTIF et TFT")
    
except Exception as e:
    print(f"\n❌ ERREUR: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)
