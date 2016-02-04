#' Process XML
#'
#' Processes the players list in XML format from Fide
#' @param date download date in dd_mm_yyyy format
#' @keywords Fide players list XML process
#' @export
#' @examples
#' process_xml("02_04_2016")

process_xml <- function(date) {
	require("XML")
	require("methods")
	xmldir=paste("list_download",date,sep="/")
	cat("Opening directory:",xmldir,"\n")
	if(!file.exists(xmldir)) {
		cat("Error, directory",xmldir,"does not exist.\n")
		return()
	}
	xmlpath=paste(xmldir,"players.xml",sep="/")
	cat("Opening file:",xmlpath,"\n")
	if(!file.exists(xmlpath)) {
		cat("Error, file",xmlpath,"does not exist.\n")
		return()
	}
	cat("Processing file:",xmlpath,", please wait.\n")
	players_df <- xmlToDataFrame(xmlpath)
	txtpath=paste(xmldir,"players.txt",sep="/")
	cat("Writing list to:",txtpath,", please wait.\n")
	write.table(players_df,txtpath)
	print("Done.")
}