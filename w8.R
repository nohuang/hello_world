flights = readRDS("flights.rds")

options(encoding = "UTF-8")
Sys.setlocale("LC_CTYPE", "zh_TW.UTF-8")
str(flights)

flights$data[[1]][["meta"]][["name"]]
flightsData <- flights$data[[1]][["data_frame"]]

flightsData$AirlineID

table(flightsData$AirlineID) |> sort(decreasing = T) |> head(10)

data2 <- list(
  meta = list(
    name="航空公司統一代碼",
    source_link ="https://data.gov.tw/dataset/8088"
  ),
  file = "airlines.json"
)

flights$data[[2]] <- data2

airlines <-
  jsonlite::fromJSON(
    flights$data[[2]][["file"]]
  )

flights$data[[2]][["data_frame"]] <- airlines

saveRDS(flights, file="flights.rds")

dplyr::glimpse(airlines)

dplyr::left_join(
  flightsData, airlines,
  by="AirlineID"
) -> flightsData

flightsData$AirlineName <-
  factor(
    flightsData[["AirlineName"]]
  )

names(flightsData)

install.packages("airportr")

airports <- airportr::airports
dplyr::glimpse(airports)

dplyr::filter(
  airports,
  Country == "Taiwan"
) -> airports_taiwan

head(airports_taiwan)

flightsData |>
  dplyr::filter(
    DepartureAirportID %in% unique(airports_taiwan[["IATA"]])) -> 
  departure_flightsData

flightsData |>
  dplyr::filter(
    ArrivalAirportID %in% unique(airports_taiwan[["IATA"]])) -> 
  arrival_flightsData


flights$data[[3]] <- list(
  departure_flightsData= departure_flightsData,
  arrival_flightsData = arrival_flightsData
)

nrow(departure_flightsData)

nrow(arrival_flightsData)

flights$dataSummary <- dataSummary

saveRDS(flights, file="flights.rds")
