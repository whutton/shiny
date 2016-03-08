#   read in SEER population data
#in_file <- "C:\\hutton\\shiny\\cancer\\SEER_1973_2012_TEXTDATA\\populations\\white_black_other\\yr1973_2012.seer9\\19agegroups.txt"
#test.fixed <- read.fwf(in_file,width=c(4,2,2,3,2,1,1,1,2,10))
#dimnames(test.fixed)[[2]] <- c("year","state","fips_code","county_fips","registry","race","origin","sex","ages","population")

library(data.table)

#  fields of interest
# year of diagnosis   39-42
# age at diagnosis    25-27
# The file is the type of cancer.
# sex  --- position 24


base_dir <- "C:\\hutton\\shiny\\cancer\\SEER_1973_2012_TEXTDATA\\incidence\\yr1973_2012.seer9"
cancer_types <- c("BREAST","COLRECT","DIGOTHR","FEMGEN","LYMYLEUK","MALEGEN","OTHER","RESPIR","URINARY")
length_types <- length(cancer_types)
for (i in 1:length_types) {
  file_name <- paste(base_dir,"\\",cancer_types[i],".txt",sep="")
  df <- read.fwf(file_name,widths=c(-23,1,3,-11,4))
  colnames(df) <- c("sex","age","year")
  df["type"] <- cancer_types[i]
  if (i == 1) {
    total <- df
  }
  else
  {
    total <- rbind(total,df)
  }
}



dt <- data.table(total)

#dput(dt,file="c:\\temp\\cancer.txt")
#zip1 <- dt[,.N,by=c('type','year','sex')]
parse1 <- dt[,.N,by=c('type','age')]
#dput(parse1,file="c:\\temp\\cancer.txt")

write.table(parse1, file = "cancer.txt", sep = ",", col.names = TRUE,
            qmethod = "double")

