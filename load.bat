@echo off

@REM get config variables
for /f "eol=- delims=" %%a in (settings.config) do set "%%a"

@REM save important paths as variables
set savedir=.\data\%save_name%
set larian_savedir=%larian_target%\%save_name%

@REM find latest directory in alphabetical order
for /f "tokens=* delims=" %%a in ('dir %savedir% /AD /B /O-D') do (
    set lastsave=%%a
    goto break
)
:break

@REM copy directory to larian save directory
xcopy %savedir%\%lastsave% %larian_saves%\%save_name% /i /y