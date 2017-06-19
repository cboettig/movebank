#https://github.com/movebank/movebank-api-doc/blob/master/movebank-api.md

#' @importFrom readr read_csv
#' @importFrom httr authenticate GET content
#'
movebank <- function(table, user, password){

base <- "https://www.movebank.org/movebank/service/direct-read"

## As listed by https://www.movebank.org/movebank/service/direct-read?attributes
## The possible entity types are:
# deployment, event, individual, sensor, study, study_attribute, tag, tag_type, taxon


auth <- httr::authenticate(user, password)
resp <- httr::GET(base, query = list(entity_type = "taxon"), auth)
taxon <- httr::content(resp, as="parsed")

}

## event table has all the raw data for all studies, by study_id
