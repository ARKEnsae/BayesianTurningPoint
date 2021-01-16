nom_dir <- "kaufmann-progs"
m_files <- list.files(path = nom_dir,pattern = ".m$")
m_files_m1 <- m_files[-grep("alain",m_files)]

f_complet <- readLines(con = paste(nom_dir, "alain.m", sep = "/"))
f_complet <- c("fused = {};",
			   f_complet)
writeLines(f_complet,
		   con = paste("alain.m", f, sep = "/"))

for(f in m_files_m1){ # tout sauf fichier alain.m
	f_complet <- readLines(con = paste(nom_dir, f, sep = "/"))
	f_complet <- c(sprintf("fused = [fused;{'%s'}];",f),
				   f_complet)
	writeLines(f_complet,
			   con = paste(nom_dir, f, sep = "/"))
}

# Si on veut supprimer la nouvelle ligne depuis R
for(f in m_files){ # tous y compris fichier alain.m
	f_complet <- readLines(con = paste(nom_dir, f, sep = "/"))
	f_complet <- f_complet[-1]
	writeLines(f_complet,
			   con = paste(nom_dir, f, sep = "/"))
}

