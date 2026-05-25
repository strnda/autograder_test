library(testthat)

context("Assignment 01 Base R Assertions")

test_that(
  desc = "Task 1: weights_lb is calculated correctly", 
  code = {
    expect_true(object = exists(x = "weights_lb"),
                info = "Variable weights_lb is missing.")
    expect_true(object = is.numeric(x = weights_lb), 
                info = "weights_lb must be a numeric vector.")
    expect_equal(object = length(x = weights_lb), 
                 expected = 5)
    expect_equal(object = weights_lb, 
                 expected = c(121.0, 136.4, 171.6, 200.2, 105.6),
                 tolerance = 1e-2)
  }
)

test_that(
  desc = "Task 2: selected_weights extracts 3rd and 5th elements", 
  code = {
    expect_true(object = exists(x = "selected_weights"),
                info = "Variable selected_weights is missing.")
    expect_equal(object = length(x = selected_weights), 
                 expected = 2)
    expect_equal(object = selected_weights, 
                 expected = c(171.6, 105.6), 
                 tolerance = 1e-2)
  }
)

test_that(
  desc = "Task 3: avg_weight finds the correct mean", 
  code = {
    expect_true(object = exists(x = "avg_weight"), 
                info = "Variable avg_weight is missing.")
    expect_equal(object = length(x = avg_weight), 
                 expected = 1)
    expect_equal(object = avg_weight, 
                 expected = 146.96, 
                 tolerance = 1e-2)
  }
)

test_that(
  desc = "Task 4: heavy_count filters and sums correctly", 
  code = {
    expect_true(object = exists("heavy_count"),
                info = "Variable heavy_count is missing.")
    expect_equal(object = as.numeric(x = heavy_count), 
                 expected = 3)
  }
)