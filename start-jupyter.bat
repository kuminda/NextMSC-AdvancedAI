@echo off
echo Activating 'advanced-ai' conda environment...
call %USERPROFILE%\Miniconda3\Scripts\activate.bat advanced-ai

echo Starting Jupyter Notebook...
cd /d "%~dp0"
jupyter notebook
pause
