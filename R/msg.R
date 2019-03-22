#' @export
msg <- function(arg, this, that, this_qualifier = "be ", that_qualifier = "", with_that = TRUE) {

  if (with_that) {
    msg_that <- glue(", not {that_qualifier}{that}")
  }
  else {
    msg_that <- ""
  }

  glue("`{arg}` must {this_qualifier}{this}{msg_that}.")
}

#' @export
msg_type <- function(arg, this, that) {
  msg(arg, this, that)
}

#' @export
msg_size <- function(arg, this, that) {
  msg(arg, this, that, this_qualifier = "have size ", that_qualifier = "size ")
}
