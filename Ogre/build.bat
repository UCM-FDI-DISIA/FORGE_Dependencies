set BINDIRECTION= ..\..\bin
set BUILDDIR=.\build\x64
set OGRESRC=.\src
mkdir %BUILDDIR%



:: CMAKE OGRE
cmake -S %OGRESRC% -B %BUILDDIR% -DOGRE_BUILD_COMPONENT_PROPERTY:BOOL="0" -DOGRE_BUILD_COMPONENT_BITES:BOOL="0" -DOGRE_BUILD_PLUGIN_BSP:BOOL="0" -DOGRE_BUILD_PLUGIN_PCZ:BOOL="0" -DOGRE_BUILD_PLUGIN_OCTREE:BOOL="0" -DOGRE_BUILD_COMPONENT_OVERLAY_IMGUI:BOOL="0" -DOGRE_BUILD_SAMPLES:BOOL="0" -DOGRE_BUILD_COMPONENT_OVERLAY:BOOL="0" -DOGRE_BUILD_PLUGIN_DOT_SCENE:BOOL="0" -DOGRE_BUILD_RENDERSYSTEM_D3D9:BOOL="0" -DOGRE_BUILD_PLUGIN_ASSIMP:BOOL="0" 

msbuild %BUILDDIR%\OGRE.sln /p:configuration=Debug
msbuild %BUILDDIR%\OGRE.sln /p:configuration=Release

COPY /y %BUILDDIR%\bin\debug\Codec_STBI_d.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\OgreMain_d.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\RenderSystem_Direct3D11_d.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\zlib.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\OgreRTShaderSystem_d.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\Plugin_ParticleFX_d.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\RenderSystem_GL_d.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\OgreTerrain_d.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\OgreVolume_d.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\RenderSystem_GL3Plus_d.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\debug\RenderSystem_GLES2_d.dll %BINDIRECTION%

COPY /y %BUILDDIR%\bin\release\Codec_STBI.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\OgreMain.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\RenderSystem_Direct3D11.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\OgreXMLConverter.exe %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\OgreMeshUpgrader.exe %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\OgreRTShaderSystem.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\Plugin_ParticleFX.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\RenderSystem_GL.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\OgreTerrain.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\OgreVolume.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\RenderSystem_GL3Plus.dll %BINDIRECTION%
COPY /y %BUILDDIR%\bin\release\RenderSystem_GLES2.dll %BINDIRECTION%
