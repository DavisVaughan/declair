# ------------------------------------------------------------------------------

#' @export
dclr_is_numeric <- function(x, size = NULL, arg = NULL) {
  dclr(x, ptype = numeric(), size = size, arg = as_arg(arg, enexpr(x)))
}

#' @export
dclr_is_integer <- function(x, size = NULL, arg = NULL) {
  dclr(x, ptype = integer(), size = size, arg = as_arg(arg, enexpr(x)))
}

#' @export
dclr_is_character <- function(x, size = NULL, arg = NULL) {
  dclr(x, ptype = character(), size = size, arg = as_arg(arg, enexpr(x)))
}

#' @export
dclr_is_logical <- function(x, size = NULL, arg = NULL) {
  dclr(x, ptype = logical(), size = size, arg = as_arg(arg, enexpr(x)))
}

# ------------------------------------------------------------------------------

#' @export
dclr_is_scalar_character <- function(x, arg = NULL) {
  dclr(x, character(), size = 1L, arg = as_arg(arg, enexpr(x)))
}

#' @export
dclr_is_scalar_double <- function(x, arg = NULL) {
  dclr(x, double(), size = 1L, arg = as_arg(arg, enexpr(x)))
}

#' @export
dclr_is_scalar_integer <- function(x, arg = NULL) {
  dclr(x, integer(), size = 1L, arg = as_arg(arg, enexpr(x)))
}

# ------------------------------------------------------------------------------

#' @export
dclr_is_null <- function(x, arg = NULL) {
  arg <- as_arg(arg, enexpr(x))

  if (!is_null(x)) {
    msg <- msg(arg, this = "NULL", this_qualifier = "be ", with_that = FALSE)
    abort(msg)
  }
}



