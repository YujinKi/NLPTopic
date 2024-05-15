# R Package : NLPTopic

<p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"><a property="dct:title" rel="cc:attributionURL" href="https://github.com/YujinKi/NLPTopic">R package : NLPTopic</a> by <span property="cc:attributionName">Yujin Ki</span> is licensed under <a href="https://creativecommons.org/licenses/by/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">CC BY 4.0<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1" alt=""></a></p>

NLPTopic is an R package for topic modelling analysis. This package basically provides four functions including basic text preprocessing procedure, extracting some patterns from text, and topic modelling analysis. These functions are designed by using the existing functions in R packages such as \texttt{tm}, \texttt{topicmodels} with limited selections of optional arguments from each function. Although this package does not provide accurate analysis, it aims to implement analysis processes, and returning metrics or tables at once rather than one by one. Therefore, this package is recommended for people who have no or less experience with corpus data but still want to conduct a topic model. For more sophisticated and accurate modeling, it is recommended to use the optional arguments of the existing R packages. 

## Installation

You can install NLPTopic from GitHub using the following commands:

```R
# install.packages("devtools")
devtools::install_github("YujinKi/NLPTopic")
```

## Functions 

### extract_patterns

\texttt{extract\_patterns} function return a list containing three patterns 
1. words containing punctuation marks, which can identify patterns such as email or combined words by dash  
2. any digits, which can be year 
3. words starting with upper case such as proper noun. 
\\
This function is helpful for setting the direction of preprocessing of text data.


### text_preprocessing 

\texttt{text\_preprocessing} function provide preprocessed corpus data containing converting to lowercase, removing punctuation marks, numbers, specific stopwords, and stripping extra whitespace. This function allows to solve the most basic text preprocessing procedures at once. 

  
### finc_optimal_k 

\texttt{find\_optimal\_k} function can find the optimal number of topics. This function is for the following \texttt{topic\_models} function as we need to specify the number of topics $k$ in the context of \texttt{topic\_models} function. Two metrics "Griffiths2004" and "CaoJuan2009" from \texttt{FindTopicNumber} in \texttt{ldatuning} package is used by combining with weighted sum. The ratio of weighted sum can be set differently depending on the user's subjective view on the importance between two metrics. 


### topic_models 

\texttt{topic\_models} function conducts topic models - LDA and CTM and return a list containing significant outputs from models. Three elements of the list are 1. Top n words by topic 2. Topic probability for each document 3. The highest probability topic in each document. Ideally, the optimal number of topics obtained by \texttt{find\_optimal\_k} would be used. 


## Example 

This is the short example of conducting functions in this R package 


