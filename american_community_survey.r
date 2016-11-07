# data loading

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
desfile <- "/Users/gulsat/R_coursera/Week_3_of_Getting_and_Cleaning_Data/data.csv"

download.file(url, destfile = desfile)

# Read data
data1 <- read.csv("data.csv", header = TRUE)

# Observe data structure

str(data1)

head(data1)

# The code book, describing the variable names is here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

# 1 question
# Create a logical vector that identifies the households on greater than 
# 10 acres who sold more than $10,000 worth of agriculture products. Assign
# that logical vector to the variable agricultureLogical. Apply the which() 
# function like this to identify the rows of the data frame where the logical
# vector is TRUE.
# AGS Sales of Agriculture Products sold more than $10 000 --6
# ACR Lot size greater than 10 -- 3

agricultureLogical <- with(data1, AGS == 6 & ACR == 3)

which(agricultureLogical)[1:3]

# answer: [1] 125 238 262
