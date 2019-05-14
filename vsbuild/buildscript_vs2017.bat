set PATH=C:\Program Files\CMake\bin;%PATH%

set Configuration=Debug
set FreeCAD_INSTALL_PREFIX=%cd%/\..\..\FreeCAD-vs2017-install

rem LibPack
set FreeCAD-LibPack=%cd%\..\..\FreeCAD-LibPack

rem Python
set PYTHONHOME=%FreeCAD-LibPack%\Python\Python37
set PATH=%PYTHONHOME%;%PYTHONHOME%\Scripts;%PATH%

rem boost
set BOOST_ROOT=%FreeCAD-LibPack%\boost\boost_1_68_0

rem XercesC
set XERCESCROOT=%FreeCAD-LibPack%\XercesC\XercesC-vs2017-install\x64-%Configuration%

rem zlib
set ZLIB_ROOT=%FreeCAD-LibPack%\opencascade\3rdParty\zlib-1.2.8-vc14-64

rem OpenCASCADE
set CASROOT=%FreeCAD-LibPack%\opencascade\opencascade-7.3.0

rem eigen3
set EIGEN3_DIR=%FreeCAD-LibPack%\eigen3\eigen-eigen-3.3.7

rem FreeType
set FREETYPE_DIR=%FreeCAD-LibPack%\opencascade\3rdParty\freetype-2.5.5-vc14-64

rem Coin3D
set COIN3D_DIR=%FreeCAD-LibPack%\Coin3D\Coin3D-vs2017-install\x64-%Configuration%

rem Qt5.10.1
set QTDIR=C:\Qt\Qt5.10.1\5.10.1\msvc2015_64
set Qt5Core_DIR=%QTDIR%\lib\cmake\Qt5Core
set Qt5Network_DIR=%QTDIR%\lib\cmake\Qt5Network
set Qt5Xml_DIR=%QTDIR%\lib\cmake\Qt5Xml
set Qt5Widgets_DIR=%QTDIR%\lib\cmake\Qt5Widgets
set Qt5PrintSupport_DIR=%QTDIR%\lib\cmake\Qt5PrintSupport
set Qt5OpenGL_DIR=%QTDIR%\lib\cmake\Qt5OpenGL
set Qt5Svg_DIR=%QTDIR%\lib\cmake\Qt5Svg
set Qt5UiTools_DIR=%QTDIR%\lib\cmake\Qt5UiTools
set Qt5Concurrent_DIR=%QTDIR%\lib\cmake\Qt5Concurrent
set Qt5WebEngineWidgets_DIR=%QTDIR%\lib\cmake\Qt5WebEngineWidgets

rem goto generate vs2017 projects
cd ..\..
mkdir FreeCAD-vs2017-build
cd FreeCAD-vs2017-build

rmdir /s /q %Configuration%
mkdir %Configuration%
cd %Configuration%
cmake.exe -G "Visual Studio 15 2017 Win64" -DCMAKE_INSTALL_PREFIX:PATH=%FreeCAD_INSTALL_PREFIX%\%Configuration% -DFREECAD_LIBPACK_USE=OFF -DBUILD_FEM=OFF -DBUILD_MESH_PART=OFF -DBUILD_OPENSCAD=OFF -DBUILD_QT5=ON -DXercesC_INCLUDE_DIRS=%XERCESCROOT%\include -DXercesC_DEBUG_LIBRARIES=%XERCESCROOT%\lib\xerces-c_3D.lib -DXercesC_LIBRARIES=%XERCESCROOT%\lib -DZLIB_ROOT=%ZLIB_ROOT% -DEIGEN3_INCLUDE_DIR=%EIGEN3_DIR% -DOCC_INCLUDE_DIR=%CASROOT%\inc -DOCC_LIBRARY=%CASROOT%\win64\vc14\libd\TKernel.lib -DCOIN3D_INCLUDE_DIRS=%COIN3D_DIR%\include -DCOIN3D_LIBRARY_DEBUG=%COIN3D_DIR%\lib\coin4d.lib -DCOIN3D_LIBRARY_RELEASE=%COIN3D_DIR%\lib\coin4.lib -DCMAKE_CONFIGURATION_TYPES=%Configuration% ..\..\FreeCAD-git-fork
