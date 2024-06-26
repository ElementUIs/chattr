test_that("chattr() works", {
  options("chattr-shiny-test" = FALSE)
  local_mocked_bindings(
    ui_current = function(...) {
      ""
    }
  )
  test_model_backend()
  expect_output(chattr("hello", stream = TRUE), "hello")
  expect_output(chattr("hello", stream = FALSE), "hello")
  expect_snapshot(chattr("test", preview = TRUE))
})

test_that("External R submit works", {
  skip_on_cran()
  local_mocked_bindings(
    ui_current = function(...) {
      "script"
    }
  )
  test_model_backend()
  expect_silent(chattr("hello"))
})

test_that("Test for null output", {
  skip_on_cran()
  local_mocked_bindings(
    ch_submit = function(...) NULL
  )
  test_model_backend()
  expect_null(chattr("hello"))
})
