library(reshape2)
NEI <- readRDS("summarySCC_PM25.rds")
NEI_baltimore_emissions_by_year<-dcast(
  melt(
    NEI[NEI$fips=="24510",],
	id="year",
	measure.vars="Emissions"
  ),
  year~variable,
  sum
)
png("plot2.png")
plot(
  NEI_baltimore_emissions_by_year,
  main = "Baltimore Total emissions by year",
  xlab = "Year",
  ylab = "PM2.5 emitted (tons)",
  type = "l"
)
dev.off()
