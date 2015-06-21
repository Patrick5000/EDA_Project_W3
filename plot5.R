setwd("~/econometrics/DataScienceSpecialist/4 Exploratory Data Analysis/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SRC <- readRDS("Source_Classification_Code.rds")



# Create Data
VEHIC <- grep("Vehicle",SRC$EI.Sector,value=T,ignore.case=T)
SRC.VEHIC <- subset(SRC, SRC$EI.Sector %in% VEHIC, select=SCC)
Baltimore.City <- subset(NEI, fips == "24510")
NEI.VEHIC <- subset(Baltimore.City, Baltimore.City$SCC %in% SRC.VEHIC$SCC)
plotdata <- aggregate(NEI.VEHIC[c("Emissions")], list(year = NEI.VEHIC$year), sum)


# Create Plot
png('plot5.png', width=480, height=480)
plot(plotdata$year, plotdata$Emissions, type = "l",
     main = "Total Vehicle Emissions in Baltimore City",
     xlab = "Year", ylab = "Emissions",cex.axis=0.8,col="red",lwd=2)

grid()
dev.off()
