@echo off

:: Guardamos el directorio actual y el directorio en el que hacer la build
set COMPILEDIR=%~dp0
set BUILDDIR=%~dp0build

:: Creamos si no existe el directorio de build y entramos en el
mkdir %BUILDDIR%
cd %BUILDDIR%

:: Generamos la solucion con cmake y la compilamos con msbuild en Debug y Release
cmake %COMPILEDIR%
msbuild "LUA_C.sln" /p:configuration=Debug
msbuild "LUA_C.sln" /p:configuration=Release

:: Volvemos al directorio original
cd ..

echo Build Lua instructions finished