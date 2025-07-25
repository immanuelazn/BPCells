% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/singlecell_utils.R
\name{pseudobulk_matrix}
\alias{pseudobulk_matrix}
\title{Aggregate counts matrices by cell group or feature.}
\usage{
pseudobulk_matrix(mat, cell_groups, method = "sum", threads = 0L)
}
\arguments{
\item{mat}{IterableMatrix object of dimensions features x cells}

\item{cell_groups}{(Character/factor) Vector of group/cluster assignments for each cell. Length must be \code{ncol(mat)}.}

\item{method}{(Character vector) Method(s) to aggregate counts. If one method is provided, the output will be a matrix. If multiple methods are provided, the output will be a named list of matrices.

Current options are: \code{nonzeros}, \code{sum}, \code{mean}, \code{variance}.}

\item{threads}{(integer) Number of threads to use.}
}
\value{
\itemize{
\item If \code{method} is length \code{1}, returns a matrix of shape \verb{(features x groups)}.
\item If \code{method} is greater than length \code{1}, returns a list of matrices with each matrix representing a pseudobulk matrix with a different aggregation method.
Each matrix is of shape \verb{(features x groups)}, and names are one of \code{nonzeros}, \code{sum}, \code{mean}, \code{variance}.
}
}
\description{
Given a \verb{(features x cells)} matrix, group cells by \code{cell_groups} and aggregate counts by \code{method} for each
feature.
}
\details{
Some simpler stats are calculated in the process of calculating more complex
statistics. So when calculating \code{variance}, \code{nonzeros} and \code{mean} can be included with no
extra calculation time, and when calculating \code{mean}, adding \code{nonzeros} will take no extra time.
}
\examples{
set.seed(12345)
mat <- matrix(rpois(100, lambda = 5), nrow = 10)
rownames(mat) <- paste0("gene", 1:10)
colnames(mat) <- paste0("cell", 1:10) 
mat <- mat \%>\% as("dgCMatrix") \%>\% as("IterableMatrix")
groups <- rep(c("Cluster1", "Cluster2"), each = 5)

## When calculating only sum across two groups
pseudobulk_res <- pseudobulk_matrix(
  mat = mat,
  cell_groups = groups,
  method = "sum"
)
pseudobulk_res

## Can also request multiple summary statistics for pseudoulking
pseudobulk_res_multi <- pseudobulk_matrix(
  mat = mat,
  cell_groups = groups,
  method = c("mean",  "variance")
)

names(pseudobulk_res_multi)

pseudobulk_res_multi$mean
}
