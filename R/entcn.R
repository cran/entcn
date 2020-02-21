#' @title Translate English words into Chinese words
#'
#' @description
#' When you pass in an English words or a vector consisting of an English words,
#' this function will calls the Youdao translation open API for R to return the
#' corresponding type of Chinese representation.
#'
#' @param x A English words or a vector made up of English words
#'
#' @return The Chinese words equivalent of English words
#'
#' @examples
#' # Example-1
#' translate("English")
#'
#' # Example-2
#' x <- c("father", "mother", "son")
#' translate(x)
#'
#' @export

translate <- function(x) {
  api = "498375134"
  keyfrom = "JustForTestYouDao"
  result = 1:length(x)
  for (i in 1:length(x))
    result[i] = stringr::str_split(
      stringr::str_split(
        RYoudaoTranslate::youdaoLookUp(x[i], api = api, keyfrom = keyfrom)[[1]],
        ";")[[1]][1], ",")[[1]][2]
  return(result[1:length(x)])
}
