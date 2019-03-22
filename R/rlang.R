#' @export
dclr_is_atomic <- function(x, size = NULL, arg = NULL) {
  arg <- as_arg(arg, enexpr(x))
  validate_is(x, "atomic", is_atomic, arg = arg)
  validate_size(x, size, arg)
}

#' @export
dclr_is_bare_atomic <- function(x, size = NULL, arg = NULL) {
  arg <- as_arg(arg, enexpr(x))
  validate_is(x, "bare atomic", is_bare_atomic, arg = arg, this_qualifier = "be a ")
  validate_size(x, size, arg)
}

#' @export
dclr_is_bare_environment <- function(x, arg = NULL) {
  arg <- as_arg(arg, enexpr(x))
  validate_is(x, "bare environment", is_bare_environment, arg = arg, this_qualifier = "be a ")
}

#' @export
dclr_is_bare_formula <- function(x, scoped = NULL, lhs = NULL, arg = NULL) {
  arg <- as_arg(arg, enexpr(x))
  validate_is(x, "bare formula", is_bare_formula, scoped = scoped, lhs = lhs, arg = arg, this_qualifier = "be a ")
}

# ------------------------------------------------------------------------------
# Some of these can have richer error messages with types

#' @export
dclr_is_bare_bytes <- function(x, size = NULL, arg = NULL) {
  arg <- as_arg(arg, enexpr(x))
  validate_is_vector(x, arg)
  validate_size(x, size, arg)
  validate_identical_ptype(x, raw(), arg)
}

#' @export
dclr_is_bare_character <- function(x, size = NULL, arg = NULL) {
  arg <- as_arg(arg, enexpr(x))
  validate_is_vector(x, arg)
  validate_size(x, size, arg)
  validate_identical_ptype(x, character(), arg)
}

#' @export
dclr_is_bare_double <- function(x, size = NULL, arg = NULL) {
  arg <- as_arg(arg, enexpr(x))
  validate_is_vector(x, arg)
  validate_size(x, size, arg)
  validate_identical_ptype(x, double(), arg)
}

#' @export
dclr_is_bare_integer <- function(x, size = NULL, arg = NULL) {
  arg <- as_arg(arg, enexpr(x))
  validate_is_vector(x, arg)
  validate_size(x, size, arg)
  validate_identical_ptype(x, integer(), arg)
}

#' @export
dclr_is_bare_list <- function(x, size = NULL, arg = NULL) {
  arg <- as_arg(arg, enexpr(x))
  validate_is_vector(x, arg)
  validate_size(x, size, arg)
  validate_identical_ptype(x, list(), arg)
}

# ------------------------------------------------------------------------------
# `size == 1`

#' @export
dclr_is_string <- function(x, arg = NULL) {
  arg <- as_arg(arg, enexpr(x))

  dclr(x, character(), size = 1L, arg = arg)

  if (is_na(x)) {
    dclr_abort(msg_type(arg, "<chr>", "NA"))
  }

  invisible(x)
}

# ------------------------------------------------------------------------------
# bool

is_bool <- function (x) {
  is_logical(x, n = 1) && !is.na(x)
}

#' @export
dclr_is_bool <- function(x, arg = NULL) {
  arg <- as_arg(arg, enexpr(x))

  validate_is_vector(x, arg)
  validate_size(x, 1, arg)

  if (!is_bool(x)) {
    dclr_abort(msg_type(arg, "<bool> (TRUE / FALSE)", vec_ptype_abbr_angled(x)))
  }

  invisible(x)
}

# ------------------------------------------------------------------------------
# ish

#' @export
dclr_is_integerish <- function(x, size = NULL, finite = NULL, arg = NULL) {
  arg <- as_arg(arg, enexpr(x))
  validate_is_vector(x, arg)
  validate_size(x, size, arg)
  validate_is(x, "integerish", is_integerish, finite = finite, arg = arg)
}

# ------------------------------------------------------------------------------
# name

#' @export
dclr_has_name <- function(x, name, arg = NULL) {
  arg <- as_arg(arg, enexpr(x))

  validate_is_vector(x, arg)

  if (!has_name(x, name)) {
    msg <- msg(arg, this = sq(name), this_qualifier = "have name ", with_that = FALSE)
    dclr_abort(msg, "dclr_error_name")
  }

  invisible(x)
}
