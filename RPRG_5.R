# ███████╗███████╗███████╗███████╗██╗ ██████╗ ███╗   ██╗    ███████╗
# ██╔════╝██╔════╝██╔════╝██╔════╝██║██╔═══██╗████╗  ██║    ██╔════╝
# ███████╗█████╗  ███████╗███████╗██║██║   ██║██╔██╗ ██║    ███████╗
# ╚════██║██╔══╝  ╚════██║╚════██║██║██║   ██║██║╚██╗██║    ╚════██║
# ███████║███████╗███████║███████║██║╚██████╔╝██║ ╚████║    ███████║
# ╚══════╝╚══════╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚══════╝

gs4_deauth()
gsheet_123 <- "1BV9KgyHtfhmW5yMzxyLF7q4jGZ5fC4YI7gfFatP5zSA"
salesDF <- read_sheet(gsheet_123, sheet = "SalesData")
salesDF

salesDF <- read_sheet(gsheet_123, sheet = "SalesData")

# |> is the pipe symbol
#filters df to get all entries with year 2015
salesDF |>
  filter(Year == 2015)

#saves the filtered DF into a new variable
sales_2015 <--salesDF |>
  filter(Year == 2015)

#arranged by city (alphabetical)
salesDF |>
  filter(Year == 2015)|>
  arrange(City)  

#does the sorting in descending order
salesDF |>
  filter(Year == 2015)|>
  arrange(desc(City))

salesDF |>
  filter(Year == 2015)|>
  #switch the City and Year column locations
  relocate(City, Year)|>
  relocate(ShippingCost, .before = Profit)


sales_df_123 <--salesDF |> 
  arrange(City, Year) |>
  relocate(City, Year,Sales, Profit) |>
  #rename a column of data
  rename(ShipCost = ShippingCost)|>
  relocate(ShipCost, .before = Profit)|>
  #the mutate operation allows us to add a column according to some operation
  mutate(
    Profit_Margin = (Profit / Sales)*100,
    
    .after = Profit
  )

#we are plotting is based on the original DF here, but we could have also
#done the filter after the mutate() function above
salesDF|>
  filter(City=="Mumbai")|>
  ggplot(aes(Year, Profit))  + geom_line() + geom_point()


profitM =salesDF|>
  filter(City=="Mumbai")|>
  select(Year, Profit)|>
  rename(MProfit= Profit)
profitM

profitD =salesDF|>
  filter(City=="Delhi")|>
  select(Year, Profit)|>
  rename(DProfit= Profit)

profitDM = profitD
profitDM

profitDM$MProfit = profitM$MProfit
profitDM

ggplot(profitDM, aes(Year))+ geom_line(aes(y=DProfit))+geom_line(aes(y=MProfit))


