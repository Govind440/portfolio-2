@echo off
set PATH=%PATH%;"C:\Program Files\Git\bin"
REM Check if .git directory exists
IF NOT EXIST ".git" (
    echo Initializing git repository...
    "C:\Program Files\Git\bin\git.exe" init
) ELSE (
    echo Git repository already initialized.
)

REM Add all files to staging
echo Adding files to git...
"C:\Program Files\Git\bin\git.exe" add .

REM Commit changes
echo Committing changes...
"C:\Program Files\Git\bin\git.exe" commit -m "Deploy project commit"

REM Rename branch to main
echo Renaming branch to main...
"C:\Program Files\Git\bin\git.exe" branch -M main

REM Check if remote origin is set
git remote get-url origin >nul 2>&1
IF ERRORLEVEL 1 (
    echo Adding remote origin...
    git remote add origin https://github.com/Govind440/NEW-Portfolio-.git
) ELSE (
    echo Remote origin already set.
)

REM Push to GitHub
echo Pushing to GitHub...
git push -u origin main

REM Deploy to Vercel
echo Deploying to Vercel...
vercel --prod

echo Deployment complete.
pause
