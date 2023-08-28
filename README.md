# Exploratory-Data-Analysis-Course-Project-2

#### Plot 1

> QUESTION: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? <br><br>
> Using the <b>base</b> plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

``` r
## Loading required libraries
library(plyr); library(grDevices)

#Loading the main dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Obtaining summary dataset by getting the total emissions for each year
NEI_sum <- ddply(NEI, .(year), summarize, sum=sum(Emissions))

# plotting a barchart for total emissions for each year
plot(NEI_sum, type="l", main=" Total PM2.5 emission from all sources ", ylab="PM25 Emission (million tonnes)")
png(filename = "plot1.png", height = 600, width = 600)  
p <- barplot(height= NEI_sum[,2]/1000000,  name=NEI_sum[,1],
             main=" Total PM2.5 emissions in the States", ylab="PM25 Emission (million tonnes)",xlab="year" ,ylim=c(0,8))
text (x=p,y=NEI_sum[,2]/1000000, label=format(NEI_sum[,2]/1000000),pos=1)
dev.off()

```

![plot1](https://github.com/kannbaba/Exploratory-Data-Analysis-Course-Project-2/assets/6490466/ba76bdc1-c8a0-44f5-9794-bee779501fae)

> ANSWER: 
