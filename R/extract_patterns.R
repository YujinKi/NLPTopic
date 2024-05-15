#' Extract pattern from text data
#' @description
#'  Extract specific patterns from text document.
#' @param text The text data to use (including corpus)
#'
#' @details
#' Identified patterns from the data are
#' 1. Punctuation_Words: words containing punctuation marks
#' 2. Digits: numbers (digits)
#' 3. Uppercase_Words: words starting with uppercase
#'
#'
#' @return A list containing three patterns, named as in Details.
#' @export
#'
#' @examples
#' data("acq", package = "tm")
#' patterns_entire = extract_patterns(acq)
#' patterns = lapply(acq, extract_patterns)
#' print(patterns$'110')
#' print(patterns_entire)

extract_patterns <- function(text) {
  text <- base::unlist(text)
  connected_words <- stringr::str_extract_all(text, "[[:alnum:]]{1,}[[:punct:]]{1}?[[:alnu m:]]{1,}")
  digits <- stringr::str_extract_all(text, "[[:digit:]]{1,}")
  uppercase_words <- stringr::str_extract_all(text, "[[:upper:]]{1}[[:alpha:]]{1,}")

  result_list <- list(
    Punctuation_Words = unlist(connected_words),
    Digits = unlist(digits),
    Uppercase_Words = unlist(uppercase_words)
  )

  return(result_list)
}
