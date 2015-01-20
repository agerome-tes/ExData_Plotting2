library(reshape2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_US_coal_emissions_by_year<-dcast(
  melt(
    NEI[NEI$SCC %in% SCC[grep("coal",SCC$Short.Name,ignore.case=T),1],],
	id="year",
	measure.vars="Emissions"
  ),
  year~variable,
  sum
)
png("plot4.png")
plot(
  NEI_US_coal_emissions_by_year,
  main = "US coal total emissions by year",
  xlab = "Year",
  ylab = "PM2.5 emitted (tons)",
  type = "l"
)
dev.off()