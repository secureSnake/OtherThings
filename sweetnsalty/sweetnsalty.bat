@echo off
echo Finding something sweet...
dir /p *.config *.conf *.ini /s/b > sweet.txt

echo Searching for something salty...
for /F "usebackq tokens=*" %%A in ("sweet.txt") do (

    findstr "password passwd pass" %%A >nul 2>&1 
    if not errorlevel 1 echo %%A >> "salty.txt"
)

for %%a in ("salty.txt") do (
set length=%%~za
if length == 0 do echo Found nothing interesting.
if length gtr 0 ( 
    echo Found something interesting in: 
    type salty.txt
    )
)

del /f sweet.txt
del /f salty.txt