% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vascan_search.r
\name{vascan_search}
\alias{vascan_search}
\title{Search the CANADENSYS Vascan API.}
\usage{
vascan_search(q, format = "json", raw = FALSE, ...)
}
\arguments{
\item{q}{(character) Can be a scientific name, a vernacular name or a VASCAN
taxon identifier (e.g. 861)}

\item{format}{(character) One of json (default) or xml.}

\item{raw}{(logical) If TRUE, raw json or xml returned, if FALSE, parsed
data returned.}

\item{...}{(list) Further args passed on to \link[crul:verb-GET]{crul::verb-GET}}
}
\value{
json, xml or a list.
}
\description{
Search the CANADENSYS Vascan API.
}
\details{
Note that we lowercase all outputs in data.frame's, but when a
list is given back, we don't touch the list names.
}
\examples{
\dontrun{
vascan_search(q = "Helianthus annuus")
vascan_search(q = "Helianthus annuus", raw=TRUE)
vascan_search(q = c("Helianthus annuus", "Crataegus dodgei"), raw=TRUE)

# format type
## json
c <- vascan_search(q = "Helianthus annuus", format="json", raw=TRUE)
library("jsonlite")
fromJSON(c, FALSE)

## xml
d <- vascan_search(q = "Helianthus annuus", format="xml", raw=TRUE)
library("xml2")
xml2::read_xml(d)

# lots of names, in this case 50
splist <- names_list(rank='species', size=50)
vascan_search(q = splist)

# Curl options
invisible(vascan_search(q = "Helianthus annuus", verbose = TRUE))
}
}
\references{
API docs https://data.canadensys.net/vascan/api
}
\author{
Scott Chamberlain {myrmecocystus@gmail.com}
}
\keyword{names}
\keyword{taxonomy}
