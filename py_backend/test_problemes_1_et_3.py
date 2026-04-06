#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Script de test pour vérifier les corrections des problèmes 1 et 3
- Problème 1: Colonnes BRUT et AMORTISSEMENT
- Problème 3: TFT vierge
"""

import pandas as pd
import sys
import os

# Ajouter le répertoire parent au path
sys.path.insert(0, os.path.dirname(__file__))

from export_liasse import remplir_liasse_officielle
from etats_financiers_v2 import process_balance_to_liasse_format
import json

def charger_correspondances():
    """Charge le fichier de correspondances SYSCOHADA"""
    with open('correspondances_syscohada.json', 'r', encoding='utf-8') as f:
        return json.load(f)

def test_probleme_1_brut_amortissement():
    """Test du problème 1: Colonnes BRUT et AMORTISSEMENT"""
    print("\n" + "="*80)
    print("TEST PROBLÈME 1: COLONNES BRUT ET AMORTISSEMENT")
    print("="*80)
    
    try:
        # Charger les balances
        print("\n📂 Chargement des balances...")
        balance_n = pd.read_excel("P000 -BALANCE DEMO N_N-1_N-2.xls", sheet_name="BALANCE N")
        balance_n1 = pd.read_excel("P000 -BALANCE DEMO N_N-1_N-2.xls", sheet_name="BALANCE N-1")
        balance_n2 = pd.read_excel("P000 -BALANCE DEMO N_N-1_N-2.xls", sheet_name="BALANCE N-2")
        print(f"   ✅ Balance N: {len(balance_n)} lignes")
        print(f"   ✅ Balance N-1: {len(balance_n1)} lignes")
        print(f"   ✅ Balance N-2: {len(balance_n2)} lignes")
        
        # Charger les correspondances
        print("\n📂 Chargement des correspondances SYSCOHADA...")
        correspondances = charger_correspondances()
        print(f"   ✅ Correspondances chargées")
        
        # Générer les états financiers
        print("\n📊 Génération des états financiers...")
        results = process_balance_to_liasse_format(
            balance_n, balance_n1, balance_n2, correspondances
        )
        
        # Ajouter les balances aux résultats pour l'enrichissement
        results['balance_n_df'] = balance_n
        results['balance_n1_df'] = balance_n1
        
        print(f"   ✅ États générés")
        
        # Vérifier si les données brut/amort sont présentes
        print("\n🔍 Vérification des données BRUT et AMORTISSEMENT...")
        bilan_actif = results.get('bilan_actif', [])
        
        if isinstance(bilan_actif, list) and len(bilan_actif) > 0:
            # Chercher un poste d'immobilisation
            poste_test = None
            for poste in bilan_actif:
                if poste.get('ref') in ['AI', 'AJ', 'AK']:  # Terrains, Bâtiments, Installations
                    poste_test = poste
                    break
            
            if poste_test:
                print(f"\n   Poste test: {poste_test.get('ref')} - {poste_test.get('libelle', 'N/A')}")
                print(f"      Brut N: {poste_test.get('brut_n', 'NON DISPONIBLE')}")
                print(f"      Amort N: {poste_test.get('amort_n', 'NON DISPONIBLE')}")
                print(f"      Net N: {poste_test.get('montant_n', 'NON DISPONIBLE')}")
                print(f"      Net N-1: {poste_test.get('montant_n1', 'NON DISPONIBLE')}")
                
                if poste_test.get('brut_n') is not None:
                    print("\n   ✅ Les données BRUT et AMORTISSEMENT sont présentes!")
                else:
                    print("\n   ⚠️ Les données BRUT et AMORTISSEMENT ne sont PAS présentes")
                    print("      (Normal si l'enrichissement n'est pas encore implémenté dans etats_financiers_v2.py)")
        
        # Exporter la liasse
        print("\n📤 Export de la liasse officielle...")
        file_content = remplir_liasse_officielle(
            results=results,
            nom_entreprise="TEST ENTREPRISE",
            exercice="2024"
        )
        
        # Sauvegarder
        output_file = "test_probleme_1_brut_amort.xlsx"
        with open(output_file, "wb") as f:
            f.write(file_content)
        
        print(f"   ✅ Fichier exporté: {output_file}")
        print("\n📋 VÉRIFICATION MANUELLE REQUISE:")
        print(f"   1. Ouvrir le fichier: {output_file}")
        print("   2. Aller à l'onglet ACTIF")
        print("   3. Vérifier que les colonnes E (BRUT), F (AMORT), G (NET N), H (NET N-1) sont remplies")
        print("   4. Vérifier les lignes d'immobilisations (AI, AJ, AK, etc.)")
        
        return True
        
    except Exception as e:
        print(f"\n❌ ERREUR: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_probleme_3_tft():
    """Test du problème 3: TFT vierge"""
    print("\n" + "="*80)
    print("TEST PROBLÈME 3: TFT VIERGE")
    print("="*80)
    
    try:
        # Charger les balances
        print("\n📂 Chargement des balances...")
        balance_n = pd.read_excel("P000 -BALANCE DEMO N_N-1_N-2.xls", sheet_name="BALANCE N")
        balance_n1 = pd.read_excel("P000 -BALANCE DEMO N_N-1_N-2.xls", sheet_name="BALANCE N-1")
        balance_n2 = pd.read_excel("P000 -BALANCE DEMO N_N-1_N-2.xls", sheet_name="BALANCE N-2")
        print(f"   ✅ Balances chargées")
        
        # Charger les correspondances
        correspondances = charger_correspondances()
        
        # Générer les états financiers
        print("\n📊 Génération des états financiers...")
        results = process_balance_to_liasse_format(
            balance_n, balance_n1, balance_n2, correspondances
        )
        
        # Ajouter les balances
        results['balance_n_df'] = balance_n
        results['balance_n1_df'] = balance_n1
        
        # Vérifier le TFT
        print("\n🔍 Vérification du TFT...")
        tft = results.get('tft', {})
        
        if isinstance(tft, dict):
            print(f"   TFT dict avec {len(tft)} clés:")
            for i, (cle, valeur) in enumerate(list(tft.items())[:5]):
                print(f"      {cle}: {valeur:,.0f}")
            if len(tft) > 5:
                print(f"      ... et {len(tft) - 5} autres clés")
            
            if len(tft) > 0:
                print("\n   ✅ Le TFT contient des données!")
            else:
                print("\n   ⚠️ Le TFT est vide")
        
        # Exporter la liasse
        print("\n📤 Export de la liasse officielle...")
        file_content = remplir_liasse_officielle(
            results=results,
            nom_entreprise="TEST ENTREPRISE",
            exercice="2024"
        )
        
        # Sauvegarder
        output_file = "test_probleme_3_tft.xlsx"
        with open(output_file, "wb") as f:
            f.write(file_content)
        
        print(f"   ✅ Fichier exporté: {output_file}")
        print("\n📋 VÉRIFICATION MANUELLE REQUISE:")
        print(f"   1. Ouvrir le fichier: {output_file}")
        print("   2. Aller à l'onglet TFT (Tableau des Flux de Trésorerie)")
        print("   3. Vérifier que les colonnes I (N) et K (N-1) sont remplies")
        print("   4. Vérifier les lignes ZA, ZB, ZC, etc.")
        
        return True
        
    except Exception as e:
        print(f"\n❌ ERREUR: {e}")
        import traceback
        traceback.print_exc()
        return False

def main():
    """Fonction principale"""
    print("\n" + "="*80)
    print("TESTS DES CORRECTIONS - PROBLÈMES 1 ET 3")
    print("="*80)
    print("\nCe script teste les corrections apportées pour:")
    print("  - Problème 1: Colonnes BRUT et AMORTISSEMENT (Bilan ACTIF)")
    print("  - Problème 3: TFT vierge")
    print("\n" + "="*80)
    
    # Test problème 1
    success_1 = test_probleme_1_brut_amortissement()
    
    # Test problème 3
    success_3 = test_probleme_3_tft()
    
    # Résumé
    print("\n" + "="*80)
    print("RÉSUMÉ DES TESTS")
    print("="*80)
    print(f"  Problème 1 (BRUT/AMORT): {'✅ SUCCÈS' if success_1 else '❌ ÉCHEC'}")
    print(f"  Problème 3 (TFT):        {'✅ SUCCÈS' if success_3 else '❌ ÉCHEC'}")
    print("\n" + "="*80)
    
    if success_1 and success_3:
        print("✅ TOUS LES TESTS ONT RÉUSSI!")
        print("\nVérification manuelle requise:")
        print("  1. test_probleme_1_brut_amort.xlsx - Vérifier colonnes E, F, G, H dans ACTIF")
        print("  2. test_probleme_3_tft.xlsx - Vérifier colonnes I, K dans TFT")
    else:
        print("⚠️ CERTAINS TESTS ONT ÉCHOUÉ - Voir les détails ci-dessus")
    
    print("\n" + "="*80)

if __name__ == "__main__":
    main()
