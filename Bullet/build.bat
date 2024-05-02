@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set BUILDDIR=.\build\x64
set BULLETSRC=.\src
set BUILD=1
set BUILDVER=1.1

::Comprobar si Bullet ya estaba compilado y en la ultima version
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
    echo Starting Bullet build.

    cmake -A x64 -S %BULLETSRC% -B %BUILDDIR% -DBUILD_BULLET2_DEMOS:BOOL="0" -DBUILD_BULLET3:BOOL="0" -DBUILD_EXTRAS:BOOL="0" -DBUILD_CPU_DEMOS:BOOL="0" -DINSTALL_LIBS:BOOL="1" -DBUILD_OPENGL3_DEMOS:BOOL="0" -DUSE_MSVC_RUNTIME_LIBRARY_DLL:BOOL="1" -DBUILD_UNIT_TESTS:BOOL="0" 

    msbuild %BUILDDIR%\BULLET_PHYSICS.sln /p:configuration=Debug /p:Platform=x64
    msbuild %BUILDDIR%\BULLET_PHYSICS.sln /p:configuration=Release /p:Platform=x64
) else (
    echo Latest Bullet build version detected.
)
