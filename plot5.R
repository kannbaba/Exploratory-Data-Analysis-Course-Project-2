## Loading required libraries
library(plyr); library(grDevices)
#Loading the main dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Filtering vehicle based missions in Baltimore. SSC source data file shows that all vehicle related emissions are recorded as "ON-ROAD" type in the main data
NEI_total_Balt_motors <- ddply(filter(NEI,fips=="24510", type =="ON-ROAD"), .(year), summarize, total=sum(Emissions))

#Plotting a bar chart to show vehicle emissions in Baltimore for each year
png(filename = "plot5.png", height = 600, width = 600)  
p <- barplot(height=NEI_total_Balt_motors[,2], name=NEI_total_Balt_motors[,1],
             main=" Total PM2.5 Emissions from vehicles in Baltimore " ,ylab="PM25 Emission (tonnes) ", xlab="year" , ylim=c(0,400)
)
text (x=p,y=NEI_total_Balt_motors[,2],label=format(round(NEI_total_Balt_motors[,2]),0),pos=1)
dev.off()

