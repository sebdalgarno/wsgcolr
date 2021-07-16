#' Parameter Descriptions for wsgcolr functions
#'
#' @param detection_path A tibble of detection path data containing columns 'transmitter_id', 'timestep', 'path', 'array', 'array_rkm', .
#' @param detection A tibble of detection data containing columns 'transmitter_id', 'timestep', 'station'. If `NULL`, argument is ignored.
#' @param deployment A tibble of the receiver deployments containing columns 'date_deployment', 'date_last_download', 'station', 'array', 'array_rkm'.
#' @param station A sf object of the station point locations containing column 'array' (for color coding). Geometry column must inherit class 'sfc_POINT' or 'sfc_MULTIPOINT'.
#' @param river A sf object of the river polygon. Geometry column must inherit class 'sfc_POLYGON' or 'sfc_MULTIPOLYGON'.
#' @keywords internal
#' @name params
NULL
