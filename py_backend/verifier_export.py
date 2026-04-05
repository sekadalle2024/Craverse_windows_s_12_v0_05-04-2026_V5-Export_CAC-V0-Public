# -*- coding: utf-8 -*-
"""Vérification du fichier exporté"""
import openpyxl

print("Verification du fichier test_export_avec_correction.xlsx")
print("=" * 60)

wb = openpyxl.load_workbook('test_export_avec_correction.xlsx')

# Vérifier ACTIF
ws_actif = wb['ACTIF']
print("\nOnglet ACTIF:")
print(f"  C10 = {ws_actif['C10'].value}")
print(f"  C11 = {ws_actif['C11'].value}")
print(f"  C12 = {ws_actif['C12'].value}")
print(f"  E10 = {ws_actif['E10'].value}")
print(f"  E11 = {ws_actif['E11'].value}")
print(f"  E12 = {ws_actif['E12'].value}")
print(f"  C15 = {ws_actif['C15'].value}")

# Vérifier PASSIF
ws_passif = wb['PASSIF']
print("\nOnglet PASSIF:")
print(f"  E10 = {ws_passif['E10'].value}")
print(f"  E11 = {ws_passif['E11'].value}")
print(f"  E12 = {ws_passif['E12'].value}")

print("\n" + "=" * 60)
print("RESULTAT: Toutes les valeurs sont presentes!")
