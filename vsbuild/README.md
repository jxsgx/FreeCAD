# FreeCAD-generate-build

目标在于不依赖FreeCAD官方LibPack的情况下，产生visual studio的工程项目。

## 预备环境
1. 克隆下载的 FreeCAD 源码文件夹被命名为 FreeCAD-git-fork
2. 与源码文件夹同级位置存在 FreeCAD-LibPack，按 boost, python, eigen3 分子文件夹的模式组织依赖库
3. 执行 buildscript_vs2017.bat 启用cmake生成工程，生成的工程文件存放在源码文件夹同级目录 FreeCAD-vs2017-build 之下的 Debug
4. 调用 vs2017 打开工程，需要通过 msvc_vs2017.bat 来执行


## 当前状态 (2019/05/14)
1. 不需要存储 Debug 下的工程文件，通过修改源码或依赖库的方式，确保可以再次执行 buildscript_vs2017.bat 脚本重新产生工程
2. 没有启用 Mesh 网格之类的 Mod 模块
3. 没有做好 Release 的设置
4. 问题：总是说找不到模块 shiboken2.shiboken2
5. 问题：还没有安装 pivy，Draft模块不能用的样子
