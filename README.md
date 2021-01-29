# BayesianTurningPoint

Projet de statistique bayésienne de Romain LESAUVAGE et Alain QUARTIER-LA-TENTE sur l'article :

Kaufmann, S. (2010). Dating and forecasting turning points by Bayesian clustering with dynamic structure: a suggestion with an application to Austrian data, *Journal of Applied Econometrics*, 25, 309 – 344.

Le projet complet est disponible ici : https://github.com/ARKEnsae/BayesianTurningPoint

Le rapport : https://arkensae.github.io/BayesianTurningPoint/Rédaction/Rapport.pdf

Le fichier "programmes/1 - Launche_me.m" contient les 3 commandes à lancer pour lancer le programmes sous Matlab (après avoir changé le working directory au dossier programmes) :

- Pour lancer les estimations :

```matlab
run 'start_model4_logit'
run 'permut_MS_ALL'
```

Ces deux programmes peuvent mettre longtemps à tourner, pour n'avoir que les graphiques il faut télécharger le fichier suivant et le mettre dans le dossier programmes :
https://github.com/ARKEnsae/BayesianTurningPoint/raw/main/programmes/logit1_dyn0_shr1_var1_perm0_sg1_K3end2_ex0_grspecstd_2020.75_2020_iden

- Pour tracer les graphiques :

```matlab
run 'plot_ALL'
```

Ces programmes sont adaptés de ceux de Kaufmann (2010) afin qu'ils puissent être appliqués aux données françaises.

La datation de référence des cycles de croissance peut-être obtenue depuis R avec le code suivant :

```r
library(mFilter)
# PIB trimestriel en évolution :
pib <- structure(c(0.7, 0.4, 0.4, 0.3, 0, 0.3, 0.3, 0.4, 1, -0.1, 0, 
				   -0.2, -0.6, 0.1, 0.2, 0.2, 0.8, 1.1, 0.6, 0.9, 0.6, 0.4, 0.2, 
				   0.2, 0.6, 0.2, 0.6, 0.1, 0.3, 1.1, 0.7, 1.1, 0.8, 0.9, 0.7, 0.7, 
				   0.6, 0.9, 1.2, 1.4, 1, 1, 0.6, 0.8, 0.6, 0.1, 0.3, 0, 0.4, 0.5, 
				   0.4, 0, 0.2, -0.2, 0.7, 0.7, 0.9, 0.7, 0.3, 0.7, 0.3, 0.2, 0.5, 
				   0.7, 0.8, 1, 0, 0.8, 0.7, 0.8, 0.3, 0.2, 0.4, -0.5, -0.3, -1.4, 
				   -1.7, -0.1, 0.2, 0.7, 0.4, 0.5, 0.6, 0.7, 1, 0, 0.3, 0.2, 0.1, 
				   -0.2, 0.2, -0.1, 0, 0.7, 0, 0.5, 0.1, 0.1, 0.4, 0.1, 0.5, 0, 
				   0.4, 0.1, 0.7, -0.2, 0.2, 0.6, 0.8, 0.7, 0.7, 0.8, 0.1, 0.2, 
				   0.4, 0.6), .Tsp = c(1990, 2018.75, 4), class = "ts")
# Indicateur de retournement :
ind_ret <- structure(c(-0.88, -0.84, -1, -1, -0.98, -1, -1, -1, -1, -1, 
					   -1, -1, -1, -0.75, -0.76, -0.51, -0.98, -1, -0.99, -0.85, -0.67, 
					   -0.52, -0.25, 0.39, 0.96, 1, 1, 1, 0.97, 0.96, 0.99, 1, 1, 0.99, 
					   0.99, 0.96, 0.91, -0.72, -0.7, -0.46, -0.36, -0.28, -0.19, -1, 
					   -1, -1, -1, -1, -0.89, -0.71, -0.59, -0.39, -0.66, -0.9, -0.97, 
					   -0.65, -0.6, -0.45, -0.11, 0.48, 0.94, 0.96, 0.99, 0.91, 0.84, 
					   0.92, 0.87, 0.99, 1, 1, 0.99, 1, 1, 1, 1, 0.94, 0.9, 0.95, 0.96, 
					   0.94, 0.85, -0.66, -0.38, -0.42, -0.27, 0.35, 0.75, 0.84, 0.98, 
					   0.96, 1, 1, 1, 1, 0.96, 0.99, 0.93, 0.91, 0.99, 1, 0.96, 1, 0.97, 
					   0.91, 0.99, 1, 0.94, 0.86, 0.77, 0.76, 0.65, -0.86, -0.69, -0.48, 
					   -0.61, -0.92, -0.98, -0.97, -0.53, -0.67, 0.14, 0, 0.92, 0.84, 
					   0.79, 0.63, 0.19, 0.39, 0.35, 0.23, -0.01, 0.28, 0.19, 0.22, 
					   -0.98, -0.75, -0.44, -0.6, 0.15, 0.96, 1, 0.98, 1, 1, 0.99, 0.93, 
					   0.98, 0.95, 0.86, 0.83, 0.79, 0.72, 0.7, 0.91, 0.72, 0.84, 0.73, 
					   0.72, 0.72, 0.69, 0.63, 0.97, 0.89, 0.88, 0.81, 0.98, 0.91, 0.93, 
					   0.98, 0.89, 0.84, 0.96, 1, 0.89, 0.95, 0.99, 1, 0.99, 0.94, 0.86, 
					   0.89, 0.95, 0.91, 0.96, 0.96, 1, 0.99, 0.91, 0.91, 0.81, 0.89, 
					   0.77, 0.74, 0.7, 0.79, 0.6, 0.45, 0.19, -0.99, -0.84, -1, -1, 
					   -0.99, -1, -0.94, -1, -0.89, -0.75, -0.34, -0.13, 0.03, 0.65, 
					   0.97, 0.96, 0.92, 0.85, 0.82, 0.74, 0.75, 0.93, 0.96, 0.86, 0.96, 
					   1, 0.94, 0.99, 0.99, 1, 1, 0.99, 0.99, 0.92, 0.85, 0.9, 0.76, 
					   -0.93, -0.93, -0.77, -0.67, -0.55, -0.44, -0.85, 0.04, -0.31, 
					   -0.96, -0.97, -0.95, -0.79, -0.67, -0.99, -0.81, -0.68, -0.7, 
					   -0.83, -0.99, -1, -0.8, -0.69, -0.07, 0.85, 0.99, 0.9, 0.82, 
					   0.76, 0.97, 0.72, 0.98, -0.27, -0.46, -0.21, -0.72, -0.57, -0.8, 
					   -0.98, -0.78, -0.75, -0.95, -0.86, -0.32, 0.11, 0.23, 0.68, 0.96, 
					   0.97, 0.85, 0.82, 0.68, 0.67, 0.85, 0.62, 0.65, 0.61, 0.68, 0.52, 
					   0.79, 0.65, 0.91, 0.91, 0.91, 0.91, 0.81, 0.98, 0.88, 0.88, 0.81, 
					   0.95, 0.92, 0.98, 0.91, 0.97, 0.97, 1, 0.97, 0.89, 0.84, 0.82, 
					   0.79, 0.8, 0.72, 0.68, 0.68, 0.6, 0.86, 0.73, 0.93, 0.85, 0.98, 
					   0.84, 0.99, 0.9, 0.84, 0.84, 0.94, 0.84, 0.87, 0.92, 0.87, 0.84, 
					   0.21, -1, -0.69, -0.05, 0.93, 1, 0.93, 0.76, 0.47, 0.8, 0.71), .Dim = c(349L, 
					   																		1L), .Dimnames = list(NULL, "001565531"), .Tsp = c(1992, 2021, 
					   																														   12), class = "ts")
simpl_cycle <- function(x, min_phase=4){
# Pour ne garder que les cycles de 4 trimestres
	prec_valeur = x[1]
	for (i in 2:(length(x)-min_phase)){
		if(x[i]!=prec_valeur){
			if(length(unique(x[i+1:min_phase-1]))==1){
				prec_valeur = x[i]
			}else{
				x[i] = prec_valeur
			}
		}
	}
	last_val <- x[(length(x)-min_phase+1):length(x)]
	if(length(unique(last_val))>1){
		d <- as.data.frame(table(last_val))
		x[(length(x)-min_phase+1):length(x)] <- as.numeric(levels(d$last_val)[d$last_val[which.max(d$Freq)]])
	}
	x
}
cff <- cffilter(pib,pl = 1.5*4, pu = 10*4)

conj <- 2*((cff$cycle)>=0) - 1
simpl_cycle(conj)

plot(simpl_cycle(conj),xlim = c(1992,2020))
lines(ind_ret, col = "red")
```
