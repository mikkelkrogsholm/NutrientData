#' Modifications to the WEIGHT file
#' 
#' WEIGHT does not at least 1 record for every NDB_No in FOOD_DES...
#' ... every NDB_No in FOOD_DES does have a record in NUT_DATA...
#' ... every NDB_No in NUT_DATA represents 100g of that NDB_No...
#' ... the code below adds 1 row to WEIGHT for every possible NDB_No...
#' ... (Amount = 1, Msre_Desc = 'g', Gm_Wgt = 1)
#' ... now every NDB_No has at least 1 record in WEIGHT.
WEIGHT <- lapply(unique(c(WEIGHT$NDB_No, FOOD_DES$NDB_No)), function(ndb_no) {
  wgt <- filter(WEIGHT, NDB_No == ndb_no)
  # if no record exists, seq = 1; if records do exist, seq = max(Seq) + 1
  seq <- ifelse(nrow(wgt) > 0, as.character(max(as.numeric(wgt$Seq)) + 1), '1')
  gram_weight <- data_frame(NDB_No = ndb_no, Seq = seq, Amount = 1, Msre_Desc = 'g', Gm_Wgt = 1, Num_Data_Pts = NA, Std_Dev = NA)
  bind_rows(wgt, gram_weight)
}) %>%
  bind_rows %>%
  arrange(NDB_No, Seq)
