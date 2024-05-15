#' Preprocess text data
#' @description
#' Preprocess text (corpus) data with several steps
#' @param corpus The corpus document to use
#' @param kind A character string to specific stopword list; defaults to "en"
#'
#' @details
#' Preprocess data with 5 steps
#' 1. convert to lowercase
#' 2. remove punctuation marks
#' 3. remove numbers
#' 4. strip extra whitespace
#' 5. remove specific stopwords
#'
#' Available stopword lists include "en"(default), "catalan", "romanian", "SMART". Details of each list and additional lists can be found in stopword function in tm package.
#'
#'
#' @return A corpus document after preprocessing.
#' @export
#'
#' @examples
#' data("acq", package = "tm")
#' text_preprocessing(acq)
#' acq_preprocessed <- text_preprocessing(acq, kind = "SMART")
#' acq_preprocessed[['110']]$content

text_preprocessing <- function(corpus, kind = "en"){
  corpus <- tm::tm_map(corpus, tm::content_transformer(base::tolower))
  corpus <- tm::tm_map(corpus, tm::removePunctuation)
  corpus <- tm::tm_map(corpus, tm::removeNumbers)
  corpus <- tm::tm_map(corpus, tm::stripWhitespace)
  corpus <- tm::tm_map(corpus, tm::removeWords, tm::stopwords(kind))
  return(corpus)
}

