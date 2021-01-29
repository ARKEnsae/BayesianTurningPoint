% Estimation du modèle
run 'start_model4_logit'

%  Identification et calcul des a posteriori
run 'permut_MS_ALL'

% Les deux précédentes commandes pouvant mettre longtemps à tourner,
% il suffit de télécharger le fichier suivant
%https://github.com/ARKEnsae/BayesianTurningPoint/raw/main/programmes/logit1_dyn0_shr1_var1_perm0_sg1_K3end2_ex0_grspecstd_2020.75_2020_iden
% et de le mettre dans le sous-dossier "programmes" avant de lancer
% la prochaine commande pour tracer les graphiques :
run 'plot_ALL'