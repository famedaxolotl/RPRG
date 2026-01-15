# ███████╗███████╗███████╗███████╗██╗ ██████╗ ███╗   ██╗    ██╗  ██╗
# ██╔════╝██╔════╝██╔════╝██╔════╝██║██╔═══██╗████╗  ██║    ██║  ██║
# ███████╗█████╗  ███████╗███████╗██║██║   ██║██╔██╗ ██║    ███████║
# ╚════██║██╔══╝  ╚════██║╚════██║██║██║   ██║██║╚██╗██║    ╚════██║
# ███████║███████╗███████║███████║██║╚██████╔╝██║ ╚████║         ██║
# ╚══════╝╚══════╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝         ╚═╝

# reads current clipboard
x1 = readClipboard()

# read_csv(): For comma-separated values (,)
# read_tsv(): For tab-separated values (\t)
# read_csv2(): For semicolon-separated values (;)
#here, the NA means unavailable values will be given as NA
newData <- read.csv("data123.csv", na = c("N/A", ""))

# read file with a custom delimiter
# reading data from a specific file with a specific custom delimiter
#this needs readr
library(readr)
my_dat1 <- read_delim("some_file_here.txt", delim = "|", show_col_types = FALSE)

#reads a table (data frame) from a special filename "clipboard", with tab as the
#separator. \t is a symbol for tab
#header = T sets the firm row as header
my_data <- read.table(file = "clipboard", sep = "\t", header = TRUE)
my_data

#this can be used to read comma-separated data files (csv)
my_data <- read.table(file = "clipboard", sep = "\t", header = TRUE)



#READING DATA FROM REMOTE LOCATION (GOOGLESHEET)
#MAY NEED AUTHENTICATION
#load the packages

#in the google sheet link, after the d/, everything else is the unique link
library(googlesheets4)
library(tidyverse)
gs4_deauth()
# first we make a variable with the unique link code
file_11 <- "1_CSUeJfZ_bmE6xdDu5vUFuQR_wwMhMKEXDcFyW3cJe4"
#then we use the read_sheet() function to read the data as a dataframe into newDF_11
#sheet does not need to be specified if there is only one sheet
newDF_11 <- read_sheet(file_11, sheet = "Sheet1")

