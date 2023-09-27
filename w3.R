# Basic Data Type ----
c("John", "Mary")
c(2, 3.1412)
c(TRUE, TRUE, F, T)
# using c() to collect your value
typeof(c("John", "Mary"))
typeof(list("John", 178, TRUE))

# binding ----
personName = c("John", "Mary")
interestingNumber = c(2, 3.14159265357)
covidPositive = c(TRUE, FALSE, T, F)

#name call to access value
personName
interestingNumber
covidPositive

# Retrieve ONE element value ----
# by position / index
personName[[1]]
personName[[2]]

list("John", 178, T)
listExample = list("John", 178, T)

listExample
listExample[[3]]

# Name your element values ----
## name: John, age: 38, height: 178, Married: False
recordExample1 = list("John", 38, 178, F)
recordExample2 = list(
  "name" = "John",
  "age" = 38,
  "height" = 178,
  "Married" = F
)

recordExample1[[1]]
recordExample2[[1]]
recordExample2$name
recordExample2[["name"]]
