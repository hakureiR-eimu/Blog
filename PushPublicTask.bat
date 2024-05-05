@echo off

if "%~1"=="" (
    echo Update:default
    git add -f public/
    git commit -m "Update:default"
    git push origin main
) else (
    echo %~1
    git add -f public/
    git commit -m %1
    git push origin main
)
