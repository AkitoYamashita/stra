@echo off
@REM echo %%0 = %0
echo %%1 = %1

cd %~dp0

IF "%1"=="get" (
    flutter pub get
) ELSE IF "%1"=="run" (
    cd example && flutter run --debug -d windows && cd %~dp0
) ELSE IF "%1"=="test" (
    flutter test
) ELSE IF "%1"=="build" (
    flutter pub run build_runner build
) ELSE IF "%1"=="publish" (
    @REM dart pub publish --dry-run
    dart pub publish
) ELSE (
    flutter --version
)