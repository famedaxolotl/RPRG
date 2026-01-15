

# ███████╗███████╗███████╗███████╗██╗ ██████╗ ███╗   ██╗     ██████╗ 
# ██╔════╝██╔════╝██╔════╝██╔════╝██║██╔═══██╗████╗  ██║    ██╔════╝ 
# ███████╗█████╗  ███████╗███████╗██║██║   ██║██╔██╗ ██║    ███████╗ 
# ╚════██║██╔══╝  ╚════██║╚════██║██║██║   ██║██║╚██╗██║    ██╔═══██╗
# ███████║███████╗███████║███████║██║╚██████╔╝██║ ╚████║    ╚██████╔╝
# ╚══════╝╚══════╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝     ╚═════╝ 

#"numeric"
x1 <- 3
class(x1)
typeof(x1)#"double"
#"interger", explicitly defined by 'L'
x2 <- 3L
class(x2)

#"complex"
x3 <- 1+2i
class(x3)

#"character"
x4 <- "abcd"
class(x4)

#"logical"
x5 <- TRUE
class(x5)

# increase scipen to stop R from using scientific notation
options(digits = 16, scipen = 999)
#'digits' sets the number of significant digits
options(digits = 7, scipen = 0) #default

#computers can only accurately store the first 15 significant digits of a double
# 7 for a double

#print however many digits
1/3
sprintf("%.8f", 1/3)
sprintf("%.16f", 1/3)
sprintf("%.24f", 1/3)
sprintf("%.100f", 1/3)

#use 
x6 <- 1/3
x6
class(x6)
typeof(x6)

x7 <- as.integer(x6)
class(x7)
x7
x8 <- as.character(x6)
class(x8)
x8


d1 <- as.Date("2025-8-15")
d1
typeof(d1)
as.numeric(d1)
d1+7

d2 <- as.Date("1970-01-01")
d2
as.numeric(d2)

Sys.Date()
Sys.time()
date()
timestamp()


#lubridate
today()
now()

#these variables are stored in standard date format yyyy-mm-dd
a1=ymd("2022-08-15")
a2=ymd("2022-Aug-15")
a3=ymd("2022-August-15")

# stored in yyyy-mm-dd
iday1 <- dmy("15-August-1947")
iday1
as.numeric(iday1)


rday1 <- mdy("01-26-1950")
rday1
rday1 - iday1

#yyyy-mm-dd- hh:mm:ss UTC
d1=ymd_hms("2025-12-31 23:59:59")
#in explicit time zone
d2=ymd_hms("2025-12-31 23:59:59", tz="Asia/Kolkata")

#adding years, months, days, hours, minutes and seconds
now()
now() + years(1) + months(5) + days (12)
now() + hours(2) + minutes(25) +seconds(45)

c1=as.numeric(now())
as.numeric(today())


# check ymd(), dmy(), or mdy()

#vectors must be of homogenous types
v1 <- c(1,2,3)
v2 <- c("A","B","C")

#lists can have mixed types
l1 <- list("33","Raju", 75)
"Raju" %in% l1 # check if it is in list

m1 <- matrix(c(1:9), nrow=3)
  m1
m2 <- matrix(c(1:9), nrow=3, byrow=TRUE)
m2

#if the matrix runs out of input values, it will repeat values.
#here, the last column takes 1,2,3 again
m3 <- matrix(c(1:9), nrow=3, ncol=4)
m3
m4 <- matrix(c(1:10), nrow=3, ncol=4)
m4
nrow(m4); ncol(m4); dim(m4); length(m4)

10 %in% m4  # check if it is in matrix

m34 <- matrix(c(1:12), nrow=3)
m34[2:3, 3:4]  # accessing part of a matrix
m34[-1,-(2:3)]  # accessing part of a matrix
# rbind() or cbind() to combine two matrices


m34
#prints column-wise
for(x in m34){print(x)}
# print row wise
for (r in 1:nrow(m34)) {
  for (c in 1:ncol(m34)) { print(m34[r,c]) }
}

arr1 <- array(c(1:24), dim=c(3,4,2))
arr1
arr1; dim(arr1) ; length(arr1)
for(x in arr1){print(x)}

roll_list <- data.frame(
  Roll_No = c(31,32,34),
  Name = c("Ajay", "Atul", "Aman"),
  Marks = c(55, 60, 70))

roll_list

head(roll_list)
str(roll_list)
structure(roll_list)
summary(roll_list)


m33 <- matrix(c(1:9), nrow=3)
m33

#the apply family of functions is used to efficiently loop over vectors of data
#and perform overations upon them
#1 is rowwise, 2 is columnwise
#the last argument is the operation
apply(m33,1,sum)
apply(m33,2,sum)

mtcars
apply(mtcars,2,mean)
lapply(mtcars,mean) # list apply
sapply(mtcars,mean) # simple apply
tapply(mtcars$mpg, mtcars$am, mean)
tapply(mtcars$disp, mtcars$cyl, mean)

#  Operators:
#  +   -   *   /
#  ^  or  **  exponent
#  %/%  integer division (quotient)
#  %%   modulus (remainder)

# Comparison: ==, !=, >, <, >=, <=


#function is defined using the function(){} notation
#a function may conditionally return something, which will be done using the
#return() function inside a function
greeting = function(msg){
  if(msg=="hello"){
    return("hi")
  }else return("rude")
}

#that return value will be output when the function is called
#here for example. right now, m2 stores 'rude'
m2=greeting("bye")

pOE <- printOddEven
pOE(105)


pOE1 <- printOddEven <- function(x){
  
  if (x %% 2 == 0) print ("Even")
  else print ("Odd")
}

pOE1(100)

