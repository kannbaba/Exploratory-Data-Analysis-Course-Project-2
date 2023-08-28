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
png(filename = "plot1.png", height = 600, width = 600)  
p <- barplot(height= NEI_sum[,2]/1000000,  name=NEI_sum[,1],
             main=" Total PM2.5 emissions in the States", ylab="PM25 Emission (million tonnes)",xlab="year" ,ylim=c(0,8))
text (x=p,y=NEI_sum[,2]/1000000, label=format(NEI_sum[,2]/1000000),pos=1)
dev.off()

```
![plot1](https://github.com/kannbaba/Exploratory-Data-Analysis-Course-Project-2/assets/6490466/9a3c60e6-a08f-446a-a90b-7bc0e60bd133)

> ANSWER: Yes! Total emission in the States have declined from 7.3 mn tonnes in 1999 to 3.5 mn tonnes in 2008

****

#### Plot 2

> QUESTION:Have total emissions from PM2.5 decreased in the <b>Baltimore City</b>, Maryland (fips == "24510"fips == "24510") from 1999 to 2008?<br><br>
> Use the <b>base</b> plotting system to make a plot answering this question.


``` r
## Loading required libraries
library(plyr); library(grDevices)

#Loading the main dataset
NEI <- readRDS("summarySCC_PM25.rds")
# Obtaining summary dataset for Baltimore by getting the total emissions for each yeari using fips=="24510" argument
NEI_sum_Balt <- ddply(filter(NEI,fips=="24510"), .(year), summarize, sum=sum(Emissions))

# plotting a barchart for total emissions in Baltimore for each year
png(filename = "plot2.png", height = 600, width = 600)  
p <- barplot(height=NEI_sum_Balt[,2], name=NEI_sum[,1],
             main=" Total PM2.5 emission from all sources in Baltimore ", ylab="PM25 Emission (thousand tonnes)", xlab="year", ylim=c(0,4000))
text (x=p,y=NEI_sum_Balt[,2], label=format(NEI_sum_Balt[,2]),pos=1)
dev.off()      
```
![plot2](https://github.com/kannbaba/Exploratory-Data-Analysis-Course-Project-2/assets/6490466/337f62d5-c966-4e4a-baa0-ec4359561b3e)


> ANSWER: Yes. Total emissions in Baltimore have declined to 1862 mn tonnes in 2008.

****

#### Plot 3
> QUESTION: Of the four types of sources indicated by the typetype (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008?
