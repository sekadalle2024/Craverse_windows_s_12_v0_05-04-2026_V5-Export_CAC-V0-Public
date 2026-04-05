# Script de diagnostic pour l'export de la liasse officielle
# Vérifie le template, les dépendances et teste le remplissage

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "DIAGNOSTIC EXPORT LIASSE OFFICIELLE" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 1. Vérifier l'environnement conda
Write-Host "1. Vérification environnement conda..." -ForegroundColor Yellow
$condaEnv = conda env list | Select-String "claraverse_backend"
if ($condaEnv) {
    Write-Host "   [OK] Environnement claraverse_backend trouvé" -ForegroundColor Green
} else {
    Write-Host "   [ERREUR] Environnement claraverse_backend non trouvé" -ForegroundColor Red
    exit 1
}

Write-Host ""

# 2. Activer l'environnement et vérifier les dépendances
Write-Host "2. Vérification des dépendances Python..." -ForegroundColor Yellow

conda activate claraverse_backend

# Vérifier openpyxl
Write-Host "   - openpyxl..." -NoNewline
$openpyxl = python -c "import openpyxl; print(openpyxl.__version__)" 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host " [OK] version $openpyxl" -ForegroundColor Green
} else {
    Write-Host " [MANQUANT]" -ForegroundColor Red
    Write-Host "     Installation..." -ForegroundColor Yellow
    conda install -y openpyxl
}

# Vérifier pandas
Write-Host "   - pandas..." -NoNewline
$pandas = python -c "import pandas; print(pandas.__version__)" 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host " [OK] version $pandas" -ForegroundColor Green
} else {
    Write-Host " [MANQUANT]" -ForegroundColor Red
    Write-Host "     Installation..." -ForegroundColor Yellow
    conda install -y pandas
}

# Vérifier xlrd
Write-Host "   - xlrd..." -NoNewline
$xlrd = python -c "import xlrd; print(xlrd.__VERSION__)" 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host " [OK] version $xlrd" -ForegroundColor Green
} else {
    Write-Host " [MANQUANT]" -ForegroundColor Red
    Write-Host "     Installation..." -ForegroundColor Yellow
    conda install -y xlrd
}

Write-Host ""

# 3. Vérifier le fichier template
Write-Host "3. Vérification du fichier template..." -ForegroundColor Yellow
$templatePath = "py_backend/Liasse_officielle_revise.xlsx"

if (Test-Path $templatePath) {
    $fileSize = (Get-Item $templatePath).Length / 1KB
    Write-Host "   [OK] Fichier trouvé: $templatePath" -ForegroundColor Green
    Write-Host "   Taille: $([math]::Round($fileSize, 2)) KB" -ForegroundColor Gray
} else {
    Write-Host "   [ERREUR] Fichier non trouvé: $templatePath" -ForegroundColor Red
    Write-Host "   Fichiers Excel disponibles dans py_backend:" -ForegroundColor Yellow
    Get-ChildItem py_backend -Filter *.xlsx | ForEach-Object {
        Write-Host "     - $($_.Name)" -ForegroundColor Gray
    }
}

Write-Host ""

# 4. Exécuter le script de diagnostic
Write-Host "4. Exécution du diagnostic complet..." -ForegroundColor Yellow
Write-Host ""

Set-Location py_backend
python diagnostic_export_liasse.py

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "DIAGNOSTIC TERMINÉ AVEC SUCCÈS" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Fichiers générés dans py_backend/:" -ForegroundColor Cyan
    Write-Host "  - test_data_export_liasse.json" -ForegroundColor White
    Write-Host "  - test_liasse_remplie.xlsx" -ForegroundColor White
    Write-Host ""
    Write-Host "Prochaines étapes:" -ForegroundColor Yellow
    Write-Host "  1. Ouvrir test_liasse_remplie.xlsx pour vérifier le remplissage" -ForegroundColor White
    Write-Host "  2. Comparer les noms d'onglets avec le code export_liasse.py" -ForegroundColor White
    Write-Host "  3. Ajuster les mappings de cellules si nécessaire" -ForegroundColor White
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "ERREUR LORS DU DIAGNOSTIC" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
}

Set-Location ..
