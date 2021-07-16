#' Plot station map
#'
#' Plot receiver station locations in Columbia and Kootenay River.
#'
#'
#' @inheritParams params
#' @return An object of class 'ggplot'.
#'
#' @export
#' @examples
#' \dontrun{
#' plot_station(station, river)
#' }

plot_station <- function(station, river){

  chk_station(station)
  chk_river(river)

  bbox <- sf::st_bbox(station)
  xlim <- c(bbox["xmin"], bbox["xmax"])
  ylim <- c(bbox["ymin"], bbox["ymax"])

  ggplot() +
    geom_sf(data = river, lwd = 0.1, color = "black") +
    geom_sf(data = station, aes(color = array), show.legend = FALSE) +
    coord_sf(xlim = xlim, ylim = ylim) +
    ggspatial::annotation_scale(height = unit(0.09, "cm"), text_cex = 0.5) +
    theme(axis.text.x = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks = element_blank()) +
    NULL
}

#' Plot deployment
#'
#' Plot receiver deployments over time.
#' Optionally provide detection data to visualize detections overlapping deployment periods.
#'
#'
#' @inheritParams params
#' @return An object of class 'ggplot'.
#'
#' @export
#' @examples
#' \dontrun{
#' plot_deployment(deployment)
#' }

plot_deployment <- function(deployment, detection = NULL){

  chk_deployment(deployment)
  gp <-  ggplot(data = deployment) +
    geom_segment(aes(x = date_deployment, y = station,
                     xend = date_last_download, yend = station, color = array),
                 alpha = 1, size = 3.8) +
    geom_point(aes(x = date_deployment, y = station), pch = '|', lwd = 2) +
    geom_point(aes(x = date_last_download, y = station), pch = '|', lwd = 2) +
    labs(x = "Date", y = "Station", color = "Array") +
    theme(legend.position = "right") +
    NULL

  if(!is.null(detection)){
    chk_detection(detection)
    gp <- gp + geom_point(data = detection, aes(x = timestep, y = station),
                          color = "black", size = 1)

  }
  gp
}

#' Plot receiver coverage
#'
#' Plot combination of station map and receiver deployment over time.
#'
#'
#' @inheritParams params
#' @return An object of class 'ggplot'.
#'
#' @export
#' @examples
#'
#' \dontrun{
#' plot_receiver_coverage(station, river, deployment)
#' }

plot_receiver_coverage <- function(station, river, deployment, detection = NULL){

  gp_deployment <- plot_deployment(deployment, detection)
  gp_station <- plot_station(station, river)

  patchwork::wrap_plots(gp_deployment, gp_station)

}
