@echo off
REM Usage: push_to_remote.bat <git-remote-url>
if "%~1"=="" (
  echo Usage: push_to_remote.bat ^<git-remote-url^>
  exit /b 1
)
set REMOTE=%~1

git init
git add .
git commit -m "Initial project import"
git remote add origin %REMOTE%
git branch -M main
git push -u origin main

echo Done.
