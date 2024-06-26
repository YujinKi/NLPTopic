% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/text_preprocessing.R
\name{text_preprocessing}
\alias{text_preprocessing}
\title{Preprocess text data}
\usage{
text_preprocessing(corpus, kind = "en")
}
\arguments{
\item{corpus}{The corpus document to use}

\item{kind}{A character string to specific stopword list; defaults to "en"}
}
\value{
A corpus document after preprocessing.
}
\description{
Preprocess text (corpus) data with several steps
}
\details{
Preprocess data with 5 steps
\enumerate{
\item convert to lowercase
\item remove punctuation marks
\item remove numbers
\item strip extra whitespace
\item remove specific stopwords
}

Available stopword lists include "en"(default), "catalan", "romanian", "SMART". Details of each list and additional lists can be found in stopword function in tm package.
}
\examples{
data("acq", package = "tm")
text_preprocessing(acq)
acq_preprocessed <- text_preprocessing(acq, kind = "SMART")
acq_preprocessed[['110']]$content
}
