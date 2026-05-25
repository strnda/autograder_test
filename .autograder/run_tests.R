library(testthat)

# Capture BOTH arguments from the workflow runner
args <- commandArgs(trailingOnly = TRUE)
target_dir <- args[1]  # e.g., "assignments/assignment_01"
student_file <- args[2]  # e.g., "01_john_doe.R"

# Construct absolute paths to the files
full_student_path <- file.path(target_dir, student_file)
full_tests_path   <- file.path(target_dir, "tests.R")

cat("# 📊 Assignment Grading Results\n\n")
cat(paste0("⚙️ **Evaluating file:** `", full_student_path, "`\n\n"))

# 1. Base R Validation Check
# 
file_content <- suppressWarnings(readLines(full_student_path))

if (any(grepl("library\\s*\\(|require\\s*\\(", file_content))) {
  
  cat("❌ **CRITICAL ERROR:** External packages are strictly forbidden for this assignment!\n")
  cat("### FINAL GRADE: FAIL ❌\n")
  
  quit(status = 0)
  
}

# 2. Source the student's submission file safely
tryCatch(
  expr = {
    
    source(file = full_student_path)
    
  }, error = function(e) {
    
    cat("❌ **CRITICAL ERROR:** Your script failed to run due to a syntax error!\n")
    cat("```text\n", as.character(e), "\n```\n")
    cat("### FINAL GRADE: FAIL ❌\n")
    
    quit(status = 0) 
    
  }
)

# 3. Cleanly evaluate the assignment-specific test file
cat("### Test Suite Summary\n\n")
test_results <- as.data.frame(x = test_file(path = full_tests_path, 
                                            reporter = "silent"))

# 4. Generate the Markdown Table
cat("| Test Case | Status |\n| :--- | :--- |\n")

for (i in 1:nrow(test_results)) {
  
  status <- if (test_results$failed[i] == 0 && !test_results$error[i]) "✅ PASSED" else "❌ FAILED"
  cat(paste0("| ", test_results$test[i], " | ", status, " |\n"))
  
}

# 5. Calculate Final Verdict (Tracking failures and hard runtime crashes)
total_problems <- sum(test_results$failed) + sum(test_results$error)

if (total_problems > 0) {
  
  cat("\n### FINAL GRADE: FAIL ❌\n")
  
} else {
  
  cat("\n### FINAL GRADE: PASS 🎉\n")
  
}