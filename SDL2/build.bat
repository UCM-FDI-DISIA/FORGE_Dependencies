@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set BINDIRECTION= ..\..\bin
set BUILDDIR=.\build\x64
set SDLSRC=.\src
set SDLIMAGE=.\src\image

set BUILD=1
set BUILDVER=1.0

::Comprobar si SDL2 ya estaba compilado y en la ultima version
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

::Si no lo estaba, se compila
if !BUILD! equ 1 (
    echo Starting SDL2 build.

    mkdir %BUILDDIR%

    :: CMAKE SDL
    cmake -S %SDLSRC% -B %BUILDDIR%

    msbuild %BUILDDIR%\SDL2.sln /p:configuration=Debug /p:Platform=x64
    msbuild %BUILDDIR%\SDL2.sln /p:configuration=Release /p:Platform=x64

    COPY /y %BUILDDIR%\Debug\SDL2d.dll %BINDIRECTION%
    COPY /y %BUILDDIR%\Release\SDL2.dll %BINDIRECTION%
    COPY /y %SDLIMAGE%\SDL2_image.dll %BINDIRECTION%
) else (
    echo Latest SDL2 build version detected.
)