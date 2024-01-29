@echo off

set "file="
set "pswd="

:getopts
if "%~1"=="" goto :file_Prepinac
if i/ "%~1"=="-file" (
    set "file=%~2"
    shift
    shift
    goto :getopts
)

:file_Prepinac
if not defined file (
    echo Prepinac -file je povinny.
Konec skriptu.
    exit /b 1
)

for /f "tokens=1-4" %%a in (%file%) do (
    set "jmeno=%%a"
    set "fullname=%%a %%b"
    set "pswd=%%c"
    set "group=%%d"
    echo !jmeno! !fullname! !pswd! !group!

    net !jmeno! !pswd! /add /fullname: "!fullname!"
    net localgroup !group! !jmeno! /add

    echo Uzivatel !fullname! 
    vytvoren s heslem !pswd!
    a pridan do skupiny !group!
)