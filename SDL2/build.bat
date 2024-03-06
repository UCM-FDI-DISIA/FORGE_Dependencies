set BINDIRECTION= ..\..\bin
set BUILDDIR=.\build\x64
set SDLSRC=.\src
mkdir %BUILDDIR%


:: CMAKE SDL
cmake -S %SDLSRC% -B %BUILDDIR%

msbuild %BUILDDIR%\SDL2.sln /p:configuration=Debug
msbuild %BUILDDIR%\SDL2.sln /p:configuration=Release
