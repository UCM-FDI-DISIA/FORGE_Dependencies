@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: Guardamos el directorio actual y el directorio en el que hacer la build
set COMPILEDIR=..\
set BUILDDIR=.\build

set BUILD=1
set BUILDVER=1.0

::Comprobar si Lua ya estaba compilado y en la ultima version
if exist buildver.forge (
    set /p CHKBUILDVER=<buildver.forge
    if "!CHKBUILDVER!"=="%BUILDVER%" (
        set BUILD=0
    ) else (
        del /q %BUILDDIR%
        echo %BUILDVER%>buildver.forge
    )
) else (
    del /q %BUILDDIR%
    echo %BUILDVER%>buildver.forge
)

if !BUILD! equ 1 (
    echo Starting Lua build.

    :: Creamos si no existe el directorio de build y entramos en el
    mkdir %BUILDDIR%
    cd %BUILDDIR%

    :: Generamos la solucion con cmake y la compilamos con msbuild en Debug y Release
    cmake %COMPILEDIR%
    msbuild "LUA_C.sln" /p:configuration=Debug /p:Platform=x64
    msbuild "LUA_C.sln" /p:configuration=Release /p:Platform=x64

    :: Volvemos al directorio original
    cd ..

    echo Lua build finished.

) else (
    echo Latest Lua build version detected.
)