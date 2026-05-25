# ==========================================
# Assignment 01: Base R Fundamentals
# Name: Jane Smith
# ==========================================

# CRITICAL ERROR TEST: This should trigger the forbidden library blocker!
# library(tidyverse) 

# TASK 1: Vector Creation & Arithmetic
weights <- c(55, 62, 78, 91, 48)
# Student mistake: Multiplied by 2.0 instead of 2.2
weights_lb <- weights * 2.0 


# TASK 2: Vector Subsetting
# Student mistake: Extracted 1st and 2nd elements instead of 3rd and 5th
selected_weights <- weights_lb[c(1, 2)]


# TASK 3: Basic Built-in Functions
avg_weight <- mean(weights_lb)


# TASK 4: Logical Indexing (Filtering)
# Student mistake: Forgot to complete this task entirely (variable is missing)
# heavy_count <-
