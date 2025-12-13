# ███████╗███████╗███████╗███████╗██╗ ██████╗ ███╗   ██╗    ██████╗ 
# ██╔════╝██╔════╝██╔════╝██╔════╝██║██╔═══██╗████╗  ██║    ╚════██╗
# ███████╗█████╗  ███████╗███████╗██║██║   ██║██╔██╗ ██║     █████╔╝
# ╚════██║██╔══╝  ╚════██║╚════██║██║██║   ██║██║╚██╗██║     ╚═══██╗
# ███████║███████╗███████║███████║██║╚██████╔╝██║ ╚████║    ██████╔╝
# ╚══════╝╚══════╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═════╝ 

library("ggplot2")

ggplot(mpg, aes(displ, hwy)) + geom_point() + facet_wrap(~class)

ggplot(mpg, aes(displ)) + geom_histogram()
ggplot(mpg, aes(displ)) + geom_freqpoly()
ggplot(mpg, aes(displ, fill=drv)) + geom_histogram()
ggplot(mpg, aes(displ, colour=drv)) + geom_freqpoly(binwidth=1) + facet_wrap(~fl, ncol = 1)

ggplot(mpg, aes(displ, fill = drv)) + geom_histogram(binwidth = 0.5) +
  facet_wrap(~fl, ncol = 1)

#geom_smooth() makes a line of best fit (may be curved)
ggplot(mpg, aes(displ, hwy)) + geom_point() + geom_smooth()

#method=lm makes the curve strictly linear
#default: loess
#span defines how wavy the curve is
#as the line comes from geom_smooth(), we use the col argument in that function to set line colour
#fill argument is for the background of the colour
p1 = ggplot(mpg, aes(displ, hwy)) + geom_point() + geom_smooth(method = "loess", span=0.25, colour="red", fill="yellow")

# using the labs() function, we can add subtitle, caption and title
p1 = p1 + labs(title="My title 456", subtitle="My subtitle hi", caption="lol")
p1

