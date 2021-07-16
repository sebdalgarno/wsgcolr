chk_detection_path <- function(detection){
  chk_is(detection, "tbl")
  check_names(detection ,names =  c("transmitter_id", "timestep", "path", "array", "array_rkm"))
}

chk_detection <- function(detection){
    chk_is(detection, "tbl")
    check_names(detection ,names =  c("transmitter_id", "timestep", "station"))
}

chk_deployment <- function(deployment){
  chk_is(deployment, "tbl")
  check_names(deployment, names = c("date_deployment", "date_last_download", "array", "array_rkm", "station"))
}

chk_station <- function(station){
  chk_is(station, "sf")
  check_names(station, names = c("array"))
  chkor(chk_is(sf::st_geometry(station), "sfc_POINT"), chk_is(sf::st_geometry(station), "sfc_MULTIPOINT"))
}

chk_river <- function(river){
  chk_is(river, "sf")
  chkor(chk_is(sf::st_geometry(river), "sfc_POLYGON"), chk_is(sf::st_geometry(river), "sfc_MULTIPOLYGON"))
}
