fiftysix::workhorse()

library(NutrientData)

search_ingredient("onion,raw")

ingredients <- c("CABBAGE,RAW", "MAYONNAISE,RED FAT,W/ OLIVE OIL", "ONIONS,RAW")
grams <- c(100, 20, 10)

calculate_nutrients(ingredients, grams)
