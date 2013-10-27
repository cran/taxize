#' Get a random vector of species names.
#' 
#' @param rank Taxonomic rank, one of species, genus (default), family, order. 
#' @param size Number of names to get. Maximum depends on the rank.
#' @return List of taxonomic names
#' @author Scott Chamberlain \email{myrmecocystus@@gmail.com}
#' @export
#' @examples
#' names_list()
#' names_list('species')
#' names_list('family')
#' names_list('order')
#' names_list('order', '2')
#' names_list('order', '15')
names_list <-  function(rank='genus', size=10)
{
  switch(rank,
         family = as.character(sample(apg_families$this, size)),
         order = as.character(sample(apg_orders$this, size)),
         genus = sample(plantGenusNames, size),
         species = sample(plantNames, size))
}