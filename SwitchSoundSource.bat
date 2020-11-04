@echo off
rem.--- Prepare the Command Processor ---
SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION

rem.--define the filename where persistent variables get storred
rem. just add a + to the name of THIS file, i.e. "DosTips.bat" - "DosTips+.bat"
set FilePersist=%~dpn0+%~x0

rem.--initialize the variables
call:setPersist defaultSoundSource=""
call:setPersist soundSource0=""
call:setPersist soundSource1=""

rem.--restore the persistent variables
call:restorePersistentVars "%FilePersist%

rem.--show current settings
echo.Currently the variables are:
echo.
echo. defaultSoundSource=%defaultSoundSource%
echo. soundSource0=%soundSource0%
echo. soundSource1=%soundSource1%
echo

rem.-- Set opposite of current defaultSoundSource
if %defaultSoundSource%==%soundSource0% (SET defaultSoundSource=%soundSource1%) else (SET defaultSoundSource=%soundSource0%) 
nircmd setdefaultsounddevice %defaultSoundSource%

rem.--Save persistent data
call:savePersistentVars "%FilePersist%"

GOTO:EOF
:-----------------------------------------------------

:-- functions to be added below here

:-----------------------------------------------------

:setPersist -- to be called to initialize persistent variables
: -- %*: set command arguments
set %*
GOTO:EOF

:getPersistentVars -- returns a comma separated list of persistent variables
: -- %~1: reference to return variable
SETLOCAL
set retlist=
set parse=findstr /i /c:"call:setPersist" "%~f0%"^|find /v "ButNotThisLine"
for /f "tokens=2 delims== " %%a in ('"%parse%"') do (set retlist=!retlist!%%a,)
( ENDLOCAL & REM RETURN VALUES
IF "%~1" NEQ "" SET %~1=%retlist%
)
GOTO:EOF

:savePersistentVars -- Save values of persistent variables into a file
: -- %~1: file name
SETLOCAL
echo.>"%~1"
call :getPersistentVars persvars
for %%a in (%persvars%) do (echo.SET %%a=!%%a!>>"%~1")
GOTO:EOF

:restorePersistentVars -- Restore the values of the persistent variables
: -- %~1: batch file name to restore from
if exist "%FilePersist%" call "%FilePersist%"
GOTO:EOF