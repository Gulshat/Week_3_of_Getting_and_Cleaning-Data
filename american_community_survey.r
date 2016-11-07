# data loading

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
desfile <- "/Users/gulsat/R_coursera/Week_3_of_Getting_and_Cleaning_Data/data.csv"

download.file(url, destfile =desfile)
