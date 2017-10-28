
## Read the table into R 

df1 <- read.table("./household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, dec = ".")


## check data

names(df1)
 head(date)
 head(df1$Date)
 str(df1)

 ##picking the relevent subset
df2 <- subset(df1, df1$Date == "1/2/2007"| df1$Date =="2/2/2007")

# checking 

head(df2)
str(df2)

## changing global active power to numeric

df2$Global_active_power <- as.numeric(df2$Global_active_power), xlab = "Global Active Power(kilowatts")

# checking
str(df2)

# test

#hist(df2$Global_active_power, col= "red",main = "Global Active power", xlab = "Global Active Power(kilowatts)")

# creating Png
png("plot1.png",width = 480, height = 480)
hist(df2$Global_active_power, col= "red",main = "Global Active power", xlab = "Global Active Power(kilowatts)")
dev.off()
getwd()
