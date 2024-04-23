test_that("multiplication works", {
  # monthly time steps
  dt <- 1 / 12
  # weiner process
  rho <- - 0.739
  cor_matrix <- matrix(c(1, rho, rho, 1), nrow = 2)
  L <- t(chol(cor_matrix))
  X <- rnorm(2 * 200) %>%
    matrix(nrow = 2)
  dZ <- correlateWeinerProcess(
    X, cor_matrix, dt
  )

  expect_equal(
    dZ,
    sqrt(dt) * (L %*% X)
  )
})
