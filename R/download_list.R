#' Download List
#'
#' Downloads the players list in XML format from Fide
#' @param none none
#' @keywords Fide players list download
#' @export
#' @examples
#' download_list()

download_list <- function() {
	curdir<-paste("list_download",format(Sys.Date(),"%d_%m_%Y"),sep="/")
	dir.create("list_download")
	cat("Removing directory",curdir,"\n")
	unlink(curdir, recursive=TRUE)
	cat("Creating directory",curdir,"\n")
	dir.create(curdir)
	curpath<-paste(curdir,"players.zip",sep="/")
	cat("Downloading players list\n")
	download.file("http://ratings.fide.com/download/players_list_xml.zip",curpath)
	cat("Unzipping players list\n")
	unzip(curpath,exdir=curdir)
	files<-list.files(path=curdir,full.names=TRUE,pattern="\\.xml$")
	xmlpath=files[1]
	cat("Unzipped file name:",xmlpath,"\n")	
	playerspath=paste(curdir,"players.xml",sep="/")
	cat("Renaming to players.xml\n")
	file.rename(from=xmlpath,to=playerspath)
	print("Done.")	
}