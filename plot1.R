## Loading required libraries
library(plyr); library(grDevices)

#Loading the main dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Obtaining summary dataset by getting the total emissions for each year
NEI_sum <- ddply(NEI, .(year), summarize, sum=sum(Emissions))

# plotting a barchart for total emissions for each year
png(filename = "plot1.png", height = 600, width = 600)  
p <- barplot(height= NEI_sum[,2]/1000000,  name=NEI_sum[,1],
             main=" Total PM2.5 emissions in the States", ylab="PM25 Emission (million tonnes)",xlab="year" ,ylim=c(0,8))
text (x=p,y=NEI_sum[,2]/1000000, label=format(round(NEI_sum[,2]/1000000,2)),pos=1)
dev.off() 
