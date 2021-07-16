#' Plot detection paths
#'
#' Plot Columbia River White Sturgeon movement paths from VR2 receiver detection data.
#'
#'
#' @param reference_locations A tibble of reference locations containing columns 'label' and 'rkm'.
#' @param lims_x A vector of class 'Date' containing x-axis limits.
#' @param lims_y A vector of the numeric y-axis limits.
#' @inheritParams params
#' @return An object of class 'ggplot'.
#'
#' @export
#' @examples
#' \dontrun{
#' lims_x = c(min(deployment$date_deployment), max(deployment$date_last_download))
#' lims_y = c(0, 56)
#' plot_detection_path(detection, deployment, reference_locations)#'
#' }

plot_detection_path <- function(detection_path, deployment, reference_locations, lims_x, lims_y){

  chk_detection_path(detection_path)
  chk_deployment(deployment)

  chk_is(reference_locations, "tbl")
  check_names(reference_locations, names = c("label", "rkm"))

  chk_is(lims_x, "Date")
  chk_length(lims_x, 2L)
  chk_is(lims_y, "numeric")
  chk_length(lims_y, 2L)

  ggplot(data = detection_path, aes(x = timestep, y = array_rkm)) +
    geom_segment(data = deployment, aes(x = date_deployment, y = array_rkm,
                                        xend = date_last_download, yend = array_rkm),
                 alpha = 1, size = 3.8, color = "#EDEDED") +
    geom_line(aes(group = path)) +
    geom_point(aes(color = array), size = 1.3) +
    labs(x = 'Date', y = 'Rkm', color = "Array") +
    lims(x = lims_x,
         y = lims_y) +
    geom_hline(data = reference_locations, aes(yintercept = rkm), linetype = 'dotted') +
    geom_text(data = reference_locations, aes(label = label, x = lims_x[1], y = rkm),
              vjust = -0.5, hjust = 0.1, size = 3.5) +

    theme_bw()
}
