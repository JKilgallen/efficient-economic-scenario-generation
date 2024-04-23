#' Update the value of a CIR process
#'
#' @param xt A positive real scalar. The current value of the process.
#' @param dt A positive real scalar. The time step to update over.
#' @param alpha A positive real scalar. A parameter of the CIR process.
#' @param mu A positive real scalar. A parameter of the CIR process.
#' @param sigma A positive real scalar. A parameter of the CIR process.
#' @param dZt A real scalar. The realised change in value of a Weiner process.
#'
#' @return A positive real scalar. The updated value of the process.
#' @export
#'
#' @examples
updateProcessValue_cir <- function(
    xt, dt,
    alpha, mu, sigma,
    dZt
){
  dxt_drift <- alpha * (mu - xt) * dt
  dxt_stochastic_variation <- sigma * sqrt(xt) * dZt

  xt + dxt_drift + dxt_stochastic_variation
}

#' Generate a CIR process
#'
#' Generates a full CIR process conditional on Weiner process innovations.
#'
#' @param x0 A positive real valued scalar. The initial value for the process.
#' @inheritParams updateProcessValue_cir
#' @param dZ A vector of real values. The Weiner process innovations driving
#' stochastic variation in the process.
#'
#' @return A vector of positive real values. The values of a CIR process.
#' @export
generateProcess_cir <-
  function(
    x0, dt,
    alpha, mu, sigma,
    dZ
  ){
    x <- x0
    for (dZt in dZ) {
      xt <- tail(x, n = 1L)
      x <- c(
        x,
        updateProcessValue_cir(
          xt = xt, dt = dt,
          alpha = alpha, mu = mu, sigma = sigma,
          dZt = dZt
          )
        )
    }
    x
  }
