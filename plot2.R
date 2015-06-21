setwd("~/econometrics/DataScienceSpecialist/4 Exploratory Data Analysis/exdata-data-NEI_data")
# Read Data 
NEI <- readRDS("summarySCC_PM25.rds")
str(NEI)
head(NEI)


# Create Data
Baltimore.City <- subset(NEI, fips == "24510")
plotdata <- aggregate(Baltimore.City[c("Emissions")], list(year = Baltimore.City$year), sum)

# Create Plot
png('plot2.png', width=480, height=480)
plot(plotdata$year, plotdata$Emissions, type = "l",
     main = "Total Emissions from PM2.5 in Baltimore City",
     xlab = "Year", ylab = "Emissions",col="red",cex.axis=0.8)
grid()
dev.off()
