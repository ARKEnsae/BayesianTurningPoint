% runmcmc3mixture_ml
fid=fopen('bf_canova.out','a');

% latent class mixed effect modell - berechnen bayes factor aus vorhandenen simulationen
% (workspace aktiv)

[mllogbs, sdrel,loglikq,loglikmc,priorq,priormc,qq,qmc,mu,Qsim,Qsiminv,detQsiminv,qmall,qqall] = mlbsfullddmixpr5_sepsind(alphamc,sepsmc,etamc,Qmc,Qinvmc,Qinvdet,prQnu,prQS,postQnu,postQS,e0,etapostmc,prseps,postseps,prlambda,anmc,ancholmc,pralm,pralinf,y,Z,dd);

ergmiran=[mllogbs(1,1) sdrel(1) mllogbs(1,1)-5*sdrel(1) mllogbs(1,1)+5*sdrel(1)] %importance
ergriran=[mllogbs(1,2) sdrel(2) mllogbs(1,2)-5*sdrel(2) mllogbs(1,2)+5*sdrel(2)] %reciprocal imp.
ergbsran=[mllogbs(end,1) sdrel(3) mllogbs(end,1)-5*sdrel(3) mllogbs(end,1)+5*sdrel(3)]  %bridge

if and(~not_switch,~auto_switch)
    t=['model_K' int2str(K) 'end' int2str(lag_dlo) '_ex' int2str(lag_dir) '_canova_base          ' 'imp ' num2str(ergmiran,'%6.4f %6.4f %6.4f') ' r.imp ' num2str(ergriran,'%6.4f %6.4f %6.4f') ' bsmi ' num2str(ergbsran,'%6.4f %6.4f %6.4f') '\n'];
elseif and(~not_switch,auto_switch)
    t=['model_K' int2str(K) 'end' int2str(lag_dlo) '_ex' int2str(lag_dir) '_canova_autoswit      ' 'imp ' num2str(ergmiran,'%6.4f %6.4f %6.4f') ' r.imp ' num2str(ergriran,'%6.4f %6.4f %6.4f') ' bsmi ' num2str(ergbsran,'%6.4f %6.4f %6.4f') '\n'];
elseif and(not_switch,~auto_switch)
    t=['model_K' int2str(K) 'end' int2str(lag_dlo) '_ex' int2str(lag_dir) '_canova_nonswit       ' 'imp ' num2str(ergmiran,'%6.4f %6.4f %6.4f') ' r.imp ' num2str(ergriran,'%6.4f %6.4f %6.4f') ' bsmi ' num2str(ergbsran,'%6.4f %6.4f %6.4f') '\n'];
elseif and(not_switch,auto_switch)
    t=['model_K' int2str(K) 'end' int2str(lag_dlo) '_ex' int2str(lag_dir) '_canova_nonswitautogr ' 'imp ' num2str(ergmiran,'%6.4f %6.4f %6.4f') ' r.imp ' num2str(ergriran,'%6.4f %6.4f %6.4f') ' bsmi ' num2str(ergbsran,'%6.4f %6.4f %6.4f') '\n'];
    
end

fprintf(fid,t);
fclose(fid)

clear *post* loglik 
clear qnorm loglikq loglikmc priorq priormc qq qmc qmall qqall%ergmiran ergriran ergbsran
clear mllogbs sdrel
clear functions
