run 'start_model4_logit'

settings:
file='logit'; 
rest_diff=0; ieff_restr=0; post=0; 
not_switch=0; auto_switch=0; auto_grspec=1; 
pool=1; start_S=0; preclas=1; S_logit=1; DStruc=0; bas_cat=3; var_logit=[3];
eta_different=1; unit_spec_var=1; sg_change=1; 
dum_out=1; 
shrink=1;

true=0; span=18; maxlag=4; 
for cal_beg=[1988];
    cal_end=cal_beg+span;
    for cal_end_est=2006.75;
    for K=[3];
        for lag_dlo=[2]
        end
    end
    ....
end
