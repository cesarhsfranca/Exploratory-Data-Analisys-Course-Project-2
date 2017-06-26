# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate the total emissions by year
aggTotals <- aggregate(Emissions ~ year,NEI, sum)

# Generate the png file
png("plot_1.png",width=480,height=480,units="px",bg="transparent")

# Name the title, x and y axis of the plot
barplot(
        (aggTotals$Emissions)/10^6,
        names.arg=aggTotals$year,
        xlab="Year",
        ylab="PM2.5 Emissions (10^6 Tons)",
        main="Total PM2.5 Emissions From All US Sources"
)

dev.off()
