@echo off
cls
set file=0
set UniverScript_DISKFULL_MAX_=10000000000000

:disk
SET/p Disk=请输入【需要被填满的磁盘分区】的盘符：
echo.
set %Disk%=%Disk:~0,1%
IF NOT EXIST "%disk%:\" (goto disk)
md %disk%:\UniverScript_DISKFULL_
attrib +s +h %disk%:\UniverScript_DISKFULL_

:start
set /a file=%file%+1
echo 正在填充第 %file% 个文件，文件大小：%UniverScript_DISKFULL_MAX_% 字节
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
echo 目标磁盘已经被完全填满！
