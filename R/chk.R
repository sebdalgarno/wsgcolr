#' Check detection path data
#'
#' @inheritParams params
#' @return A flag.
#'
#' @export

chk_detection_path <- function(detection_path){
  chk_is(detection_path, "tbl")
  check_names(detection_path ,names =  c("transmitter_id", "timestep", "path", "array", "array_rkm"))
}

#' Check detection data
#'
#' @inheritParams params
#' @return A flag.
#'
#' @export

chk_detection <- function(detection){
    chk_is(detection, "tbl")
    check_names(detection ,names =  c("transmitter_id", "timestep", "station"))
}

#' Check deployment data
#'
#' @inheritParams params
#' @return A flag.
#'
#' @export

chk_deployment <- function(deployment){
  chk_is(deployment, "tbl")
  check_names(deployment, names = c("date_deployment", "date_last_download", "array", "array_rkm", "station"))
}

#' Check station data
#'
#' @inheritParams params
#' @return A flag.
#'
#' @export

chk_station <- function(station){
  chk_is(station, "sf")
  check_names(station, names = c("array"))
  chkor(chk_is(sf::st_geometry(station), "sfc_POINT"), chk_is(sf::st_geometry(station), "sfc_MULTIPOINT"))
}

#' Check river data
#'
#' @inheritParams params
#' @return A flag.
#'
#' @export

chk_river <- function(river){
  chk_is(river, "sf")
  chkor(chk_is(sf::st_geometry(river), "sfc_POLYGON"), chk_is(sf::st_geometry(river), "sfc_MULTIPOLYGON"))
}

#' Check reference locations
#'
#' @inheritParams params
#' @return A flag.
#'
#' @export

chk_reference_locations <- function(reference_locations){
  chk_is(reference_locations, "tbl")
  check_names(reference_locations, names = c("label", "rkm"))
}
