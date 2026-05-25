library(testthat)

# Capture the dynamic student filename passed by GitHub Actions
args <- commandArgs(trailingOnly = TRUE)
student_file <- args[1]

cat("# 📊 Assignment 01 Grading Results\n\n")
cat(paste0("⚙️ **Evaluating file:** `", student_file, "`\n\n"))

# ------------------------------------------------------------------
# SECURITY & CONSTRAINT CHECK: Enforce Base R Only
# ------------------------------------------------------------------
file_content <- readLines(con = student_file)

# Search for any instances of library() or require()
if (any(grepl(pattern = "library\\s*\\(|require\\s*\\(", 
              x = file_content))) {
  
  cat("❌ **CRITICAL ERROR:** External packages are strictly forbidden for this assignment!\n")
  cat("Please remove all `library()` or `require()` calls and use **Base R** functions only.\n\n")
  cat("### FINAL GRADE: FAIL ❌\n")
  quit(status = 0) # Exit early so they don't get credit for package-based answers
}

# ------------------------------------------------------------------
# EXECUTION CHECK: Check for Syntax Errors
# ------------------------------------------------------------------
tryCatch(
  expr = {
    
    source(file = student_file)
    cat("✅ **Success:** Script executed without syntax errors.\n\n")
  }, error = function(e) {
    
    cat("❌ **CRITICAL ERROR:** Your script failed to run due to a syntax error!\n")
    cat("```text\n", as.character(x = e), "\n```\n")
    cat("### GRADE: FAIL\n")
    quit(status = 0) 
  }
)

# ------------------------------------------------------------------
# UNIT TESTS: Evaluate Assignment Assertions
# ------------------------------------------------------------------
assignment_tests <- function() {
  
  test_that("Task 1: weights_lb is calculated correctly", {
    expect_true(exists(x = "weights_lb"), 
                failure_message = "Variable 'weights_lb' is missing.")
    expect_true(is.numeric(x = weights_lb), 
                failure_message = "'weights_lb' must be a numeric vector.")
    expect_equal(length(x = weights_lb), 5)
    expect_equal(weights_lb, c(121.0, 136.4, 171.6, 200.2, 105.6), 
                 tolerance = 1e-2)
  })
  
  test_that("Task 2: selected_weights extracts 3rd and 5th elements", {
    expect_true(exists("selected_weights"), 
                failure_message = "Variable 'selected_weights' is missing.")
    expect_equal(length(selected_weights), 2)
    expect_equal(selected_weights, c(171.6, 105.6), 
                 tolerance = 1e-2)
  })
  
  test_that("Task 3: avg_weight finds the correct mean", {
    expect_true(exists("avg_weight"), 
                failure_message = "Variable 'avg_weight' is missing.")
    expect_equal(length(avg_weight), 1)
    expect_equal(avg_weight, 146.96, 
                 tolerance = 1e-2)
  })
  
  test_that("Task 4: heavy_count filters and sums correctly", {
    expect_true(exists("heavy_count"), 
                failure_message = "Variable 'heavy_count' is missing.")
    expect_equal(as.numeric(heavy_count), 3)
  })
}

# Run tests and collect metrics
reporter <- SummaryReporter$new()
out <- test_reporter(reporter, start_end_reporter = FALSE, assignment_tests())

# ------------------------------------------------------------------
# REPORT GENERATION: Build Markdown Output
# ------------------------------------------------------------------
cat("### Test Suite Summary\n\n")
cat("| Test Case | Status |\n")
cat("| :--- | :--- |\n")

for (result in reporter$results) {
  
  test_name <- result$test
  
  if (inherits(result, "test_passed")) {
    
    cat(paste0("| ", test_name, " | ✅ PASSED |\n"))
  } else {
    
    err_msg <- gsub("\n", " ", result$message)
    if(nchar(err_msg) > 60) err_msg <- paste0(substr(err_msg, 1, 57), "...")
    cat(paste0("| ", test_name, " | ❌ FAILED: ", err_msg, " |\n"))
  }
}

# Determine overall passing status
if (reporter$failures > 0 || reporter$errors > 0) {
  cat("\n### FINAL GRADE: FAIL ❌\n")
  cat("Please review the failures noted above, fix your code, and push your changes back to this PR branch.\n")
} else {
  cat("\n### FINAL GRADE: PASS 🎉\n")
  cat("Excellent work! All Base R assertion checks have passed successfully.\n")
}