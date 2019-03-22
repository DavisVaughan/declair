dclr_abort <- function(msg, .subclass = character(), ...) {
  abort(msg, .subclass = c(.subclass, "dclr_error"), ...)
}

dclr_abort_ptype <- function(msg, required, actual) {
  dclr_abort(msg, .subclass = "dclr_error_ptype", required = required, actual = actual)
}

dclr_abort_size <- function(msg, required, actual) {
  dclr_abort(msg, .subclass = "dclr_error_size", required = required, actual = actual)
}

dclr_abort_scalar <- function(msg, actual) {
  dclr_abort(msg, .subclass = "dclr_error_scalar", actual = actual)
}
