@echo off

@REM get config variables
for /f "eol=- delims=" %%a in (settings.config) do set "%%a"

@REM save important paths as variables
set savedir=.\data\%save_name%
set larian_savedir=%larian_target%\%save_name%

@REM create savefile subdir if it does not exist
if not exist %savedir% mkdir %savedir%

@REM keep saves under max
@REM see if max_saves is defined and a number
if not defined max_saves goto save
set /a max_saves=%max_saves%
set "var="& for /f "delims=0123456789" %%i in ("%max_saves%") do set var=%%i
if defined var goto save
@REM see if we are over limit
set scount=0
for /f %%x in ('dir %savedir% /AD /B') do set /a scount+=1
if %scount% lss %max_saves% goto save
@REM delete oldest savefile
for /f "tokens=* delims=" %%a in ('dir %savedir% /AD /B /OD') do (
    set save_to_delete=%%a
    goto del_oldest
)
:del_oldest
rmdir /S /Q %savedir%\%save_to_delete%

:save
@REM get current date and time
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
for /f "usebackq tokens=1,2 delims==" %%i in (
    `wmic os get LocalDateTime /VALUE 2^>NUL`
) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set newsave=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2%_%ldt:~8,2%-%ldt:~10,2%-%ldt:~12,2%

xcopy %larian_saves%\%save_name% %savedir%\%newsave% /i /y
