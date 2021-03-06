% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sample.R
\name{sample}
\alias{sample}
\alias{sample_linial_meshulam_wallach}
\alias{sample_costa_farber}
\title{Sample random simplicial complexes}
\usage{
sample_linial_meshulam_wallach(n, dimension, prob)

sample_costa_farber(n, prob)
}
\arguments{
\item{n}{an integer number of starting vertices.}

\item{dimension}{an integer dimension at which to randomly insert simplices.}

\item{prob}{a numeric simplex insertion probability (Linial-Meshulam-Wallach)
or a vector of probabilities for all dimensions (Costa-Farber). The
dimension of a Costa-Farber random simplicial complex will be at most
\code{length(prob) - 1L}.}
}
\description{
Generate random simplicial complexes following the models of
  Meshulam and Wallach (2009) and of Costa and Farber (2016).
}
\details{
The random simplicial complex model of Costa and Farber (2016)
  begins with a finite number of vertices \eqn{n} (\code{n}) and proceeds as
  follows, based on the \eqn{d+1}-dimensional vector of probabilities
  \eqn{p_0,\ldots,p_d} (\code{prob}):
  \itemize{
    \item{Delete each vertex
          with probability \eqn{1-p_0}.}
    \item{Insert an edge
          on each pair of vertices
          with probability \eqn{p_1}.}
    \item{Insert a \eqn{2}-simplex
          on each triangle
          with probability \eqn{p_2}.}
    \item{For \eqn{k=3,\ldots,d}, insert a \eqn{k}-simplex
          on each subcomplex that forms a \eqn{k}-simplex boundary
          with probability \eqn{p_k}.}
  }
  The model of Meshulam and Wallach (2009), generalized from that of Linial
  and Meshulam (2006) is a special case in which \eqn{p_k=1} for \eqn{0\le
  k\le d-1}; the only parameters are \eqn{n} (\code{n}) and \eqn{p_d}
  (\code{prob}).
}
\examples{
set.seed(1)
## Generate Linial-Meshulam random simplicial complexes
sample_linial_meshulam_wallach(n = 6L, dimension = 0L, prob = .5)
sample_linial_meshulam_wallach(n = 6L, dimension = 1L, prob = .5)
sample_linial_meshulam_wallach(n = 6L, dimension = 2L, prob = .5)
sample_linial_meshulam_wallach(n = 6L, dimension = 3L, prob = .5)
## Generate Costa-Farber random simplicial complexes
plot(sample_costa_farber(n = 12L, prob = c(.5, .5, .5)))
plot(sample_costa_farber(n = 12L, prob = c(.5, .5, .5)))
plot(sample_costa_farber(n = 12L, prob = c(.5, .5, .5)))
## Construct a complete complex of a given size and dimension
sample_linial_meshulam_wallach(n = 6L, dimension = 4L, prob = 0)
sample_costa_farber(n = 6L, prob = rep(1, 4L))
## Construct the clique complex of a random 1-skeleton
plot(sample_costa_farber(n = 10L, prob = c(.7, .4, rep(1, 11L))))
}
\references{
Linial N. and Meshulam R. (2006) Homological Connectivity of
  Random 2-Complexes. Combinatorica 26, 4, 475–487.
  DOI:https://doi.org/10.1007/s00493-006-0027-9

Meshulam, R. and Wallach, N. (2009) Homological Connectivity of
  Random k‐Dimensional Complexes. Random Struct. Alg., 34: 408-417.
  doi:10.1002/rsa.20238

Costa A. and Farber M. (2016) Random Simplicial Complexes. In:
  Callegaro F., Cohen F., De Concini C., Feichtner E., Gaiffi G., Salvetti M.
  (eds) Configuration Spaces. Springer INdAM Series, vol 14. Springer, Cham.
  https://doi.org/10.1007/978-3-319-31580-5_6
}
