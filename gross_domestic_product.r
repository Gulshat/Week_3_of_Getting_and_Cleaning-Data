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

# 4 question
# What is the average GDP ranking for the "High income: OECD" and "High 
# income: nonOECD" group?

income_OECD <- subset(matchedData, Income.Group %in% "High income: OECD",
                      select = c(Rank))$Rank
mean(income_OECD)

# answer: [1] 32.96667

income_nonOECD <- subset(matchedData, Income.Group %in% 
                           "High income: nonOECD", select = c(Rank))$Rank
mean(income_nonOECD)

# answer: [1] 91.91304

# 5 question
# Cut the GDP ranking into 5 separate quantile groups. Make a table versus 
# Income.Group. How many countriesare Lower middle income but among the 38
# nations with highest GDP?

library(Hmisc)

# let's create 5 groups
matchedData$Rank.Group <- cut2(matchedData$Rank, g = 5)

table(matchedData$Income.Group, matchedData$Rank.Group)

# answer:
#                      [  1, 39) [ 39, 77) [ 77,115) [115,154) [154,190]
# High income: nonOECD         4         5         8         5         1
# High income: OECD           18        10         1         1         0
# Low income                   0         1         9        16        11
# Lower middle income          5        13        12         8        16
# Upper middle income         11         9         8         8         9
