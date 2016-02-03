@ECHO OFF

IF "%CD%\"=="%~dp0" CD /d "%~dp0"

ECHO [STATUS] Current working directory, "%CD%".
ECHO [WARNING] This script will rewrite and nullify the entire Blamscript archive.
PAUSE

IF EXIST %CD%\dump.txt DEL %CD%\dump.txt
FOR /f %%P IN ('DIR /d/s/b *.taglist') DO ECHO [FOUND] %%~nxP
FOR /f %%P IN ('DIR /d/s/b *.taglist') DO ECHO %%~nxP >> dump.txt
ECHO [STATUS] All found .taglist files published at "%CD%\dump.txt".
ECHO [WARNING] This will rewrite and nullify the entire Blamscript archive.
PAUSE

ECHO [STATUS] Trashing current Blamscript archive . . .
FOR /f %%F IN ('DIR /d/s/b tag*') DO RD /s /q %%F && ECHO [REMOVED] %%F
ECHO [STATUS] Rewriting a blank Blamscript archive . . .
ECHO [STATUS] tag1 . . .
FOR /f %%P IN ('DIR /d/s/b *tag1.taglist') DO MKDIR %%~dpPtag1 & FOR /F %%T IN (%%P) DO TYPE nul > %%~dpPtag1\%%T && ECHO [WRITING] %%T
ECHO [STATUS] tag2 . . .
FOR /f %%P IN ('DIR /d/s/b *tag2.taglist') DO MKDIR %%~dpPtag2 & FOR /F %%T IN (%%P) DO TYPE nul > %%~dpPtag2\%%T && ECHO [WRITING] %%T
ECHO [STATUS] tag3 . . .
FOR /f %%P IN ('DIR /d/s/b *tag3.taglist') DO MKDIR %%~dpPtag3 & FOR /F %%T IN (%%P) DO TYPE nul > %%~dpPtag3\%%T && ECHO [WRITING] %%T
ECHO [STATUS] Done!
PAUSE
