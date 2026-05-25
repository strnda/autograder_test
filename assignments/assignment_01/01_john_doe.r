# ==========================================
# Assignment 01: Base R Fundamentals
# Name: John Doe
# ==========================================

# TASK 1: Vector Creation & Arithmetic
# Create a numeric vector named 'weights' containing the values: 55, 62, 78, 91, 48.
# Then, convert all these weights from kilograms to pounds by multiplying by 2.2.
# Save the resulting pounds vector as 'weights_lb'.

weights <- c(55, 62, 78, 91, 48)
weights_lb <- weights * 2.2


# TASK 2: Vector Subsetting
# Using the 'weights_lb' vector you just created, extract the 3rd and 5th elements.
# Save this two-element vector as 'selected_weights'.

selected_weights <- weights_lb[c(3, 5)]


# TASK 3: Basic Built-in Functions
# Calculate the average (mean) value of the 'weights_lb' vector.
# Save this single numeric value as 'avg_weight'.

avg_weight <- mean(weights_lb)


# TASK 4: Logical Indexing (Filtering)
# Count how many animals in the original 'weights' vector are strictly 
# greater than 60 kg.
# Save this count as an integer or numeric value named 'heavy_count'.

heavy_count <- sum(weights > 60)