library("jpeg")

#data loading

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
desfile1 <- "/Users/gulsat/R_coursera/Week_3_of_Getting_and_Cleaning_Data/data.jpg"

download.file(url, destfile = desfile1)

# data read

data2 <- readJPEG("data.jpg", native = TRUE )

# 2 question
# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the 
# resulting data? 

quantile(data2, probs = c(0.3, 0.8))

# answer:
#       30%       80% 
#  -15259150 -10575416