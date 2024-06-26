% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cirProcessFunctions.R
\name{generateProcess_cir}
\alias{generateProcess_cir}
\title{Generate a CIR process}
\usage{
generateProcess_cir(x0, dt, alpha, mu, sigma, dZ)
}
\arguments{
\item{x0}{A positive real valued scalar. The initial value for the process.}

\item{dt}{A positive real scalar. The time step to update over.}

\item{alpha}{A positive real scalar. A parameter of the CIR process.}

\item{mu}{A positive real scalar. A parameter of the CIR process.}

\item{sigma}{A positive real scalar. A parameter of the CIR process.}

\item{dZ}{A vector of real values. The Weiner process innovations driving
stochastic variation in the process.}
}
\value{
A vector of positive real values. The values of a CIR process.
}
\description{
Generates a full CIR process conditional on Weiner process innovations.
}
