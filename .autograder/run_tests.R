library(testthat)

args <- commandArgs(trailingOnly = TRUE)
target_dir <- args[1]  
student_file <- args[2]  

full_student_path <- file.path(target_dir, student_file)
full_tests_path <- file.path(target_dir, "tests.R")

report <- c(
  "# 📊 Assignment Grading Results",
  "",
  paste0("⚙️ **Evaluating file:** `", full_student_path, "`"),
  ""
)

file_content <- suppressWarnings(readLines(full_student_path))

if (any(grepl("library\\s*\\(|require\\s*\\(", file_content))) {
  
  report <- c(report, 
              "❌ **CRITICAL ERROR:** External packages are strictly forbidden for this assignment!",
              "### FINAL GRADE: FAIL ❌")
  writeLines(report, "../../feedback.md")
  
  quit(status = 0)
  
}

tryCatch(
  expr = source(file = full_student_path), 
  error = function(e) {
    report <- c(report, 
                "❌ **CRITICAL ERROR:** Your script failed to run due to a syntax error!",
                "```text", as.character(e), "```",
                "### FINAL GRADE: FAIL ❌")
    writeLines(report, "../../feedback.md")
    quit(status = 0) 
  }
)

test_results <- as.data.frame(test_file(path = full_tests_path, 
                                        reporter = "silent"))

report <- c(report, "### Test Suite Summary", "", "| Test Case | Status |", "| :--- | :--- |")


for (i in 1:nrow(test_results)) {
  
  status <- if (test_results$failed[i] == 0 && !test_results$error[i]) "✅ PASSED" else "❌ FAILED"
  report <- c(report, paste0("| ", test_results$test[i], " | ", status, " |"))
  
}

total_problems <- sum(test_results$failed) + sum(test_results$error)

if (total_problems > 0) {
  
  report <- c(report, "", "### FINAL GRADE: FAIL ❌")
  
} else {
  
  report <- c(report, "", "### FINAL GRADE: PASS 🎉")
  
}

writeLines(report, "../../feedback.md")