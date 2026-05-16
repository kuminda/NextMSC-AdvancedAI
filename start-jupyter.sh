#!/bin/bash
# Launch Jupyter Notebook from the project directory using the advanced-ai conda environment

echo "Activating 'advanced-ai' conda environment..."
source ~/.bash_profile
conda activate advanced-ai

echo "Starting Jupyter Notebook..."
cd "$(dirname "$0")"
jupyter notebook
