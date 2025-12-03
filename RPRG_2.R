
# ███████╗███████╗███████╗███████╗██╗ ██████╗ ███╗   ██╗    ██████╗ 
# ██╔════╝██╔════╝██╔════╝██╔════╝██║██╔═══██╗████╗  ██║    ╚════██╗
# ███████╗█████╗  ███████╗███████╗██║██║   ██║██╔██╗ ██║     █████╔╝
# ╚════██║██╔══╝  ╚════██║╚════██║██║██║   ██║██║╚██╗██║    ██╔═══╝ 
# ███████║███████╗███████║███████║██║╚██████╔╝██║ ╚████║    ███████╗
# ╚══════╝╚══════╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚══════╝

# Data cache
x=c(1,2,3,4,5)
y=c(1,2,3,4,5)
z=c(1,2,4,8,16)
p=c(5,4,3,2,1)

# This plot function displays the arguments which it may take
# 'main' is the title, blank by default
# 'xlab' and 'ylab' are the x and y axis labels
# 'cex' sets the size of the data plot points
# 'col' sets the colour
# 'pch' is the code of the type of the point (0-box, 1-circle, 2-triangle etc)
# 'type' takes options 'p', 'l' and 'b', which stand for 'show points only', 'show line only'
# or 'show both'
# 'lwd' is the line width
# 'lty' is the line type (full, dotted, dashes etc)
plot(x,y, main="Main Title", xlab="x-label", ylab="y-label",
     col='blue', cex=2, pch=1, type='b', lwd=2, lty=3)
# subsequently, we can add onto the previous plot with the line() function
# this function uses the same 'main', 'xlab' and 'ylab' as its parent plot() function
lines(x, p, col='red', cex=3, pch=1, type='b', lwd=2, lty=3)



# PIE CHART

# First, we obtain the data values
p1 <- c(10,20,30,40)

# Then, we obtain a list of labels
myLabels <- c('A','B','C','D')

# Then, we obtain a list of colours
myColors <- c('blue','green','red','yellow')

# 'p1' takes the data, 'init.angle' sets the deg from which the first slice begins
pie(p1, init.angle = 0, label = myLabels, main='Main Title', col=myColors)
# subsequently, we can add a legend()
# the first argument of the legend will be the location
legend("bottomleft", myLabels, fill = myColors)


# BARPLOT
barplot(p1, names.arg = myLabels, col=myColors)
# 'horiz' if set to T, sets the barplot horzontally. False by default
# 'density' is the shading of the lines
barplot(p1, names.arg = myLabels, col=myColors, density=100, horiz=TRUE)

# Removes stored data
rm(data)
# Forces garbage collection
gc()
  


#  ██████╗  ██████╗ ██████╗ ██╗      ██████╗ ████████╗██████╗ 
# ██╔════╝ ██╔════╝ ██╔══██╗██║     ██╔═══██╗╚══██╔══╝╚════██╗
# ██║  ███╗██║  ███╗██████╔╝██║     ██║   ██║   ██║    █████╔╝
# ██║   ██║██║   ██║██╔═══╝ ██║     ██║   ██║   ██║   ██╔═══╝ 
# ╚██████╔╝╚██████╔╝██║     ███████╗╚██████╔╝   ██║   ███████╗
#  ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝ ╚═════╝    ╚═╝   ╚══════╝

# import ggplot2
library(ggplot2)
# use this to print ALL rows of mpg data
print(mpg, n = nrow(mpg))

#load writexl library, which gives the write_xlsx() function
library(writexl)
# This writes mpg data to xlsx file
# NOTE: Stored in working directory
write_xlsx(mpg, "mpg_data.xlsx")

# REFER TO GGPLOT2 notes for the grammar of graphics theory

# Data; Aesthetic mapping; Geom function {geom_point(), geom_histogram(), geom_line()}
# 'ggplot() takes data and aesthetics, which is the aes() function, which takes x and y points
# add a geom to it, plot points in this case
ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()
ggplot(mpg, aes(cty, hwy)) + geom_point()

# in this, the geom is a histogram
ggplot(mpg, aes(cty)) + geom_histogram()
# histogram with variable bin width
# the fill argument in aes() will change the colour
ggplot(mpg, aes(cty, fill="red")) + geom_histogram(binwidth = 0.5)

#if fill is set to a category, the colours are different according to the different catagories
#drv in this case
ggplot(mpg, aes(cty, fill=drv)) + geom_histogram()

# same with fuel 'fl'
ggplot(mpg, aes(cty, fill=fl)) + geom_histogram()

# type cast cylinder data into as a categorical data
cylF=as.factor(mpg$cyl)
#now, we can use this categorical data
ggplot(mpg, aes(cty, fill=cylF)) + geom_histogram()

# same for year
yearF = as.factor(mpg$year)
ggplot(mpg, aes(cty, fill=yearF)) + geom_histogram()


#this is a frequency polygon geom of dipsl
#use colour instead of fill here
ggplot(mpg, aes(displ, colour=drv)) + geom_freqpoly(binwidth=0.5)


# ECONOMICS DATASET
write_xlsx(economics, "economics_data.xlsx")

#line plot geom
ggplot(economics, aes(date, unemploy)) + geom_line()

ggplot(mpg, aes(drv, hwy)) + geom_point()
ggplot(mpg, aes(drv, hwy)) + geom_jitter()
ggplot(mpg, aes(drv, hwy)) + geom_boxplot()
ggplot(mpg, aes(drv, hwy)) + geom_violin()

#use ggsave(<name>) to save the last plot

# In order to save, add a xlab and ylab to the plot, save it to a variable then use ggsave
p = ggplot(mpg, aes(cty, hwy)) + geom_point() + xlab("city (mpg)") + ylab("highway (mpg)")
# ggsave() takes output file name, widtha and height and units for measurement ()
ggsave("plot1.png", p, width = 5, height = 5, units='in')
