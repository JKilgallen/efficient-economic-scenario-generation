test_that("cir updating works", {
  # monthly time steps
  dt <- 1 / 12
  # Initial values
  x_10 <- 0.0228
  x_20 <- 0.0809
  # Parameters
  a_1 <- 1.0682
  m_1 <- 0.0546
  s_1 <- 0.0412
  a_2 <- 0.0469
  m_2 <- 0.0778
  s_2 <- 0.0287
  # weiner process
  rho <- - 0.739
  cor_matrix <- matrix(c(1, rho, rho, 1), nrow = 2)
  L <- t(chol(cor_matrix))
  dZ <- sqrt(dt) * (L %*% rnorm(2)) %>%
    c()

  x_11 <- updateProcessValue_cir(
    xt = x_10,
    dt = dt,
    alpha = a_1,
    mu = m_1,
    sigma = s_1,
    dZt = dZ[1]
  )

  expect_equal(
    x_11,
    x_10 + (a_1 * (m_1 - x_10) * dt) + (s_1 * sqrt(x_10) * dZ[1])
  )
})
