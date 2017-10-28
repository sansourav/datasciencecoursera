
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

df2$Global_active_power <- as.numeric(df2$Global_active_power)

# checking
str(df2)

## changing submetering fields to numeric 

df2$Sub_metering_1 <- as.numeric(df2$Sub_metering_1)
df2$Sub_metering_2 <- as.numeric(df2$Sub_metering_2)
df2$Sub_metering_3 <- as.numeric(df2$Sub_metering_3)

## changing "global active power", "global reactive power" and "Voltage" to numeric

df2$Global_active_power <- as.numeric(df2$Global_active_power)
df2$Global_reactive_power <- as.numeric(df2$Global_reactive_power)
df2$Voltage <- as.numeric(df2$Voltage)

## checking to see if it worked 

str(df2)

# creating a variable to get date and time 

dt <- strptime(paste(df2$Date, df2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# checking 

str(dt)
head(dt)

# creating Png
png("plot4.png",width = 480, height = 480)
par(mfrow =c(2,2))

# 1st graph
plot(dt, df2$Global_active_power, type = "l",xlab ="", ylab = "Global Active power", cex =0.2)

#2nd graph
plot(dt, df2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#3rd graph
plot(dt,df2$Sub_metering_1, type = "l", xlab = "", ylab ="Energy sub metering")
lines(dt, df2$Sub_metering_2, type = "l", col ="red")
lines(dt, df2$Sub_metering_3, type = "l", col ="blue")
legend("topright", c("sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))


# 4th graph
plot(dt, df2$Global_reactive_power, type = "l", xlab = "datetime", ylab = " Global_reactive_power")

dev.off()

