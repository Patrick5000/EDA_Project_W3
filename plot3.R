setwd("~/econometrics/DataScienceSpecialist/4 Exploratory Data Analysis/exdata-data-NEI_data")
# Read Data 
NEI <- readRDS("summarySCC_PM25.rds")
str(NEI)
head(NEI)
# Aggregate data
# Create Data 
Baltimore.City <- subset(NEI, fips == "24510")
Baltimore.City$year <- factor(Baltimore.City$year, levels=c('1999', '2002', '2005', '2008'))


# boxplots with jitter
png(filename='plot3.png', width=800, height=500)

ggplot(data=Baltimore.City, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type)  +
  geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
  ylab(expression(paste(' PM'[2.5], ' Emissions'))) + xlab('Year') +
  ggtitle('Emissions per Type in Baltimore City') +
  geom_jitter(alpha=0.20)

dev.off()








