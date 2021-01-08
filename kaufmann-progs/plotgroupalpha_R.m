i1=-1;i2=0;iplot=0;

ifig=ifig+1;
figure(ifig);

if fix(dd/2)>=1;
    for i=1:fix(dd/2)
        i1=i1+2;i2=i2+2;ih=4;iplot=iplot+1;
        subplot(fix((fix(dd/2)+ih-1)/ih),ih,iplot);
        for k=1:K
            scatter(alphamc(indexmc,dd*(k-1)+i1)-alphamc(indexmc,d+i1),alphamc(indexmc,dd*(k-1)+i2)-alphamc(indexmc,d+i2),1.,str(k));
            
            xlabel(['\beta_{' num2str(i1) '}']);
            ylabel(['\beta_{' num2str(i2) '}']);
            hold on;
        end
        if i==1 title('Scatterplot of MCMC (I_t=0)'); end
    end
elseif fix(dd/2)==0;
    for k=1:K
        scatter(alphamc(indexmc,dd*(k-1)+1)-alphamc(indexmc,indexMS((k-1)*dMS+1),etaMSmc(1,1,k,indexmc),1.,str(k));
        hold on;
        if k==1 title(['MCMC group-specific parameter ' ]);
            xlabel(['\beta^G_{\cdot}-\beta^R_{\cdot}']);
            ylabel(['\etaMS_{11,\cdot}']);
            
        end
    end
end
