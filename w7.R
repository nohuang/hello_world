flights = readRDS("flights.rds")

flightsData <- flights$data[[1]]$data_frame

dplyr::glimpse(flightsData)

factor(flightsData$ArrivalAirportID) -> flightsData$ArrivalAirportID

factor(flightsData$DepartureAirportID) -> flightsData$DepartureAirportID

levels(flightsData$AirlineID) |> length()

sum(c(20, 14, 4, 95))

c(20, 14, 4, 95) |> sum()

c(1, 3, 1, 2, 9, 9, 5, 9, 2) |> table()

flightsData$AirlineID |> table() -> tb_airlineID

sort(tb_airlineID, decreasing = T)