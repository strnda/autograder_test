# 📊 R Data Analysis — Assignment Submission Guide

Welcome to your R programming course! We use an automated grading system (an autograder) powered by GitHub Actions. This allows you to get instant feedback on your assignments every time you submit your work.

Please follow these instructions carefully to ensure your assignments are processed and graded correctly.
---

## 🚀 Step-by-Step Submission Process

All assignments must be submitted using **Pull Requests (PRs)**. Do not attempt to push code directly to the `main` branch, as it is locked.

### Step 1: Clone the Repository
If you haven't already, clone this repository to your local machine using RStudio or your terminal:
```bash
git clone [https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git](https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git)
```

### Step 2: Create a New Branch
Never work directly on the `main` branch. Before starting an assignment, create a new branch named after the assignment (e.g., `homework-01`):
```bash
git checkout -b homework-01
```

### Step 3: Complete the Assignment
1. Navigate to the `assignments/` directory and find the folder for the current week (e.g., `assignments/assignment_01/`).
2. Locate the template file (e.g., `01_template.R`).
3. **Duplicate and rename the file** using the strict naming convention below.
4. Write your R code to complete the tasks inside your renamed file.

### Step 4: Commit and Push Your Changes
Once your script is saved and working locally, stage, commit, and push your branch to GitHub:
```bash
git add assignments/assignment_01/01_your_name.R
git commit -m "Completed assignment 1"
git push origin homework-01
```

### Step 5: Open a Pull Request
1. Go to the repository page on GitHub.
2. Click the green **"Compare & pull request"** button that appears at the top.
3. Ensure the base branch is `main` and the compare branch is your working branch (e.g., `homework-01`).
4. Click **"Create pull request"**.
---

## ⚠️ Important Rules for a Passing Grade

Our autograder evaluates your script the exact moment you open your Pull Request. If you violate any of the following rules, the test runner will fail automatically:

### 1. Strict Naming Convention
Your submitted file name **must** start with the assignment number followed by an underscore and your name. The automated system will completely ignore files that don't match this pattern.
* **✅ Correct:** `01_john_doe.R` or `01_jane_smith.r`
* **❌ Incorrect:** `homework1.R`, `01-john-doe.R`, `sol_01.R`

### 2. Base R Assignments (No External Packages)
For foundational assignments, the use of external libraries (such as `tidyverse`, `dplyr`, or `ggplot2`) is strictly forbidden unless explicitly stated in the assignment description. 
* **Do not** include `library(tidyverse)` or `require(tidyverse)` in your script.
* The autograder scans your file text; if any package loading functions are found, **your grade will immediately drop to zero (FAIL).**
---

## 🔄 Getting Your Feedback

Within **1 minute** of opening your Pull Request, a GitHub automated bot will post a comment directly on your PR conversation thread.

* **If you see a Green Pass (🎉):** Your logic is correct and you have successfully completed the assignment. You are ready for final instructor review.
* **If you see a Red Fail (❌):** Look at the breakdown table in the bot's comment to see which specific test cases failed or if your script suffered from a syntax error.

### How to Fix Mistakes
If you fail a test case, **you do not need to open a new Pull Request.** Simply fix the code in your file locally, save, commit, and push again:
```bash
git add assignments/assignment_01/01_your_name.R
git commit -m "Fixed typo in task 3"
git push origin homework-01
```
The autograder will automatically re-run on your existing PR!
