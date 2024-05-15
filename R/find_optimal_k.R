#' Find the optimal number of topics
#'
#' @description
#' Automatically find the optimal number of topics from corpus document.
#'
#' @param corpus The corpus document to use
#' @param seed_number set.seed for Gibbs sampling in FindTopicNumber function ; defaults to NA. Object of class "integer".
#' @param weights A weighted ratio for each "Griffiths2004", "CaoJuan2009" metric ; defaults to c(0.5, 0.5). A vector containing two numeric elements. Ideally, the sum of vector is 1.
#' @param topic_range The considered number of topic range. A vector of type "integer" or "double". Ideally, the results from functions such as seq are recommended.
#'
#' @details
#' The objective of the function is finding the optimal number of topics based on FindTopicsNumber function in ldatuning package. Combination of two metrics "Griffiths2004", "CaoJuan2009" from FindTopicsNumber as a weighted sum is considered.
#' Weights can be set differently depending on the user's subjective view on the importance of the two measurements. Since the function normalises the vector to be ratio, the sum of the vector for the weights does not necessarily have to be 1.
#' The range of desired k (topic_range) must be manually set by users.
#'
#' @return A scalar of type "integer": The number of optimal topics from the corpus document
#' @export
#'
#' @examples
#' data("acq", package = "tm")
#' topic_range <- seq(from=3,to=18,by=3)
#' find_optimal_k(acq, topic_range = topic_range)
#' find_optimal_k(acq, seed_number = 123, topic_range = topic_range)
#' find_optimal_k(acq, weights = c(0.3, 0.7), topic_range = topic_range)
#' find_optimal_k(acq, seed_number = 123, weights = c(4, 5), topic_range = topic_range)

find_optimal_k <- function(corpus, seed_number = NA, weights = c(0.5, 0.5), topic_range) {

  if (base::sum(weights) != 1) {
    weights <- weights / base::sum(weights)
  }

  dtm = tm::DocumentTermMatrix(corpus)

  optimal_topics <- ldatuning::FindTopicsNumber(dtm, topics = topic_range,
                                                metrics = c("Griffiths2004", "CaoJuan2009"),
                                                method = "Gibbs",
                                                control = list(seed = seed_number))

  optimal_topics$Griffiths2004 <- scales::rescale(optimal_topics$Griffiths2004, to = c(0, 1))
  optimal_topics$CaoJuan2009 <- scales::rescale(optimal_topics$CaoJuan2009, to = c(0, 1))

  optimal_topics$weighted_sum <- weights[1] * (1 - optimal_topics$Griffiths2004) +
    weights[2] * optimal_topics$CaoJuan2009

  idx <- base::which.min(optimal_topics$weighted_sum)

  return(optimal_topics[idx, "topics"])
}
