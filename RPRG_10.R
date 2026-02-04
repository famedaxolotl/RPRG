# ███████╗███████╗███████╗███████╗██╗ ██████╗ ███╗   ██╗     ██╗ ██████╗ 
# ██╔════╝██╔════╝██╔════╝██╔════╝██║██╔═══██╗████╗  ██║    ███║██╔═████╗
# ███████╗█████╗  ███████╗███████╗██║██║   ██║██╔██╗ ██║    ╚██║██║██╔██║
# ╚════██║██╔══╝  ╚════██║╚════██║██║██║   ██║██║╚██╗██║     ██║████╔╝██║
# ███████║███████╗███████║███████║██║╚██████╔╝██║ ╚████║     ██║╚██████╔╝
# ╚══════╝╚══════╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝     ╚═╝ ╚═════╝ 
# ERRORS STOP THE PROGRAM EXECUTION
# WARNINGS ALLOW THE PROGRAM TO CONTINUE< BUT TELLS YOU SOMETHING IS WRONG 

1/0 #gives Inf
log(0) #-Inf
sqrt("abc") #error, is a showstopper

testFn1 <- function(){
  # log(-1) produces a warning, specifically that log(-1) is NotANumber(NaN)
  log(-1)
  cat("\n *** passed warning ***", "\n")
}
#THIS GIVES A WARNING
testFn1()
rm(testFn1)

#execution stops at error, at the 4th line in this case
#in warnings, execution is not halted
testFn2 <- function(){
  log(-1)
  #the cat functions allows us to use \t, \n and other regex markers
  cat("\n *** passed warning ***", "\n")
  #the log of a string will obviously return ERROR
  log("a")
  cat("\n\n*** passed error ***", "\n")
}
testFn2()
rm(testFn2)

#we can downgrade/escalate between normal-output-->warning-->

# Stop and Warning
4/0

divE <- function(x, y) {
  if (y == 0) {
    #instead of returning Inf, division by zero stops execution with ERROR
    #and prints the following message
    stop("Division by zero not allowed")
  }
  x / y
}
divE(4, 2)
#the error comes in this case
divE(4, 0)

divW <- function(x, y) {
  if (y == 0) {
    #the warning function here doesn't stop the execution loop
    warning("Division by zero")
  }
  x/y
}
divW(4, 2)
#the below function call returns the output and then the warning
divW(4, 0)




#all code in suppressWarnings() wont give any warnings if they are produced
sqrt(-1) #gives warnings
suppressWarnings(sqrt(-1)) #no warning, just NaN (the original output)

sqrt("abcd")
#the try block 'tries' to run the argument, but setting silent=T means
#any warnings or errors are supressed, the below line gives no output
#use this for errors
try(sqrt("abcd"), silent=TRUE)

class(try(sqrt(1), silent=TRUE)) #normal output, class is "numeric"
#as we can see here, the class of Error is "try-error"
class(try(sqrt("abcd"), silent=TRUE))


#this function prints Error occurred somewhere
#if ans123 is of type error
ans123 <- try( sqrt("a"), silent = TRUE)
#inherits function checks if a certain variable belongs to a certain class
if (inherits(ans123, "try-error")) {
  cat("\nError occurred somehwere\n\n")
}

#the tryCatch() function allows us to pass a piece of code to check for errors
#if the error occurs, we can capture it and use it in a function
#we can customize error messages in case of error by passing the function(e) to error
safeLog1 <- function(x) {
  tryCatch(
    log(x),
    #for any error 'e' captured, simply return "Invalid input"
    error = function(e) "Invalid input"
  )
}
safeLog1(-1)
safeLog1("A")

#Similar function here
safeDiv11 <- function(x,y) {
  tryCatch(
    divE(x,y),
    error = function(e) "Invalid input"
  )
}
safeDiv11(4,2)
safeDiv11(4/0)

#this try-catch block explicitly shows the argument structure
#this allows us to define use-cases for error, warning and normal execution(the finally block(only ADDS to normal output))
safeLog2 <- function(x){
  tryCatch(
    #conditionMesssage() takes the raw error object 'e' and converts itself to a human readable error,
    #it is generic instead of specific for error like before
    #the message function is used simply to highlight the output (run and see)
    expr = {
      log(x)
    },
    error = function(e) {
      message("\n*** Custom Error ***", "\n\n", conditionMessage(e), "\n")
    },
    warning = function(w) {
      message("\n*** Custom Warning ***", "\n\n", conditionMessage(w), "\n")
    },
    finally = {
      message("\nExecute this FINALLY line.\t")
    }
  )
}
safeLog2(2)
safeLog2(0)
safeLog2(-2)
safeLog2("A")

#Another similar function
safeDiv22 <- function(x,y){
  tryCatch(
    expr = {
      divW(x,y)
    },
    error = function(e) {
      message("\n*** Custom Error ***", "\n\n", conditionMessage(e), "\n")
    },
    warning = function(w) {
      message("\n*** Custom Warning ***", "\n\n", conditionMessage(w), "\n")
    },
    finally = { }
  )
}
safeDiv22(4,2)
safeDiv22(4,0)

#########################
#in this function, we return NA for warnings and errors
#we do not do anythign with the captured warnigns and messages
safeLog3 <- function(x){
  tryCatch(
    expr = {log(x)},
    error = function(e) { return (NA) },
    warning = function(w) {  return (NA)},
    finally = { }
  )
}
safeLog3(2)
safeLog3(-2)
safeLog3("A")



#########################
safeLog4 <- function(x){
  tryCatch(
    expr = {
      log(x)
    },
    error = function(e) {
      message("\n\nCustom Error: Error 123. Check below for system error message. ", "\n", conditionMessage(e), "\n")
    },
    warning = function(w) {
      message("\n\nCustom Warning: Warning 123. Check below for system warning. ", "\n", conditionMessage(w), "\n")
    },
    message = function(m) {
      message("Custom message: Message 123. Check below for any system message. ", "\n", conditionMessage(m), "\n")
    },
    finally = {
      message("\n\nFINALLY:")
    }
  )
}

safeLog4(2)
safeLog4(-2)
safeLog4("A")



#########################
safeLog5 <- function(x){
  tryCatch(
    expr = { 
      log(x)
    },
    #the cat function is sed to write the error output in emwLog.txt
    #cat function has a file argument which allows us to do this
    error = function(e) {
      cat("\n\nError:", conditionMessage(e), file = "emwLog.txt", append = TRUE, sep = "\n")
    },
    warning = function(w) {
      cat("\n\nWarning:", conditionMessage(w), file = "emwLog.txt", append = TRUE, sep = "\n")
    },
    message = function(m) {
      cat("\n\nMessage:", conditionMessage(m), file = "emwLog.txt", append = TRUE, sep = "\n")
    },
    finally = {}
  )
}

safeLog5(2)
safeLog5(-2)
safeLog5("A")


library(tidyverse)
########## One at a time data ##########
stocks25 <- read_delim("stocks25.txt", delim = "|", show_col_types = FALSE)
stocks25 <- stocks25 |>
  #Note: new_name=old_name is the order to be followed
  rename(code=co_code, coname=company_name, stdate=co_stkdate, clprice=nse_closing_price)|>
  mutate(stdate=dmy(stdate))

stockId <- '5747'
#filtering stocks for a given id and after a given date
p12 <- stocks25 |> filter(code==stockId) |> filter(stdate >= ymd("2025-09-01"))

ggplot(p12, aes(stdate, clprice)) + geom_line() +
  labs(x = month(p12$stdate, label = TRUE, abbr = FALSE) )


# 2  pivot_wider() and pivot_longer()
library(readxl)
SimpleData <- read_excel("SimpleData.xlsx")

#first, we select only the city, year and profit columns
wide123 <- SimpleData |> select(Year, City, Profit )|>
  #pivot_wider is used to summarize data by converting from long to wide
  #the column names become each year
  #the values are the profit amounts
  #the rows become the remaining column, which is city (unique)
  #so we have table of city profits for each year
  pivot_wider(
    names_from = Year,
    values_from = Profit
  )

long321 <- pivot_longer(
  wide123,
  #reversing the pivot wider
  cols = c('2015', '2016', '2017'),
  names_to = 'Year',
  values_to = 'Profit'
)


# 3 compute in matrix

library(tidyverse)
########## Read data ##########
stocks25 <- read_delim("stocks25.txt", delim = "|", show_col_types = FALSE)
stocks25 <- stocks25 |>
  rename(code=co_code, coname=company_name, stdate=co_stkdate, clprice=nse_closing_price)|>
  mutate(stdate=dmy(stdate))

priceDF <- stocks25 |> select(code, stdate, clprice)
priceMF <- priceDF |>
  pivot_wider(
    names_from = code,
    values_from = clprice
  )


########## calculate returns ##########
tret<- as.matrix(priceDF[2:51])
for (c in 1:dim(tret)[2]){
  rstart<-1
  for (r in 1:dim(tret)[1]){
    if (is.na(tret[r,c])) {} else {break}
    rstart <- r
  }
  for (r in dim(tret)[1]:(rstart+1)){
    tret[r,c] <- tret[r,c]/tret[r-1,c]
    if (is.na(tret[r,c])) tret[r,c] <- 1
  }
  tret[rstart,c] <- NA
}
rm(r,c,rstart)

tretDF <- as.data.frame(tret)
tretDF <- cbind(priceDF$stdate, tretDF)
colnames(tretDF)[1] <- "Date"


##### plot #####
stockId <- "5747"
df2plot <- tretDF|> mutate(thisStock = !!sym(stockId))|>
  select(Date, thisStock)|>
  filter(year(Date)==2025, month(Date)==9)

ggplot(df2plot, aes(Date, thisStock)) + geom_point()


tretDF|> mutate(thisStock = !!sym(stockId))|>
  select(Date, thisStock)|>
  filter(year(Date)==2025, month(Date)==9)|>
  ggplot(aes(Date, thisStock)) + geom_line()


