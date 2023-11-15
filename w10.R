flights <- readRDS("flights_week10.rds")
flightsData <- flights$data[[1]]$data_frame
dplyr::glimpse(flightsData)

library(dplyr)
library(lubridate)

flightsData <- flightsData %>%
  group_by(DepartureTimeZone) %>%
  mutate(DepartureTime = ymd_hms(DepartureTime, tz = DepartureTimeZone[[1]])) |>
  glimpse()

flightsData$DepartureTimeZone |> table() |> sort(,decreasing=T) -> tb_DepartureTimeZone

flightsData |> split(flightsData$DepartureTimeZone) -> split_flightsData

head(split_flightsData[[1]], 3)
head(split_flightsData[[2]]$DepartureTimeZone, 3)
head(split_flightsData[[3]]$DepartureTimeZone, 3)

# for each sub data frame
.x=1 # say the first one
# we want to parse the time
split_flightsData[[.x]]$DepartureTime <- 
  lubridate::ymd_hm(split_flightsData[[.x]]$DepartureTime, tz = split_flightsData[[.x]]$DepartureTimeZone[[1]]) 


split_flightsData[[.x]] |>
  dplyr::mutate(
    DepartureTime = 
      lubridate::ymd_hm(DepartureTime, tz = DepartureTimeZone[[1]])
  ) |>
  dplyr::ungroup() ->
  flightsData

flights$data[[1]]$data_frame <- flightsData

saveRDS(flights, file="flights.rds")
