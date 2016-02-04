###########################

installation

###########################

install this package with:

library(devtools)
devtools::install_github("chessstats/players")

prerequisites:

if you don't have the devtools package installed, install it with:

install.packages("devtools")

prerequisites for devtools:

if you don't have the rTools package installed, install it with:

install.packages("rTools")

this may not work for R 3.2+:
the solution on Windows is to download Rtools33.exe from:

https://cran.r-project.org/bin/windows/Rtools/

this is a Windows installer which will install rTools

###########################

usage:

###########################

to download the fide players list in XML format connect to the internet and in the R console type:

library(players)
download_list()

this will create a directory called 'list_download' in the working directory
plus a subdirectory within the 'list_download' directory
the subdirectory will have the name in format "dd_mm_yyyy" for the current date ( eg. "04_02_2016" )
warning: if the subdirectory existed before all its content will be deleted!
then it downloads the XML file and saves it in the subdirectory
unzips it and renames the unzipped XML file 'players.xml'

to create a data table from the downloaded XML file:

library(players)
process_xml("subdirectory name")

eg. process_xml("04_02_2016")

this will parse the XML file in the specified subdirectory
and store it in a data table called "players.txt" within the same directory

from the working directory this can be read to a data frame with:

df <- read.table("list_download/subdirectory name/players.txt")

eg. df<-read.table("list_download/04_02_2016/players.txt")

