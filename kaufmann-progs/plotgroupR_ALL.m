%program to plot the state-specific parameters of various estimated models

% cal_beg=[1980 ];
% cal_end=[1986:2003];
unit_spec_var=1;
perm=0;
pool=1;
shrink=1;
sg_change=1;
ifig=1;
% for cal_beg=[1980 1985 1990 1995];
span=28;  
File='logit';
DSTruc=1;
S_Logit=0;
Pclas=0;
for cal_beg=[date_deb];
    cal_end=cal_beg+span;
    cal_end_Est=2020.75
    for K=[3];
        for lag_dlo=[2]; ['lag=' int2str(lag_dlo)] %lag endogenous variable
            lag_dir=0; %lag exogenous variable

            if Pclas
                load('-mat',[File int2str(S_Logit) '_dyn' int2str(DSTruc) '_shr' int2str(shrink) '_var' int2str(unit_spec_var) '_perm' int2str(perm) '_sg' int2str(sg_change) '_K' int2str(K) 'end' int2str(lag_dlo) '_ex' int2str(lag_dir) '_grspecstd_' num2str(cal_end_Est,'%5.2f%') '_' int2str(cal_end) ]);
            elseif ~Pclas
                load('-mat',[File int2str(S_Logit) '_pclas' int2str(Pclas) '_dyn' int2str(DSTruc) '_shr' int2str(shrink) '_var' int2str(unit_spec_var) '_perm' int2str(perm) '_sg' int2str(sg_change) '_K' int2str(K) 'end' int2str(lag_dlo) '_ex' int2str(lag_dir) '_grspecstd_' num2str(cal_end_Est,'%5.2f') '_' int2str(cal_end)]);
            end
            eval=1;
            run_model4_endswit_logit;
            %             run_model_test_endswit
            plotgroupR_ranperm
            plotgroupalpha
            figure(gcf)
            title(['K' int2str(K) ', ' int2str(cal_beg) '-' int2str(cal_end)])
            clear functions
            
            % ctr=ctr+1;
        end
    end
end

