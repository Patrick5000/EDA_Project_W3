setwd("~/econometrics/DataScienceSpecialist/4 Exploratory Data Analysis/exdata-data-NEI_data")
# Read Data 
NEI <- readRDS("summarySCC_PM25.rds")
str(NEI)
head(NEI)
# Aggregate data


plotdata <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

# Create Plot 1

png('plot1.png', width=480, height=480)
plot(plotdata$year, plotdata$Emissions, type = "l",
     main = "Total Emissions from PM2.5 in the US",
     xlab = "Year", ylab = "Emissions",col="red",cex.axis=0.8)
grid()


dev.off()
