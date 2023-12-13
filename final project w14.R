library(readr)
work <- read_csv("https://data.cip.gov.tw/API/v1/dump/datastore/A53000000A-112010-003")
View(work)
dplyr::glimpse(work)

dg6 <- readr::read_csv("https://data.cip.gov.tw/API/v1/dump/datastore/A53000000A-112010-003")

# 篩出性別資料
dg6 |>
  dplyr::filter(
    類別 == "性別"
  ) -> dg6_1

dg6_1 |>
  split(
    dg6_1$項目別
  ) -> split_dg6_1

split_dg6_1$女$看報紙/
  split_dg6_1$男$看報紙 -> summarise1

names(summarise1) <- 
  split_dg6_1$女$年度

summarise1

# 篩出年齡資料

dg6 |>
  dplyr::filter(
    類別 == "年齡"
  ) -> dg6_2

dg6_2 |>
  split(
    dg6_2$項目別
  ) -> split_dg6_2

split_dg6_2$`15 ~ 19歲`$看報紙/
  split_dg6_2$`65歲及以上`$看報紙 -> summarise2

names(summarise2) <- 
  split_dg6_2$`15 ~ 19歲`$年度

summarise2
