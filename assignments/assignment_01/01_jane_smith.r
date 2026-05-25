# ==========================================
# Assignment 01: Base R Fundamentals
# Name: Jane Smith
# ==========================================

# TASK 1: Vector Creation & Arithmetic
weights <- c(55, 62, 78, 91, 48)
weights_lb <- weights * 2.2


# TASK 2: Vector Subsetting
selected_weights <- weights_lb[c(3, 5)]


# TASK 3: Basic Built-in Functions
avg_weight <- mean(weights_lb)


# TASK 4: Logical Indexing (Filtering)
# Student mistake: Forgot to complete this task entirely (variable is missing)
heavy_count <- sum(weights > 60)
