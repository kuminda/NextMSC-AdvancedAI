@echo off
REM ===================================================================
REM Start-Jupyter.bat
REM ===================================================================
REM 
REM PURPOSE:
REM   This script automatically launches Jupyter Notebook inside the
REM   'advanced-ai' Conda environment for the NextMSC-AdvancedAI
REM   coursework. It ensures all required Python packages (Jupyter,
REM   NumPy, Pandas, Matplotlib, scikit-learn) are available.
REM
REM PREREQUISITES:
REM   1. Miniconda must be installed in the default location:
REM      C:\Users\<YourUsername>\Miniconda3
REM      (Download from: https://docs.conda.io/en/latest/miniconda.html)
REM   2. The 'advanced-ai' Conda environment must exist.
REM      To create it manually, run:
REM          conda create -n advanced-ai python=3.12 jupyter numpy pandas matplotlib scikit-learn
REM   3. Windows OS (this is a Windows batch file).
REM
REM USAGE:
REM   Double-click this file, or run it from Command Prompt / PowerShell:
REM       .\start-jupyter.bat
REM   Jupyter Notebook will open in your default web browser.
REM   The server root will be the folder containing this script.
REM
REM WHAT IT DOES:
REM   Step 1 - Activates the 'advanced-ai' Conda environment.
REM   Step 2 - Changes directory to the project folder (where this file lives).
REM   Step 3 - Starts Jupyter Notebook server on localhost:8888.
REM   Step 4 - Pauses on exit so you can see any error messages.
REM
REM TROUBLESHOOTING:
REM   - If conda is not found, verify Miniconda is installed in your
REM     user profile folder (e.g., C:\Users\kumin\Miniconda3).
REM   - If the environment is missing, create it using the command above.
REM   - To stop Jupyter, close the browser tab, then press Ctrl+C in
REM     this window and confirm with Y.
REM
REM AUTHOR: NextMSC-AdvancedAI Course Setup
REM ===================================================================

echo Activating 'advanced-ai' Conda environment...
call %USERPROFILE%\Miniconda3\Scripts\activate.bat advanced-ai

echo Starting Jupyter Notebook...
cd /d "%~dp0"
jupyter notebook
pause
