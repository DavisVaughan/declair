
<!-- README.md is generated from README.Rmd. Please edit that file -->

# declair

<!-- badges: start -->

<!-- badges: end -->

The goal of declair is to provide standardized validation functions. It
is inspired by `vctrs::vec_assert()` and motivated by frustration and
duplication across packages when validating user input.

## Installation

You can install the released version of declair from
[CRAN](https://CRAN.R-project.org) with:

``` r
# no you cannot
install.packages("declair")
```

``` r
devtools::install_github("DavisVaughan/declair")
```

## Example

``` r
library(declair)
```

Nice error messages based on type

``` r
dclr_is_character(1)
#> Error: `1` must be <chr>, not <dbl>.
```

Expressions are auto labeled

``` r
x <- 1
dclr_is_character(x)
#> Error: `x` must be <chr>, not <dbl>.
```

Works with function arguments

``` r
fn <- function(my_arg) {
  dclr_is_scalar_character(my_arg)
}

fn(x)
#> Error: `my_arg` must be <chr>, not <dbl>.

fn(c("x", "y"))
#> Error: `my_arg` must have size 1, not size 2.
```

Lots of extra helpers based on rlang goodies

``` r
dclr_has_name(mtcars, "x")
#> Error: `mtcars` must have name 'x'.
```

``` r
dclr_is_integerish(1.5)
#> Error: `1.5` must be integerish.

dclr_is_integerish(1)

dclr_is_bool(1)
#> Error: `1` must be <bool> (TRUE / FALSE), not <dbl>.
```

You can use `dclr()` on any custom ptype and size.

``` r
dclr(1, ptype = glue::glue(), size = 1)
#> Error: `1` must be <glue>, not <dbl>.
```
