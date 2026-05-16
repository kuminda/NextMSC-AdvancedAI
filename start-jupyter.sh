#!/bin/bash
# ===================================================================
# start-jupyter.sh
# ===================================================================
#
# PURPOSE:
#   This script automatically launches Jupyter Notebook inside the
#   'advanced-ai' Conda environment for the NextMSC-AdvancedAI
#   coursework. It ensures all required Python packages (Jupyter,
#   NumPy, Pandas, Matplotlib, scikit-learn) are available.
#
# PREREQUISITES:
#   1. Miniconda must be installed in your home directory:
#      ~/Miniconda3  (or $HOME/Miniconda3)
#      (Download from: https://docs.conda.io/en/latest/miniconda.html)
#   2. The 'advanced-ai' Conda environment must exist.
#      To create it manually, run:
#          conda create -n advanced-ai python=3.12 jupyter numpy pandas matplotlib scikit-learn
#   3. Git Bash, WSL, or any Unix-like shell on Windows.
#
# USAGE:
#   Make the script executable (one-time only):
#       chmod +x start-jupyter.sh
#   Run it from the project directory:
#       ./start-jupyter.sh
#   Jupyter Notebook will open in your default web browser.
#   The server root will be the folder containing this script.
#
# WHAT IT DOES:
#   Step 1 - Loads Conda shell hooks from ~/.bash_profile.
#   Step 2 - Activates the 'advanced-ai' Conda environment.
#   Step 3 - Changes directory to the project folder.
#   Step 4 - Starts Jupyter Notebook server on localhost:8888.
#
# TROUBLESHOOTING:
#   - If 'conda: command not found', verify Miniconda is installed
#     and conda init bash has been run during installation.
#   - If the environment is missing, create it using the command above.
#   - To stop Jupyter, press Ctrl+C in the terminal.
#
# AUTHOR: NextMSC-AdvancedAI Course Setup
# ===================================================================

echo "Loading Conda shell configuration..."
source ~/.bash_profile

echo "Activating 'advanced-ai' conda environment..."
conda activate advanced-ai

echo "Starting Jupyter Notebook..."
cd "$(dirname "$0")"
jupyter notebook
