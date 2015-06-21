setwd("~/econometrics/DataScienceSpecialist/4 Exploratory Data Analysis/exdata-data-NEI_data")
# Read Data 
NEI <- readRDS("summarySCC_PM25.rds")
str(NEI)
head(NEI)
SRC <- readRDS("Source_Classification_Code.rds")


require(ggplot2)


# Coal combustion related sources
SRC.coal = SRC[grepl("coal", SRC$Short.Name, ignore.case=TRUE),]


merge <- merge(x=NEI, y=SRC.coal, by='SCC')
merge1 <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(merge1) <- c('Year', 'Emissions')

# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008?
# Plot4

png('plot4.png',width=480, height=480)

ggplot(data=merge1, aes(x=Year, y=Emissions/1000)) +
  geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) +
  ggtitle(expression('Total Emissions of PM'[2.5] )) +
  ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) +
    theme(legend.position='none') + scale_colour_gradient(low='black', high='blue')
  
 dev.off()
