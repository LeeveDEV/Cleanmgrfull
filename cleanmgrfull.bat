@echo off
echo script created by LeeveDEV on Github
title cleaning...
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
cls
:::
:::
:::   _____ _                            
:::  / ____| |                           
::: | |    | | ___  __ _ _ __   ___ _ __ 
::: | |    | |/ _ \/ _` | '_ \ / _ \ '__|
::: | |____| |  __/ (_| | | | |  __/ |   
:::  \_____|_|\___|\__,_|_| |_|\___|_|   
:::                                   
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A      
pause  
start cleanmgr.exe /VERYLOWDISK
exit