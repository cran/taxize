% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gna_verifier.R
\name{gna_verifier}
\alias{gna_verifier}
\title{Verify a list of scientific names against biodiversity data-sources.}
\usage{
gna_verifier(
  names,
  data_sources = c(1, 12),
  all_matches = FALSE,
  capitalize = FALSE,
  species_group = FALSE,
  fuzzy_uninomial = FALSE,
  stats = FALSE,
  main_taxon_threshold = 0.5,
  output_type = "table",
  ...
)
}
\arguments{
\item{names}{A \code{character} vector of taxon names to verify.}

\item{data_sources}{A \code{character} or \code{integer} vector with numbers
corresponding to data sources. See the Global Names Architecture
documentation for a list of available options.}

\item{all_matches}{When \code{TRUE}, return all found matches, not only the best
one. Multiple results are returned in results. These results are sorted by
matching quality, the first result is the same as bestResult.}

\item{capitalize}{When \code{TRUE}, capitalize the first letter of a name-string.}

\item{species_group}{When \code{TRUE}, expands the search to species group where
applicable.}

\item{fuzzy_uninomial}{When \code{TRUE}, allows fuzzy matching for uninomial
names.}

\item{stats}{When \code{TRUE}, finds out a kingdom and a taxon (main taxon) that
contain most names. It only takes in account the names matched to the
Catalogue of Life entries. This option is ignored, if the Catalogue of Life
is not included in data-sources.}

\item{main_taxon_threshold}{A \code{numeric} vector from 0.5 to 1. This sets the
minimal percentage for the main taxon discovery.}

\item{output_type}{A \code{character} vector of length 1, either \code{table} or
\code{list}, indicating the format of the output. The tabular output only
contains values that consistently appear in all results, so \code{list} output
can have additional information. For \code{list} and \code{json} outputs, only values
for unique taxon names are returned, but the \code{table} output has rows that
correspond 1-1 with the input data.}

\item{...}{Curl options passed on to \link[crul:HttpClient]{crul::HttpClient}}
}
\value{
Depends on the value of the \code{output_type} option
}
\description{
This service parses incoming names, executes exact or fuzzy matching as
required, and returns the best-scored result. Optionally, it can also return
matches from data-sources selected by a user.
}
\examples{
\dontrun{
gna_verifier(c("Helianthus annuus", "Homo saapiens"))
gna_verifier(c("Helianthus annuus", "Homo saapiens"), all_matches = TRUE)
}
}
\author{
Zachary S.L. Foster
}
