library(testthat)

context('Assignment 01 Base R Assertions')

test_that('Task 1: weights_lb is calculated correctly', {
  
  expect_true(exists('weights_lb'),
              failure_message = 'Variable weights_lb is missing.')
  expect_true(is.numeric(weights_lb), 
              failure_message = 'weights_lb must be a numeric vector.')
  expect_equal(length(weights_lb), 5)
  expect_equal(weights_lb, c(121.0, 136.4, 171.6, 200.2, 105.6), 
               tolerance = 1e-2)
})

test_that('Task 2: selected_weights extracts 3rd and 5th elements', {
  expect_true(exists('selected_weights'),
              failure_message = 'Variable selected_weights is missing.')
  expect_equal(length(selected_weights), 2)
  expect_equal(selected_weights, c(171.6, 105.6), 
               tolerance = 1e-2)
})

test_that('Task 3: avg_weight finds the correct mean', {
  expect_true(exists('avg_weight'), 
              failure_message = 'Variable avg_weight is missing.')
  expect_equal(length(avg_weight), 1)
  expect_equal(avg_weight, 146.96, 
               tolerance = 1e-2)
})

test_that('Task 4: heavy_count filters and sums correctly', {
  expect_true(exists('heavy_count'), 
              failure_message = 'Variable heavy_count is missing.')
  expect_equal(as.numeric(heavy_count), 3)
})
