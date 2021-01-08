K = size(etamc,2);
M = size(etamc,1);
%D = size(Qmc,2);dd = -.5 + (.25 + 2*D)^.5;
dMS=size(ZMS,2);
dd=size(Q0,1)-dMS;
str=['r';'k';'b';'y';'g';'c'];
%str=['g';'b';'r';'y';'k';'c'];
%strMS=['r';'b';];
strMS=str;


index1 = [1:dd];
index = reshape(index1(ones(1,K),:)',1,K*dd);
states = [1:K]';
index2 = reshape(states(:,ones(1,dd))',1,K*dd);
indexMIX=[1:dd*K];
indexFIX=[K*dd+1:d+(K-1)*dd];
indexMS=[(d+(K-1)*dd+1):(d+(K-1)*dd+dMS*K)];

if M< 500
    indexmc=[1:M];
else
    ispace=fix(M/500);indexmc=[1:ispace:M];
end   

figure(double(gcf)+1);

i1=-1;i2=0;iplot=0;
var=[];
if fix(dMS/2)>=1;
    for i=1:fix(dMS/2)
        i1=i1+2;i2=i2+2;ih=4;iplot=iplot+1;
        subplot(fix((fix(dMS/2)+ih-1)/ih),ih,iplot);
        %scatter(alphamc(:,dd*K+i1),etamc(:,i),1.,str(i));
        hold on;
        scatter(alphamc(indexmc,indexMS(i1)),alphamc(indexmc,indexMS(i2)),1.,strMS(1));
        %var=[var alphamc(indexmc,indexMS(i1)),alphamc(indexmc,indexMS(i2))];
        xlabel(['\beta^R_{' num2str(i1) '}']);
        ylabel(['\beta^R_{' num2str(i2) '}']);
        hold on;
        if i==1 title(['MCMC Markov switching parameter ' ]);end
        
    end  
elseif fix(dMS/2)==0;
    for i=1:K-1
        scatter(alphamc(indexmc,indexMS((i-1)*dMS+1)),etaMSmc(4^(i-1),4^(i-1),1,indexmc),1.,str(i));
        hold on;
        
        if i==1 title(['MCMC Markov switching parameter ' ]);
            xlabel(['\beta^R_{\cdot}']);
            ylabel(['\etaMS']);
        end
        
    end  
end
    
    %save scatR_K2.asc var -ascii
