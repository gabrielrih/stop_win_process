:: It kills a Windows process

@echo off

GOTO :CHECAPERMISSAO
GOTO :EXECUTAPROCESSO

:CHECAPERMISSAO
net session >nul 2>&1
if %errorLevel% EQU 0 (
	REM echo Everything is fine
) else (
	echo ERROR: Run as administrator.
	echo.
	pause
	exit /B
)

:EXECUTAPROCESSO
taskkill /fi "imagename eq ProcessName" /f
:: You also can use wildcard
:: taskkill /fi "imagename eq ProcessName* " /f  
timeout 2