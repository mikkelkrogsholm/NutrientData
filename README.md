
<!-- README.md is generated from README.Rmd. Please edit that file -->
This package contains data sets with the composition of Foods: Raw, Processed, Prepared. The source of the data is the [USDA National Nutrient Database for Standard Reference](http://www.ars.usda.gov/ba/bhnrc/ndl), Release 28 (2015).

There are 12 data sets at the moment. 11 of them work as a relational database where the different data sets link to eachother. You can see how they link to eachother here:

![](inst/extdata/relationships.png)

The 12th data set is an abbreviated version of all the data called ABBREV. This is the easiest data set to begin with. And the one I will use in my example.

Basic nutrient information
--------------------------

``` r
# load NutrientData, dplyr and tidyr
library(NutrientData)
library(dplyr)
library(tidyr)
```

Lets first have a look at the the top 20 calorie dense foods

``` r
data("ABBREV") # Load the data

ABBREV %>% # Select the data
  arrange(-Energ_Kcal) %>% # Sort by calories per 100 g
  select(Food = Shrt_Desc, Calories = Energ_Kcal) %>% # Select relevant columns
  slice(1:20) %>% # Choose the top 20
  pander() # Make the table pretty-ish
```

<table style="width:57%;">
<colgroup>
<col width="43%" />
<col width="13%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Food</th>
<th align="center">Calories</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">FAT,BEEF TALLOW</td>
<td align="center">902</td>
</tr>
<tr class="even">
<td align="center">LARD</td>
<td align="center">902</td>
</tr>
<tr class="odd">
<td align="center">FAT,MUTTON TALLOW</td>
<td align="center">902</td>
</tr>
<tr class="even">
<td align="center">FISH OIL,COD LIVER</td>
<td align="center">902</td>
</tr>
<tr class="odd">
<td align="center">FISH OIL,HERRING</td>
<td align="center">902</td>
</tr>
<tr class="even">
<td align="center">FISH OIL,MENHADEN</td>
<td align="center">902</td>
</tr>
<tr class="odd">
<td align="center">FISH OIL,MENHADEN,FULLY HYDR</td>
<td align="center">902</td>
</tr>
<tr class="even">
<td align="center">FISH OIL,SALMON</td>
<td align="center">902</td>
</tr>
<tr class="odd">
<td align="center">FISH OIL,SARDINE</td>
<td align="center">902</td>
</tr>
<tr class="even">
<td align="center">OIL,CORN,INDUSTRIAL &amp; RTL,ALLPURP SALAD OR COOKING</td>
<td align="center">900</td>
</tr>
<tr class="odd">
<td align="center">FAT,CHICKEN</td>
<td align="center">900</td>
</tr>
<tr class="even">
<td align="center">SHORTENING,HOUSEHOLD,LARD&amp;VEG OIL</td>
<td align="center">900</td>
</tr>
<tr class="odd">
<td align="center">SHORTENING INDUSTRIAL,LARD&amp;VEG OIL</td>
<td align="center">900</td>
</tr>
<tr class="even">
<td align="center">SHORTENING FRYING (HVY DUTY),BF TALLOW&amp;CTTNSD</td>
<td align="center">900</td>
</tr>
<tr class="odd">
<td align="center">FAT,TURKEY</td>
<td align="center">900</td>
</tr>
<tr class="even">
<td align="center">FAT,GOOSE</td>
<td align="center">900</td>
</tr>
<tr class="odd">
<td align="center">OIL,INDUSTRIAL,CANOLA,HI OLEIC</td>
<td align="center">900</td>
</tr>
<tr class="even">
<td align="center">OIL,INDUSTRIAL,SOY,LO LINOLENIC</td>
<td align="center">900</td>
</tr>
<tr class="odd">
<td align="center">OIL,BELUGA,WHALE (ALASKA NATIVE)</td>
<td align="center">900</td>
</tr>
<tr class="even">
<td align="center">OIL,WALRUS (ALASKA NATIVE)</td>
<td align="center">900</td>
</tr>
</tbody>
</table>

It's probably no big surprise that oil (pure fat) is the most calorie dense.

But what food contains the highest amount of protein? Lets have a look:

``` r
ABBREV %>% # Select the data
  arrange(-`Protein_(g)`) %>% # Sort by protein per 100 g
  select(Food = Shrt_Desc, Protein = `Protein_(g)`) %>% # Select relevant columns
  slice(1:20) %>% # Choose the top 20
  pander() # Make the table pretty-ish
```

<table style="width:71%;">
<colgroup>
<col width="58%" />
<col width="12%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Food</th>
<th align="center">Protein</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">SOY PROTEIN ISOLATE</td>
<td align="center">88.32</td>
</tr>
<tr class="even">
<td align="center">SOY PROT ISOLATE,K TYPE</td>
<td align="center">88.32</td>
</tr>
<tr class="odd">
<td align="center">GELATINS,DRY PDR,UNSWTND</td>
<td align="center">85.60</td>
</tr>
<tr class="even">
<td align="center">EGG,WHITE,DRIED,STABILIZED,GLUCOSE RED</td>
<td align="center">84.08</td>
</tr>
<tr class="odd">
<td align="center">SEAL,BEARDED (OOGRUK),MEAT,DRIED (ALASKA NATIVE)</td>
<td align="center">82.60</td>
</tr>
<tr class="even">
<td align="center">EGG,WHITE,DRIED,PDR,STABILIZED,GLUCOSE RED</td>
<td align="center">82.40</td>
</tr>
<tr class="odd">
<td align="center">EGG,WHITE,DRIED</td>
<td align="center">81.10</td>
</tr>
<tr class="even">
<td align="center">BEVERAGES,PROT PDR WHEY BSD</td>
<td align="center">78.13</td>
</tr>
<tr class="odd">
<td align="center">STEELHEAD TROUT,DRIED,FLESH (SHOSHONE BANNOCK)</td>
<td align="center">77.27</td>
</tr>
<tr class="even">
<td align="center">EGG,WHITE,DRIED,FLAKES,STABILIZED,GLUCOSE RED</td>
<td align="center">76.92</td>
</tr>
<tr class="odd">
<td align="center">VITAL WHEAT GLUTEN</td>
<td align="center">75.16</td>
</tr>
<tr class="even">
<td align="center">WHALE,BELUGA,MEAT,DRIED (ALASKA NATIVE)</td>
<td align="center">69.86</td>
</tr>
<tr class="odd">
<td align="center">BEVERAGES,ABBOTT,EAS WHEY PROT PDR</td>
<td align="center">66.67</td>
</tr>
<tr class="even">
<td align="center">SOY PROT CONC,PRODUCED BY ALCOHOL EXTRACTION</td>
<td align="center">63.63</td>
</tr>
<tr class="odd">
<td align="center">SOY PROT CONC,PRODUCED BY ACID WASH</td>
<td align="center">63.63</td>
</tr>
<tr class="even">
<td align="center">COD,ATLANTIC,DRIED&amp;SALTED</td>
<td align="center">62.82</td>
</tr>
<tr class="odd">
<td align="center">FISH,WHITEFISH,DRIED (ALASKA NATIVE)</td>
<td align="center">62.44</td>
</tr>
<tr class="even">
<td align="center">SEAL,BEARDED (OOGRUK),MEAT,PART DRIED (ALASKA NATIVE)</td>
<td align="center">62.38</td>
</tr>
<tr class="odd">
<td align="center">FISH,SALMON,CHUM,DRIED (ALASKA NATIVE)</td>
<td align="center">62.09</td>
</tr>
<tr class="even">
<td align="center">PORK SKINS,PLAIN</td>
<td align="center">61.30</td>
</tr>
</tbody>
</table>

Here we see that soy, eggwhites and pork skins are good sources of protein. Dig in!

Lets have a look at those pork skins and see what nutrients they contain:

``` r
ABBREV %>% # Select the data
  filter(Shrt_Desc == "PORK SKINS,PLAIN") %>% # Select the pork skins
  select(-1:-2) %>% # Remove name and number
  gather(Nutrients, Per_100_g) %>% # Turn into long format
  pander() # Make the table pretty-ish
```

<table style="width:40%;">
<colgroup>
<col width="25%" />
<col width="15%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Nutrients</th>
<th align="center">Per_100_g</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">Water_(g)</td>
<td align="center">1.8</td>
</tr>
<tr class="even">
<td align="center">Energ_Kcal</td>
<td align="center">544</td>
</tr>
<tr class="odd">
<td align="center">Protein_(g)</td>
<td align="center">61.3</td>
</tr>
<tr class="even">
<td align="center">Lipid_Tot_(g)</td>
<td align="center">31.3</td>
</tr>
<tr class="odd">
<td align="center">Ash_(g)</td>
<td align="center">5.4</td>
</tr>
<tr class="even">
<td align="center">Carbohydrt_(g)</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Fiber_TD_(g)</td>
<td align="center">0</td>
</tr>
<tr class="even">
<td align="center">Sugar_Tot_(g)</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Calcium_(mg)</td>
<td align="center">30</td>
</tr>
<tr class="even">
<td align="center">Iron_(mg)</td>
<td align="center">0.88</td>
</tr>
<tr class="odd">
<td align="center">Magnesium_(mg)</td>
<td align="center">11</td>
</tr>
<tr class="even">
<td align="center">Phosphorus_(mg)</td>
<td align="center">85</td>
</tr>
<tr class="odd">
<td align="center">Potassium_(mg)</td>
<td align="center">127</td>
</tr>
<tr class="even">
<td align="center">Sodium_(mg)</td>
<td align="center">1818</td>
</tr>
<tr class="odd">
<td align="center">Zinc_(mg)</td>
<td align="center">0.56</td>
</tr>
<tr class="even">
<td align="center">Copper_mg)</td>
<td align="center">0.094</td>
</tr>
<tr class="odd">
<td align="center">Manganese_(mg)</td>
<td align="center">0.069</td>
</tr>
<tr class="even">
<td align="center">Selenium_(µg)</td>
<td align="center">41</td>
</tr>
<tr class="odd">
<td align="center">Vit_C_(mg)</td>
<td align="center">0.5</td>
</tr>
<tr class="even">
<td align="center">Thiamin_(mg)</td>
<td align="center">0.099</td>
</tr>
<tr class="odd">
<td align="center">Riboflavin_(mg)</td>
<td align="center">0.283</td>
</tr>
<tr class="even">
<td align="center">Niacin_(mg)</td>
<td align="center">1.549</td>
</tr>
<tr class="odd">
<td align="center">Panto_Acid_mg)</td>
<td align="center">0.43</td>
</tr>
<tr class="even">
<td align="center">Vit_B6_(mg)</td>
<td align="center">0.023</td>
</tr>
<tr class="odd">
<td align="center">Folate_Tot_(µg)</td>
<td align="center">0</td>
</tr>
<tr class="even">
<td align="center">Folic_Acid_(µg)</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Food_Folate_(µg)</td>
<td align="center">0</td>
</tr>
<tr class="even">
<td align="center">Folate_DFE_(µg)</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Choline_Tot_ (mg)</td>
<td align="center">164.5</td>
</tr>
<tr class="even">
<td align="center">Vit_B12_(µg)</td>
<td align="center">0.64</td>
</tr>
<tr class="odd">
<td align="center">Vit_A_IU</td>
<td align="center">40</td>
</tr>
<tr class="even">
<td align="center">Vit_A_RAE</td>
<td align="center">12</td>
</tr>
<tr class="odd">
<td align="center">Retinol_(µg)</td>
<td align="center">12</td>
</tr>
<tr class="even">
<td align="center">Alpha_Carot_(µg)</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Beta_Carot_(µg)</td>
<td align="center">0</td>
</tr>
<tr class="even">
<td align="center">Beta_Crypt_(µg)</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Lycopene_(µg)</td>
<td align="center">0</td>
</tr>
<tr class="even">
<td align="center">Lut+Zea_ (µg)</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Vit_E_(mg)</td>
<td align="center">0.53</td>
</tr>
<tr class="even">
<td align="center">Vit_D_µg</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Vit_D_IU</td>
<td align="center">0</td>
</tr>
<tr class="even">
<td align="center">Vit_K_(µg)</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">FA_Sat_(g)</td>
<td align="center">11.37</td>
</tr>
<tr class="even">
<td align="center">FA_Mono_(g)</td>
<td align="center">14.78</td>
</tr>
<tr class="odd">
<td align="center">FA_Poly_(g)</td>
<td align="center">3.64</td>
</tr>
<tr class="even">
<td align="center">Cholestrl_(mg)</td>
<td align="center">95</td>
</tr>
<tr class="odd">
<td align="center">GmWt_1</td>
<td align="center">28.35</td>
</tr>
<tr class="even">
<td align="center">GmWt_Desc1</td>
<td align="center">1 oz</td>
</tr>
<tr class="odd">
<td align="center">GmWt_2</td>
<td align="center">14.2</td>
</tr>
<tr class="even">
<td align="center">GmWt_Desc2</td>
<td align="center">.5 oz</td>
</tr>
<tr class="odd">
<td align="center">Refuse_Pct</td>
<td align="center">0</td>
</tr>
</tbody>
</table>

Lookup and calculations
-----------------------

I have included a few functions to help do basic search and some nutrient calculations. The first one is `search_ingredient()`, which searches the `ABBREV` data based on one or more search strings.

Lets search for onion:

``` r
search_ingredient("onion")
#>  [1] "ONION POWDER"                                                
#>  [2] "SOUP,ONION,CND,COND"                                         
#>  [3] "SOUP,CRM OF ONION,CND,COND"                                  
#>  [4] "SOUP,ONION,DRY,MIX"                                          
#>  [5] "GRAVY,ONION,DRY,MIX"                                         
#>  [6] "PREGO PASTA,DICED ONION & GARLIC ITAL SAU,RTS"               
#>  [7] "SOUP,CRM OF ONION,CND,PREP W/ EQ VOLUME MILK"                
#>  [8] "CAMPBELL'S RED & WHITE,CRM OF ONION SOUP,COND"               
#>  [9] "CAMPBELL'S RED & WHITE,FRENCH ONION SOUP,COND"               
#> [10] "CAMPBELL'S CHUNKY SOUPS,SALISBURY STEAK MUSHRMS ONIONS SOUP" 
#> [11] "SOUP,CRM OF ONION,CND,PREP W/ EQ VOLUME H2O"                 
#> [12] "SOUP,ONION,DRY,MIX,PREP W/ H2O"                              
#> [13] "GRAVY,CAMPBELL'S,BROWN W/ ONIONS"                            
#> [14] "ONIONS,RAW"                                                  
#> [15] "ONIONS,CKD,BLD,DRND,WO/SALT"                                 
#> [16] "ONIONS,DEHYDRATED FLAKES"                                    
#> [17] "ONIONS,CND,SOL&LIQUIDS"                                      
#> [18] "ONIONS,YEL,SAUTEED"                                          
#> [19] "ONIONS,FRZ,CHOPD,UNPREP"                                     
#> [20] "ONIONS,FRZ,CHOPD,CKD,BLD,DRND,WO/SALT"                       
#> [21] "ONIONS,FRZ,WHL,UNPREP"                                       
#> [22] "ONIONS,FRZ,WHL,CKD,BLD,DRND,WO/SALT"                         
#> [23] "ONIONS,SPRING OR SCALLIONS (INCL TOPS&BULB),RAW"             
#> [24] "ONIONS,YOUNG GRN,TOPS ONLY"                                  
#> [25] "ONIONS,WELSH,RAW"                                            
#> [26] "ONIONS,SWT,RAW"                                              
#> [27] "ONION RINGS,BREADED,PAR FR,FRZ,UNPREP"                       
#> [28] "ONION RINGS,BREADED,PAR FR,FRZ,PREP,HTD IN OVEN"             
#> [29] "PEAS&ONIONS,CND,SOL&LIQUIDS"                                 
#> [30] "PEAS&ONIONS,FRZ,UNPREP"                                      
#> [31] "PEAS&ONIONS,FRZ,CKD,BLD,DRND,WO/SALT"                        
#> [32] "TOMATO PRODUCTS,CND,SAU,W/ONIONS"                            
#> [33] "TOMATO PRODUCTS,CND,SAU,W/ONIONS,GRN PEPPERS,&CELERY"        
#> [34] "ONIONS,CKD,BLD,DRND,W/SALT"                                  
#> [35] "ONIONS,FRZ,CHOPD,CKD,BLD,DRND,W/SALT"                        
#> [36] "ONIONS,FRZ,WHL,CKD,BLD,DRND,W/SALT"                          
#> [37] "PEAS&ONIONS,FRZ,CKD,BLD,DRND,W/SALT"                         
#> [38] "PICKLES,CHOWCHOW,W/CAULIFLOWER ONION MUSTARD,SWT"            
#> [39] "BAGEL,PLN,TSTD, ENR W/CA PROP(INCLUDE ONION,POPPY,SESAME)"   
#> [40] "BAGELS,PLN,ENR,W/ CA PROP (INCLUDES ONION,POPPY,SESAME),TSTD"
#> [41] "CRACKERS,MATZO,EGG&ONION"                                    
#> [42] "BAGELS,PLN,ENR,WO/CA PROP (INCL ONION,POPPY,SESAME)"         
#> [43] "BAGELS,PLN,UNENR,W/CA PROP (INCL ONION,POPPY,SESAME)"        
#> [44] "BAGELS,PLN,UNENR,WO/CA PROP (INCL ONION,POPPY,SESAME)"       
#> [45] "GEORGE WESTON BAKER,BROWNBERRY SAGE & ONION STUFFING MIX,DRY"
#> [46] "SNACKS,CORN-BASED,EXTRUDED,ONION-FLAVOR"                     
#> [47] "POTATO CHIPS,SOUR-CREAM-AND-ONION-FLAVOR"                    
#> [48] "POTATO CHIPS,MADE FR DRIED POTATOES,SOUR-CREAM&ONION-FLAVOR" 
#> [49] "FAST FOODS,ONION RINGS,BREADED&FRIED"                        
#> [50] "SUBWAY,SWT ONION CHICK SUB WHT BRD LTTC,TMT & SWT ONION SAU" 
#> [51] "FAST FOODS,SUB,SWT ONION CHICK WIT BRD W/ LTTC,TMT SWT ONION"
#> [52] "BURGER KING,ONION RINGS"                                     
#> [53] "SNACKS,FRITOLAY,SUNCHIPS,MULTIGRAIN,FRENCH ONION FLAVOR"     
#> [54] "KEEBLER,TOASTEDS,ONION CRACKERS"                             
#> [55] "KELLOGG'S,SPL K,CRACKER CHIPS,SOUR CRM & ONION"              
#> [56] "APPLEBEE'S,CRUNCHY ONION RINGS"                              
#> [57] "CRACKER BARREL,ONION RINGS,THICK-CUT"                        
#> [58] "DENNY'S,ONION RINGS"                                         
#> [59] "RESTAURANT,FAMILY STYLE,ONION RINGS"
```

As you can see, it returns all foods where it detects the word "onion". It's a bit too many. If you feed the function more words seperated by commas, it only returns the ones where all words match. Lets look for raw onions:

``` r
search_ingredient("onion,raw")
#> [1] "ONIONS,RAW"                                     
#> [2] "ONIONS,SPRING OR SCALLIONS (INCL TOPS&BULB),RAW"
#> [3] "ONIONS,WELSH,RAW"                               
#> [4] "ONIONS,SWT,RAW"
```

Much better. Only four results. We can know take the exact string of raw onions and feed it to the nutrient calculator, along with some cabbage and som mayonnaise.

In addition to telling it what foods we want to include in our calculations we also need to tell it how many grams we have of each.

``` r
ingredients <- c("CABBAGE,RAW", "MAYONNAISE,RED FAT,W/ OLIVE OIL", "ONIONS,RAW")
grams <- c(100, 20, 10)

calculate_nutrients(ingredients, grams) %>% 
  select(Food = 1, Calories = 3, Protein = 4,
         Fat = 5, Carbs = 7) %>% # Select only a few variables for looks and rename
  pander() # Make the table pretty-ish
```

<table style="width:86%;">
<colgroup>
<col width="38%" />
<col width="15%" />
<col width="13%" />
<col width="8%" />
<col width="9%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Food</th>
<th align="center">Calories</th>
<th align="center">Protein</th>
<th align="center">Fat</th>
<th align="center">Carbs</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">CABBAGE,RAW</td>
<td align="center">25</td>
<td align="center">1.28</td>
<td align="center">0.1</td>
<td align="center">5.8</td>
</tr>
<tr class="even">
<td align="center">MAYONNAISE,RED FAT,W/ OLIVE OIL</td>
<td align="center">72.2</td>
<td align="center">0.074</td>
<td align="center">8</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">ONIONS,RAW</td>
<td align="center">4</td>
<td align="center">0.11</td>
<td align="center">0.01</td>
<td align="center">0.934</td>
</tr>
<tr class="even">
<td align="center">TOTAL</td>
<td align="center">101.2</td>
<td align="center">1.464</td>
<td align="center">8.11</td>
<td align="center">6.734</td>
</tr>
</tbody>
</table>

So our little cabbage salad has a total of 101 calories coming mostly from the mayonnaise.
