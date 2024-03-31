@echo off

set DWNLDFILE=.\irrKlang.zip
set IKDIR=.\irrKlang-64bit-1.6.0\
set DLLDIR=.\bin\winx64-visualStudio\
set WORKDIR=..\..\bin\

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