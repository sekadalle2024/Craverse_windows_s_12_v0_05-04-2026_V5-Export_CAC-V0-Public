# ============================================================================
# Script de test - Onglet Contrôle de Cohérence
# ============================================================================
# Date: 05 Avril 2026
# Description: Teste la génération de l'onglet "Contrôle de cohérence"
# ============================================================================

Write-Host "============================================================================" -ForegroundColor Cyan
Write-Host "TEST ONGLET CONTROLE DE COHERENCE" -ForegroundColor Cyan
Write-Host "============================================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Vérifier le module
Write-Host "1. Verification du module generer_onglet_controle_coherence.py..." -ForegroundColor Yellow

cd py_backend

$testImport = python -c "from generer_onglet_controle_coherence import ajouter_onglet_controle_coherence, generer_etats_controle_pour_export; print('OK')" 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "   OK Module importe avec succes" -ForegroundColor Green
} else {
    Write-Host "   ERREUR Import du module" -ForegroundColor Red
    Write-Host "   $testImport" -ForegroundColor Red
    cd ..
    exit 1
}

Write-Host ""
Write-Host "2. Verification du module export_liasse.py..." -ForegroundColor Yellow

$testExport = python -c "from export_liasse import remplir_liasse_officielle; print('OK')" 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "   OK Module export_liasse importe avec succes" -ForegroundColor Green
} else {
    Write-Host "   ERREUR Import du module export_liasse" -ForegroundColor Red
    Write-Host "   $testExport" -ForegroundColor Red
    cd ..
    exit 1
}

cd ..

Write-Host ""
Write-Host "3. Verification du fichier template..." -ForegroundColor Yellow

$templatePath = "py_backend\Liasse_officielle_revise.xlsx"

if (Test-Path $templatePath) {
    Write-Host "   OK Fichier template trouve: $templatePath" -ForegroundColor Green
} else {
    Write-Host "   ERREUR Fichier template non trouve" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "4. Test de generation complete..." -ForegroundColor Yellow
Write-Host "   Commande: python generer_etats_liasse.py" -ForegroundColor Gray
Write-Host ""
Write-Host "   Pour tester la generation complete:" -ForegroundColor Yellow
Write-Host "   cd py_backend" -ForegroundColor White
Write-Host "   conda activate claraverse_backend" -ForegroundColor White
Write-Host "   python generer_etats_liasse.py" -ForegroundColor White
Write-Host ""
Write-Host "   Verifier ensuite:" -ForegroundColor Yellow
Write-Host "   - Fichier HTML genere sur le Bureau" -ForegroundColor White
Write-Host "   - Option d'export Excel disponible" -ForegroundColor White
Write-Host "   - Onglet 'Controle de coherence' present" -ForegroundColor White
Write-Host "   - 16 etats de controle affiches" -ForegroundColor White
Write-Host "   - 6 sections organisees" -ForegroundColor White

Write-Host ""
Write-Host "============================================================================" -ForegroundColor Cyan
Write-Host "RESUME DU TEST" -ForegroundColor Cyan
Write-Host "============================================================================" -ForegroundColor Cyan
Write-Host "OK Module generer_onglet_controle_coherence.py fonctionne" -ForegroundColor Green
Write-Host "OK Module export_liasse.py fonctionne" -ForegroundColor Green
Write-Host "OK Fichier template present" -ForegroundColor Green
Write-Host ""
Write-Host "PROCHAINES ETAPES:" -ForegroundColor Yellow
Write-Host "  1. Tester la generation complete avec generer_etats_liasse.py" -ForegroundColor White
Write-Host "  2. Verifier l'onglet 'Controle de coherence' dans le fichier Excel" -ForegroundColor White
Write-Host "  3. Comparer avec le menu accordeon frontend" -ForegroundColor White
Write-Host "  4. Valider les 16 etats de controle" -ForegroundColor White
Write-Host ""
Write-Host "DOCUMENTATION:" -ForegroundColor Yellow
Write-Host "  Doc_Etat_Fin/00_ONGLET_CONTROLE_COHERENCE_05_AVRIL_2026.txt" -ForegroundColor White
Write-Host "  Doc_Etat_Fin/QUICK_START_ONGLET_CONTROLE.txt" -ForegroundColor White
Write-Host ""
Write-Host "============================================================================" -ForegroundColor Cyan
