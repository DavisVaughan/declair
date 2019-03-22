#' @export
dclr <- function (x, ptype = NULL, size = NULL, arg = NULL) {

  arg <- as_arg(arg, enexpr(x))

  validate_is_vector(x, arg)
  validate_ptype(x, ptype, arg)
  validate_size(x, size, arg)

  invisible(x)
}

validate_is_vector <- function(x, arg) {

  if (!vec_is_vector(x)) {

    msg <- msg(
      arg = arg,
      this = "a vector",
      that = friendly_type_of(x),
      that_qualifier = ""
    )

    dclr_abort_scalar(msg, actual = x)
  }

  invisible(x)
}


validate_ptype <- function(x, ptype, arg) {

  if (!is_null(ptype)) {

    ptype <- vec_type(ptype)
    x_type <- vec_type(x)

    if (!is_same_type(x_type, ptype)) {

      msg <- msg_type(
        arg = arg,
        this = vec_ptype_abbr_angled(ptype),
        that = vec_ptype_abbr_angled(x_type)
      )

      dclr_abort_ptype(msg, ptype, x_type)
    }

  }

  invisible(x)
}

validate_size <- function(x, size, arg) {

  if (!is_null(size)) {

    size <- vec_recycle(vec_cast(size, integer()), 1L)
    x_size <- vec_size(x)

    if (!identical(x_size, size)) {

      msg <- msg_size(arg, size, x_size)

      dclr_abort_size(msg, required = size, actual = x_size)
    }

  }

  invisible(x)
}

# Bare prototypes act as partial types. Only the SEXPTYPE is checked.
is_same_type <- function(x, ptype) {

  if (!is.object(x) || !is.object(ptype)) {
    typeof(x) == typeof(ptype)
  }
  else {
    identical(x, ptype)
  }

}

# ------------------------------------------------------------------------------

# stricter version of validate_ptype() for use
# with dclr_is_bare_*() functions. Treats
# glue() and character() differently
validate_identical_ptype <- function(x, ptype, arg) {

  if (!is_null(ptype)) {

    ptype <- vec_type(ptype)
    x_type <- vec_type(x)

    if (!is_identical_type(x_type, ptype)) {

      msg <- msg_type(
        arg = arg,
        this = vec_ptype_abbr_angled(ptype),
        that = vec_ptype_abbr_angled(x_type)
      )

      dclr_abort_ptype(msg, ptype, x_type)
    }

  }

  invisible(x)
}

is_identical_type <- function(x, ptype) {
  identical(x, ptype)
}
