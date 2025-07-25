% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/matrix.R, R/matrix_stats.R, R/transforms.R
\name{IterableMatrix-methods}
\alias{IterableMatrix-methods}
\alias{matrix_type}
\alias{storage_order}
\alias{show,IterableMatrix-method}
\alias{t,IterableMatrix-method}
\alias{\%*\%,IterableMatrix,matrix-method}
\alias{rowSums,IterableMatrix-method}
\alias{colSums,IterableMatrix-method}
\alias{rowMeans,IterableMatrix-method}
\alias{colMeans,IterableMatrix-method}
\alias{colVars}
\alias{rowVars}
\alias{rowMaxs}
\alias{colMaxs}
\alias{rowQuantiles}
\alias{colQuantiles}
\alias{log1p,IterableMatrix-method}
\alias{log1p_slow}
\alias{expm1,IterableMatrix-method}
\alias{expm1_slow}
\alias{^,IterableMatrix,numeric-method}
\alias{<,numeric,IterableMatrix-method}
\alias{>,IterableMatrix,numeric-method}
\alias{<=,numeric,IterableMatrix-method}
\alias{>=,IterableMatrix,numeric-method}
\alias{round,IterableMatrix-method}
\alias{*,IterableMatrix,numeric-method}
\alias{+,IterableMatrix,numeric-method}
\alias{/,IterableMatrix,numeric-method}
\alias{-,IterableMatrix,numeric-method}
\title{IterableMatrix methods}
\usage{
matrix_type(x)

storage_order(x)

\S4method{show}{IterableMatrix}(object)

\S4method{t}{IterableMatrix}(x)

\S4method{\%*\%}{IterableMatrix,matrix}(x, y)

\S4method{rowSums}{IterableMatrix}(x)

\S4method{colSums}{IterableMatrix}(x)

\S4method{rowMeans}{IterableMatrix}(x)

\S4method{colMeans}{IterableMatrix}(x)

colVars(
  x,
  rows = NULL,
  cols = NULL,
  na.rm = FALSE,
  center = NULL,
  ...,
  useNames = TRUE
)

rowVars(
  x,
  rows = NULL,
  cols = NULL,
  na.rm = FALSE,
  center = NULL,
  ...,
  useNames = TRUE
)

rowMaxs(x, rows = NULL, cols = NULL, na.rm = FALSE, ..., useNames = TRUE)

colMaxs(x, rows = NULL, cols = NULL, na.rm = FALSE, ..., useNames = TRUE)

rowQuantiles(
  x,
  rows = NULL,
  cols = NULL,
  probs = seq(from = 0, to = 1, by = 0.25),
  na.rm = FALSE,
  type = 7L,
  digits = 7L,
  ...,
  useNames = TRUE,
  drop = TRUE
)

colQuantiles(
  x,
  rows = NULL,
  cols = NULL,
  probs = seq(from = 0, to = 1, by = 0.25),
  na.rm = FALSE,
  type = 7L,
  digits = 7L,
  ...,
  useNames = TRUE,
  drop = TRUE
)

\S4method{log1p}{IterableMatrix}(x)

log1p_slow(x)

\S4method{expm1}{IterableMatrix}(x)

expm1_slow(x)

\S4method{^}{IterableMatrix,numeric}(e1, e2)

\S4method{<}{numeric,IterableMatrix}(e1, e2)

\S4method{>}{IterableMatrix,numeric}(e1, e2)

\S4method{<=}{numeric,IterableMatrix}(e1, e2)

\S4method{>=}{IterableMatrix,numeric}(e1, e2)

\S4method{round}{IterableMatrix}(x, digits = 0)

\S4method{*}{IterableMatrix,numeric}(e1, e2)

\S4method{+}{IterableMatrix,numeric}(e1, e2)

\S4method{/}{IterableMatrix,numeric}(e1, e2)

\S4method{-}{IterableMatrix,numeric}(e1, e2)
}
\arguments{
\item{x}{IterableMatrix object or a matrix-like object.}

\item{object}{IterableMatrix object}

\item{y}{matrix}

\item{probs}{(Numeric) Quantile value(s) to be computed, between 0 and 1.}

\item{type}{(Integer) between 4 and 9 selecting which quantile algorithm to use, detailed in \code{matrixStats::rowQuantiles()}}
}
\value{
\itemize{
\item \code{t()} Transposed object
}

\itemize{
\item \code{x \%*\% y}: dense matrix result
}

\itemize{
\item \code{rowSums()}: vector of row sums
}

\itemize{
\item \code{colSums()}: vector of col sums
}

\itemize{
\item \code{rowMeans()}: vector of row means
}

\itemize{
\item \code{colMeans()}: vector of col means
}

\itemize{
\item \code{colVars()}: vector of col variance
}

\itemize{
\item \code{rowVars()}: vector of row variance
}

\itemize{
\item \code{rowMaxs()}: vector of maxes for every row
}

\itemize{
\item \code{colMaxs()}: vector of column maxes
}

\itemize{
\item \verb{rowQuantiles():} If \code{length(probs) == 1}, return a numeric with number of entries equal to the number of rows in the matrix.
Else, return a Matrix of quantile values, with cols representing each quantile, and each row representing a row in the input matrix.
}

\itemize{
\item \verb{colQuantiles():} If \code{length(probs) == 1}, return a numeric with number of entries equal to the number of columns in the matrix.
Else, return a Matrix of quantile values, with cols representing each quantile, and each row representing a col in the input matrix.
}
}
\description{
Generic methods and built-in functions for IterableMatrix objects
}
\section{Functions}{
\itemize{
\item \code{matrix_type()}: Get the matrix data type (mat_uint32_t, mat_float, or mat_double for now)

\item \code{storage_order()}: Get the matrix storage order ("row" or "col")

\item \code{show(IterableMatrix)}: Display an IterableMatrix

\item \code{t(IterableMatrix)}: Transpose an IterableMatrix

\item \code{x \%*\% y}: Multiply by a dense matrix

\item \code{rowSums(IterableMatrix)}: Calculate rowSums

\item \code{colSums(IterableMatrix)}: Calculate colSums

\item \code{rowMeans(IterableMatrix)}: Calculate rowMeans

\item \code{colMeans(IterableMatrix)}: Calculate colMeans

\item \code{colVars()}: Calculate colVars (replacement for \code{matrixStats::colVars()})

\item \code{rowVars()}: Calculate rowVars (replacement for \code{matrixStats::rowVars()})

\item \code{rowMaxs()}: Calculate rowMaxs (replacement for \code{matrixStats::rowMaxs()})

\item \code{colMaxs()}: Calculate colMax (replacement for \code{matrixStats::colMax()})

\item \code{rowQuantiles()}: Calculate rowQuantiles (replacement for \code{matrixStats::rowQuantiles})

\item \code{colQuantiles()}: Calculate colQuantiles (replacement for \code{matrixStats::colQuantiles})

\item \code{log1p(IterableMatrix)}: Calculate log(x + 1)

\item \code{log1p_slow()}: Calculate log(x + 1) (non-SIMD version)

\item \code{expm1(IterableMatrix)}: Calculate exp(x) - 1

\item \code{expm1_slow()}: Calculate exp(x) - 1 (non-SIMD version)

\item \code{e1^e2}: Calculate x^y (elementwise; y > 0)

\item \code{e1 < e2}: Binarize matrix according to numeric < matrix comparison

\item \code{e1 > e2}: Binarize matrix according to matrix > numeric comparison

\item \code{e1 <= e2}: Binarize matrix according to numeric <= matrix comparison

\item \code{e1 >= e2}: Binarize matrix according to matrix >= numeric comparison

\item \code{round(IterableMatrix)}: round to nearest integer (digits must be 0)

\item \code{e1 * e2}: Multiply by a constant, or multiply rows by a vector length nrow(mat)

\item \code{e1 + e2}: Add a constant, or row-wise addition with a vector length nrow(mat)

\item \code{e1 / e2}: Divide by a constant, or divide rows by a vector length nrow(mat)

\item \code{e1 - e2}: Subtract a constant, or row-wise subtraction with a vector length nrow(mat)

}}
\examples{
## Prep data
mat <- matrix(1:25, nrow = 5) \%>\% as("dgCMatrix")
mat
mat <- as(mat, "IterableMatrix")
mat


#######################################################################
## matrix_type() example
#######################################################################
matrix_type(mat)


#######################################################################
## storage_order() example
#######################################################################
storage_order(mat)


#######################################################################
## show() example
#######################################################################
show(mat)


#######################################################################
## t() example
#######################################################################
t(mat)


#######################################################################
## `x \%*\% y` example
#######################################################################
mat \%*\% as(matrix(1:50, nrow = 5), "dgCMatrix")


#######################################################################
## rowSums() example
#######################################################################
rowSums(mat)


#######################################################################
## colSums() example
#######################################################################
colSums(mat)


#######################################################################
## rowMeans() example
#######################################################################
rowMeans(mat)


#######################################################################
## colMeans() example
#######################################################################
colMeans(mat)


#######################################################################
## colVars() example
#######################################################################
colVars(mat)


#######################################################################
## rowMaxs() example
#######################################################################
rowMaxs(mat)


#######################################################################
## colMaxs() example
#######################################################################
colMaxs(mat)


#######################################################################
## rowQuantiles() example
#######################################################################
rowQuantiles(transpose_storage_order(mat))


#######################################################################
## colQuantiles() example
#######################################################################
colQuantiles(mat)


#######################################################################
## log1p() example
#######################################################################
log1p(mat)


#######################################################################
## log1p_slow() example
#######################################################################
log1p_slow(mat)


#######################################################################
## expm1() example
#######################################################################
expm1(mat)


#######################################################################
## expm1_slow() example
#######################################################################
expm1_slow(mat)


#######################################################################
## `e1 < e2` example
#######################################################################
5 < mat


#######################################################################
## `e1 > e2` example
#######################################################################
mat > 5


#######################################################################
## `e1 <= e2` example
#######################################################################
5 <= mat


#######################################################################
## `e1 >= e2` example
#######################################################################
mat >= 5


#######################################################################
## round() example
#######################################################################
round(mat)


#######################################################################
## `e1 * e2` example
#######################################################################
## Multiplying by a constant
mat * 5

## Multiplying by a vector of length `nrow(mat)`
mat * 1:nrow(mat)


#######################################################################
## `e1 + e2` example
#######################################################################
## Add by a constant
mat + 5

## Adding row-wise by a vector of length `nrow(mat)`
mat + 1:nrow(mat)


#######################################################################
## `e1 / e2` example
#######################################################################
## Divide by a constant
mat / 5

## Divide by a vector of length `nrow(mat)`
mat / 1:nrow(mat)


#######################################################################
## `e1 - e2` example
#######################################################################
## Subtracting by a constant
mat - 5

## Subtracting by a vector of length `nrow(mat)`
mat - 1:nrow(mat)


}
