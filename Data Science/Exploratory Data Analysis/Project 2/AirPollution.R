NEI <<- readRDS("../data/summarySCC_PM25.rds")
SCC <<- readRDS("../data/Source_Classification_Code.rds")

head(NEI$SCC)
myvars <<- c("fips", "SCC", "Pollutant", "Emissions", "type", "year")
newNEI <<- NEI[myvars]
head(newNEI)
dim(newNEI)
colnames(NEI)
## 6497651 x 6

NEIdf <<- data.frame(matrix(unlist(newNEI), nrow=6497651 ), stringAsFactors=FALSE)
names(NEIdf) <- myvars
head(NEIdf)

head(SCC$SCC)
head(SCC$EI.Sector, 25)
colnames(SCC)
myvars1 <<- c("SCC", "SCC.Level.One", "SCC.Level.Two", "SCC.Level.Three", "SCC.Level.Four")
newSCC <<- SCC[myvars1]
head(newSCC)
dim(newSCC)
## 11717  X 5

SCCdf <<- data.frame(matrix(unlist(newSCC), nrow=11717 ), stringAsFactors=FALSE)
names(SCCdf) <- myvars1
head(SCCdf)



##############################################

##merge the data frames

temp_df <<- merge(NEIdf, SCCdf, by="SCC")
head(temp_df)
temp1_df <<- temp_df[order(temp_df$year),]
head(temp1_df)
dim(temp1_df)

myvars3 <<- c("fips", "SCC", "Pollutant", "Emissions", "type", "year", "SCC.Level.One", "SCC.Level.Two", "SCC.Level.Three", "SCC.Level.Four")

NEI_SCC_df <<- temp1_df[myvars3]
head(NEI_SCC_df)
tail(NEI_SCC_df)
dim(NEI_SCC_df)

##grx <<- glob2rx("onroad")
##grx
##t1_df <<- NEI_SCC_df[grep(grx, NEI_SCC_df$type, ignore.case=TRUE, value=TRUE)]
##head(t1_df)

##############################################

## plot1

plot1vars <<- c("year","Emissions") 
plot1_df <<- NEI_SCC_df[plot1vars]
dim(plot1_df)
head(plot1_df)

typeof(plot1_df$Emissions)

x <- as.numeric(as.character(plot1_df$year))
y <- as.numeric(as.character(plot1_df$Emissions))

xrange <<- range(x)
yrange <<- range(y)

png("plot1.png", width=480, height=480)
plot(xrange, yrange, xaxt="n", frame.plot=TRUE, pch="", type="p", ylab="PM2.5 Emissions", xlab="Year", main="U.S. Total Emissions")
axis(1, at=c(1999, 2002, 2005, 2008) , lab=c("1999", "2002", "2005", "2008"))
lines(x, y, col="red", pch="|")
dev.off()


## plot 2

plot1vars <<- c("fips","year","Emissions") 
plot2_df <<- NEI_SCC_df[plot1vars]
dim(plot2_df)
head(plot2_df)

plot2a_df <<- subset(plot2_df, fips== "24510")
head(plot2a_df)
dim(plot2a_df)


x <- as.numeric(as.character(plot2a_df$year))
y <- as.numeric(as.character(plot2a_df$Emissions))

xrange <<- range(x)
yrange <<- range(y)

png("plot2.png", width=480, height=480)
plot(xrange, yrange, axes=FALSE, frame.plot=TRUE, pch="", type="p", ylab="PM2.5 Emissions", xlab="Year", main="Baltimore Total Emissions")
axis(1, at=c(1999, 2002, 2005, 2008) , lab=c("1999", "2002", "2005", "2008"))
axis(2, at=c(0, 200, 400, 600, 800, 1000) , lab=c("0", "200", "400", "600", "800", "1000"))
lines(x, y, col="blue", pch="|")
dev.off()

## plot 3



## plot 4
plot1vars <<- c("fips","year","Emissions", "type", "SCC.Level.One", "SCC.Level.Two", "SCC.Level.Three") 
plot4_df <<- NEI_SCC_df[plot1vars]
dim(plot4_df)
tail(plot4_df, 190)
head(plot4_df)

##US
plot4a_df <<- subset(plot4_df,type=="NONPOINT" & SCC.Level.One=="Stationary Source Fuel Combustion" & SCC.Level.Three=="Anthracite Coal")
head(plot4a_df, 200)
dim(plot4a_df)

x <- as.numeric(as.character(plot4a_df$year))
y <- as.numeric(as.character(plot4a_df$Emissions))

xrange <<- range(x)
yrange <<- range(y)

png("plot4.png", width=480, height=480)
plot(xrange, yrange, axes=FALSE, frame.plot=TRUE, pch="", type="p", ylab="PM2.5 Emissions", xlab="Year", main="U.S. Coal Emissions")
axis(1, at=c(1999, 2002, 2005, 2008) , lab=c("1999", "2002", "2005", "2008"))
axis(2, at=c(0, 200, 400, 600, 800) , lab=c("0", "200", "400", "600", "800"))
lines(x, y, col="green", pch="|")
dev.off()



## plot 5
plot1vars <<- c("fips","year","Emissions", "type", "SCC.Level.One", "SCC.Level.Two") 
plot5_df <<- NEI_SCC_df[plot1vars]
dim(plot5_df)
tail(plot5_df, 190)

##Baltimore
plot5a_df <<- subset(plot5_df, fips== "24510" & type=="ON-ROAD" & SCC.Level.One=="Mobile Sources")
head(plot5a_df, 200)
dim(plot5a_df)

## Baltimore
x1 <- as.numeric(as.character(plot5a_df$year))
Baltimore <- as.numeric(as.character(plot5a_df$Emissions))

xrange <<- range(x1)
yrange <<- range(Baltimore)

png("plot5.png", width=480, height=480)
plot(xrange, yrange, axes=FALSE, frame.plot=TRUE, pch="", type="p", ylab="PM2.5 Emissions", xlab="Year", main="Baltimore Motor Vechicle Emissions")
axis(1, at=c(1999, 2002, 2005, 2008) , lab=c("1999", "2002", "2005", "2008"))
axis(2, at=c(0, 10, 20, 30, 40, 50) , lab=c("0", "10", "20", "30", "40", "50"))
lines(x1, Baltimore, col="orange", pch="|")
dev.off()



## plot 6
plot1vars <<- c("fips","year","Emissions", "type", "SCC.Level.One", "SCC.Level.Two") 
plot6_df <<- NEI_SCC_df[plot1vars]
dim(plot6_df)
tail(plot6_df, 190)

##Baltimore
plot6a_df <<- subset(plot6_df, fips== "24510" & type=="ON-ROAD" & SCC.Level.One=="Mobile Sources")
head(plot6a_df, 200)
dim(plot6a_df)

## LA
plot6b_df <<- subset(plot6_df, fips== "06037" & type=="ON-ROAD" & SCC.Level.One=="Mobile Sources")
head(plot6b_df)
dim(plot6b_df)

## LA
x <- as.numeric(as.character(plot6b_df$year))
LA <- as.numeric(as.character(plot6b_df$Emissions))

## Baltimore
x1 <- as.numeric(as.character(plot6a_df$year))
Baltimore <- as.numeric(as.character(plot6a_df$Emissions))

xrange <<- range(x)
yrange <<- range(LA)

png("plot6.png", width=480, height=480)
plot(xrange, yrange, axes=FALSE, frame.plot=TRUE, pch="", type="p", ylim=c(0,600), ylab="PM2.5 Emissions", xlab="Year", main="Motor Vechicle Emissions")
axis(1, at=c(1999, 2002, 2005, 2008) , lab=c("1999", "2002", "2005", "2008"))
axis(2, at=c(0, 100, 200, 300, 400, 500, 600) , lab=c("0", "100", "200", "300", "400", "500", "600"))
lines(x, LA, col="blue", pch="|")
lines(x1, Baltimore, col="red", pch="|")
legend("topright", c("LA", "Baltimore"), lty=c(1,1), col=c("blue","red"))
dev.off()








