#https://github.com/movebank/movebank-api-doc/blob/master/movebank-api.md

base <- "https://www.movebank.org/movebank/service/direct-read"

#' movebank
#'
#' Read data from movebank
#' @param table Name of the table, see details. If NULL, text listing possible tables and their attributes is returned.
#' @param ... additional fields to filter on as named list, depends on table selecte
#' @param user username. Will be read from Sys.getenv("MOVEBANK_USER") if not supplied, register at https://www.movebank.org/
#' @param password user password. Will be read from Sys.getenv("MOVEBANK_PW") if not supplied, register at https://www.movebank.org/
#' @return Returns the requested table (read by read_csv), possibly filtered by additional search fields
#' @details Acceptable table names are: deployment, event, individual, sensor, study, study_attribute, tag, tag_type, taxon

#' @importFrom readr read_csv
#' @importFrom httr authenticate GET content warn_for_status
#' @export
#' @examples \dontrun{
#'
#' ## Not run, requires password set
#' movebank("study")
#'
#' }
movebank <- function(table = NULL,
                     ...,
                     user = Sys.getenv("MOVEBANK_USER"),
                     password = Sys.getenv("MOVEBANK_PW"),
                     encoding = "UTF-8"){

## As listed by https://www.movebank.org/movebank/service/direct-read?attributes
## The possible entity types are:
# deployment, event, individual, sensor, study, study_attribute, tag, tag_type, taxon

  if(is.null(table)){
    query <- "attributes"
  } else {
    query <- list(entity_type = table, ...)
  }

  ## write methods to use select & filter verbs, taxon %>% select(study_id) %>% filter(study) %>% call_api()

  ## FIXME adjust so that we can take lists of studies, or filters
  #"Example query": "?entity-type=individual&study=80355,80725&attributes=id,local-identifier,taxon"


  auth <- httr::authenticate(user, password)
  resp <- httr::GET(base, query = query, auth)
  httr::warn_for_status(resp)
  httr::content(resp, as="parsed", encoding = encoding)

}

## event table has all the raw data for all studies, by study_id

#https://www.movebank.org/movebank/service/public/json



