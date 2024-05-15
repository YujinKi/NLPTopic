#' Implement topic models
#'
#' @description
#' Estimate a topic model based on topicmodels package using for the VEM algorithm and present key metrics by topic and document.
#'
#' @param corpus The corpus document to use
#' @param model A topic model to use ; defaults to LDA. Only LDA and CTM are supported
#' @param k The number of topics. A scalar of type "integer"
#' @param seed_number set.seed for VEM estimation ; defaults to NA. Object of class "integer"
#' @param n_terms The number of top words by topic ; defaults to 20. A scalar of type "integer"
#'
#' @details
#' The function is designed for presenting metrics by topic or document after estimating LDA (default) and CTM from topicmodels package.
#'
#' The three metrics from the model are
#' 1. Top_words_by_topic: Top n words by topic. n_terms argument is used.
#' 2. Latent_topic_prob: Topic probability for each document.
#' 3. Highest_prop_topic: The highest probability topic in each document.
#'
#' @return A list containing three elements, named as in Details.
#' @export
#'
#' @examples
#' data("acq", package = "tm")
#' topic_models(acq, k=7)
#' topic_models(acq, model = topicmodels::CTM, k = 7, n_terms = 10)



topic_models  <- function(corpus, model = topicmodels::LDA, k, seed_number = NA, n_terms = 20) {

  dtm = tm::DocumentTermMatrix(corpus)

  model.out <- model(dtm, control = list(seed = seed_number), k = k)
  posterior_model = modeltools::posterior(model.out)

  result_list <- list(
    Top_words_by_topic = topicmodels::terms(model.out, n_terms),
    Latent_topic_prob = round(posterior_model$topics, 3),
    Highest_prop_topic = topicmodels::topics(model.out)
  )

  return(result_list)
}
