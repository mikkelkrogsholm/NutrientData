library(dplyr)
library(tidyr)

# query FOOD_DES
des <- function(ndb_no) filter(FOOD_DES, NDB_No %in% ndb_no)

# query WEIGHTS
ndb_weight <- function(ndb_no, seq, amount = 1) {
  if(missing(seq)) {
    filter(WEIGHT, NDB_No == ndb_no)
  } else {
    filter(WEIGHT, NDB_No == ndb_no, Seq == seq)
  } %>%
    mutate(
      Gm_Wgt = Gm_Wgt / Amount * amount,
      Amount = Amount / Amount * amount
    )
}

# query NUT_DATA
ndb <- function(ndb_no, amount = 100, seq) {
  if(missing(seq)) {
    grams <- amount
  } else {
    grams <- ndb_weight(ndb_no, seq, amount)$Gm_Wgt
  }
  filter(NUT_DATA, NDB_No %in% ndb_no) %>%
    mutate(Nutr_Val = Nutr_Val / 100 * grams)
}

# query NUTR_DEF
nutrient <- function(nutr_no, quantity = 1) {
  select(NUTR_DEF, Nutr_No) %>%
    filter(Nutr_No %in% nutr_no) %>%
    mutate(Nutr_Val = quantity)
}

# combine 2 or more NUT_DATA queries
add_nutrition <- function(nutrition, nutrition_to_add) {
  select(nutrition_to_add, Nutr_No, Nutr_Val) %>%
    bind_rows(select(nutrition, Nutr_No, Nutr_Val)) %>%
    group_by(Nutr_No) %>%
    summarise(Nutr_Val = sum(as.numeric(Nutr_Val), na.rm = T))
}

# resize NUT_DATA
resize_nutrition <- function(nutrition_to_multiply, qty = 1) {
  mutate(nutrition_to_multiply, Nutr_Val = Nutr_Val * qty)
}
