library(readr)
dg6 <- readr::read_csv("https://data.cip.gov.tw/API/v1/dump/datastore/A53000000A-112010-003")
View(dg6)

# 男女看報紙比例----
## new ----
## 若沒有tidyr則安裝
if(!require(tidyr)) install.packages("tidyr")

dg6 |>
  dplyr::select(
    年度, 類別,看報紙,項目別
  ) |>
  dplyr::filter(
    類別 == "性別"
  ) -> dg6_filtered
View(dg6_filtered)
head(dg6_filtered)

dg6_filtered |>
    tidyr::pivot_wider(
    names_from = "項目別",
    values_from = "看報紙"
  )  |>
  dplyr::mutate(
      男_女比=男/女
  )

# others ----


dg6 |>
  dplyr::select(
    年度, 類別,項目別,看報紙
  ) |>
  dplyr::filter(
    類別 == "年齡"
  ) -> dg6_filtered_1

head(dg6_filtered_1)

dg6_filtered_1 |>
  tidyr::pivot_wider(
    names_from = "項目別",
    values_from = "看報紙"
  ) 
View(dg6_filtered_1)

#pie chart
dg6 |>
  dplyr::select(
    3:21
  ) |>
  dplyr::filter(
    項目別=="-"
  ) -> dg6_filtered_3

View(dg6_filtered_3)

x <- as.numeric(dg6_filtered_3[1, ][4:19])
labels <- c(colnames(dg6_filtered_3[1, ][4:19]))

# Give the chart file a name.
png(file = "103.jpg")

# Plot the chart.
pie(x,labels)

# Save the file.
dev.off()