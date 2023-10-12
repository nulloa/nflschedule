#' Transform a row of data from \link{get_schedule}
#'
#' @param x The data from \link{get_schedule}
#' @return A data.frame.
#' @export

transform_data <- function(x){
  tdat <- data.frame(A = as.character(x[1]), B = as.character(t(x[-1])))
  tdat$Week <- as.numeric(gsub("\\D", "", names(x)[-1]))
  tdat$Home <- gsub("@", "", ifelse(grepl("@", tdat$B), tdat$B, tdat$A))
  tdat$Away <- ifelse(grepl("@", tdat$B), tdat$A, tdat$B)
  tdat <- tdat[,-c(1,2)]
  tdat <- subset(tdat, Away!="BYE")
  return(tdat)
}