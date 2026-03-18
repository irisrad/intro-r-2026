
# training_source.R — shared setup for Intro to R Workshop
# Installs (if needed) and loads packages, then defines helper functions used in the QMD.

pkgs <- c(
  "rio",        # import/export by file extension
  "tidyverse",  # dplyr, tidyr, ggplot2, readr, etc.
  "lubridate",  # date-time parsing
  "stringr",    # string utilities
  "janitor",    # clean_names(), tabyl(), etc.
  "scales",     # percent_format and friends
  "tidycensus"  # ACS API wrapper (optional bonus section)
)

need <- pkgs[!pkgs %in% rownames(installed.packages())]
if (length(need)) install.packages(need)

invisible(lapply(pkgs, library, character.only = TRUE))

# ---- Helper: tidy_acs_result -------------------------------------------------
#' Tidy ACS result to wide format
#'
#' @param raw_result tibble returned by tidycensus::get_acs()
#' @param include_moe logical; if TRUE include margin-of-error columns
#' @return a wide tibble with one row per GEOID
#' @examples
#' # wide <- tidy_acs_result(get_acs(...))

tidy_acs_result <- function(raw_result, include_moe = FALSE) {
  if (isTRUE(include_moe)) {
    new_df <- raw_result |>
      tidyr::pivot_wider(id_cols = GEOID:NAME,
                         names_from = variable,
                         values_from = estimate:moe)
  } else {
    new_df <- raw_result |>
      tidyr::pivot_wider(id_cols = GEOID:NAME,
                         names_from = variable,
                         values_from = estimate)
  }
  new_df
}

# ---- Helper: safe_export -----------------------------------------------------
# Export a data frame if a path is supplied; otherwise do nothing
safe_export <- function(x, path = NULL) {
  if (!is.null(path) && nzchar(path)) rio::export(x, path)
  invisible(x)
}
