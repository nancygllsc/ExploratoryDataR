#test
head(pollution)
dim(pollution)
summary(pollution$pm25) #This shows us basic info about the pm25 data, namely its Minimum (0
| #percentile) and Maximum (100 percentile) values, and three
| #Quartiles of the data. These last indicate the pollution measures
| #at which 25%, 50%, and 75% of the counties fall below. 
boxplot(ppm)
boxplot(ppm,col="blue") #The boxplot shows us the 
#same quartile data that summary and quantile did.
abline(h=12) # drew a vertical line at 12
hist(ppm, col = "green")
rug(ppm) #gives you a little more detailed information about 
#how many data points are in each bucket and where they lie within the bucket
hist(ppm,col="green" ,breaks = 100)# breaks: the number of buckets to split the data into
abline(v=median(ppm),col="magenta",lwd=4)
reg <- table(pollution$region)
boxplot(pm25~region,data=pollution, col="red")
par(mfrow=c(2,1),mar=c(4,4,2,1))#set up the plot window for two rows and one column with the
# mfrow argument.The mar argument set up the margins.
east <- subset(pollution,region=="east") 
head(east)
hist(east$pm25,col="green")
hist(subset(pollution,region=="west")$pm25, col = "green")
with(pollution, plot(latitude, pm25)) #plots along x and y axis
abline(h = 12, lwd = 2, lty = 2)
plot(pollution$latitude, ppm, col = pollution$region)
par(mfrow=c(1,2),mar = c(5, 4, 2, 1))
west<-subset(pollution,region=="west")
plot(west$latitude, west$pm25, main = "West")
plot(east$latitude, east$pm25, main = "East")

with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data" ) 
#edv.cur(). This will show you the current plotting device, the screen
pdf(file="myplot.pdf") #this will create the pdf file myplot.
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data" )
dev.cur() # to find active graphics device 
dev.off()
dev.cur() #start graphics
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data" )
dev.copy(png, file = "geyserplot.png")
dev.off() 
#Base Plotting - cant be modified once finished
head(cars)
with(cars,plot(speed, dist))
text(mean(cars$speed),max(cars$dist),"SWIRL rules!")

#lattice graphs- lattice plots are created with a single
#function call such as xyplot or bwplot.
#Margins and spacing are set automatically because the
#entire plot is specified at once.you cannot "add" to the plot once
#it is created as you can with the base system.
#The lattice system is most useful for conditioning types of plots 
#which display how y changes with x across levels of z. The variable z might be a
#categorical variable of your data. 
#This system is also good for putting many plots on a screen at once.
head(state)
table(state$region) #to see how many categories there are and how many states are in each 
xyplot(Life.Exp ~ Income | region,data = state,layout=c(4,1))
#The first is the most complicated. It is this R formula, Life.Exp ~
 # | Income | region, which indicates we're plotting life expectancy as it depends on income for each region. The
#second argument, data, is set equal to state. This
#allows us to use "Life.Exp" and "Income" in the formula
#instead of specifying the dataset state for each term
#(as in state$Income). The third argument, layout, is set
#equal to the two-long vector c(4,1).
xyplot(Life.Exp ~ Income | region,data = state,layout=c(2,2))
#c(2,2)

#ggplot2- mix base and lattice
#allows you to annotate by "adding" to a plot (as Base does)
head(mpg)
dim(mpg) #dimensions
table(mpg$model)
#We're interested in the effect engine displacement (displ) has on highway gas mileage (hwy),
qplot(displ,hwy,data = mpg)
#We'll focus on using the base plotting system to create graphics on the screen
#device rather than another graphics device.
#The core plotting and graphics engine in R is encapsulated in two packages. 
#The first is the graphics package which contains plotting functions for the
#"base" system. The functions in this package include plot, hist, boxplot, barplot, etc. 
#The second package is grDevices which contains all the code
#implementing the various graphics devices, including X11, PDF, PostScript, PNG, etc.
head(airquality)
range(airquality$Ozone, na.rm = TRUE) #tells you the lowes and biggest digits in the column 
hist(airquality$Ozone)
#boxplot
table(airquality$Month)
boxplot(Ozone~Month,airquality)
boxplot(Ozone~Month, airquality, xlab="Month", ylab="Ozone (ppb)",col.axis="blue",col.lab="red") #adds titles
title(main="Ozone and Wind in New York City")
#2 dimensions scatter plot
with(airquality, plot(Wind, Ozone))
title(main="Ozone and Wind in New York City")
length(par()) #par -> parameters You can use par to set parameters OR to find out what values are already set
names(par()) #finds the parameters 
par()$pin # alternatively running par("pin") or par('pin')) -> Plot dimensions in inches
par("fg") # r par('fg') or par()$fg -> pecifies foreground color
par()$bg #background 
#graphical parameter pch controls plot character
par("pch")
#parameters lty and lwd control line type and width
par("lty") #to see the default line type.
#The par() function is used to specify global graphics parameters that affect all plots in an R session
#(Use dev.off or plot.new to reset to the defaults.)These include las (the orientation of the axis
#labels on the plot), bg (background color), mar (margin size), oma (outer margin size), mfrow and mfcol (number of plots per row, column).
plot(airquality$Wind, type="n",airquality$Ozone
title("Wind and Ozone in NYC")
may <- subset(airquality, Month==5)
points(may$Wind,may$Ozone,col="blue",pch=17)#plot May's wind and ozone (in that order) as solid blue triangles
notmay <- subset(airquality, Month!=5) 
points(notmay$Wind,notmay$Ozone,col="red",pch=8)#red sowflakes
legend("topright",pch = c(17,8), col = c("blue","red"), legend=c("May","Other Months"))
#the first will be the string "topright" to tell R where to put the legend. The remaining 3 arguments will each be 2-long vectors
#created by R's concatenate function, e.g., c(). These arguments are pch, col, and legend. The first is the vector (17,8), the second
# ("blue","red"), and the third ("May","Other Months").
abline(v=median(airquality$Wind),lty=2,lwd=2)
#add a vertical line at the median of airquality$Wind. Make it dashed (lty=2) with a width of 2.
par(mfrow=c(1,2))
#par with the parameter mfrow set equal to the vector (1,2) to set up the plot window for two plots side by side. You won't see a result.
plot(airquality$Wind, airquality$Ozone, main = "Ozone and Wind")
plot(airquality$Ozone, airquality$Solar.R, main = "Ozone and Solar Radiation").
#
par(mfrow=c(1,3),mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(airquality$Wind, airquality$Ozone, main = "Ozone and Wind")
plot(airquality$Solar.R, airquality$Ozone, main = "Ozone and Solar Radiation")
plot(airquality$Temp, airquality$Ozone, main = "Ozone and Temperature")
mtext("Ozone and Weather in New York City", outer = TRUE)

