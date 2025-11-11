@echo off
echo ====================================================
echo   Running Java Document Manager (Debug)
echo ====================================================
echo.

set JAR_NAME=doc-manager-app-debug-1.0.0.jar
set JAR_PATH=target\%JAR_NAME%

echo [INFO] Looking for JAR file at: %JAR_PATH%
echo.

if not exist %JAR_PATH% (
    echo [ERROR] JAR file not found: %JAR_PATH%
    echo Please run 'compile.bat' first to build the project.
    echo.
    pause
    exit /b 1
)

echo [INFO] Starting the application...
echo All console output (including INFO, DEBUG, and ERROR) will appear below.
echo.
:: Run the fat JAR
java -jar %JAR_PATH%

echo.
echo ====================================================
echo   Application has exited.
echo ====================================================
pause