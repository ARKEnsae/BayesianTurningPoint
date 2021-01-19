library(AQLTools)
library(mFilter)
pib <- window(na.omit(AQLTools::lectureBDM("010565692")), start = 1990, end = c(2018,4))
pib_vol <-window(na.omit(AQLTools::lectureBDM("010565708")), start = 1990, end = c(2018,4))
ind_ret <- window(na.omit(AQLTools::lectureBDM("001565531")), start = 1992)
simpl_cycle <- function(x, min_phase=4){
	for (i in 2:(length(x)-min_phase)){
		if(x[i]!=prec_valeur){
			if(length(unique(x[i+1:min_phase-1]))==1){
				prec_valeur = x[i]
			}else{
				x[i] = prec_valeur
			}
		}
	}
	x
}
hp <- hpfilter(pib,freq = 1600,drift = TRUE)
cff <- cffilter(pib,pl = 1.5*4, pu = 10*4)
cff2 <- cffilter(pib_vol,pl = 1.5*4, pu = 10*4)

conj <- 2*((hp$cycle)>=0) - 1
conj2 <- 2*((cff$cycle)>=0) - 1
conj3 <- 2*((cff2$cycle)>=0) - 1
simpl_cycle(conj2)
plot(simpl_cycle(conj2),xlim = c(1992,2020))
lines(ind_ret, col = "red")
AQLTools::hc_stocks(ts.union(simpl_cycle(conj2)))
