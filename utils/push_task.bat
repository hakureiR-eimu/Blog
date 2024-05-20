@echo off

if "%~1"=="" (
    hugo
    echo Update:default
    git add -f ../public/
    git commit -m "chore:update static and pubilc"
    git push origin main
) else (
    hugo
    echo %~1
    git add -f ../public/
    git commit -m %1
    git push origin main
)
