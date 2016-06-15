#' Searches the data
#'
#' The function takes one or more comma-separated search terms and looks for matches in the ABBREV data set.
#'
#' @param ingredient is a string of one or more comma-separated terms
#'
#' @return a vector of possible matches
#'
#' @examples
#' library(NutrientData)
#'
#' search_ingredient("onion")
#'
#' search_ingredient("onion,raw")
#'
#' @export

search_ingredient <- function(ingredient){

  ingredient <- stringr::str_to_lower(ingredient)

  ingredient <- unlist(stringr::str_split(ingredient, ","))

  detected_ingredient <- lapply(ingredient, function(x) {
    stringr::str_detect(stringr::str_to_lower(ABBREV$Shrt_Desc), x)
  })
  detected_ingredient <- do.call(cbind, detected_ingredient)
  detected_ingredient <- apply(detected_ingredient, 1, all)

  found.ingredients <- dplyr::filter(ABBREV, detected_ingredient)
  found.ingredients <- found.ingredients$Shrt_Desc

  return(found.ingredients)
}

###

#' Calculates nutrients
#'
#' The function calculates nutrient value based on a list of ingredients and their weight in grams.
#'
#' @param ingredients is a vector of one or more ingredients
#' @param grams is a vector of the corresponding weight in grams of each ingredient
#'
#' @return a data frame containing the nutrients of each ingredient along with a total score.
#'
#' @examples
#' library(NutrientData)
#' library(dplyr)
#'
#' ingredients <- c("CABBAGE,RAW", "MAYONNAISE,RED FAT,W/ OLIVE OIL", "ONIONS,RAW")
#' grams <- c(100, 20, 10)
#'
#' calculate_nutrients(ingredients, grams) %>%
#'   select(Food = 1, Calories = 3, Protein = 4,
#'          Fat = 5, Carbs = 7)
#'
#' @export

calculate_nutrients <- function(ingredients, grams){

  ingredients.df <- data.frame(ingredients, grams, stringsAsFactors = F)

  ingredients.calc <- lapply(1:nrow(ingredients.df), function(x){
    ingred <- dplyr::filter(ABBREV, Shrt_Desc == ingredients.df$ingredients[x])
    ingred[,3:48] <- ingred[,3:48]*(ingredients.df$grams[x]/100)
    ingred <- ingred[,2:48]
    return(ingred)
  })

  ingredients.calc <- do.call(rbind, ingredients.calc)
  sums <- colSums(ingredients.calc[2:47])

  ingredients.calc[nrow(ingredients.calc)+1,] <- NA
  ingredients.calc[nrow(ingredients.calc),] <- c("TOTAL", sums)

  return(ingredients.calc)
}

