@echo off
setlocal enabledelayedexpansion
cd /d %~dp0

echo %%0 = %0
echo %%1 = %1

if "%1" equ "get" (
    flutter pub get && cd %~dp0
)
if "%1" equ "clean" (
    flutter clean && flutter pub get && cd %~dp0
)
if "%1" equ "test" (
    flutter test
)
if "%1" equ "build" (
    flutter build appbundle --release && cd %~dp0
)
if "%1" equ "publish" (
    @REM dart pub publish --dry-run
    dart pub publish
)
if "%1" equ "version" (
    flutter --version && cd %~dp0
)
echo COMPLETE
