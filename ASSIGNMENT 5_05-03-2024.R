#ASSIGNMENT-5

# read a csv file

stats <- read.csv(file.choose())

# Show the data of France
stats[stats$Country.Name == "France", ]

#Show the countries with birthrate >20 and High income
data<- stats[stats$Birth.rate > 20 & stats$Income.Group == "High income", ]
data

# Show the data of the country with the highest internet users
max_internet_user_country <- stats[stats$Internet.users == max(stats$Internet.users, 
                                                               na.rm = TRUE), ]
max_internet_user_country

#Average birth Rate
Avg_birthrate <- mean(stats$Birth.rate, na.rm = TRUE)
Avg_birthrate

#Standard Deviation of birthrate
SD_birthrate <- sd(stats$Birth.rate, na.rm = TRUE)
SD_birthrate


# Countries whose birth rate is two SDs above the mean
countries_above_2SDs <- stats[stats$Birth.rate > (Avg_birthrate + 2*SD_birthrate), ]

countries_above_2SDs

#IQR of the birthrate 
Iqr_birthrate <- IQR(stats$Birth.rate, na.rm = TRUE)
Iqr_birthrate