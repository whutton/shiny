Cancer seer presentation
========================================================
author: Bill Hutton 
date: 2/29/16

Seer Data

W. Hutton
2/29/16

========================================================

SEER data is a compliation of report data from health care providers.   This presentaiton is a summary of information from 1973 to 2012 from Atlanta, Connecticut, Detroit, Hawaii, Iowa,  New Mexico, San Francisco-Oakland, Seattle-Puget Sound, and Utah

The report is showing a summmarization of the information with a focus on the year of diagnosis.   The on-line component list by percentage the average cancer type by age.

Rights to the data was obtained from  http://seer.cancer.gov/data


==================================================
The data consist of over 100 data points. For purpose of this presentation I selected the following:

- year of diagnosis   39-42
- age at diagnosis    25-27
- sex  --- position 24
- The file name is the type of cancer.

==================================================
The R code used to read the data was the following:


```r
base_dir <- "C:\\hutton\\shiny\\cancer\\SEER_1973_2012_TEXTDATA\\incidence\\yr1973_2012.seer9"
cancer_types <- c("BREAST","COLRECT","DIGOTHR","FEMGEN","LYMYLEUK","MALEGEN","OTHER","RESPIR","URINARY")
length_types <- length(cancer_types)
for (i in 1:length_types) {
	file_name <- paste(base_dir,"\\",cancer_types[i],".txt",sep="")
	df <- read.fwf(file_name,widths=c(-23,1,3,-11,4))
	colnames(df) <- c("sex","age","year")
	df["type"] <- cancer_types[i]
	if (i == 1) {  	total <- df    }
      else	{ 	total <- rbind(total,df)	}
}
dt <- data.table(total)
parse1 <- dt[,.N,by=c('type','age')]
write.table(parse1, file = "cancer.txt", sep = ",", col.names = TRUE,
            qmethod = "double")
```
========================================================
The data was summarized the data into the file cancer.txt.     The data.table dt itself has 4,693,327 rows.   The above code summarizes the information by cancer type and age at diagnosis.   Each row will have the following values:


```r
test1 <- read.table("cancer.txt", 
               header = TRUE, sep = ",", row.names = 1)
test1[ which (test1$age==60),]
```

```
        type age     N
1     BREAST  60 17582
140  COLRECT  60 10436
244  DIGOTHR  60  7538
318   FEMGEN  60  8250
463 LYMYLEUK  60  6614
583  MALEGEN  60 15292
650    OTHER  60 14702
772   RESPIR  60 16101
910  URINARY  60  6791
```



