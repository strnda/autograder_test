library(testthat)

# Read the filename (e.g., "01_john_doe.R") passed from GitHub Actions
args <- commandArgs(trailingOnly = TRUE)
student_file <- args[1]

cat("# 📊 Assignment Grading Results\n\n")
cat(paste0("⚙️ **Evaluating file:** `", student_file, "`\n\n"))

# Source the student's file locally within this folder
tryCatch({
  source(student_file)
  cat("✅ **Success:** Script executed without syntax errors.\n\n")
}, error = function(e) {
  cat("❌ **CRITICAL ERROR:** Your script failed to run due to a syntax error!\n")
  cat("```text\n", as.character(e), "\n```\n")
  cat("### GRADE: FAIL\n")
  quit(status = 0) 
})

# --- Assignment-specific tests go here ---
results <- test_transparently <- function() {
  test_that("Task 1: Check if 'numeric_answer' exists", {
    expect_true(exists("numeric_answer"))
  })
}

# Execute tests and capture the results
reporter <- SummaryReporter$new()
out <- test_reporter(reporter, start_end_reporter = FALSE, test_transparently())

# Format results into Markdown table
cat("### Test Suite Summary\n\n")
cat("| Test Case | Status |\n")
cat("| :--- | :--- |\n")

for (result in reporter$results) {
  test_name <- result$test
  if (inherits(result, "test_passed")) {
    cat(paste0("| ", test_name, " | ✅ PASSED |\n"))
  } else {
    err_msg <- gsub("\n", " ", result$message)
    cat(paste0("| ", test_name, " | ❌ FAILED: ", err_msg, " |\n"))
  }
}

if (reporter$failures > 0 || reporter$errors > 0) {
  cat("\n### FINAL GRADE: FAIL ❌\n")
} else {
  cat("\n### FINAL GRADE: PASS 🎉\n")
}