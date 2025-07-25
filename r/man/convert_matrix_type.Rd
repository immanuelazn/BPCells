% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/matrix.R
\name{convert_matrix_type}
\alias{convert_matrix_type}
\title{Convert the type of a matrix}
\usage{
convert_matrix_type(matrix, type = c("uint32_t", "double", "float"))
}
\arguments{
\item{matrix}{IterableMatrix object input}

\item{type}{One of uint32_t (unsigned 32-bit integer), float (32-bit real number),
or double (64-bit real number)}
}
\value{
IterableMatrix object
}
\description{
Convert the type of a matrix
}
\examples{
mat <- matrix(rnorm(50), nrow = 10, ncol = 5)
rownames(mat) <- paste0("gene", seq_len(10))
colnames(mat) <- paste0("cell", seq_len(5))
mat <- mat \%>\% as("dgCMatrix") \%>\% as("IterableMatrix")
mat
convert_matrix_type(mat, "float")
}
