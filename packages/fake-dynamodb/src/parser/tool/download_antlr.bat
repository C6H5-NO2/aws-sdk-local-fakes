@echo off
setlocal enabledelayedexpansion
set "filename=antlr.jar"
set "url=https://www.antlr.org/download/antlr-4.13.2-complete.jar"
set "sha256=eae2dfa119a64327444672aff63e9ec35a20180dc5b8090b7a6ab85125df4d76"

if exist "%filename%" del /q "%filename%"

curl -fsSL -o "%filename%" "%url%"
if %errorlevel% neq 0 exit /b 1

certutil -hashfile "%filename%" sha256
rem todo: auto check shasum
