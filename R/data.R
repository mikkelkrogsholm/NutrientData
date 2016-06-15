#'Food Description File
#'
#'This file contains long and short descriptions and food group designators for all food items, along with common names, manufacturer name, scientific name, percentage and description of refuse, and factors used for calculating protein and kilocalories, if applicable. Items used in the FNDDS are also identified by value of “Y” in the Survey field.
#'Links to:
#'\itemize{
#'   \item Food Group Description file by the FdGrp_Cd field
#'   \item Nutrient Data file by the NDB_No field
#'   \item Weight file by the NDB_No field
#'   \item Footnote file by the NDB_No field
#'   \item LanguaL Factor file by the NDB_No field
#' }
#'
"FOOD_DES"

###

#' Food Group Description File
#'
#' This file is a support file to the Food Description file and contains a list of food groups used in SR28 and their descriptions.
#' Links to:
#' \itemize{
#'   \item Food Description file by FdGrp_Cd
#' }
"FD_GROUP"

###

#' LanguaL Factor File
#'
#' This file is a support file to the Food Description file and contains the factors from the LanguaL Thesaurus used to code a particular food.
#' Links to:
#' \itemize{
#'   \item Food Description file by the NDB_No field
#'   \item LanguaL Factors Description file by the Factor_Code field
#' }
"LANGUAL"

###

#' LanguaL Factors Description File
#'
#' This file is a support file to the LanguaL Factor file and contains the descriptions for only those factors used in coding the selected food items codes in this release of SR.
#' Links to:
#' \itemize{
#'   \item LanguaL Factor file by the Factor_Code field
#' }
"LANGDESC"

###

#' Nutrient Data File
#'
#' This file contains the nutrient values and information about the values, including expanded statistical information.
#' #' Links to:
#' \itemize{
#'   \item Food Description file by NDB_No
#'   \item Food Description file by Ref_NDB_No
#'   \item Weight file by NDB_No
#'   \item Footnote file by NDB_No and when applicable, Nutr_No
#'   \item Sources of Data Link file by NDB_No and Nutr_No
#'   \item Nutrient Definition file by Nutr_No
#'   \item Source Code file by Src_Cd
#'   \item Data Derivation Code Description file by Deriv_Cd
#' }
"NUT_DATA"

###

#' Nutrient Definition File
#'
#' This file is a support file to the Nutrient Data file. It provides the 3-digit nutrient code, unit of measure, INFOODS tagname, and description.#'
#' Links to:
#' \itemize{
#'   \item Nutrient Data file by Nutr_No
#' }
"NUTR_DEF"

###

#' Source Code File
#'
#' This file contains codes indicating the type of data (analytical, calculated, assumed zero, and so on) in the Nutrient Data file. To improve the usability of the database and to provide values for the FNDDS, NDL 34staff imputed nutrient values for a number of proximate components, total dietary fiber, total sugar, and vitamin and mineral values.
#' Links to:
#' \itemize{
#'   \item Nutrient Data file by Src_Cd
#' }
"SRC_CD"

###

#' Data Derivation Code Description File
#'
#' This file provides information on how the nutrient values were determined. The file contains the derivation codes and their descriptions.#' Links to:
#' \itemize{
#'   \item Nutrient Data file by Deriv_Cd
#' }
"DERIV_CD"

###

#' Weight File
#'
#' This file  contains the weight in grams of a number of common measures for each food item.
#' \itemize{
#'   \item Food Description file by NDB_No
#'   \item Nutrient Data file by NDB_No
#' }
"WEIGHT"

###

#' Footnote File
#'
#' This file contains additional information about the food item, household weight, and nutrient value.
#' \itemize{
#'   \item Food Description file by NDB_No
#'   \item Nutrient Data file by NDB_No and when applicable, Nutr_No
#'   \item Nutrient Definition file by Nutr_No, when applicable
#' }
"FOOTNOTE"

###

#' Sources of Data Link File
#'
#' This file is used to link the Nutrient Data file with the Sources of Data table. It is needed to resolve the many-to-many relationship between the two tables.#' \itemize{
#'   \item Nutrient Data file by NDB No. and Nutr_No
#'   \item Nutrient Definition file by Nutr_No
#'   \item Sources of Data file by DataSrc_ID
#' }
"DATSRCLN"

###

#' Sources of Data File
#'
#' This file (Table 15) provides a citation to the DataSrc_ID in the Sources of Data Link file.
#'   \item Nutrient Data file by NDB No. through the Sources of Data Link file
#' }
"DATA_SRC"

###

#' Contains all the food
#'
#' Contains all the food items found in the relational database, but with fewer nutrients and other related information. Data refer to 100 g of the edible portion of the food item.
"ABBREV"
