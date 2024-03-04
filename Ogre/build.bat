set BINDIRECTION= ..\..\bin
set BUILDDIR=%~dp0build\x64
set OGRESRC=%~dp0src
mkdir %BUILDDIR%
:: CMAKE OGRE
cmake -S %OGRESRC% -B %BUILDDIR% -DOGRE_BUILD_COMPONENT_BITES:BOOL="0" -DOGRE_INSTALL_SAMPLES:BOOL="0" -DOGRE_BUILD_COMPONENT_OVERLAY:BOOL="0" -DOGRE_BUILD_COMPONENT_OVERLAY_IMGUI:BOOL="0" -DOGRE_BUILD_PLUGIN_DOT_SCENE:BOOL="0" -DOGRE_BUILD_COMPONENT_PROPERTY:BOOL="0" -DOGRE_BUILD_SAMPLES:BOOL="0" -DOGRE_BUILD_COMPONENT_BULLET:BOOL="0" -DOGRE_BUILD_PLUGIN_BSP:BOOL="0" -DOGRE_BUILD_PLUGIN_OCTREE:BOOL="0" 

msbuild %BUILDDIR%\OGRE.sln /p:configuration=Debug
msbuild %BUILDDIR%\OGRE.sln /p:configuration=Release
COPY /y %BINDIRECTION%\bin\debug\Codec_STBI_d.dll %BIN%
COPY /y %BINDIRECTION%\bin\debug\OgreMain_d.dll %BIN%
COPY /y %BINDIRECTION%\bin\debug\RenderSystem_Direct3D11_d.dll %BIN%
COPY /y %BINDIRECTION%\bin\debug\zlib.dll %BIN%
COPY /y %BINDIRECTION%\bin\debug\OgreRTShaderSystem_d.dll %BIN%
COPY /y %BINDIRECTION%\bin\debug\Plugin_ParticleFX_d.dll %BIN%
COPY /y %BINDIRECTION%\bin\debug\RenderSystem_GL_d.dll %BIN%

COPY /y %BINDIRECTION%\bin\release\Codec_STBI.dll %BIN%
COPY /y %BINDIRECTION%\bin\release\OgreMain.dll %BIN%
COPY /y %BINDIRECTION%\bin\release\RenderSystem_Direct3D11.dll %BIN%
COPY /y %BINDIRECTION%\bin\release\OgreXMLConverter.exe %BIN%
COPY /y %BINDIRECTION%\bin\release\OgreMeshUpgrader.exe %BIN%
COPY /y %BINDIRECTION%\bin\release\SDL2.dll %BIN%
COPY /y %BINDIRECTION%\bin\release\OgreRTShaderSystem.dll %BIN%
COPY /y %BINDIRECTION%\bin\release\Plugin_ParticleFX.dll %BIN%
COPY /y %BINDIRECTION%\bin\release\RenderSystem_GL.dll %BIN%
del /s /q %BUILDDIR%\bullet3-3.25

