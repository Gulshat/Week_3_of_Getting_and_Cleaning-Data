# data loading

url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

dataplace1 <- "/Users/gulsat/R_coursera/Week_3_of_Getting_and_Cleaning_Data/rank_country.csv"
dataplace2 <- "/Users/gulsat/R_coursera/Week_3_of_Getting_and_Cleaning_Data/education.csv"

download.file(url1, destfile = dataplace1)
download.file(url2, destfile = dataplace2)

# read data

rank_country <- read.csv("rank_country.csv", nrows = 190, header = FALSE, skip = 5, 
                         stringsAsFactors = FALSE)
education <- read.csv("education.csv", header = TRUE, stringsAsFactors = FALSE)

# 3 question
# Match the data based on the country shortcode. How many of the IDs match? 
# Sort the data frame in descending order by GDP rank (so United States is 
# last). What is the 13th country in the resulting data frame?

# Let's observe data
head(education)
head(rank_country)

dim(rank_country)
dim(education)

# Subset only needed data, name columns

rank_country <- rank_country[, c(1, 2, 4, 5)]
colnames(rank_country) <- c("CountryCode", "Rank", "Country.Name", "GDP.Value")
rank_country$GDP.Value <- as.numeric(gsub(",", "", rank_country$GDP.Value))

# merge two tables
matchedData <- merge(rank_country, education, by.x = "CountryCode", 
                     by.y = 'CountryCode')
# mathed ID
dim(matchedData)
#answer [1] 189  34

library(plyr)
f <- arrange(matchedData, desc(Rank))[13,3]
f
# answer [1] "St. Kitts and Nevis"


