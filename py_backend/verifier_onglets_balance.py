#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Vérifier les noms des onglets dans le fichier de balance
"""

import pandas as pd

print("="*80)
print("VÉRIFICATION DES ONGLETS - BALANCE DEMO")
print("="*80)

try:
    # Lire le fichier Excel
    fichier = "P000 -BALANCE DEMO N_N-1_N-2.xls"
    print(f"\nFichier: {fichier}")
    
    # Obtenir les noms des onglets
    xl_file = pd.ExcelFile(fichier)
    onglets = xl_file.sheet_names
    
    print(f"\nNombre d'onglets: {len(onglets)}")
    print("\nListe des onglets:")
    for i, onglet in enumerate(onglets, 1):
        print(f"   {i}. '{onglet}'")
    
    # Lire le premier onglet pour voir sa structure
    if len(onglets) > 0:
        print(f"\n📊 Structure du premier onglet ('{onglets[0]}'):")
        df = pd.read_excel(fichier, sheet_name=onglets[0])
        print(f"   - Dimensions: {df.shape[0]} lignes x {df.shape[1]} colonnes")
        print(f"   - Colonnes: {list(df.columns)}")
        print(f"\n   Premières lignes:")
        print(df.head(3))
    
    print("\n" + "="*80)
    print("✅ VÉRIFICATION TERMINÉE")
    print("="*80)
    
except Exception as e:
    print(f"\n❌ ERREUR: {e}")
    import traceback
    traceback.print_exc()
