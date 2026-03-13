@echo off
setlocal
cd /d %~dp0..

title Trauma Register Backend - Servidor de Produccion

echo ======================================================
echo    TRAUMA REGISTER BACKEND - INICIANDO SERVIDOR
echo ======================================================
echo.

:: Verificar si existe la carpeta venv
if not exist "venv\Scripts\activate.bat" (
    echo [ERROR] No se encontro el entorno virtual en la carpeta 'venv'.
    echo Por favor, crea el entorno virtual antes de continuar.
    pause
    exit /b
)

echo [1/3] Activando entorno virtual...
call venv\Scripts\activate.bat

echo [2/3] Verificando dependencias (Waitress)...
pip install waitress --quiet

echo [3/3] Iniciando servidor en produccion con Waitress...
echo.
echo ------------------------------------------------------
:: Ejecuta el servidor. La ventana se mantendra abierta para ver los logs.
python run_server.py

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] El servidor se detuvo de forma inesperada.
    pause
)

deactivate
pause
