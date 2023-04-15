@echo off
@REM echo %%0 = %0
echo %%1 = %1

@REM for cd -
PUSHD %CD%
@REM cd C:\Windows && pwd && POPD

IF "%1"=="get" (
    flutter pub get
) ELSE IF "%1"=="run" (
    cd %CD%/example
    flutter run --debug -d windows
    POPD
) ELSE IF "%1"=="test" (
    flutter test
) ELSE IF "%1"=="build" (
    flutter pub run build_runner build
) ELSE (
    flutter --version
)