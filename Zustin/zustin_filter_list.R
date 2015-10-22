library("haven")
library("foreign")
library("dplyr")

#haven - read_sav je isto što i read_spss
args(read_sav)
zustin <- read_sav("UZA_HR_V1-zustin.sav")

#foreign
zustin_foreign <- read.spss("/home/ivan/R/UZA_HR_V1-zustin.sav", use.value.labels = TRUE, to.data.frame = TRUE)

#haven ne čita value labele #foreign ih čita ali radi rusvaj s variable labelama

#sva imena varijabli u file
cat(names(zustin),file="outputCat")

#summary za jednu varijablu pomoću dplyr-a
summary(select(zustin, p5x3_0))

#dplyr - selektovanje varijabli prema popisu
zustin_vars <- select(zustin_foreign, c(p2,P5X1_4,P5X1_4,p5x2_0,p5x2_2,p5x2_4,p6x2_0,p6x2_1a,p6x2_3,p9x1_1,p9x1_2,p9x1_3,p8x1,p8x2,p13x1_1,p13x1_2,p13x1x1,p14x1_1,p14x1_2,,p14x1x1,p16,p17_1,p17_2,p23_1,p28,p29,p29x1,p45,p58x1_3a,p58x2_3a))

#jednostavni match - vraća logički vektor - koje varijable je žustin poslao, a nema ih u fajlu
c("p5x2_0","p5x2_2","p5x2_4","p6x2_1b","p6x2_1","p6x2_4","p6x2_5","p9x1","p13x1","p14x1","p16","p17","p17x1","p21x1","p28","p33","p58x1_3b","p58x2_3a") %in% colnames(zustin)

#selekcija varijabli
zustin_vars <- select(zustin_foreign,c(ID_No,p2,p5x1_4,p5x1_4,p5x2_0,p5x2_2,p5x2_4,p6x2_0,p6x2_1a,p6x2_3,p6x3_0,p6x3_1a,p6x3_3,p6x4_0,p6x4_1a,p6x4_3,p6x5_0,p6x5_1a,p6x5_3,p6x6_0,p6x6_1a,p6x6_3,p9x1_1,p9x1_2,p9x1_3,p8x1,p8x2,p13x1_1,p13x1_2,p13x1x1,p14x1_1,p14x1_2,p14x1x1,p16,p17_1,p17_2,p23_1,p28,p29,p29x1,p45,p58x1_3a,p58x2_3a))

#selekcija ispitanika
zustin_vars_filter <- filter(zustin_vars, ID_No == 32 | ID_No == 4 | ID_No == 18 | ID_No == 879)

# napravi subsetiranjem! ### zustin_vars_filter <- filter(zustin_vars$ID_No[32,4,18,879])

#zapisivanje u csv
write.csv2(zustin_vars_filter,file="probniCSV_v2",row.names = FALSE)

#ista stvar samo učitano s havenom - jer su tako korektne var labs ALI ih ne mogu izvući iz R-a
#zustin_vars_varLabs <- select(zustin,c(ID_No,p2,p5x1_4,p5x1_4,p5x2_0,p5x2_2,p5x2_4,p6x2_0,p6x2_1a,p6x2_3,p9x1_1,p9x1_2,p9x1_3,p8x1,p8x2,p13x1_1,p13x1_2,p13x1x1,p14x1_1,p14x1_2,p14x1x1,p16,p17_1,p17_2,p23_1,p28,p29,p29x1,p45,p58x1_3a,p58x2_3a))
#selekcija ispitanika
#zustin_vars_varLabs_filter <- filter(zustin_vars_varLabs, ID_No == 32 | ID_No == 4 | ID_No == 18 | ID_No == 879)

#zapisivanje u csv
write.csv2(zustin_vars_filter,file="probniCSV",row.names = FALSE)
write.csv2(zustin_vars_varLabs_filter,file="probniCSV_varlabs",row.names = FALSE)

head(zustin_vars_varLabs_filter)

?read_sav
