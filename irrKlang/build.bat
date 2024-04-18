@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set DWNLDFILE=.\irrKlang.zip
set IKDIR=.\irrKlang-64bit-1.6.0\
set DLLDIR=.\bin\winx64-visualStudio\
set WORKDIR=..\..\bin\

set BUILD=1
set BUILDVER=1.0

::Comprobar si irrKlang ya estaba compilado y en la ultima version
if exist buildver.forge (
    set /p CHKBUILDVER=<buildver.forge
    if "!CHKBUILDVER!"=="%BUILDVER%" (
        set BUILD=0
    ) else (
        rmdir /q *
        del /q *.txt
        echo %BUILDVER%>buildver.forge
    )
) else (
    rmdir /q *
    del /q *.txt
    echo %BUILDVER%>buildver.forge
)

if %BUILD% equ 1 (
    echo Starting irrKlang build.
    :: Descargar la libreria de irrKlang
    curl "https://www.ambiera.at/downloads/irrKlang-64bit-1.6.0.zip" -o "%DWNLDFILE%"
    :: Extraerla
    tar -xf %DWNLDFILE%

    :: Mover el contenido de la subcarpeta a la carpeta actual
    move "%IKDIR%*" ".\"
    for /d %%i in ("%IKDIR%*") do move "%%i" ".\"

    :: Copiar los dll a la carpeta de trabajo
    xcopy "%DLLDIR%*.dll" "%WORKDIR%"

    :: Eliminar el zip y la subcarpeta sobrantes generados
    del "%DWNLDFILE%"
    rmdir "%IKDIR%"
) else (
    echo Latest irrKlang build version detected.
)
