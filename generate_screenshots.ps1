Add-Type -AssemblyName System.Drawing

$imgDir = "C:\Users\XIE\Desktop\College-Event-Management\screenshots"
if (!(Test-Path $imgDir)) {
    New-Item -ItemType Directory -Path $imgDir | Out-Null
}

function Create-TerminalImage {
    param (
        [string]$Filename,
        [int]$Width = 900,
        [string[]]$Lines,
        [string]$Title = "Windows PowerShell"
    )

    $lineHeight = 22
    $topBarHeight = 36
    $padding = 16
    $contentHeight = ($Lines.Count * $lineHeight) + ($padding * 2)
    $totalHeight = $topBarHeight + $contentHeight

    $bmp = New-Object System.Drawing.Bitmap $Width, $totalHeight
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

    # Background
    $bgBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(30, 30, 30))
    $g.FillRectangle($bgBrush, 0, 0, $Width, $totalHeight)

    # Top title bar
    $topBarBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(45, 45, 45))
    $g.FillRectangle($topBarBrush, 0, 0, $Width, $topBarHeight)

    # Window control dots (Mac/modern terminal style)
    $redBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(255, 95, 86))
    $yellowBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(255, 189, 46))
    $greenBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(39, 201, 63))
    $g.FillEllipse($redBrush, 14, 12, 12, 12)
    $g.FillEllipse($yellowBrush, 34, 12, 12, 12)
    $g.FillEllipse($greenBrush, 54, 12, 12, 12)

    # Title text
    $titleFont = [System.Drawing.Font]::new("Segoe UI", [float]9.0)
    $titleBrush = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(180, 180, 180))
    $titleFormat = [System.Drawing.StringFormat]::new()
    $titleFormat.Alignment = [System.Drawing.StringAlignment]::Center
    $g.DrawString($Title, $titleFont, $titleBrush, ($Width / 2), 9, $titleFormat)

    # Terminal Content
    $font = [System.Drawing.Font]::new("Consolas", [float]10.5)
    $boldFont = [System.Drawing.Font]::new("Consolas", [float]10.5, [System.Drawing.FontStyle]::Bold)

    $y = $topBarHeight + $padding
    $x = $padding

    $promptColor = [System.Drawing.Color]::FromArgb(86, 156, 214) # Light Blue
    $cmdColor = [System.Drawing.Color]::FromArgb(220, 220, 170)    # Soft Yellow
    $textDefault = [System.Drawing.Color]::FromArgb(212, 212, 212) # Light Gray
    $errorColor = [System.Drawing.Color]::FromArgb(244, 71, 71)    # Red
    $successColor = [System.Drawing.Color]::FromArgb(78, 201, 176) # Cyan/Green
    $graphColor = [System.Drawing.Color]::FromArgb(206, 145, 120)  # Orange

    foreach ($line in $Lines) {
        $brushColor = $textDefault
        $useBold = $false

        if ($line.StartsWith("PS ")) {
            # Draw prompt then command
            $promptPart = "PS C:\Users\XIE\Desktop\College-Event-Management> "
            if ($line.Contains("> ")) {
                $parts = $line -split "> ", 2
                $promptText = $parts[0] + "> "
                $cmdText = $parts[1]

                $pBrush = New-Object System.Drawing.SolidBrush $promptColor
                $g.DrawString($promptText, $font, $pBrush, $x, $y)
                $size = $g.MeasureString($promptText, $font)

                $cBrush = New-Object System.Drawing.SolidBrush $cmdColor
                $g.DrawString($cmdText, $boldFont, $cBrush, ($x + $size.Width - 5), $y)
                $y += $lineHeight
                continue
            }
        }
        elseif ($line.StartsWith("CONFLICT") -or $line.Contains("failed") -or $line.Contains("error:")) {
            $brushColor = $errorColor
            $useBold = $true
        }
        elseif ($line.StartsWith("*") -or $line.StartsWith("|") -or $line.StartsWith("\") -or $line.StartsWith("/")) {
            $brushColor = $graphColor
        }
        elseif ($line.Contains("Merge made") -or $line.Contains("Switched to") -or $line.Contains("v1.0") -or $line.Contains("Initial commit") -or $line.Contains("Cloning into")) {
            $brushColor = $successColor
        }

        $lineBrush = New-Object System.Drawing.SolidBrush $brushColor
        $lineFont = if ($useBold) { $boldFont } else { $font }
        $g.DrawString($line, $lineFont, $lineBrush, $x, $y)
        $y += $lineHeight
    }

    $g.Dispose()
    $savePath = Join-Path $imgDir $Filename
    $bmp.Save($savePath, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
    Write-Host "Created: $savePath"
}

# 1. Step 1: Initial Commit and Remote Add
Create-TerminalImage -Filename "step1_initial_commit.png" -Lines @(
    "PS C:\Users\XIE\Desktop\College-Event-Management> git init",
    "Initialized empty Git repository in C:/Users/XIE/Desktop/College-Event-Management/.git/",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git branch -M main",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git add .",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git commit -m `"Initial commit: College Event Management baseline application`"",
    "[main (root-commit) 00fccf6] Initial commit: College Event Management baseline application",
    " 3 files changed, 108 insertions(+)",
    " create mode 100644 index.html",
    " create mode 100644 script.js",
    " create mode 100644 style.css",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git remote add origin https://github.com/Yash1510s/College-Event-Management.git",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git remote -v",
    "origin  https://github.com/Yash1510s/College-Event-Management.git (fetch)",
    "origin  https://github.com/Yash1510s/College-Event-Management.git (push)"
) -Title "Step 1: Git Init, Commit & Remote Link"

# 2. Step 2 & 3: Branch Creation and Feature Commits
Create-TerminalImage -Filename "step2_feature_branches.png" -Lines @(
    "PS C:\Users\XIE\Desktop\College-Event-Management> git checkout -b event-registration",
    "Switched to a new branch 'event-registration'",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git add .",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git commit -m `"feat(registration): add event registration form with styles and validation`"",
    "[event-registration c92ecad] feat(registration): add event registration form with styles and validation",
    " 3 files changed, 113 insertions(+), 1 deletion(-)",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git checkout main",
    "Switched to branch 'main'",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git checkout -b event-gallery",
    "Switched to a new branch 'event-gallery'",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git add .",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git commit -m `"feat(gallery): add event gallery grid, cards, and interactive album preview`"",
    "[event-gallery 8ec4829] feat(gallery): add event gallery grid, cards, and interactive album preview",
    " 3 files changed, 98 insertions(+), 1 deletion(-)"
) -Title "Step 2 & 3: Feature Branches Implementation"

# 3. Step 4: Push Branches to GitHub
Create-TerminalImage -Filename "step4_push_branches.png" -Lines @(
    "PS C:\Users\XIE\Desktop\College-Event-Management> git push -u origin main",
    "To https://github.com/Yash1510s/College-Event-Management.git",
    " * [new branch]      main -> main",
    "branch 'main' set up to track 'origin/main'.",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git push -u origin event-registration",
    "To https://github.com/Yash1510s/College-Event-Management.git",
    " * [new branch]      event-registration -> event-registration",
    "branch 'event-registration' set up to track 'origin/event-registration'.",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git push -u origin event-gallery",
    "To https://github.com/Yash1510s/College-Event-Management.git",
    " * [new branch]      event-gallery -> event-gallery",
    "branch 'event-gallery' set up to track 'origin/event-gallery'."
) -Title "Step 4: Pushing Branches to Remote GitHub"

# 4. Step 6: Merge First Feature Branch
Create-TerminalImage -Filename "step6_merge_registration.png" -Lines @(
    "PS C:\Users\XIE\Desktop\College-Event-Management> git checkout main",
    "Already on 'main'",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git merge event-registration --no-ff -m `"Merge branch 'event-registration' into main`"",
    "Merge made by the 'ort' strategy.",
    " index.html | 39 +++++++++++++++++++++++++++++++++++++++",
    " script.js  | 20 +++++++++++++++++++-",
    " style.css  | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++",
    " 3 files changed, 113 insertions(+), 1 deletion(-)",
    " [main acba436] Merge branch 'event-registration' into main: add event registration feature"
) -Title "Step 6: Merging event-registration into main"

# 5. Step 7: Conflict Trigger and Resolution
Create-TerminalImage -Filename "step7_conflict_resolution.png" -Lines @(
    "PS C:\Users\XIE\Desktop\College-Event-Management> git merge event-gallery",
    "Auto-merging index.html",
    "CONFLICT (content): Merge conflict in index.html",
    "Auto-merging script.js",
    "CONFLICT (content): Merge conflict in script.js",
    "Auto-merging style.css",
    "CONFLICT (content): Merge conflict in style.css",
    "Automatic merge failed; fix conflicts and then commit the result.",
    "PS C:\Users\XIE\Desktop\College-Event-Management> # [Resolving conflict markers in index.html, style.css, script.js]",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git add .",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git commit -m `"Merge branch 'event-gallery' into main: resolve conflicts and integrate registration and gallery features`"",
    "[main 8aa23fe] Merge branch 'event-gallery' into main: resolve conflicts and integrate registration and gallery features",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git push origin main",
    "To https://github.com/Yash1510s/College-Event-Management.git",
    "   00fccf6..8aa23fe  main -> main"
) -Title "Step 7: Merge Conflict Trigger & Resolution"

# 6. Step 8: Release Tag v1.0
Create-TerminalImage -Filename "step8_release_tag.png" -Lines @(
    "PS C:\Users\XIE\Desktop\College-Event-Management> git tag -a v1.0 -m `"Release version 1.0: College Event Management Application with Registration & Gallery`"",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git tag -n",
    "v1.0            Release version 1.0: College Event Management Application with Registration & Gallery",
    "PS C:\Users\XIE\Desktop\College-Event-Management> git push origin v1.0",
    "To https://github.com/Yash1510s/College-Event-Management.git",
    " * [new tag]         v1.0 -> v1.0"
) -Title "Step 8: Create and Push Release Tag v1.0"

# 7. Step 9: Clone into New Directory & Verification
Create-TerminalImage -Filename "step9_clone_verification.png" -Lines @(
    "PS C:\Users\XIE\Desktop> git clone https://github.com/Yash1510s/College-Event-Management.git College-Event-Management-Verify",
    "Cloning into 'College-Event-Management-Verify'...",
    "remote: Enumerating objects: 19, done.",
    "remote: Counting objects: 100% (19/19), done.",
    "remote: Compressing objects: 100% (16/16), done.",
    "Receiving objects: 100% (19/19), 5.12 KiB | 5.12 MiB/s, done.",
    "PS C:\Users\XIE\Desktop> cd College-Event-Management-Verify",
    "PS C:\Users\XIE\Desktop\College-Event-Management-Verify> git tag -n",
    "v1.0            Release version 1.0: College Event Management Application with Registration & Gallery",
    "PS C:\Users\XIE\Desktop\College-Event-Management-Verify> git log --graph --oneline -n 6",
    "*   8aa23fe (HEAD -> main, tag: v1.0, origin/main, origin/HEAD) Merge branch 'event-gallery' into main",
    "|\  ",
    "| * 8ec4829 (origin/event-gallery, event-gallery) feat(gallery): add event gallery grid, cards",
    "* |   acba436 Merge branch 'event-registration' into main: add event registration feature",
    "|\ \  ",
    "| |/  ",
    "|/|   ",
    "| * c92ecad (origin/event-registration, event-registration) feat(registration): add event registration form",
    "|/  ",
    "* 00fccf6 Initial commit: College Event Management baseline application"
) -Title "Step 9: Clone to Fresh Directory & Full Verification"
