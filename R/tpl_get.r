#' Get The Plant List csv files.
#'
#' @export
#' @param x Directory to write csv files to.
#' @param family If you want just one, or >1 family, but not all, list
#' them in a vector.
#' @param ... (list) Curl options passed on to \code{\link[httr]{GET}}
#' @details Throws a warning if you already have a directory of the one
#' provided, but still works. Writes to your home directory, change x
#' as needed.
#' @return Returns nothing to console, except a message and progress bar.
#' Writes csv files to x.
#' @author John Baumgartner (johnbb@@student.unimelb.edu.au)
#' @seealso \code{\link{tpl_families}}
#' @references The Plant List http://www.theplantlist.org
#' @examples \dontrun{
#' # Get a few families
#' dir <- file.path(tempdir(), "abc")
#' tpl_get(dir, family = c("Platanaceae","Winteraceae"))
#' readLines(file.path(dir, "Platanaceae.csv"), n = 5)
#'
#' # You can now get Gymnosperms as well
#' dir1 <- file.path(tempdir(), "def")
#' tpl_get(dir1, family = c("Pinaceae","Taxaceae"))
#'
#' # You can get mosses too!
#' dir2 <- file.path(tempdir(), "ghi")
#' tpl_get(dir2, family = "Echinodiaceae")
#'
#' # Get all families
#' ## Beware, will take a while
#' ## dir3 <- file.path(tempdir(), "jkl")
#' ## tpl_get("dir3)
#' }

tpl_get <- function(x, family = NULL, ...) {
  temp <- httr::GET('http://www.theplantlist.org/1.1/browse/-/', ...)
  temp <- xml2::read_html(con_utf8(temp), encoding = "UTF-8")
  families <- xml2::xml_text(
    xml2::xml_find_all(temp, "//ul[@id='nametree']//a"))
  csvlinks <- sprintf(
    'http://www.theplantlist.org%s%s.csv',
    xml2::xml_attr(xml2::xml_find_all(temp, "//ul[@id='nametree']//a"), 'href'),
    families)
  if (!is.null(family) && all(!family %in% families)) {
    stop(paste('Requested families not found on TPL.',
               'Use tpl_families() to list plant families indexed by TPL.'),
         call. = FALSE)
  }
  if (!is.null(family) && any(!family %in% families)) {
    warning(
      sprintf('Requested families not found on TPL: %s.\n%s',
              paste(family[!family %in% families], collapse = ', '),
              'Use tpl_families() to list plant families indexed by TPL.'),
      call. = FALSE)
  }
  if (!is.null(family)) {
    csvlinks <- csvlinks[families %in% family]
    families <- families[families %in% family]
  }

  message("Downloading csv files to ", x, "...")
  dir.create(x, showWarnings = FALSE, recursive = TRUE)
  plyr::l_ply(csvlinks, getcsv, x = x, .progress = "text")
  message("...el fin")
}

getcsv <- function(z, x) {
  #download.file(z, destfile = file.path(x, basename(z)), quiet = TRUE)
  invisible(GET(z, httr::write_disk(path = file.path(x, basename(z)), overwrite = TRUE)))
}
