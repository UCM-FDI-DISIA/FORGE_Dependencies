@echo off

:: Limpiamos la pantalla para que se muestren los mensajes
cls

:: Nos guardamos el nombre del archivo que vamos a compilar por cada dependencia (por defecto, los vamos a llamar build.bat)
set BAT=build.bat
mkdir ..\bin
set BINDIRECTION = ..\bin

:: Entramos a la carpeta de Lua, ejecutamos su build.bat y volvemos
cd .\Lua\
call %BAT%
cd ..

cd .\SDL2\
call %BAT%
cd ..

cd .\Ogre\
call %BAT%
cd ..

cd .\Bullet\
call %BAT%
cd ..

cd .\irrKlang\
call %BAT%
cd ..