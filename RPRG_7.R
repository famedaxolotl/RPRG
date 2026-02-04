# ███████╗███████╗███████╗███████╗██╗ ██████╗ ███╗   ██╗    ███████╗
# ██╔════╝██╔════╝██╔════╝██╔════╝██║██╔═══██╗████╗  ██║    ╚════██║
# ███████╗█████╗  ███████╗███████╗██║██║   ██║██╔██╗ ██║        ██╔╝
# ╚════██║██╔══╝  ╚════██║╚════██║██║██║   ██║██║╚██╗██║       ██╔╝ 
# ███████║███████╗███████║███████║██║╚██████╔╝██║ ╚████║       ██║  
# ╚══════╝╚══════╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝       ╚═╝  

#this is a function which adds two numbers and returns
#the output
f01 <- function(x, y) {
  # A comment
  x + y
}

#formals returns the arguments of the function
formals(f01)
#body gives the main body, without function signature/comments
body(f01)
#type of environment
environment(f01)

#returns the entire source code without comments
attr(f01, "srcref")

# Primitive functions are written in C
f01 #f01 is not a primitive function
sum
`[`
# their type is "special" or "builtin"
#builtin function
typeof(sum)
#special
typeof(`[`)
# they have NULL formals, body, env
formals(sum)
body(sum)
environment(sum)

rm(f01) # clear from workspace


x <- c(1,2,3,4,5,6,7,8,9)
#as the following function is 1 line, we dont need the "{}"
#returns square of given number
square <- function(x) x*x
#gives deviation from mean of vector x
deviation <- function(x) x - mean(x)
square(x)
deviation(x)


sqrt(mean(square(deviation(x))))

#storing intermediate steps in the same variable
temp1 <- deviation(x)
temp1 <- square(temp1)
temp1 <- mean(temp1)
sqrt(temp1)

#sequential steps through pipe
x |>
  deviation() |>
  square() |>
  mean() |>
  sqrt()

rm(x, temp1, deviation, square) # clear

# LEXICAL SCOPING IN R
x <- 2 # the value of x (global variable) is now 2
f02 <- function() {
  x <- 10 #the value of local x (inside f02() is 10)
  return(x)
}
#this function will return the local x, which is 10. Global x is still 12
f02()
x

#variables defined inside the local scope cannot be accessed globally
x <- 2
f03 <- function() {
  y <- 1
  c(x, y)
}
f03()
# 'y' cannot be found here
y
rm(x,y,f03)

#  Lexical scoping: Name masking
x <- 10
y <- 20
f03 <- function() {
  y <- 2
  z <- 3
  c(x, y, z)
}
f03()
c(x, y)
# as in previous example, R cannot find z in the global scope
c(x, y, z)
rm(x,y,f03) # Clear

#  Lexical scoping: Functions versus variables
# function inside function
x <- 1
f01 <- function() {
  # print("Here-1")
  y <- 2
  z <- 30
  f02 <- function() {
    # 'z' here is masking by 3
    z <- 3
    c(x, y, z)
  }
  f02()
}
#as part of the execution of f01, f02 will also run
f01()
rm(x,f01) # CLear

f01 <- function(x) x + 1
f02 <- function() {
  f01 <- function(x) x + 100
  f01(10)
}
#gives 110 as it calls the locally defined f01()
f02()
#below f01() function is the global f01(), not the one defined in f02()
#so, value of f01(10) gives 11, and not 101
f01(10)

rm(f01,f02) # Clear


# function and variable
v1 <- function(x) x + 100
v2 <- function() {
  #this is defining the VARIABLE v1
  v1 <- 10
  #this is using the globally defined FUNCTION v1
  #naming variables and functions the same IS EXTREMELY MORONIC AND SMOOTHBRAINED THING TO DO
  v1(v1)
}
v2()

rm(v1,v2) # Clear

#  Lexical scoping: A fresh start, no history/memory
f1 <- function() {
  #the if() clause executed if the statement inside evalutes to true, adding a ! means
  #TRUE if NOT TRUE
  #obviously, a random string "a" does not exist
  if (!exists("a")) {
    a <- 1
  } else {
    a <- a + 1
  }
  a
}

f1()
f1()

rm(f1) # Clear

#  Lexical scoping: Dynamic lookup, look for values when run
f1 <- function() x + 1
x <- 15
#when running, the function f1() automatically picks up x from the global env
f1()
#below, now picks up x20
x <- 20
f1()

rm(x,f1)

# Default values
#the value of y is preset to 2, and will be used when a y value is not passed in the argument of f
f <- function(x, y = 2) {
  x + y
}
f(10) #returns 12
f(10, 20) #returns 30
rm(f)

#[3]
f <- function(x) {
  #the outer function passed argument x to inner function
  f <- function(x) {
    #which runs the inner-inner function which captures x from the local env and squares it
    f <- function() {
      x ^ 2
    }
    #as part of its execution, f() calls and returns itself +1
    f() + 1
  }
  # as part if its execution, this squares the output of the inner function
  f(x) * 2
}
# 9(10^2)+1)*2=202
f(10)
rm(f)

#[4]
f<- function(x){
  f<- function(x){
    x
  }
}
#below function call doesn't return anything as the outer f() never calls the inner
# f() function as part of its execution
f(100)
rm(f)

#this is how the above function is supposed to look
f<- function(x){
  f<- function(x){
    x
  }
  f(10)
}
#but putting 100 here doesn't matter as the outer f() calls f(10) anyway. output is 10
f(100)

rm(f)


# this is an example to demonstrate default values
amount <- function(p, y = 1, i = 0.1) {
  p*(1+i)^y
}
amount(100) # used y and i presets. output 100
amount(p = 100, y = 2) #uses preset i. output 121
amount(p = 100, y = 2, i = 0.2) #uses no presetes. output 144
rm(amount)


#[7]
h01 <- function(x) {
  10
}
#regardless of argument passed into h01, it will output 10
h01(print("Hi"))

rm(h01)

#[8] applied to vector
plus1 <- function(x) x + 1
#as we are passing a vector as argument, it will add 1 to each and output
plus1(c(1, 2, 3))

rm(plus1)

#[9] anonymous functions
#the sqrt function is a named function, and we can use it by its name
lapply(1:5, sqrt)
#but we can also use a function without naming it and simply entering it like so
lapply(1:5, function(x) x^2)
