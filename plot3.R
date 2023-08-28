## Loading required libraries
library(plyr); library(grDevices); library(ggplot2)

#Loading the main dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Obtaining summary dataset for Baltimore by getting the total emissions for each source 
NEI_total_Balt_source <- ddply(filter(NEI,fips=="24510"), .(year,type), summarize, total=sum(Emissions))

# plotting a summary chart of 4 types for total emissions in Baltimore across each source
png(filename = "plot3.png", height = 600, width = 600)  
p <- ggplot(NEI_total_Balt_source,aes(x=year, y=total))+ ggtitle("Total PM2.5 emission for each sources in Baltimore") + ylab("Total Emissions (tonnes")+  geom_line()+geom_point()
p + facet_grid(cols = vars(type))
dev.off() 
