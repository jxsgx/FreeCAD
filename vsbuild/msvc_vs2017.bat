
set Configuration=Debug
set FreeCAD_INSTALL_PREFIX=%cd%\..\..\FreeCAD-vs2017-install

rem LibPack
set FreeCAD-LibPack=%cd%\..\..\FreeCAD-LibPack

rem Python
set PYTHONHOME=%FreeCAD-LibPack%\Python\Python37
set PATH=%PYTHONHOME%;%PYTHONHOME%\Scripts;%PATH%

rem boost
set BOOST_ROOT=%FreeCAD-LibPack%\boost\boost_1_68_0
set PATH=%BOOST_ROOT%\lib64-msvc-14.1;%PATH%

rem XercesC
set XERCESCROOT=%FreeCAD-LibPack%\XercesC\XercesC-vs2017-install\x64-%Configuration%
set PATH=%XERCESCROOT%\bin;%PATH%

rem zlib
set ZLIB_ROOT=%FreeCAD-LibPack%\opencascade\3rdParty\zlib-1.2.8-vc14-64
set PATH=%ZLIB_ROOT%\bin;%PATH%

rem OpenCASCADE
set CASROOT=%FreeCAD-LibPack%\opencascade\opencascade-7.3.0
set PATH=%CASROOT%\..\3rdParty\ffmpeg-3.3-lgpl-64\bin;%CASROOT%\..\3rdParty\freeimage-3.17.0-vc14-64\bin;%CASROOT%\..\3rdParty\freetype-2.5.5-vc14-64\bin;%CASROOT%\..\3rdParty\VTK-6.1.0-vc14-64\bin;%CASROOT%\win64\vc14\bind;%PATH%

rem eigen3
set EIGEN3_DIR=%FreeCAD-LibPack%\eigen3\eigen-eigen-3.3.7

rem FreeType
set FREETYPE_DIR=%FreeCAD-LibPack%\opencascade\3rdParty\freetype-2.5.5-vc14-64

rem Coin3D
set COIN3D_DIR=%FreeCAD-LibPack%\Coin3D\Coin3D-vs2017-install\x64-%Configuration%
set PATH=%COIN3D_DIR%\bin;%PATH%

rem Qt
set QTDIR=C:\Qt\Qt5.10.1\5.10.1\msvc2017_64
set PATH=%QTDIR%\bin;%PATH%

cd ..\..
mkdir FreeCAD-vs2017-build
cd FreeCAD-vs2017-build

rem start
set "PATH=%PATH%;%ProgramFiles(x86)%\Microsoft Visual Studio\Installer"
for /f "usebackq delims=" %%i in (`vswhere.exe -version "[15.0,15.99]" -requires Microsoft.VisualStudio.Workload.NativeDesktop -property installationPath`) do (
    set "DevEnvDir=%%i\Common7\IDE\"
  )

start "" "%DevEnvDir%\devenv.exe" %Configuration%\FreeCAD_trunk.sln
exit
