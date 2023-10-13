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


filepath = flights$data[[1]]$file

flights$data[[1]][[2]]

flightsData <- jsonlite::fromJSON(filepath)

flights$data[[1]]$data_frame <- flightsData

typeof(flightsData)
class(flightsData)

flightsData[3,"ScheduleStartDate"]
flightsData[3,2]
flightsData[c(2,4),c("AirlineID","ScheduleStartDate","FlightNumber")]
flightsData[c(2,4),c(1,3,4)]


saveRDS(flights, "flights.rds")


