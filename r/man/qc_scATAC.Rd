% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/atac_utils.R
\name{qc_scATAC}
\alias{qc_scATAC}
\title{Calculate ArchR-compatible per-cell QC statistics}
\usage{
qc_scATAC(fragments, genes, blacklist)
}
\arguments{
\item{fragments}{IterableFragments object}

\item{genes}{Gene coordinates given as GRanges, data.frame, or list. See \code{help("genomic-ranges-like")} for details on format and coordinate systems. Required attributes:
\itemize{
\item \code{chr}, \code{start}, \code{end}: genomic position
}}

\item{blacklist}{Blacklisted regions given as GRanges, data.frame, or list. See \code{help("genomic-ranges-like")} for details on format and coordinate systems. Required attributes:
\itemize{
\item \code{chr}, \code{start}, \code{end}: genomic position
}}
}
\value{
data.frame with QC data
}
\description{
Calculate ArchR-compatible per-cell QC statistics
}
\details{
This implementation mimics ArchR's default parameters. For uses requiring more flexibility to tweak default parameters,
the best option is to re-implement this function with required changes.
Output columns of data.frame:
\itemize{
\item \code{cellName}: cell name for each cell
\item \code{nFrags}: number of fragments per cell
\item \code{subNucleosomal}, \code{monoNucleosomal}, \code{multiNucleosomal}: number of fragments of size 1-146bp, 147-254bp, and 255bp + respectively.
equivalent to ArchR's nMonoFrags, nDiFrags, nMultiFrags respectively
\item \code{TSSEnrichment}: \code{AvgInsertInTSS / max(AvgInsertFlankingTSS, 0.1)}, where \code{AvgInsertInTSS} is \code{ReadsInTSS / 101} (window size),
and \code{AvgInsertFlankingTSS} is \code{ReadsFlankingTSS / (100*2)} (window size). The \code{max(0.1)} ensures that very low-read cells
do not get assigned spuriously high TSSEnrichment.
\item \code{ReadsInPromoter}: Number of reads from 2000bp upstream of TSS to 101bp downstream of TSS
\item \code{ReadsInBlacklist}: Number of reads in the provided blacklist region
\item \code{ReadsInTSS}: Number of reads overlapping the 101bp centered around each TSS
\item \code{ReadsFlankingTSS}: Number of reads overlapping 1901-2000bp +/- each TSS
}

Differences from ArchR:
Note that ArchR by default uses a different set of annotations to derive TSS sites and promoter sites.
This function uses just one annotation for gene start+end sites, so must be called twice to exactly
re-calculate the ArchR QC stats.

ArchR's \code{PromoterRatio} and \code{BlacklistRatio} are not included in the output, as they can be easily calculated
from \code{ReadsInPromoter / nFrags} and  \code{ReadsInBlacklist / nFrags}. Similarly, ArchR's \code{NucleosomeRatio} can be calculated
as \code{(monoNucleosomal + multiNucleosomal) / subNucleosomal}.
}
\examples{
## Prep data
frags <- get_demo_frags()
reference_dir <- file.path(tempdir(), "references")
genes <- read_gencode_transcripts(
  reference_dir, 
  release="42", 
  transcript_choice="MANE_Select",
  annotation_set = "basic",
  features="transcript"
)
blacklist <- read_encode_blacklist(reference_dir, genome = "hg38")


## Run qc
head(qc_scATAC(frags, genes, blacklist))
}
