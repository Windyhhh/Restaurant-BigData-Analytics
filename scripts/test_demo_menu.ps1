# Test script for demo_menu.py
# This script tests the menu display and basic functionality

Write-Host "========================================" -ForegroundColor Blue
Write-Host "Testing Demo Menu Script" -ForegroundColor Blue
Write-Host "========================================" -ForegroundColor Blue
Write-Host ""

# Activate conda environment
Write-Host "Step 1: Activating conda environment..." -ForegroundColor Yellow
conda activate base

# Test 1: Check if Python is available
Write-Host ""
Write-Host "Step 2: Checking Python availability..." -ForegroundColor Yellow
python --version

# Test 2: Check if script exists
Write-Host ""
Write-Host "Step 3: Checking if demo_menu.py exists..." -ForegroundColor Yellow
if (Test-Path "demo_menu.py") {
    Write-Host "[OK] demo_menu.py found" -ForegroundColor Green
} else {
    Write-Host "[ERROR] demo_menu.py not found" -ForegroundColor Red
    exit 1
}

# Test 3: Check Python syntax
Write-Host ""
Write-Host "Step 4: Checking Python syntax..." -ForegroundColor Yellow
python -m py_compile demo_menu.py
if ($LASTEXITCODE -eq 0) {
    Write-Host "[OK] Python syntax is valid" -ForegroundColor Green
} else {
    Write-Host "[ERROR] Python syntax error" -ForegroundColor Red
    exit 1
}

# Test 4: Run menu with exit command (option 0)
Write-Host ""
Write-Host "Step 5: Testing menu display and exit..." -ForegroundColor Yellow
Write-Host "Sending command: 0 (exit)" -ForegroundColor Cyan
echo "0" | python demo_menu.py

Write-Host ""
Write-Host "========================================" -ForegroundColor Blue
Write-Host "Test completed!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Blue

