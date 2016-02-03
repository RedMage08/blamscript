@ECHO OFF

IF "%CD%\"=="%~dp0" CD /d "%~dp0"

ECHO [STATUS] Current working directory, "%CD%".
ECHO [WARNING] This test script will nullify the entire Blamscript archive.
PAUSE

FOR /f %%F IN ('DIR /d/s/b tag*') DO RD /s /q %%F && ECHO [REMOVED] %%F
PAUSE
