rem echo "CURRENT PATH"
rem echo %path%

@echo off
setlocal
if "%~1"=="" (
    set PATHQ=%PATH%
) else (
    set PATHQ=%~1 )
:WHILE
    if "%PATHQ%"=="" goto WEND
    for /F "delims=;" %%i in ("%PATHQ%") do echo %%i
    for /F "delims=; tokens=1,*" %%i in ("%PATHQ%") do set PATHQ=%%j
    goto WHILE
:WEND

rem @echo on
rem echo "ANOTHER TEST"
rem echo %PATH% | find /C /I "<string>"
pause
