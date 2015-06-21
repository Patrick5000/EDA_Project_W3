setwd("~/econometrics/DataScienceSpecialist/4 Exploratory Data Analysis/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SRC <- readRDS("Source_Classification_Code.rds")

# Create Plot Data   
VEHIC <- grep("Vehicle",SRC$EI.Sector,value=T,ignore.case=T)  
SRC.VEHIC <- subset(SRC, SRC$EI.Sector %in% VEHIC, select=SCC)  
Baltimore.City.LA <- subset(NEI, fips == "24510"|fips == "06037")	
NEI.VEHIC <- subset(Baltimore.City.LA, Baltimore.City.LA$SCC %in% SRC.VEHIC$SCC)	
plotdata <- aggregate(NEI.VEHIC[c("Emissions")], list(fips = NEI.VEHIC$fips, year = NEI.VEHIC$year), sum)	
plotdata$city <- rep(NA, nrow(plotdata))	
plotdata[plotdata$fips == "06037", ][, "city"] <- "Los Angeles"	
plotdata[plotdata$fips == "24510", ][, "city"] <- "Baltimore"	


# Create Plot	
library(ggplot2)	
png('plot6.png', width=480, height=480)	
p <- ggplot(plotdata, aes(x=year, y=Emissions, colour=city)) +	
  geom_point(alpha=.3) +	
  geom_smooth(alpha=.2, size=1, method="loess") +	
  ggtitle("Vehicle Emissions in Baltimore vs. Los Angeles")	

print(p)	


dev.off()	
