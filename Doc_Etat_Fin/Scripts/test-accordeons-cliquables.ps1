# ============================================================================
# Script de Test - Accordéons Cliquables
# ============================================================================
# Date: 05 Avril 2026
# Description: Vérifie que les accordéons des états de contrôle sont cliquables
# ============================================================================

Write-Host ""
Write-Host "╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                                              ║" -ForegroundColor Cyan
Write-Host "║              TEST - ACCORDEONS CLIQUABLES DES ETATS DE CONTROLE              ║" -ForegroundColor Cyan
Write-Host "║                                                                              ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Variables
$testsPassed = 0
$testsFailed = 0
$testsTotal = 0

# Fonction pour afficher un test
function Test-Item {
    param(
        [string]$Description,
        [bool]$Condition,
        [string]$SuccessMessage = "OK",
        [string]$FailureMessage = "ECHEC"
    )
    
    $script:testsTotal++
    
    if ($Condition) {
        Write-Host "  ✅ $Description" -ForegroundColor Green
        Write-Host "     → $SuccessMessage" -ForegroundColor Gray
        $script:testsPassed++
    } else {
        Write-Host "  ❌ $Description" -ForegroundColor Red
        Write-Host "     → $FailureMessage" -ForegroundColor Gray
        $script:testsFailed++
    }
    Write-Host ""
}

# ============================================================================
# TEST 1: Vérifier que le fichier JavaScript existe
# ============================================================================
Write-Host "📋 TEST 1: Fichier JavaScript" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────────────────────────────────────────────" -ForegroundColor Gray

$jsFile = "public/EtatsControleAccordeonHandler.js"
$jsExists = Test-Path $jsFile

Test-Item `
    -Description "Fichier EtatsControleAccordeonHandler.js existe" `
    -Condition $jsExists `
    -SuccessMessage "Fichier trouvé: $jsFile" `
    -FailureMessage "Fichier manquant: $jsFile"

# ============================================================================
# TEST 2: Vérifier que la fonction est exposée globalement
# ============================================================================
Write-Host "📋 TEST 2: Fonction Globale" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────────────────────────────────────────────" -ForegroundColor Gray

if ($jsExists) {
    $jsContent = Get-Content $jsFile -Raw
    $hasGlobalExpose = $jsContent -match "window\.toggleSection\s*=\s*toggleSection"
    
    Test-Item `
        -Description "Fonction toggleSection exposée globalement" `
        -Condition $hasGlobalExpose `
        -SuccessMessage "Ligne trouvée: window.toggleSection = toggleSection;" `
        -FailureMessage "Ligne manquante dans le fichier"
} else {
    Test-Item `
        -Description "Fonction toggleSection exposée globalement" `
        -Condition $false `
        -FailureMessage "Impossible de vérifier (fichier manquant)"
}

# ============================================================================
# TEST 3: Vérifier que le script est chargé dans index.html
# ============================================================================
Write-Host "📋 TEST 3: Chargement dans index.html" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────────────────────────────────────────────" -ForegroundColor Gray

$indexFile = "index.html"
$indexExists = Test-Path $indexFile

if ($indexExists) {
    $indexContent = Get-Content $indexFile -Raw
    $hasScriptTag = $indexContent -match '<script\s+src="/EtatsControleAccordeonHandler\.js"'
    
    Test-Item `
        -Description "Script chargé dans index.html" `
        -Condition $hasScriptTag `
        -SuccessMessage "Balise <script> trouvée dans index.html" `
        -FailureMessage "Balise <script> manquante dans index.html"
} else {
    Test-Item `
        -Description "Script chargé dans index.html" `
        -Condition $false `
        -FailureMessage "Fichier index.html manquant"
}

# ============================================================================
# TEST 4: Vérifier la structure du code JavaScript
# ============================================================================
Write-Host "📋 TEST 4: Structure du Code" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────────────────────────────────────────────" -ForegroundColor Gray

if ($jsExists) {
    $jsContent = Get-Content $jsFile -Raw
    
    # Vérifier la fonction toggleSection
    $hasToggleFunction = $jsContent -match "function\s+toggleSection\s*\("
    Test-Item `
        -Description "Fonction toggleSection définie" `
        -Condition $hasToggleFunction `
        -SuccessMessage "Fonction trouvée" `
        -FailureMessage "Fonction manquante"
    
    # Vérifier la fonction initializeAccordeons
    $hasInitFunction = $jsContent -match "function\s+initializeAccordeons\s*\("
    Test-Item `
        -Description "Fonction initializeAccordeons définie" `
        -Condition $hasInitFunction `
        -SuccessMessage "Fonction trouvée" `
        -FailureMessage "Fonction manquante"
    
    # Vérifier le MutationObserver
    $hasMutationObserver = $jsContent -match "new\s+MutationObserver"
    Test-Item `
        -Description "MutationObserver configuré" `
        -Condition $hasMutationObserver `
        -SuccessMessage "Observer trouvé" `
        -FailureMessage "Observer manquant"
    
    # Vérifier l'exposition de reinitializeAccordeons
    $hasReinitExpose = $jsContent -match "window\.reinitializeEtatsControleAccordeons"
    Test-Item `
        -Description "Fonction reinitialize exposée" `
        -Condition $hasReinitExpose `
        -SuccessMessage "window.reinitializeEtatsControleAccordeons trouvée" `
        -FailureMessage "Fonction reinitialize non exposée"
}

# ============================================================================
# TEST 5: Vérifier les fichiers de documentation
# ============================================================================
Write-Host "📋 TEST 5: Documentation" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────────────────────────────────────────────" -ForegroundColor Gray

$docFiles = @(
    "00_CORRECTION_ACCORDEONS_CLIQUABLES_05_AVRIL_2026.txt",
    "QUICK_TEST_ACCORDEONS_CLIQUABLES.txt",
    "COMMIT_MESSAGE_ACCORDEONS_CLIQUABLES.txt",
    "00_SYNTHESE_CORRECTION_ACCORDEONS_05_AVRIL_2026.txt",
    "Doc_Etat_Fin/00_INDEX_CORRECTION_ACCORDEONS_05_AVRIL_2026.md"
)

foreach ($docFile in $docFiles) {
    $exists = Test-Path $docFile
    $fileName = Split-Path $docFile -Leaf
    
    Test-Item `
        -Description "Documentation: $fileName" `
        -Condition $exists `
        -SuccessMessage "Fichier trouvé" `
        -FailureMessage "Fichier manquant: $docFile"
}

# ============================================================================
# TEST 6: Vérifier le module Python backend
# ============================================================================
Write-Host "📋 TEST 6: Module Python Backend" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────────────────────────────────────────────" -ForegroundColor Gray

$pyFile = "py_backend/etats_controle_exhaustifs_html.py"
$pyExists = Test-Path $pyFile

Test-Item `
    -Description "Module Python existe" `
    -Condition $pyExists `
    -SuccessMessage "Fichier trouvé: $pyFile" `
    -FailureMessage "Fichier manquant: $pyFile"

if ($pyExists) {
    $pyContent = Get-Content $pyFile -Raw
    
    # Vérifier les attributs onclick
    $hasOnclick = $pyContent -match 'onclick="toggleSection\(this\)"'
    Test-Item `
        -Description "Attributs onclick dans le HTML généré" `
        -Condition $hasOnclick `
        -SuccessMessage "onclick='toggleSection(this)' trouvé" `
        -FailureMessage "Attributs onclick manquants"
    
    # Vérifier les classes CSS
    $hasClasses = $pyContent -match 'class="section"' -and $pyContent -match 'class="section-header"'
    Test-Item `
        -Description "Classes CSS correctes" `
        -Condition $hasClasses `
        -SuccessMessage "Classes .section et .section-header trouvées" `
        -FailureMessage "Classes CSS manquantes"
}

# ============================================================================
# RÉSUMÉ DES TESTS
# ============================================================================
Write-Host ""
Write-Host "╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                              RÉSUMÉ DES TESTS                                ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

Write-Host "  Total de tests: $testsTotal" -ForegroundColor White
Write-Host "  Tests réussis:  $testsPassed" -ForegroundColor Green
Write-Host "  Tests échoués:  $testsFailed" -ForegroundColor $(if ($testsFailed -eq 0) { "Green" } else { "Red" })
Write-Host ""

$successRate = [math]::Round(($testsPassed / $testsTotal) * 100, 1)
Write-Host "  Taux de réussite: $successRate%" -ForegroundColor $(if ($successRate -eq 100) { "Green" } elseif ($successRate -ge 80) { "Yellow" } else { "Red" })
Write-Host ""

# ============================================================================
# PROCHAINES ÉTAPES
# ============================================================================
if ($testsFailed -eq 0) {
    Write-Host "╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║                          ✅ TOUS LES TESTS PASSENT !                         ║" -ForegroundColor Green
    Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Green
    Write-Host ""
    Write-Host "🚀 PROCHAINES ÉTAPES:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  1. Démarrer l'application:" -ForegroundColor White
    Write-Host "     npm run dev" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  2. Tester manuellement:" -ForegroundColor White
    Write-Host "     Voir: QUICK_TEST_ACCORDEONS_CLIQUABLES.txt" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  3. Faire le commit:" -ForegroundColor White
    Write-Host "     git add ." -ForegroundColor Gray
    Write-Host "     git commit -F COMMIT_MESSAGE_ACCORDEONS_CLIQUABLES.txt" -ForegroundColor Gray
    Write-Host "     git push origin main" -ForegroundColor Gray
    Write-Host ""
} else {
    Write-Host "╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Red
    Write-Host "║                        ❌ CERTAINS TESTS ONT ÉCHOUÉ                          ║" -ForegroundColor Red
    Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Red
    Write-Host ""
    Write-Host "🔧 ACTIONS CORRECTIVES:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  1. Vérifier les fichiers manquants" -ForegroundColor White
    Write-Host "  2. Consulter: 00_CORRECTION_ACCORDEONS_CLIQUABLES_05_AVRIL_2026.txt" -ForegroundColor White
    Write-Host "  3. Réexécuter ce script après corrections" -ForegroundColor White
    Write-Host ""
}

Write-Host "═══════════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
