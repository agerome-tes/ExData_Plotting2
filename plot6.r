library(reshape2)
NEI <- readRDS("summarySCC_PM25.rds")

NEI_baltimore_vehicle_emissions_by_year<-dcast(
  melt(
    NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",],
	id=c("year","type"),
	measure.vars="Emissions"
  ),
  type+year~variable,
  sum
)
NEI_la_vehicle_emissions_by_year<-dcast(
  melt(
    NEI[NEI$fips=="06037" & NEI$type=="ON-ROAD",],
	id=c("year","type"),
	measure.vars="Emissions"
  ),
  type+year~variable,
  sum
)
NEI_baltimore_vehicle_emissions_by_year$type<-NULL
NEI_la_vehicle_emissions_by_year$type<-NULL
png("plot6.png")
par(mfrow = c(2, 1))
plot(
  NEI_baltimore_vehicle_emissions_by_year,
  main = "Baltimore total vehicle emissions by year",
  xlab = "Year",
  ylab = "PM2.5 emitted (tons)",
  type = "l"
)
plot(
  NEI_la_vehicle_emissions_by_year,
  main = "Los Angeles total vehicle emissions by year",
  xlab = "Year",
  ylab = "PM2.5 emitted (tons)",
  type = "l"
)
dev.off()