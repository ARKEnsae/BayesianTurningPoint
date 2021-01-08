dlogit=2; %flag to plot the (1) histogramm of logit parameter  (2) a scatter plot of the logit parameters
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

index_col=[1:size(Z,2)];
index_perm2=zeros(dMS,1);
for iMS=1:dMS
   incol=index_col(all(all((Z-ZMS(:,iMS*ones(size(Z,2),1),:))==0,3)==1,1));
   if isempty(incol) 
      ['warning: column ' num2str(iMS) ' of ZMS not contained in ZG']
   else   
      index_perm2(iMS)=incol;
   end  

end

% match group specific and fixed parameters
iiMIX=index_perm2(index_perm2<=dd);
iiFIX=index_perm2(index_perm2>dd);
iiNS= find(1-any([kron(ones(1,length(iiMIX)),[1:dd]')-iiMIX(:,ones(1,dd))']==0,2));

if M< 500
    indexmc=[1:M];
else
    ispace=fix(M/500);indexmc=[1:ispace:M];
end   


i1=-1;i2=0;iplot=0;
str=['r';'k';'b';'y';'g';'c'];

figure(double(gcf)+1);
var=[];
% if fix(dd/2)>=1;
for i=1:fix(dd/2)
    i1=i1+2;i2=i2+2;ih=4;iplot=iplot+1;
    subplot(fix((fix(dd/2)+ih-1)/ih),ih,iplot);
    for k=1:K-1
        %scatter(alphamc(:,dd*K+i1),etamc(:,i),1.,str(i));
        scatter(alphamc(indexmc,dd*(k-1)+i1),alphamc(indexmc,dd*(k-1)+i2),1.,str(k));
        %var=[var alphamc(indexmc,dd*(k-1)+i1),alphamc(indexmc,dd*(k-1)+i2)];
        %save scatG_K2.asc 
        xlabel(['\beta_{' num2str(i1) '}']);
        ylabel(['\beta_{' num2str(i2) '}']);
        hold on;
    end
    if i==1 title(['K' int2str(K) ', ' int2str(cal_beg) '-' int2str(cal_end)]); end
end
%save scatG_K2.asc var -ascii
% elseif fix(dd/2)==0;

figure(double(gcf)+1)
for k=1:K-1
    scatter(alphamc(indexmc,dd*(k-1)+1),etaMSmc(4^(k-1),4^(k-1),1,indexmc),1.,str(k));
    hold on;
    if k==1 title(['K' int2str(K) ', ' int2str(cal_beg) '-' int2str(cal_end) ', MCMC group-specific parameter ' ]);    
        
        xlabel(['\beta^G_{\cdot,1}']);
        ylabel(['\etaMS']);
        
    end
end

if dMS>1
    figure(double(gcf)+1)
    for k=1:K-1
        scatter(alphamc(indexmc,indexMS((k-1)*dMS+2)),etaMSmc(4^(k-1),4^(k-1),1,indexmc),1.,str(k));
        hold on;
        if k==1 title(['K' int2str(K) ', ' int2str(cal_beg) '-' int2str(cal_end) ', MCMC group-specific parameter ' ]);
            xlabel(['\beta^R_{\cdot,2}']);
            ylabel(['\etaMS']);
            
        end
    end
end

if any(Q)
iplot=0;
var=[];
nQ=fix((dd-dMS)/2);
if nQ>=1;
    figure(double(gcf)+1);
    for i=1:nQ
        i1=sum(1:iiNS(nQ*(i-1)+1));i2=sum(1:iiNS(nQ*(i-1)+2));ih=4;iplot=iplot+1;
        if (dd-dMS)>2
            subplot(fix((fix((dd-dMS)/2)+ih-1)/ih),ih,iplot);
        end
        for k=1:K-1
            %scatter(alphamc(:,dd*K+i1),etamc(:,i),1.,str(i));
            scatter(Qmc(indexmc,i1,k),Qmc(indexmc,i2,k),1.,str(k));
            %var=[var alphamc(indexmc,dd*(k-1)+i1),alphamc(indexmc,dd*(k-1)+i2)];
            %save scatG_K2.asc
            xlabel(['Q_{' num2str(i1) num2str(i1) '}']);
            ylabel(['Q_{' num2str(i2) num2str(i2) '}']);
            hold on;
        end
        if i==1 title('Q of group-specific parameters'); end
    end
end


var=[];
iplot=0;
if dMS>0;
    figure(double(gcf)+1);
    if fix(dMS/2)>=1;
        for i=1:fix(dMS/2)
            i1=sum(1:1+dd);i2=sum(1:2+dd);ih=4;iplot=iplot+1;
            if dMS>2
                subplot(fix((fix(dMS/2)+ih-1)/ih),ih,iplot);
            end
            for k=1:K-1
                %scatter(alphamc(:,dd*K+i1),etamc(:,i),1.,str(i));
                scatter(Qmc(indexmc,i1,k),Qmc(indexmc,i2,k),1.,str(k));
                %var=[var alphamc(indexmc,dd*(k-1)+i1),alphamc(indexmc,dd*(k-1)+i2)];
                %save scatG_K2.asc
                xlabel(['Q_{' num2str(i1) num2str(i1) '}']);
                ylabel(['Q_{' num2str(i2) num2str(i2) '}']);
                hold on;
            end
            if i==1 title('Q of switching parameters'); end
        end
    else
        i1=sum(1:iiMIX(1));i2=sum(1:1+dd);ih=4;iplot=iplot+1;
        for k=1:K-1
            %scatter(alphamc(:,dd*K+i1),etamc(:,i),1.,str(i));
            scatter(Qmc(indexmc,i1,k),Qmc(indexmc,i2,k),1.,str(k));
            %var=[var alphamc(indexmc,dd*(k-1)+i1),alphamc(indexmc,dd*(k-1)+i2)];
            %save scatG_K2.asc
            xlabel(['Q_{' num2str(i1) num2str(i1) '}']);
            ylabel(['Q_{' num2str(i2) num2str(i2) '}']);
            hold on;
        end
        title('Q of switching parameters'); 
    end
end
end

if S_logit
    figure(double(gcf)+1);
    if dlogit==1
        for k=1:K-1;
            subplot(fix((K+1)*0.5),1,k);hist(gammc(indexmc,2,k),20);
        end
    elseif dlogit==2
        for k=1:K-1
            subplot(fix((K+1)*0.5),2,k);scatter(gammc(indexmc,2,k),gammc(indexmc,3,k),str(k));
            hold on;
            plot([min(gammc(indexmc,2,k)) max(gammc(indexmc,2,k))],[0 0]);
            plot([0 0],[min(gammc(indexmc,3,k)) max(gammc(indexmc,3,k))]);
            ylabel(['logit of group ' int2str(k)])
        end
    elseif dlogit>2
        'plotgroupalpha erweitern'
    end
end
