library(reshape2)
NEI <- readRDS("summarySCC_PM25.rds")
NEI_emissions_by_year<-dcast(
  melt(
    NEI,
	id="year",
	measure.vars="Emissions"
  ),
  year~variable,
  sum
)
png("plot1.png")
plot(
  NEI_emissions_by_year,
  main = "Total emissions by year",
  xlab = "Year",
  ylab = "PM2.5 emitted (tons)",
  type = "l"
)
dev.off()
