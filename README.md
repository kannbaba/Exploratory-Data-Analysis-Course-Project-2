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
> QUESTION: Of the four types of sources indicated by the typetype (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? <br><br>
> Use the ggplot2 plotting system to make a plot answer this question.
``` r
## Loading required libraries
library(plyr); library(grDevices); library(ggplot2)

#Loading the main dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Obtaining summary dataset for Baltimore by getting the total emissions for each source 
NEI_total_Balt_source <- ddply(filter(NEI,fips=="24510"), .(year,type), summarize, total=sum(Emissions))

# plotting a summary chart of 4 types for total emissions in Baltimore across each source using ggplot
png(filename = "plot3.png", height = 600, width = 600)  
p <- ggplot(NEI_total_Balt_source,aes(x=year, y=total))+ ggtitle("Total PM2.5 emission for each sources in Baltimore") + ylab("Total Emissions (tonnes")+  geom_line()+geom_point()
p + facet_grid(cols = vars(type))
dev.off() 
```
![plot3](https://github.com/kannbaba/Exploratory-Data-Analysis-Course-Project-2/assets/6490466/f1fd9d7f-a599-456e-9f28-5e95551c6d26)

> ANSWER: All sources of emissions EXCEPT "ON ROAD" have declined. 

****

#### Plot 4
> QUESTION:Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

``` r
## Loading required libraries
library(plyr); library(grDevices)

#Loading the main dataset
NEI <- readRDS("summarySCC_PM25.rds")

#Loading the main dataset
NEI <- readRDS("summarySCC_PM25.rds")
#Loading the source dataset in order to filter "coal related" entries
SCC <- readRDS("Source_Classification_Code.rds")
#Creating coal filter by selecting all entries which ends with "Coal" at EI.Sector column
NEI_coal <- SCC %>% filter(grepl("Coal$",EI.Sector))
# Filtering main data with code ids from filtered source database
NEI_total_coal <- ddply( filter(NEI, str_detect(NEI$SCC, paste(NEI_coal[,1], collapse="|"))), .(year), summarize, total=sum(Emissions))


#Plotting a bar chart to show coal emissions for each year
png(filename = "plot4.png", height = 600, width = 600)  
p <- barplot( height =NEI_total_coal[,2]/1000, name= NEI_total_coal[,1],
               main=" Total PM2.5 Emissions in the U.S. due to coal sources ", ylab="PM25 Emission (tonnes) ", xlab="year", ylim=c(0,600)
               )
text ( x=p , y=NEI_total_coal[,2] , label=format(round(NEI_total_coal[,2],1)) , pos=1)  ##I could not figure out why labels do not appear
dev.off()
```
![plot4](https://github.com/kannbaba/Exploratory-Data-Analysis-Course-Project-2/assets/6490466/c68433d7-757b-412a-8d58-f514ada2f788)



> ANSWER:

****

#### Plot 5

