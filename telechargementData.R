library(AQLTools)
library(zoo)
ind <- c(`manuf-oscd`= "001585942",
		 `manuf-oscde`= "001585980",
		 `manuf-ossk` = "001586017",
		 `manuf-tppa` = "001586064",
		 `manuf-tppre` = "001586103",
		 `manuf-pgp` = "001586052",
		 `ser-capa` = "001582081",
		 `ser-capre` = "001582085",
		 `ser-dem` = "001585791",
		 `bat-jcc`="001586918",
		 `bat-epa` = "001586921",
		 `bat-tuc` = "001586923",
		 `bat-apre`= "001586916",
		 `bat-apa` = "001586917",
		 #`ind-ret-fr` = "001565531",
		 `CLIMAT-FR` = "001565530",
		 `CLIMAT-FR-EMPL` = "001796629",
		 `HIPC-FO` = "001759963",
		 `HICP-IG` = "001759966",
		 `HICP-E` = "001759967",
		 `HICP` = "001759968",
		 `IPI-CZ` = "010537946")
data <- AQLTools::lectureBDM(ind)
colnames(data) <- names(ind)
moy_trim <- aggregate(as.zoo(data), yearqtr, mean, na.rm  = TRUE)
moy_trim <- as.ts(moy_trim)
ind_diff = c("manuf-oscd", "manuf-oscde", "manuf-ossk", "manuf-tppa", "manuf-tppre", 
			 "manuf-pgp", "ser-capa", "ser-capre", "ser-dem", 
			 "bat-jcc", "bat-epa", "bat-tuc", "bat-apre", "bat-apa", 
			 "CLIMAT-FR", "CLIMAT-FR-EMPL")
ind_evol = c("HIPC-FO", "HICP-IG", "HICP-E", 
			 "HICP", "IPI-CZ")
data_diff <- ts.union(diff(moy_trim[,ind_diff],1), ev(moy_trim[,ind_evol]))
colnames(data_diff) <- c(ind_diff, ind_evol)
data_diff <- window(na.omit(data_diff),start = 1992)
data_diff[,"manuf-ossk"] <- -data_diff[,"manuf-ossk"]

AQLTools::ctrl_c(scale(data_diff), col.names = FALSE)
data_diff_df <- as.data.frame(data_diff)

# Normalisation PIB :
# Selectionner toutes les colonnes, nom compris jusqu'à derniere date 
d <- ctrl_v()[-1,] # 1ere ligne est l'indice de gorupe
AQLTools::ctrl_c(scale(d), col.names = FALSE)
