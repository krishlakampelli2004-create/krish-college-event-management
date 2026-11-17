$screenshotsDir = "C:\Users\XIE\Desktop\College-Event-Management\screenshots"

function Get-Base64Image {
    param([string]$path)
    if (Test-Path $path) {
        $bytes = [System.IO.File]::ReadAllBytes($path)
        return [Convert]::ToBase64String($bytes)
    }
    return ""
}

$img_step1 = Get-Base64Image "$screenshotsDir\step1_initial_commit.png"
$img_step2 = Get-Base64Image "$screenshotsDir\step2_feature_branches.png"
$img_step4 = Get-Base64Image "$screenshotsDir\step4_push_branches.png"
$img_step6 = Get-Base64Image "$screenshotsDir\step6_merge_registration.png"
$img_step7 = Get-Base64Image "$screenshotsDir\step7_conflict_resolution.png"
$img_step8 = Get-Base64Image "$screenshotsDir\step8_release_tag.png"
$img_step9 = Get-Base64Image "$screenshotsDir\step9_clone_verification.png"
$img_vscode = Get-Base64Image "$screenshotsDir\ide_terminal_vscode.jpg"
$img_github = Get-Base64Image "$screenshotsDir\github_repo_online.jpg"

$html = @"
<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns='http://www.w3.org/TR/REC-html40'>
<head>
    <meta charset="utf-8">
    <title>DevOps Practical Report - College Event Management</title>
    <!--[if gte mso 9]>
    <xml>
        <w:WordDocument>
            <w:View>Print</w:View>
            <w:Zoom>100</w:Zoom>
            <w:DoNotOptimizeForBrowser/>
        </w:WordDocument>
    </xml>
    <![endif]-->
    <style>
        @page {
            size: A4;
            margin: 2.54cm 2.54cm 2.54cm 2.54cm;
            mso-page-orientation: portrait;
        }
        body {
            font-family: 'Calibri', 'Segoe UI', Arial, sans-serif;
            font-size: 11pt;
            line-height: 1.5;
            color: #2D3748;
        }
        .cover-page {
            text-align: center;
            padding-top: 60px;
            padding-bottom: 80px;
            page-break-after: always;
        }
        .college-title {
            font-size: 20pt;
            font-weight: bold;
            color: #1A365D;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 8px;
        }
        .dept-title {
            font-size: 14pt;
            color: #4A5568;
            margin-bottom: 40px;
        }
        .report-badge {
            display: inline-block;
            background-color: #2B6CB0;
            color: white;
            font-size: 13pt;
            font-weight: bold;
            padding: 8px 25px;
            border-radius: 4px;
            margin-bottom: 25px;
        }
        .project-title {
            font-size: 24pt;
            font-weight: bold;
            color: #1A365D;
            margin-bottom: 15px;
            line-height: 1.2;
        }
        .project-subtitle {
            font-size: 13pt;
            color: #718096;
            margin-bottom: 60px;
        }
        .meta-box {
            margin: 0 auto;
            width: 75%;
            background-color: #F7FAFC;
            border: 1px solid #E2E8F0;
            border-radius: 8px;
            padding: 20px;
            text-align: left;
        }
        .meta-table {
            width: 100%;
            border-collapse: collapse;
        }
        .meta-table td {
            padding: 8px;
            font-size: 11pt;
        }
        .meta-label {
            font-weight: bold;
            color: #2D3748;
            width: 35%;
        }
        .meta-val {
            color: #2B6CB0;
            font-weight: 600;
        }
        
        h1 {
            font-size: 16pt;
            color: #1A365D;
            border-bottom: 2px solid #2B6CB0;
            padding-bottom: 6px;
            margin-top: 30px;
            margin-bottom: 15px;
            page-break-after: avoid;
        }
        h2 {
            font-size: 13pt;
            color: #2B6CB0;
            margin-top: 22px;
            margin-bottom: 10px;
            page-break-after: avoid;
        }
        p {
            margin-bottom: 12px;
            text-align: justify;
        }
        .step-card {
            background-color: #FFFFFF;
            border: 1px solid #CBD5E0;
            border-left: 5px solid #2B6CB0;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 25px;
            page-break-inside: avoid;
        }
        .step-header {
            font-size: 13pt;
            font-weight: bold;
            color: #1A365D;
            margin-bottom: 10px;
        }
        .code-block {
            background-color: #1E1E1E;
            color: #D4D4D4;
            font-family: 'Consolas', monospace;
            font-size: 9.5pt;
            padding: 12px;
            border-radius: 4px;
            margin: 10px 0;
            white-space: pre-wrap;
            border-left: 4px solid #4EC9B0;
        }
        .screenshot-container {
            text-align: center;
            margin: 15px 0;
            page-break-inside: avoid;
        }
        .screenshot-container img {
            max-width: 95%;
            height: auto;
            border: 1px solid #CBD5E0;
            border-radius: 6px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .figure-caption {
            font-size: 9pt;
            font-style: italic;
            color: #718096;
            margin-top: 6px;
        }
        table.data-table {
            width: 100%;
            border-collapse: collapse;
            margin: 15px 0;
        }
        table.data-table th, table.data-table td {
            border: 1px solid #CBD5E0;
            padding: 8px 12px;
            text-align: left;
            font-size: 10pt;
        }
        table.data-table th {
            background-color: #2B6CB0;
            color: white;
            font-weight: bold;
        }
        table.data-table tr:nth-child(even) {
            background-color: #F7FAFC;
        }
        .alert-note {
            background-color: #EBF8FF;
            border-left: 4px solid #3182CE;
            padding: 10px 14px;
            margin: 12px 0;
            border-radius: 0 4px 4px 0;
        }
        .alert-success {
            background-color: #F0FFF4;
            border-left: 4px solid #38A169;
            padding: 10px 14px;
            margin: 12px 0;
            border-radius: 0 4px 4px 0;
        }
        .viva-q {
            font-weight: bold;
            color: #1A365D;
            margin-top: 14px;
        }
        .viva-a {
            color: #4A5568;
            margin-left: 15px;
            margin-bottom: 12px;
        }
    </style>
</head>
<body>

    <!-- COVER PAGE -->
    <div class="cover-page">
        <div class="college-title">DEPARTMENT OF COMPUTER SCIENCE & ENGINEERING</div>
        <div class="dept-title">DevOps & Cloud Computing Laboratory</div>

        <div style="margin: 40px 0;">
            <span class="report-badge">LAB PRACTICAL REPORT</span>
        </div>

        <div class="project-title">College Event Management Application</div>
        <div class="project-subtitle">End-to-End Implementation of Git Branching, Pull Requests, Merge Conflict Resolution & Release Tagging using GitHub</div>

        <div class="meta-box">
            <table class="meta-table">
                <tr>
                    <td class="meta-label">Student Name:</td>
                    <td class="meta-val">Yash</td>
                </tr>
                <tr>
                    <td class="meta-label">GitHub Username:</td>
                    <td class="meta-val">Yash1510s</td>
                </tr>
                <tr>
                    <td class="meta-label">Subject / Course:</td>
                    <td class="meta-val">DevOps Lab (Git & Version Control)</td>
                </tr>
                <tr>
                    <td class="meta-label">Repository URL:</td>
                    <td class="meta-val"><a href="https://github.com/Yash1510s/College-Event-Management">https://github.com/Yash1510s/College-Event-Management</a></td>
                </tr>
                <tr>
                    <td class="meta-label">Release Tag:</td>
                    <td class="meta-val">v1.0 (Verified)</td>
                </tr>
                <tr>
                    <td class="meta-label">Date of Practical:</td>
                    <td class="meta-val">16 November 2026</td>
                </tr>
            </table>
        </div>
    </div>

    <!-- OBJECTIVE & TOOLS -->
    <h1>1. Aim & Objectives</h1>
    <p>
        <strong>Aim:</strong> To develop a complete <strong>College Event Management</strong> application and master core DevOps distributed version control practices using <strong>Git</strong> and <strong>GitHub</strong>, including repository initialization, feature branch isolation, Pull Request workflows, simulated merge conflict resolution, release tagging, and distribution verification.
    </p>

    <h2>Key Learning Objectives:</h2>
    <ul>
        <li>Understand Distributed Version Control Systems (DVCS) and Git architecture.</li>
        <li>Implement isolated feature development using Git branching workflows (Git-Flow).</li>
        <li>Manage remote synchronization, tracking branches, and remote repositories on GitHub.</li>
        <li>Execute Pull Requests (PR) and code integration into production branches.</li>
        <li>Identify, reproduce, analyze, and resolve <strong>three-way merge conflicts</strong> using standard conflict markers (<code>&lt;&lt;&lt;&lt;&lt;&lt;&lt;</code>, <code>=======</code>, <code>&gt;&gt;&gt;&gt;&gt;&gt;&gt;</code>).</li>
        <li>Create annotated production release tags (<code>v1.0</code>) and verify codebase integrity in an isolated environment.</li>
    </ul>

    <h1>2. Tools & Environment Specifications</h1>
    <table class="data-table">
        <tr>
            <th>Component</th>
            <th>Tool / Specification</th>
            <th>Purpose</th>
        </tr>
        <tr>
            <td><strong>Operating System</strong></td>
            <td>Microsoft Windows 11 (x64)</td>
            <td>Host practical environment</td>
        </tr>
        <tr>
            <td><strong>Version Control</strong></td>
            <td>Git v2.56.1</td>
            <td>Local repository and version management</td>
        </tr>
        <tr>
            <td><strong>Remote Repository</strong></td>
            <td>GitHub (Cloud)</td>
            <td>Central collaboration and release hosting</td>
        </tr>
        <tr>
            <td><strong>Code Editor / IDE</strong></td>
            <td>Antigravity IDE / VS Code</td>
            <td>Application development and terminal session</td>
        </tr>
        <tr>
            <td><strong>Application Tech</strong></td>
            <td>HTML5, CSS3, Vanilla JavaScript</td>
            <td>College Event Management web platform</td>
        </tr>
        <tr>
            <td><strong>Shell</strong></td>
            <td>Windows PowerShell 5.1</td>
            <td>CLI command execution</td>
        </tr>
    </table>

    <div style="page-break-before: always;"></div>

    <!-- PRACTICAL EXECUTION DETAILS -->
    <h1>3. Step-by-Step Practical Implementation</h1>

    <!-- STEP 1 -->
    <div class="step-card">
        <div class="step-header">Step 1: Create a GitHub Repo & Push Baseline Application</div>
        <p>
            The project baseline for the <strong>College Event Management System</strong> consists of <code>index.html</code> (header, upcoming events list, about section), <code>style.css</code> (responsive layout), and <code>script.js</code>. The directory was initialized as a Git repository, committed with an author identity, and linked to the remote GitHub repository.
        </p>
        <div class="code-block">git init
git branch -M main
git config user.name "Yash1510s"
git config user.email "yash1510s@users.noreply.github.com"
git add .
git commit -m "Initial commit: College Event Management baseline application"
git remote add origin https://github.com/Yash1510s/College-Event-Management.git
git push -u origin main</div>
        <div class="screenshot-container">
            <img src="data:image/png;base64,$img_step1" alt="Step 1 Screenshot">
            <div class="figure-caption">Figure 1.1: Git Repository Initialization, Initial Commit, and Remote Configuration</div>
        </div>
    </div>

    <!-- STEP 2 & 3 -->
    <div class="step-card">
        <div class="step-header">Step 2 & 3: Feature Branch Creation & Independent Feature Implementation</div>
        <p>
            Two dedicated feature branches were branched off <code>main</code> to simulate collaborative team development:
        </p>
        <ul>
            <li><strong>Branch 1 (<code>event-registration</code>):</strong> Added an interactive student registration form with fields for Full Name, Student Roll Number, Academic Department, and Event Selection, styled with custom CSS and handled via JavaScript validation.</li>
            <li><strong>Branch 2 (<code>event-gallery</code>):</strong> Added a rich event memories gallery grid showcasing past events (Hackathon, Cultural Fest, RoboWars, Sports Meet) with hover cards, category badges, and interactive click alerts.</li>
        </ul>
        <div class="code-block"># Feature Branch 1
git checkout -b event-registration
# [Implemented Registration Form, CSS & JS handlers]
git add .
git commit -m "feat(registration): add event registration form with styles and validation"

# Feature Branch 2
git checkout main
git checkout -b event-gallery
# [Implemented Photo Gallery Grid, CSS cards & JS preview]
git add .
git commit -m "feat(gallery): add event gallery grid, cards, and interactive album preview"</div>
        <div class="screenshot-container">
            <img src="data:image/png;base64,$img_step2" alt="Step 2 Screenshot">
            <div class="figure-caption">Figure 2.1: Branch Creation and Independent Feature Commits</div>
        </div>
    </div>

    <div style="page-break-before: always;"></div>

    <!-- STEP 4 -->
    <div class="step-card">
        <div class="step-header">Step 4: Push Both Feature Branches to GitHub</div>
        <p>
            Both isolated feature branches were published to GitHub as upstream tracking branches:
        </p>
        <div class="code-block">git push -u origin main
git push -u origin event-registration
git push -u origin event-gallery</div>
        <div class="screenshot-container">
            <img src="data:image/png;base64,$img_step4" alt="Step 4 Screenshot">
            <div class="figure-caption">Figure 4.1: Remote Branch Push Output for main, event-registration, and event-gallery</div>
        </div>
    </div>

    <!-- STEP 5 & 6 -->
    <div class="step-card">
        <div class="step-header">Step 5 & 6: Pull Request Workflow & Merging First Feature into Main</div>
        <p>
            A Pull Request (PR) allows team members to review code before merging into the production branch. On GitHub, PR 1 was initiated from <code>event-registration</code> into <code>main</code>. The feature was merged cleanly using a non-fast-forward merge commit (<code>acba436</code>), maintaining complete traceability of the feature integration.
        </p>
        <div class="code-block">git checkout main
git merge event-registration --no-ff -m "Merge branch 'event-registration' into main: add event registration feature"</div>
        <div class="screenshot-container">
            <img src="data:image/png;base64,$img_step6" alt="Step 6 Screenshot">
            <div class="figure-caption">Figure 6.1: Merging event-registration Branch into Main</div>
        </div>
    </div>

    <div style="page-break-before: always;"></div>

    <!-- STEP 7 -->
    <div class="step-card">
        <div class="step-header">Step 7: Introduce Conflicting Changes & Resolve Merge Conflict</div>
        <p>
            <strong>Conflict Simulation:</strong> Because both <code>event-registration</code> and <code>event-gallery</code> inserted navigation links in the same navbar region and added sections immediately preceding <code>&lt;section id="about"&gt;</code>, attempting to merge <code>event-gallery</code> into the updated <code>main</code> resulted in a genuine three-way merge conflict.
        </p>
        <div class="alert-note">
            <strong>Conflict Notice:</strong> Git stopped automatic integration and inserted standard conflict markers:
            <br><code>&lt;&lt;&lt;&lt;&lt;&lt;&lt; HEAD</code> (Current main content: registration feature)
            <br><code>=======</code> (Conflict boundary)
            <br><code>&gt;&gt;&gt;&gt;&gt;&gt;&gt; event-gallery</code> (Incoming branch content: gallery feature)
        </div>
        <p>
            <strong>Conflict Resolution:</strong> All three files (<code>index.html</code>, <code>style.css</code>, and <code>script.js</code>) were manually resolved to preserve <em>both</em> the Event Registration form and the Event Gallery grid. Conflict markers were stripped, and the resolution was committed as <code>8aa23fe</code> and pushed upstream.
        </p>
        <div class="code-block">git merge event-gallery
# Auto-merging index.html -> CONFLICT (content): Merge conflict in index.html
# Auto-merging script.js -> CONFLICT (content): Merge conflict in script.js
# Auto-merging style.css -> CONFLICT (content): Merge conflict in style.css

# [Resolved conflict markers in index.html, style.css, script.js]
git add .
git commit -m "Merge branch 'event-gallery' into main: resolve conflicts and integrate registration and gallery features"
git push origin main</div>
        <div class="screenshot-container">
            <img src="data:image/png;base64,$img_step7" alt="Step 7 Screenshot">
            <div class="figure-caption">Figure 7.1: Merge Conflict Trigger, Resolution Commit, and Push</div>
        </div>
    </div>

    <!-- STEP 8 -->
    <div class="step-card">
        <div class="step-header">Step 8: Create Annotated Release Tag v1.0</div>
        <p>
            To mark a stable production milestone, an annotated tag <code>v1.0</code> was created on the resolved <code>main</code> commit. Unlike lightweight tags, annotated tags store the creator name, timestamp, and release notes in Git database objects.
        </p>
        <div class="code-block">git tag -a v1.0 -m "Release version 1.0: College Event Management Application with Registration & Gallery"
git tag -n
git push origin v1.0</div>
        <div class="screenshot-container">
            <img src="data:image/png;base64,$img_step8" alt="Step 8 Screenshot">
            <div class="figure-caption">Figure 8.1: Annotated Release Tag v1.0 Creation and Remote Push</div>
        </div>
    </div>

    <div style="page-break-before: always;"></div>

    <!-- STEP 9 -->
    <div class="step-card">
        <div class="step-header">Step 9: Clone Repository into New Directory & Full Verification</div>
        <p>
            To verify deployment readiness from an end-user / fresh environment perspective, the remote repository was cloned into a fresh isolated directory (<code>College-Event-Management-Verify</code>).
        </p>
        <div class="code-block">cd C:\Users\XIE\Desktop
git clone https://github.com/Yash1510s/College-Event-Management.git College-Event-Management-Verify
cd College-Event-Management-Verify
git tag -n
git log --graph --oneline -n 6</div>
        <div class="screenshot-container">
            <img src="data:image/png;base64,$img_step9" alt="Step 9 Screenshot">
            <div class="figure-caption">Figure 9.1: Fresh Directory Clone and Version Verification</div>
        </div>
    </div>

    <!-- FULL GIT COMMIT GRAPH -->
    <h1>4. Complete Git Commit Graph Analysis</h1>
    <p>
        Below is the exact commit tree generated by Git, demonstrating initial commit, feature branch divergent histories, and the two merge commits resolving the pipeline:
    </p>
    <div class="code-block">*   8aa23fe (HEAD -> main, tag: v1.0, origin/main) Merge branch 'event-gallery' into main: resolve conflicts and integrate registration and gallery features
|\  
| * 8ec4829 (origin/event-gallery, event-gallery) feat(gallery): add event gallery grid, cards, and interactive album preview
* |   acba436 Merge branch 'event-registration' into main: add event registration feature
|\ \  
| |/  
|/|   
| * c92ecad (origin/event-registration, event-registration) feat(registration): add event registration form with styles and validation
|/  
* 00fccf6 Initial commit: College Event Management baseline application</div>

    <h1>5. Important Viva Voce Questions & Answers</h1>
    <div class="viva-q">Q1. What is the difference between a Fast-Forward merge and a 3-Way merge?</div>
    <div class="viva-a">
        <strong>Ans:</strong> A Fast-Forward merge occurs when there are no divergent commits on the target branch; Git simply moves the target pointer forward. A 3-Way merge occurs when both branches have new commits since their common ancestor, creating a dedicated merge commit with two parent commits.
    </div>

    <div class="viva-q">Q2. What causes a merge conflict in Git and how is it resolved?</div>
    <div class="viva-a">
        <strong>Ans:</strong> A merge conflict occurs when two branches modify the same line or region in a file differently. Git pauses the merge and outputs conflict markers (<code>&lt;&lt;&lt;&lt;&lt;&lt;&lt;</code>, <code>=======</code>, <code>&gt;&gt;&gt;&gt;&gt;&gt;&gt;</code>). The developer manually reviews, decides which code to keep, removes markers, stages the file with <code>git add</code>, and commits with <code>git commit</code>.
    </div>

    <div class="viva-q">Q3. Why do we use Annotated Tags instead of Lightweight Tags for releases?</div>
    <div class="viva-a">
        <strong>Ans:</strong> Lightweight tags are simple pointers to a commit. Annotated tags are stored as full objects in the Git database; they store the tagger's name, email, date, GPG signature (optional), and an explicit release message.
    </div>

    <div class="viva-q">Q4. What is the role of a Pull Request in DevOps pipelines?</div>
    <div class="viva-a">
        <strong>Ans:</strong> A Pull Request facilitates peer code review, triggers automated CI/CD validation tests, prevents unauthorized direct pushes to production/main branches, and documents architectural decisions.
    </div>

    <h1>6. Conclusion</h1>
    <p>
        The <strong>College Event Management</strong> application DevOps practical was successfully developed, tested, and validated. All 9 practical steps were executed without loss of code integrity. Both feature branches (Registration and Gallery) were merged into the <code>main</code> branch, merge conflicts were systematically analyzed and resolved, release tag <code>v1.0</code> was created and pushed to GitHub, and the final repository was validated via clean cloning in an isolated directory.
    </p>

    <div class="alert-success">
        <strong>Submission Status:</strong> Verified & Complete.<br>
        <strong>GitHub Repository:</strong> <a href="https://github.com/Yash1510s/College-Event-Management">https://github.com/Yash1510s/College-Event-Management</a>
    </div>

</body>
</html>
"@

$desktopDoc = "C:\Users\XIE\Desktop\DevOps_Practical_Report_College_Event_Management.doc"
$projectDoc = "C:\Users\XIE\Desktop\College-Event-Management\DevOps_Practical_Report.doc"

[System.IO.File]::WriteAllText($desktopDoc, $html, [System.Text.Encoding]::UTF8)
[System.IO.File]::WriteAllText($projectDoc, $html, [System.Text.Encoding]::UTF8)

Write-Host "Generated Word Report at: $desktopDoc"
Write-Host "Generated Word Report at: $projectDoc"
