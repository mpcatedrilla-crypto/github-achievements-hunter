@echo off
:: GitHub Achievements Hunter for Windows
:: Batch script version

echo ======================================
echo   🏆 GitHub Achievements Hunter
echo ======================================
echo.

:: Check for GitHub CLI
where gh >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ GitHub CLI (gh) not found!
    echo Install from: https://cli.github.com/
    exit /b 1
)

:: Check authentication
ghe auth status >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Not authenticated. Run: gh auth login
    exit /b 1
)

echo ✅ GitHub CLI ready
echo.

:MENU
echo Select achievement:
echo.
echo   1) 🦈 Pull Shark - Merge PRs
echo   2) 🤪 YOLO - Merge without review
echo   3) 👥 Pair Extraordinaire - Co-authored commits
echo   4) ⚡ Quickdraw - Fast close
echo   5) ⭐ Starstruck - Check star progress
echo   6) Exit
echo.

set /p choice="Enter choice [1-6]: "

if "%choice%"=="1" goto PULLSHARK
if "%choice%"=="2" goto YOLO
if "%choice%"=="3" goto PAIR
if "%choice%"=="4" goto QUICKDRAW
if "%choice%"=="5" goto STARSTRUCK
if "%choice%"=="6" exit /b 0

goto MENU

:PULLSHARK
echo.
echo 🦈 Pull Shark - Create and merge a PR
echo.
set /p count="How many PRs? [1]: "
if "%count%"=="" set count=1

:: Use PowerShell for git operations
powershell -Command "& {
    for ($i=1; $i -le %count%; $i++) {
        $branch = 'pull-shark-' + [DateTimeOffset]::UtcNow.ToUnixTimeSeconds() + '-' + $i
        git checkout -b $branch 2>$null
        'Update ' + $i + ' - ' + (Get-Date) | Out-File -Append pull-shark.log
        git add . 2>$null
        git commit -m ('docs: pull shark update #' + $i) 2>$null
        git push -u origin $branch 2>$null
        
        $pr = gh pr create --title ('Pull Shark #' + $i) --body 'Achievement PR' 2>$null
        if ($pr) {
            $prNum = ($pr -split '/')[-1]
            Start-Sleep -s 2
            gh pr merge $prNum --squash --delete-branch 2>$null
            Write-Host ('  ✓ Merged PR #' + $prNum)
        }
        git checkout main 2>$null
        Write-Host ('  Progress: ' + $i + '/%count%')
    }
}"
echo.
echo ✅ Pull Shark batch complete!
pause
goto MENU

:YOLO
echo.
echo 🤪 YOLO - Merge without review
echo.
powershell -Command "& {
    $branch = 'yolo-' + [DateTimeOffset]::UtcNow.ToUnixTimeSeconds()
    git checkout -b $branch 2>$null
    'YOLO test ' + (Get-Date) | Out-File -Append yolo.log
    git add . 2>$null
    git commit -m 'feat: yolo test' 2>$null
    git push -u origin $branch 2>$null
    
    $pr = gh pr create --title 'YOLO Test' --body 'Merge without review' 2>$null
    if ($pr) {
        $prNum = ($pr -split '/')[-1]
        Start-Sleep -s 2
        gh pr merge $prNum --admin --delete-branch 2>$null
        Write-Host ('  ✓ Merged PR #' + $prNum + ' without review!')
    }
    git checkout main 2>$null
}"
echo.
echo ✅ YOLO attempt complete!
pause
goto MENU

:PAIR
echo.
echo 👥 Pair Extraordinaire - Co-authored commits
echo.
set /p count="How many commits? [1]: "
if "%count%"=="" set count=1

powershell -Command "& {
    $email1 = git config user.email
    $name1 = git config user.name
    for ($i=1; $i -le %count%; $i++) {
        $branch = 'pair-' + [DateTimeOffset]::UtcNow.ToUnixTimeSeconds() + '-' + $i
        git checkout -b $branch 2>$null
        'Co-authored update ' + $i | Out-File -Append pair-extraordinaire.log
        git add . 2>$null
        git commit -m ('feat: pair extraordinaire #' + $i + '`n`nCo-authored-by: ' + $name1 + ' <' + $email1 + '>`nCo-authored-by: Co-Author <coauthor@example.com>') 2>$null
        git push -u origin $branch 2>$null
        
        $pr = gh pr create --title ('Pair #' + $i) --body 'Co-authored commit' 2>$null
        if ($pr) {
            $prNum = ($pr -split '/')[-1]
            Start-Sleep -s 2
            gh pr merge $prNum --squash --delete-branch 2>$null
        }
        git checkout main 2>$null
    }
}"
echo.
echo ✅ Pair Extraordinaire batch complete!
pause
goto MENU

:QUICKDRAW
echo.
echo ⚡ Quickdraw - Close within 5 minutes
echo.
powershell -Command "& {
    $issue = gh issue create --title ('Quickdraw ' + (Get-Date).ToString()) --body 'Fast close test' 2>$null
    if ($issue) {
        $num = ($issue -split '/')[-1]
        gh issue close $num 2>$null
        Write-Host ('  ✓ Closed issue #' + $num)
    }
    
    $branch = 'quickdraw-' + [DateTimeOffset]::UtcNow.ToUnixTimeSeconds()
    git checkout -b $branch 2>$null
    'quickdraw' | Out-File quickdraw.log
    git add . 2>$null
    git commit -m 'chore: quickdraw' 2>$null
    git push -u origin $branch 2>$null
    
    $pr = gh pr create --title 'Quickdraw PR' --body 'Fast close' 2>$null
    if ($pr) {
        $prNum = ($pr -split '/')[-1]
        Start-Sleep -s 1
        gh pr close $prNum 2>$null
        Write-Host ('  ✓ Closed PR #' + $prNum)
    }
    git checkout main 2>$null
}"
echo.
echo ✅ Quickdraw attempts complete!
pause
goto MENU

:STARSTRUCK
echo.
echo ⭐ Starstruck - Checking star progress...
gh repo list --limit 50 --json name,stargazersCount
pause
goto MENU
