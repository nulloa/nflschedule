#' Get the NFL schedule for a certain year
#'
#' @param year Year of NFL schedule
#' @param original Return original data or transformed data
#' @return A data.frame
#' @export
#' @examples
#' get_schedule(year="2023")

get_schedule <- function(year=NULL, original=F){
  # Create the link from where to get the data
  link <- paste0("https://www.4for4.com/teams/schedule/", year, "/grid")
  # Pull the data
  web_page <- rvest::read_html(link)
  # Parse the data
  odat <- rvest::html_table(rvest::html_element(web_page, "table"))
  # Transform the data
  tdat <- unique(do.call("rbind", apply(odat, 1, transform_data)))
  
  # Return original or transformed data
  if(original){
    return(odat)
  }else{
    return(tdat)
  }
  
}