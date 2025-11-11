@echo off
echo ====================================================
echo   Compiling Project ^& Downloading Dependencies
echo ====================================================
echo.
echo Compiling the project and downloading dependencies with Maven...
echo This may take a minute on the first run.
echo.
echo [DEBUG] Reached line 10. About to check for Maven.
echo [DEBUG] Running 'mvn -v' command RIGHT NOW...
echo.

:: --- SUPER DEBUG BLOCK ---
:: We will NOT hide the output of 'mvn -v' this time.
:: Any errors from 'mvn' itself will be printed.

::
:: FIXED: Added 'CALL' so that control returns to this batch file.
::
CALL mvn -v

:: Now, let's explicitly capture and print the error level.
set MAVEN_ERROR=%errorlevel%
echo.
echo [DEBUG] 'mvn -v' command finished.
echo [DEBUG] ErrorLevel is: %MAVEN_ERROR%
:: --- END SUPER DEBUG BLOCK ---

if %MAVEN_ERROR% neq 0 (
    echo [ERROR] 'mvn' command failed or was not found.
    :: FIXED: Corrected typo from MAVER_ERROR to MAVEN_ERROR
    echo [ERROR] The error level %MAVEN_ERROR% indicates a problem.
    echo Please install Apache Maven and ensure it is in your system's PATH.
    echo You can download it from: https://maven.apache.org/download.cgi
    echo.
    pause
    exit /b 1
)

echo.
echo [INFO] Maven check successful. Running Maven build...
::
:: FIXED: Added 'CALL' here as well for the main build command.
::
CALL mvn clean package
if %errorlevel% neq 0 (
    echo [ERROR] Maven build failed. See output above for details.
    echo.
    pause
    exit /b 1
)

echo.
echo [SUCCESS] Build successful!
echo The runnable JAR is in the 'target' directory.
echo.
pause
