library(ggplot2)
library(reshape2)
NEI <- readRDS("summarySCC_PM25.rds")
NEI_baltimore<-dcast(
  melt(
    NEI[NEI$fips=="24510",],
	id=c("year","type"),
	measure.vars="Emissions"
  ),
  type+year~variable,
  sum
)
png(filename="plot3.png", width=480, height=480, units="px")
ggplot(
  data=NEI_baltimore,
  aes(
    x=year,
    y=Emissions,
    group=type,
    colour=type
  )
) +
geom_line() +
xlab("Year") +
ylab(expression(Total~PM[2.5]~Emissions~(`in`~tons))) +
ggtitle(expression(Total~PM[2.5]~Emission~`in`~Baltimore~City))
dev.off()