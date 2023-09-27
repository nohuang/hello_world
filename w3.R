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
covidPositive <- c(TRUE, FALSE, T, F)
c(TRUE, FALSE, T, F) -> covidPositive
#name call to access value
personName
interestingNumber
covidPositive

# Retrieve ONE element value ----
##by position / index
personName[[1]]
personName[[2]]

list("John", 178, T)
listExample = list("John", 178, T)

listExample
listExample[[3]]

# Name your element values ----
## name: John, age: 38, height: 178, married: False
recordExample1 = list("John", 38, 178, F)
recordExample2 = list(
  "name" = "John",
  "age" = 38,
  "height" = 178,
  "married" = F
)

recordExample1[[1]]
recordExample2[[1]]
recordExample2$name
recordExample2[["name"]]

# Retrieve multiple element values ----
# by Position/Index
listExample
listExample[c(1,3)]

atomicExample = c(1, 4, 78, 455, -23)
atomicExample
atomicExample[c(1,3,4)]
atomicExample[c(1:5)]

# by element names ----
recordExample2[c("name", "age", "married")]

# collective_data ----
collective_data = list(
  list(  "name" = "John",
         "age" = 38,
         "height" = 178,
         "married" = F
  ), 
  list( "name" = "Mary",
        "age" = 32,
        "height" = 165,
        "married" = T
  )
)
collective_data[[2]][["name"]]
collective_data[[2]]$name
collective_data[[1]][c("name", "height")]
