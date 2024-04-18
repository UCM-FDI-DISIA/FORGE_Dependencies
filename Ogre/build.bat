@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set BINDIRECTION= ..\..\bin
set BUILDDIR=.\build\x64
set OGRESRC=.\src

set BUILD=1
set BUILDVER=1.0

::Comprobar si Ogre ya estaba compilado y en la ultima version
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

if !BUILD! equ 1 (
    echo Starting Ogre build.
    mkdir %BUILDDIR%

    :: CMAKE OGRE
    cmake -S %OGRESRC% -B %BUILDDIR% -DOGRE_BUILD_COMPONENT_PROPERTY:BOOL="0" -DOGRE_BUILD_COMPONENT_BITES:BOOL="0" -DOGRE_BUILD_PLUGIN_BSP:BOOL="0" -DOGRE_BUILD_PLUGIN_PCZ:BOOL="0" -DOGRE_BUILD_PLUGIN_OCTREE:BOOL="0" -DOGRE_BUILD_COMPONENT_OVERLAY_IMGUI:BOOL="0" -DOGRE_BUILD_SAMPLES:BOOL="0" -DOGRE_BUILD_COMPONENT_OVERLAY:BOOL="0" -DOGRE_BUILD_PLUGIN_DOT_SCENE:BOOL="0" -DOGRE_BUILD_RENDERSYSTEM_D3D9:BOOL="0" -DOGRE_BUILD_PLUGIN_ASSIMP:BOOL="0" 

    msbuild %BUILDDIR%\OGRE.sln /p:configuration=Debug
    msbuild %BUILDDIR%\OGRE.sln /p:configuration=Release

    set DLLCOPYDIR=%BUILDDIR%\bin\debug
    COPY /y !DLLCOPYDIR!\Codec_STBI_d.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\OgreMain_d.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\RenderSystem_Direct3D11_d.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\zlib.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\OgreRTShaderSystem_d.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\Plugin_ParticleFX_d.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\RenderSystem_GL_d.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\OgreTerrain_d.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\OgreVolume_d.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\RenderSystem_GL3Plus_d.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\RenderSystem_GLES2_d.dll %BINDIRECTION%

    set DLLCOPYDIR=%BUILDDIR%\bin\release
    COPY /y !DLLCOPYDIR!\Codec_STBI.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\OgreMain.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\RenderSystem_Direct3D11.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\OgreXMLConverter.exe %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\OgreMeshUpgrader.exe %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\OgreRTShaderSystem.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\Plugin_ParticleFX.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\RenderSystem_GL.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\OgreTerrain.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\OgreVolume.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\RenderSystem_GL3Plus.dll %BINDIRECTION%
    COPY /y !DLLCOPYDIR!\RenderSystem_GLES2.dll %BINDIRECTION%
    
    echo Ogre build finished.
) else (
    echo Latest Ogre build version detected.
)