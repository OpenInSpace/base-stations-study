# LIBRARIES ---------------------------------------------------------------
library(rvest)

# VARIABLES ---------------------------------------------------------------
url <- "https://archiwum.uke.gov.pl/archiwum-wykazow-pozwolen-radiowych-dla-stacji-gsm-umts-lte-oraz-cdma-7502"
absoluteUrl <- "https://archiwum.uke.gov.pl/"
resultDir <- "D:\\temp\\"

# LINKS EXTRACTION ---------------------------------------------------
sourceCode <- read_html(url)

aTags <- html_nodes(sourceCode, "a")
aTagsRAR <- grep(".rar", aTags, value=TRUE)

pattern <- '<a href([^files]*)'
aTagsRAR <- gsub(pattern, "",aTagsRAR)
pattern <- '\">.*$'
relativeLinks <- gsub(pattern, "", aTagsRAR)

absoluteLinks <- paste0(absoluteUrl, relativeLinks)

# DOWNLOAD ALL FILES ----------------------------------------------------------
for(i in seq_along(absoluteLinks)){
  download.file(absoluteLinks[i], paste0(resultDir,i,".rar"), mode = "wb")
}
