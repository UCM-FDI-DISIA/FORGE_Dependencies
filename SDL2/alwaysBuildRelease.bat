@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set BINDIRECTION= ..\..\bin
set BUILDDIR=.\build\x64
set SDLSRC=.\src
set SDLIMAGE=.\src\image

::Si no lo estaba, se compila
echo Starting SDL2 build.

mkdir %BUILDDIR%

:: CMAKE SDL
cmake -S %SDLSRC% -B %BUILDDIR%

msbuild %BUILDDIR%\SDL2.sln /p:configuration=Release /p:Platform=x64

COPY /y %BUILDDIR%\Debug\SDL2d.dll %BINDIRECTION%
COPY /y %BUILDDIR%\Release\SDL2.dll %BINDIRECTION%
COPY /y %SDLIMAGE%\SDL2_image.dll %BINDIRECTION%
