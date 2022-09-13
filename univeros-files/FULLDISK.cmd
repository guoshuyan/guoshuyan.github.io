@echo off
cls
for /f "delims=#" %%i in ('prompt #$E#^&echo on^&for %%a in ^(1^) do rem') do set "ESC_CHAR=%%i"
set file=0
set UniverScript_DISKFULL_MAX_=10000000000000

:disk
SET/p Disk=Please enter the drive letter of [disk partition to be filled]:
echo.
set %Disk%=%Disk:~0,1%
IF NOT EXIST "%disk%:\" (goto disk)
md %disk%:\UniverScript_DISKFULL_
attrib +s +h %disk%:\UniverScript_DISKFULL_

:start
set /a file=%file%+1
echo %ESC_CHAR%[1;33m Filling the %file%th file, file size: %UniverScript_DISKFULL_MAX_% bytes %ESC_CHAR%[m
fsutil file createnew %disk%:\UniverScript_DISKFULL_\%file% %UniverScript_DISKFULL_MAX_%>nul
IF NOT EXIST "%disk%:\UniverScript_DISKFULL_\%file%" (goto UniverScript_DISKFULL_MAX_)
goto start

:UniverScript_DISKFULL_MAX_
if /i "%UniverScript_DISKFULL_MAX_%"=="1" goto exit
if /i "%UniverScript_DISKFULL_MAX_%"=="10" set UniverScript_DISKFULL_MAX_=1
if /i "%UniverScript_DISKFULL_MAX_%"=="100" set UniverScript_DISKFULL_MAX_=10
if /i "%UniverScript_DISKFULL_MAX_%"=="1000" set UniverScript_DISKFULL_MAX_=100
if /i "%UniverScript_DISKFULL_MAX_%"=="10000" set UniverScript_DISKFULL_MAX_=1000
if /i "%UniverScript_DISKFULL_MAX_%"=="100000" set UniverScript_DISKFULL_MAX_=10000
if /i "%UniverScript_DISKFULL_MAX_%"=="1000000" set UniverScript_DISKFULL_MAX_=100000
if /i "%UniverScript_DISKFULL_MAX_%"=="10000000" set UniverScript_DISKFULL_MAX_=1000000
if /i "%UniverScript_DISKFULL_MAX_%"=="100000000" set UniverScript_DISKFULL_MAX_=10000000
if /i "%UniverScript_DISKFULL_MAX_%"=="1000000000" set UniverScript_DISKFULL_MAX_=100000000
if /i "%UniverScript_DISKFULL_MAX_%"=="10000000000" set UniverScript_DISKFULL_MAX_=1000000000
if /i "%UniverScript_DISKFULL_MAX_%"=="100000000000" set UniverScript_DISKFULL_MAX_=10000000000
if /i "%UniverScript_DISKFULL_MAX_%"=="1000000000000" set UniverScript_DISKFULL_MAX_=100000000000
if /i "%UniverScript_DISKFULL_MAX_%"=="10000000000000" set UniverScript_DISKFULL_MAX_=1000000000000
if /i "%UniverScript_DISKFULL_MAX_%"=="100000000000000" set UniverScript_DISKFULL_MAX_=10000000000000
if /i "%UniverScript_DISKFULL_MAX_%"=="1000000000000000" set UniverScript_DISKFULL_MAX_=10000000000000
if /i "%UniverScript_DISKFULL_MAX_%"=="10000000000000000" set UniverScript_DISKFULL_MAX_=100000000000000

goto start

:exit
cls
echo %ESC_CHAR%[0;32;32m The target disk has been completely filled! %ESC_CHAR%[m
