
library("movebank")
readRenviron(".Renviron")

taxon <- movebank("taxon")
study <- movebank("study")
tag_type <- movebank("tag_type")

sensor <- movebank("sensor")
sensor_test <- movebank("sensor", study_id=2238275)

deployment <- movebank("deployment")

individual <- movebank("individal")
study_attribute <- movebank("study_attribute")
tag<- movebank("tag")
event <- movebank("event")


devtools::use_data(taxon)
devtools::use_data(study)
devtools::use_data(deployment)
devtools::use_data(sensor)
devtools::use_data(individual)
devtools::use_data(study_attribute)
devtools::use_data(tag)
devtools::use_data(tag_type)
devtools::use_data(event)





# deployment, event, individual, sensor, study, study_attribute, tag, tag_type, taxon
