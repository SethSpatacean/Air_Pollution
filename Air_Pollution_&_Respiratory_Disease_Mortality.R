# Set the directory containing the CSV files
setwd("C:\\Users\\seths\\Documents\\Rscripts\\data_123CW")

# Create an empty data frame to store the combined data
combined_data <- data.frame()

# List the CSV files in the directory
csv_files <- list.files(pattern = "*.csv")

# Loop through each CSV file and merge the desired columns to the combined data frame
for (i in 1:length(csv_files)) {
  file_path <- file.path(getwd(), csv_files[i])
  data <- read.csv(file_path)
  
  # Select the desired columns
  last_column <- names(data)[ncol(data)]
  data <- data[, c("Entity", "Year", last_column)]
  
  # Merge the data frames based on common columns "Entity" and "Year"
  if (i == 1) {
    combined_data <- data
  } else {
    combined_data <- merge(combined_data, data, by = c("Entity", "Year"), all = TRUE)
  }
}

# Write the combined data frame to a new CSV file
write.csv(combined_data, "combined_data.csv", row.names = FALSE)


# List of countries to keep
countries_to_keep <- c("Afghanistan", "Albania", "Algeria", "Andorra", 
                       "Argentina", "Armenia", "Australia", "Austria", 
                       "Belarus", "Belgium", "Belize", "Bolivia", "Brazil", 
                       "Bulgaria", "Cambodia", "Cameroon", "Canada", "Chad", 
                       "Chile", "China", "Colombia", "Costa Rica", "Croatia", 
                       "Cuba", "Czechia", "Denmark", "Dominican Republic", 
                       "Ecuador", "Egypt", "El Salvador", "England", "Ethiopia",
                       "Finland", "France", "Georgia", "Germany", "Ghana", 
                       "Greece", "Greenland", "Guatemala", "Honduras", 
                       "Hong Kong", "Hungary", "Iceland", "India", "Indonesia",
                       "Iran", "Iraq", "Ireland", "Israel", "Italy", "Jamaica",
                       "Japan", "Jordan", "Kazakhstan", "Kyrgyzstan", "Latvia",
                       "Lebanon", "Lithuania", "Malaysia", "Mexico", "Moldova",
                       "Monaco", "Mongolia", "Montenegro", "Nepal", 
                       "Netherlands", "New Zealand", "Nicaragua",
                       "Northern Ireland", "Norway", "Pakistan", "Panama", 
                       "Paraguay", "Peru", "Philippines", "Poland", "Portugal",
                       "Puerto Rico", "Qatar", "Romania", "Russia", 
                       "Saudi Arabia", "Scotland", "Serbia", "Singapore",
                       "Slovakia", "Slovenia", "South Africa", "South Korea", 
                       "Spain", "Sweden", "Switzerland", "Syria", "Taiwan",
                       "Thailand", "Tunisia", "Turkey", "Ukraine",
                       "United Arab Emirates", "United Kingdom", 
                       "United States", "Uruguay", "Venezuela", "Vietnam", 
                       "Wales")

# Subset the combined_data dataframe to keep only rows with Entity values 
# in the list
combined_data <- combined_data[combined_data$Entity %in% countries_to_keep, ]

# Drop rows with NA values
combined_data <- combined_data[complete.cases(combined_data), ]

# Drop columns with NA values
combined_data <- combined_data[, colSums(is.na(combined_data)) == 0]

# Get the column names of combined_data
column_names <- colnames(combined_data)

# Print the list of column names
print(column_names)

# Rename the columns
colnames(combined_data) <- c("Entity", "Year", "GDP", "Hospital_Beds", 
                             "PM2.5", "Smoking_Prevalence",
                             "Health_Expenditure", "Respiratory_Deaths")

# Print the updated column names
print(colnames(combined_data))

# Filter the data to include years between 2010 and 2018
filtered_data <- subset(combined_data, Year >= 2010 & Year <= 2018)

# Divide GDP column by 1 billion
filtered_data$GDP <- filtered_data$GDP / 1000000000

# Check the dimensions of filtered_data
dim(filtered_data)

# Check the structure of filtered_data
str(filtered_data)

# Make sure the variables are of numeric type
filtered_data$Respiratory_Deaths <- as.numeric(filtered_data$Respiratory_Deaths)
filtered_data$GDP <- as.numeric(filtered_data$GDP)
filtered_data$Hospital_Beds <- as.numeric(filtered_data$Hospital_Beds)
filtered_data$PM2.5_Pollution <- as.numeric(filtered_data$PM2.5)
filtered_data$Smoking_Prevalence <- as.numeric(filtered_data$Smoking_Prevalence)
filtered_data$Health_Expenditure <- as.numeric(filtered_data$Health_Expenditure)

# Create a linear regression model using the lm() function
model <- lm(Respiratory_Deaths ~ GDP + Hospital_Beds + PM2.5_Pollution
            + Smoking_Prevalence + Health_Expenditure, data = filtered_data)

# Obtain the regression coefficients, standard errors, p-values, and other 
# statistics
summary(model)