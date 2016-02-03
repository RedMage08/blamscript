@ECHO OFF

IF "%CD%\"=="%~dp0" CD /d "%~dp0"

ECHO [STATUS] Current working directory, "%CD%".
ECHO [WARNING] This script will rewrite and nullify the entire Blamscript archive.
PAUSE

IF EXIST %CD%\taglist_filter.txt DEL %CD%\taglist_filter.txt
FOR /f %%P IN ('DIR /d/s/b *.taglist') DO ECHO [FOUND] %%~nxP
FOR /f %%P IN ('DIR /d/s/b *.taglist') DO ECHO %%~nxP >> taglist_filter.txt
ECHO [STATUS] All found .taglist files published at "%CD%\taglist_filter.txt".
ECHO [WARNING] This will rewrite and nullify the entire Blamscript archive.
PAUSE

ECHO [STATUS] Trashing current Blamscript archive . . .
FOR /f %%F IN ('DIR /d/s/b hs*') DO RD /s /q %%F && ECHO [REMOVED] %%F
ECHO [STATUS] Rewriting a blank Blamscript archive . . .
ECHO [STATUS] hsdt
FOR /f %%P IN ('DIR /d/s/b *hsdt.taglist') DO MKDIR %%~dpPhsdt & FOR /F %%T IN (%%P) DO TYPE nul > %%~dpPhsdt\%%T && ECHO [WRITING] %%T
ECHO [STATUS] hscn
FOR /f %%P IN ('DIR /d/s/b *hscn.taglist') DO MKDIR %%~dpPhscn & FOR /F %%T IN (%%P) DO TYPE nul > %%~dpPhscn\%%T && ECHO [WRITING] %%T
ECHO [STATUS] hsc
FOR /f %%P IN ('DIR /d/s/b *hsc.taglist') DO MKDIR %%~dpPhsc & FOR /F %%T IN (%%P) DO TYPE nul > %%~dpPhsc\%%T && ECHO [WRITING] %%T
ECHO [STATUS] Done!
PAUSE
