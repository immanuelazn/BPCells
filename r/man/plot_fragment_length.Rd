% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plots.R
\name{plot_fragment_length}
\alias{plot_fragment_length}
\title{Fragment size distribution}
\usage{
plot_fragment_length(
  fragments,
  max_length = 500,
  return_data = FALSE,
  apply_styling = TRUE
)
}
\arguments{
\item{fragments}{Fragments object}

\item{max_length}{Maximum length to show on the plot}

\item{return_data}{If true, return data from just before plotting rather than a plot.}

\item{apply_styling}{If false, return a plot without pretty styling applied}
}
\value{
Numeric vector where index i contans the number of length-i fragments
}
\description{
Plot the distribution of fragment lengths, with length in basepairs on the
x-axis, and proportion of fragments on the y-axis. Typical plots will show
10-basepair periodicity, as well as humps spaced at multiples of a nucleosome
width (about 150bp).
}
\examples{
frags <- get_demo_frags(filter_qc = FALSE, subset = FALSE)
plot_fragment_length(frags)
}
