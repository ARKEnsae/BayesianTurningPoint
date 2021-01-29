library(AQLTools)
library(mFilter)
library(zoo)
# pib <- window(na.omit(AQLTools::lectureBDM("010565692")), start = 1990, end = c(2018,4))
# ind_ret <- window(na.omit(AQLTools::lectureBDM("001565531")), start = 1992)
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

AQLTools::hc_stocks(ts.union(simpl_cycle(conj)))

detect_tp <- function(x){
	x <- c(NA, as.numeric(x), NA)
	p1 <- rollapply(x,3,function(t){
		t[1]*t[2]
	})
	p2 <- rollapply(x,3,function(t){
		t[2]*t[3]
	})
	pic = which((p1<0.5)&(p2>0.5))
	creux = which((p1>0.5)&(p2<0.5))
	ret_pic <- ret_creux <- ts(0, start = 1992, end = c(2020,3),frequency = 4)
	pic = time(ret_pic)[pic]
	creux = time(ret_creux)[creux]
	ret_pic[time(ret_pic)%in%pic] <- 1
	ret_creux[time(ret_creux)%in%creux] <- 1
	list(pic = pic,
		 creux = creux,
		 ts_pic= ret_pic,
		 ts_creux = ret_creux)
}
probMS <- read.csv("programmes/probMS.csv",header = FALSE)
proba <- ts(as.numeric(probMS[1,]), start = 1992,frequency = 4)


ret_pic <- detect_tp(probMS[1,])$ts_pic
ret_creux <- detect_tp(probMS[1,])$ts_creux
AQLTools::hc_stocks(ts.union(simpl_cycle(conj), ret_pic, ret_creux,
								 proba),type = c("line","line","line","column"))


library(ggplot2)
data_rect <- function(x){
	datation <- simpl_cycle(x)
	dates <- time(datation)
	x <- as.numeric(datation)
	val_m1 <- which(x==-1)
	xmin <- dates[val_m1[1]]
	xmax <- c()
	for(i in 2:length(val_m1)){
		if(val_m1[i]-val_m1[i-1]>1){
			xmax <- c(xmax, dates[val_m1[i-1]])
			xmin <- c(xmin, dates[val_m1[i]])
		}
	}
	xmax <- c(xmax, dates[val_m1[i]])
	
	data.frame(xmin = xmin,
			   xmax = xmax,
			   ymin = -1, 
			   ymax = 1)
}
detect_tp(probMS[1,])[1:2]
detect_tp(probMS[2,])[1:2]
ret_bays <- detect_tp(probMS[1,])
ret_bays_av <- detect_tp(probMS[2,])

ret_pic <- detect_tp(probMS[1,])$ts_pic
ret_creux <- detect_tp(probMS[1,])$ts_creux

p0 <- ggplot() +
	geom_rect(aes(xmin = xmin, xmax = xmax,
				  ymin = ymin, ymax = ymax,
				  fill = "g1"),
			  data = data_rect(conj),
			  alpha = 0.5,
			  inherit.aes = FALSE)+
	geom_rect(aes(xmin = xmin, xmax = xmax,
				  ymin = ymin, ymax = ymax,
				  fill = "g2"), 
			  data = data.frame(xmin = 2018,
			  				  xmax = 2018,
			  				  ymin = -1, 
			  				  ymax = 1),alpha = 0.5,
			  inherit.aes = FALSE) +
	geom_rect(aes(xmin = xmin, xmax = xmax,
				  ymin = ymin, ymax = ymax,
				  fill = "g3"), 
			  data = data.frame(xmin = 2018,
			  				  xmax = 2022,
			  				  ymin = -1, 
			  				  ymax = 1),alpha = 0.5,
			  inherit.aes = FALSE)
p <- AQLTools::graph_ts(ind_ret, prec_plot = p0, size = 0.6) +
	geom_point(mapping = aes(x = x, y = y, shape = "p1"),
			   data = data.frame(x = ret_bays$pic,
			   				  y = 1))+
	geom_point(mapping = aes(x = x, y = y, shape = "p2"),
			   data = data.frame(x = ret_bays$creux,
			   				  y = -1)) +
	geom_point(mapping = aes(x = x, y = y, shape = "p3"),
			   data = data.frame(x = ret_bays_av$pic,
			   				  y = 0.9), fill = "blue")+
	geom_point(mapping = aes(x = x, y = y, shape = "p4"),
			   data = data.frame(x = ret_bays_av$creux,
			   				  y = -0.9), fill = "blue") +
	scale_shape_manual(values=c(6,2, 25,24),
					   labels=c("Pic (Groupe coïncident)", "Creux (Groupe coïncident)",
					   		 "Pic (Groupe avancé)", "Creux (Groupe avancé)")) +
	scale_color_manual(values=c("red"),
					  labels=c("Indicateur retournement"))+
	scale_fill_manual(values=c("gray20", "white", "gray80"),
					  labels=c("Phase de contraction",
					  		 "Phase d'expansion",
					  		 "Datation provisoire"))+ 
	theme(legend.position="right")
p2 <- AQLTools::graph_ts(ind_ret, prec_plot = p0, size = 0.6) +
	geom_point(mapping = aes(x = x, y = y, shape = shape),
			   data = rbind(data.frame(x = ret_bays$pic,
			   				  y = 0.9, shape = "p0"),
			   			 data.frame(x = ret_bays$creux,
			   			 		   y = -.9, shape = "p1")), size = 3)+
	scale_shape_manual(values=c(24,25),
					   labels=c("Pic (méthode bayésienne)", "Creux (méthode bayésienne)")) +
	scale_color_manual(values=c("red"),
					   labels=c("Indicateur retournement"))+
	scale_fill_manual(values=c("gray20", "white", "gray80"),
					  labels=c("Phase de contraction",
					  		 "Phase d'expansion",
					  		 "Datation provisoire"))+ 
	theme(legend.position="right")
p2
ggsave(filename = "Rédaction/img/indret.png",
	   plot = p2,
	   width = 12, height = 5)
?
p
paste(gsub(" Q", "T", as.character(as.yearqtr(ret_bays$pic))), collapse = ", ")
paste(gsub(" Q", "T", as.character(as.yearqtr(ret_bays$creux))), collapse = ", ")
