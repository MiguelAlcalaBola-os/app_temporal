@echo off

rem Verifica que se haya proporcionado un argumento VERSION
if "%~1"=="" (
    echo Usage: %0 ^<VERSION^>
    exit /b 1
)

rem Asigna el primer argumento a la variable VERSION
set VERSION=%~1

rem Agrega todos los archivos al repositorio git
git add .

rem Realiza un commit con el mensaje proporcionado por el usuario
git commit -m "Version %VERSION%"

rem Sube los cambios al repositorio remoto
git push 