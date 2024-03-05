
set BUILDDIR=%~dp0build\x64
set OGRESRC=%~dp0src
mkdir %BUILDDIR%


:: CMAKE OGRE
cmake -S %OGRESRC% -B %BUILDDIR% -DOGRE_BUILD_COMPONENT_BITES:BOOL="0" -DOGRE_INSTALL_SAMPLES:BOOL="0" -DOGRE_BUILD_COMPONENT_OVERLAY:BOOL="0" -DOGRE_BUILD_COMPONENT_OVERLAY_IMGUI:BOOL="0" -DOGRE_BUILD_PLUGIN_DOT_SCENE:BOOL="0" -DOGRE_BUILD_COMPONENT_PROPERTY:BOOL="0" -DOGRE_BUILD_SAMPLES:BOOL="0" -DOGRE_BUILD_COMPONENT_BULLET:BOOL="0" -DOGRE_BUILD_PLUGIN_BSP:BOOL="0" -DOGRE_BUILD_PLUGIN_OCTREE:BOOL="0" 

msbuild %BUILDDIR%\OGRE.sln /p:configuration=Debug
msbuild %BUILDDIR%\OGRE.sln /p:configuration=Release

set BINDIRECTION=..\..\bin
COPY /y %BUILDDIR%\bin\debug\Codec_STBI_d.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\OgreMain_d.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\RenderSystem_Direct3D11_d.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\zlib.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\OgreRTShaderSystem_d.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\Plugin_ParticleFX_d.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\RenderSystem_GL_d.dll %BINDIRECTION%

COPY /y %BUILDDIR%\bin\release\Codec_STBI.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\OgreMain.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\RenderSystem_Direct3D11.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\OgreXMLConverter.exe %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\OgreMeshUpgrader.exe %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\SDL2.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\OgreRTShaderSystem.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\Plugin_ParticleFX.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\RenderSystem_GL.dll %BINDIRECTION%

del /s /q %BUILDDIR%\bullet3-3.25