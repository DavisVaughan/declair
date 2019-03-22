#' @export
dclr_or <- function(...) {
  dclr_quos <- rlang::enquos(...)

  results <- eval_loop(dclr_quos)
  errors <- remove_null(results)

  if (length(results) == length(errors)) {

    msgs <- lapply(errors, function(error) {error$message})
    msgs <- glue::glue_collapse(glue("- {msgs}"), "\n")

    abort(
      glue("At least one condition must pass:\n{msgs}"),
      .subclass = "dclr_error_or",
      errors = errors
    )

  }

  invisible(NULL)
}

#' @export
dclr_and <- function(...) {
  dclr_quos <- rlang::enquos(...)

  results <- eval_loop(dclr_quos)
  errors <- remove_null(results)

  if (length(errors) != 0L) {

    msgs <- lapply(errors, function(error) {error$message})
    msgs <- glue::glue_collapse(glue("- {msgs}"), "\n")

    abort(
      glue("All conditions must pass. The following do not:\n{msgs}"),
      .subclass = "dclr_error_and",
      errors = errors
    )

  }

  invisible(NULL)
}

remove_null <- function(x) {
  Filter(Negate(is.null), x)
}

eval_loop <- function(.quos) {

  lapply(.quos, function(.quo) {
    rlang::with_handlers(
      {
        rlang::eval_tidy(.quo)
        NULL
      },
      error = function(c) {
        c
      }
    )
  })

}
