
## ----installtaxizecran, eval=FALSE---------------------------------------
## install.packages("taxize")


## ----loadtaxize, messages=FALSE, warning=FALSE---------------------------
library(taxize)


## ----resolvenames, eval=TRUE, cache=FALSE--------------------------------
temp <- gnr_resolve(names = c("Helianthos annus", "Homo saapiens"))
temp[ , -c(1,4)]


## ----tnrs, eval=TRUE, cache=FALSE----------------------------------------
mynames <- c("Helianthus annuus", "Pinus contort", "Poa anua", "Abis magnifica",
  	"Rosa california", "Festuca arundinace", "Sorbus occidentalos","Madia sateva")
tnrs(query = mynames, source = "iPlant_TNRS")[ , -c(5:7)]


## ----synonyms, eval=TRUE, cache=FALSE, message=FALSE, warning=FALSE, comment=NA----
mynames <- c("Helianthus annuus ssp. jaegeri", "Helianthus annuus ssp. lenticularis", "Helianthus annuus ssp. texanus")
tsn <- get_tsn(mynames)
library(plyr)
ldply(tsn, itis_acceptname)


## ----itisclass, eval=TRUE, cache=FALSE-----------------------------------
specieslist <- c("Abies procera","Pinus contorta")
classification(specieslist, db = 'itis')


## ----taxname, eval=TRUE,cache=TRUE---------------------------------------
tax_name(query = "Helianthus annuus", get = "family", db = "ncbi")


## ----interactive, eval=TRUE, echo=TRUE, cache=FALSE----------------------
get_tsn(searchterm = "Heliastes", searchtype = "sciname")


## ----interactive_many, eval=TRUE, echo=TRUE, cache=FALSE-----------------
splist <- c("annona cherimola", 'annona muricata', "quercus robur")
get_tsn(searchterm = splist, searchtype = "sciname")


## ----downstream, eval=TRUE, cache=FALSE----------------------------------
col_downstream(name = "Apis", downto = "Species")[[1]]


## ----tax_match, cache=FALSE, tidy=FALSE----------------------------------
A <- "gammarus roeseli" 

B1 <- "gammarus roeseli"
B2 <- "gammarus"
B3 <- "gammaridae"

A_clas <- classification(A, db = 'ncbi')
B1_clas <- classification(B1, db = 'ncbi')
B2_clas <- classification(B2, db = 'ncbi')
B3_clas <- classification(B3, db = 'ncbi')


B1[match(A, B1)]
A_clas[[1]]$Rank[tolower(A_clas[[1]]$ScientificName) %in% B2]
A_clas[[1]]$Rank[tolower(A_clas[[1]]$ScientificName) %in% B3]


