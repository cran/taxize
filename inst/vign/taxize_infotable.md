<!--
%\VignetteEngine{knitr::knitr}
%\VignetteIndexEntry{Key functions}
%\VignetteEncoding{UTF-8}
-->

Some key functions in taxize, what they do, and their data sources.
======

Function name | What it does | Source |
----------- | ----------- | ----------- |
`children` | Get direct children | COL, NCBI, ITIS |
`classification` | Upstream classification | COL, NCBI, ITIS, Tropicos, EOL, GBIF, NBN |
`comm2sci` | Get scientific from common names | EOL, NCBI, ITIS, Tropicos |
`downstream` | Downstream taxa to specified rank | COL, ITIS, GBIF |
`get_ids` | Get taxonomic identifiers | COL, NCBI, ITIS, Tropicos, EOL, GBIF, NBN |
`resolve` | Resolve names using many resolvers | GNR, TNRS, iPlant |
`gnr_resolve` | Resolve names using Global Names Resolver | GNR |
`tnrs` | Phylotastic Taxonomic Name Resolution Service | NCBI, iPlant, MSW3 |
`tol_resolve` | Resolve names using any resolver | TOL |
`iplant_resolve` | iPlant name resolution| iPlant |
`sci2comm` | Get common from scientific names | EOL, NCBI, ITIS |
`synonyms` | Retrieve synonyms given input names/identifiers | COL, NCBI, ITIS, Tropicos |
`upstream` | Retrieve upstream taxa given names/identifiers | COL, ITIS |
`lowest_common` | Retrieve the lowest common taxon and rank for a given taxon name or ID | COL, ITIS, GBIF, TOL, NCBI |
`genbank2uid` | Get NCBI taxonomy UID from GenBankID | NCBI |
`tax_name` | Get taxonomic names for a given rank | NCBI, ITIS |
`tax_rank` | Get rank for a given taxonomic name | BOLD, COL, EOL, GBIF, NATSERV, NBN, TOL, TROPICOS, ITIS, NCBI, WORMS |
`tpl_get` | Get The Plant List csv files | TPL |

### Acronyms

* COL: Catalogue of Life
* NCBI: National Center for Biotechnology Information
* ITIS: Integrated Taxonomic Information Service
* EOL: Encylopedia of Life
* GBIF: Global Biodiversity Information Facility
* NBN: National Biodiversity Network (UK)
* iPlant: iPlant Name Resolution Service
* GNR: Global Names Resolver
* TNRS: Taxonomic Name Resolution Service
* TOL: Open Tree of Life
* MSW3: Mammal Species of the World, 3rd Edition
* TPL: The Plant List
* BOLD: Barcode of Life
* NATSERV: Natureserve
* TROPICOS: Tropicos plant database
* WORMS: World Register of Marine Species
