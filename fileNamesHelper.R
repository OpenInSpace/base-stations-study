# INPUT DATA ---------------------------------------------------------------
dirInputData <- "files\\"

# BASIC VARIABLES ---------------------------------------------------------------
filesNameFull <- list.files(dirInputData)  # character vector of all files names
filesSystem <- gsub(' -.*', "", filesNameFull)  # character vector of systems
filesNameExtension = gsub('.*\\.', "", filesNameFull)  # character vector of the files extensions
filesNameWithoutExtension <- gsub("\\..*", "", filesNameFull) #character vector of files name without extensions
filesDate <-gsub('.*na ', "", filesNameWithoutExtension) #character vector of dates

length(filesNameWithoutExtension)  
length(unique(filesNameWithoutExtension))  
unique(filesNameExtension)

doubleExtensions <- c()
for (i in seq_along(filesNameWithoutExtension)) {
  if(length(which(filesNameWithoutExtension == filesNameWithoutExtension[i])) == 2) {
    doubleExtensions <- c(doubleExtensions,filesNameExtension[i])
  }
}
unique(doubleExtensions)
length(which(doubleExtensions == "ods"))
length(which(doubleExtensions == "xls"))

odsFile<- c()
for (i in seq_along(filesNameWithoutExtension)) {
  if(length(which(filesNameWithoutExtension == filesNameWithoutExtension[i])) == 1) {
    if(filesNameExtension[i] == "ods") {
      odsFile<- c(odsFile, filesNameFull[i])
    }
  }
}

unique(filesSystem)

