flights = readRDS("flights.rds")
str(flights)
flightsData = flights$data[[1]]$data_frame

grades <- data.frame(
  student = c("Alice", "Bob", "Charlie", "David", "Eve"),
  midterm = c(95, 80, 70, 60, 75),
  final = c(90, 85, 75, 95, 80)
)

grades_list <- list(
  student = c("Alice", "Bob", "Charlie", "David", "Eve"),
  midterm = c(95, 80, 70, 60, 75),
  final = c(90, 85, 75, 95, 80)
)


grades_list$student
grades_list[["student"]]

grades$student
grades[["student"]]


grades[, "student"] # retrieve student column
grades[, c("student", "midterm")] # retrieve student and midterm columns
grades[c(1,3), "student"] # retrieve student column for rows 1 and 3
grades[c(1,3), c("student", "midterm")] # retrieve 

install.packages("tidyverse")

dplyr::glimpse(flightsData)
flightsData[c(358, 408),c("AirlineID", "ArrivalTime")]
names(flightsData)

class(flightsData$AirlineID)
class(flightsData$ScheduleStartDate)

head(flightsData$AirlineID)
head(flightsData$ScheduleStartDate)

vec = c("A", "B", "C")
typeof(vec)
class(vec)

bloodTypes <- c("AB", "AB", "A", "B", "A", "A", "B", "O", "O", "AB")


householdIncomes <- c(
  "middle income", "high income", "middle income", "low income",
  "middle income", "high income", "high income", "low income",
  "high income", "middle income", "high income", "middle income"
)

class(householdIncomes)
householdIncomes[[1]]
householdIncomes[[1]] < "high income"
householdIncomes[[1]] < "low income"

"h" < "m"

fct_householdIncome <- factor(householdIncomes)

ord_fct_householdIncome <- ordered(householdIncomes, levels = c("low income", "middle income", "high income"))

class(fct_householdIncome)
class(ord_fct_householdIncome)

ord_fct_householdIncome[[1]] < "high income"


class(flightsData$AirlineID)

factor(flightsData$AirlineID) -> flightsData$AirlineID

class(flightsData$AirlineID)

flights$data[[1]]$data_frame <- flightsData

saveRDS(flights, "flights.rds")