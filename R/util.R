vec_ptype_abbr_angled <- function(x) {
  glue("<{vec_ptype_abbr(x)}>")
}

sq <- function(x) {
  glue::single_quote(x)
}

# is functions don't get a "that". Only type/ptype functions do
validate_is <- function(x, this, f, ..., this_qualifier = "be ", arg = NULL) {

  arg <- as_arg(arg, enexpr(x))

  if (!f(x, ...)) {
    msg <- msg(arg, this = this, this_qualifier = this_qualifier, with_that = FALSE)
    dclr_abort(msg, "dclr_error_is")
  }

  invisible(x)
}
