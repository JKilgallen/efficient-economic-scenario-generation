#' Construct a correlated Weiner process
#'
#' Map iid standard Normal random variables to a correlated Weiner process
#'
#' @param X A matrix of real values. The iid Normal random variables.
#' @param Sigma A covariance matrix. The instantaneous covariance of the Weiner process.
#' @param dt A positive real value. The size of each time step.
#'
#' @return
#' @export
correlateWeinerProcess <-
  function(X, Sigma, dt){
    L <- t(chol(Sigma))
    sqrt(dt) * (L %*% X)
  }
