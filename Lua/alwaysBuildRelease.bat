@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: Guardamos el directorio actual y el directorio en el que hacer la build
set COMPILEDIR=..\
set BUILDDIR=.\build

echo Starting Lua build.

:: Creamos si no existe el directorio de build y entramos en el
mkdir %BUILDDIR%
cd %BUILDDIR%

:: Generamos la solucion con cmake y la compilamos con msbuild en Debug y Release
cmake %COMPILEDIR%
msbuild "LUA_C.sln" /p:configuration=Release /p:Platform=x64

:: Volvemos al directorio original
cd ..

echo Lua build finished.
