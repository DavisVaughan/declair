#' @export
dclr_type <- function(x, ptype, arg = NULL) {
  dclr(x, ptype = ptype, arg = as_arg(arg, enexpr(x)))
}

#' @export
dclr_size <- function(x, size, arg = NULL) {
  dclr(x, size = size, arg = as_arg(arg, enexpr(x)))
}
