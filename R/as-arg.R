#' @export
as_arg <- function(arg, x_expr) {
  arg %||% as_label(x_expr)
}
