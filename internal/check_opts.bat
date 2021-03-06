@echo off

REM Check for optional components

where /q ninja.exe

IF NOT ERRORLEVEL 1 (
    echo Ninja found, using it to speed up builds
    set CMAKE_GENERATOR=Ninja
)

where /q clcache.exe

IF NOT ERRORLEVEL 1 (
    echo clcache found, using it to speed up builds
    set CC=clcache
    set CXX=clcache
)

IF "%MKLProductDir%" == "" IF exist "C:\Program Files (x86)\IntelSWTools\compilers_and_libraries\windows" (
    set "MKLProductDir=C:\Program Files (x86)\IntelSWTools\compilers_and_libraries\windows";
)

IF exist "%MKLProductDir%\mkl\lib\intel64_win" (
    echo MKL found, adding it to build
    set "CMAKE_INCLUDE_PATH=%MKLProductDir%\mkl\include"
    set "LIB=%MKLProductDir%\mkl\lib\intel64_win;%LIB%";
)

exit /b 0
