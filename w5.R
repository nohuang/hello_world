# my economic grades
MyEcnomicGrades = c(90,80)
my_ecnomics_grades = c(90,80)

# import json file -----
flights = jsonlite::fromJSON("international_flights.json")
View(flights)

# data information ----
data1 <- list(
  file = "international_flights.json",
  meta = list(
    name = "國際航空定期時刻表",
    source_link = "https://data.gov.tw/dataset/161167")
)

flights <- list(
  data = list(data1)
)

flights = readRDS("flights.rds")

filepath = flights$data[[1]]$file

flightData = jsonlite::fromJSON(filepath)

flights$data[[1]]$data_frame <- flightsData
flightsData

typeof(flightsData)
class(flightsData)

saveRDS(flights, "flights.rds")


