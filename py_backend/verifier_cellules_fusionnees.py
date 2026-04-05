# -*- coding: utf-8 -*-
"""Vérification des cellules fusionnées"""
import openpyxl
from openpyxl.cell.cell import MergedCell

print("Analyse des cellules fusionnees")
print("=" * 80)

wb = openpyxl.load_workbook('test_export_avec_correction.xlsx')
ws_actif = wb['ACTIF']

print("\nOnglet ACTIF - Analyse des cellules:")
print("-" * 80)

cellules_test = ['C10', 'C11', 'C12', 'E10', 'E11', 'E12', 'C15']

for cell_addr in cellules_test:
    cell = ws_actif[cell_addr]
    
    if isinstance(cell, MergedCell):
        print(f"\n{cell_addr}: CELLULE FUSIONNEE")
        
        # Trouver la plage de fusion
        for merged_range in ws_actif.merged_cells.ranges:
            if cell_addr in merged_range:
                print(f"  Range: {merged_range}")
                top_left = merged_range.start_cell
                print(f"  Cellule principale: {top_left.coordinate}")
                print(f"  Valeur dans principale: {top_left.value}")
                break
    else:
        print(f"\n{cell_addr}: CELLULE NORMALE")
        print(f"  Valeur: {cell.value}")

print("\n" + "=" * 80)
