K = size(etamc,2);
M = size(etamc,1);
%D = size(Qmc,2);dd = -.5 + (.25 + 2*D)^.5;
dd=size(Q,1);
dMS=size(ZMS,2);
%str=['r';'g';'b';'y';'k';'c'];
%str=['g';'b';'r';'y';'k';'c'];
str=['b';'r';'g';'y';'k';'c'];



index1 = [1:dd];
index = reshape(index1(ones(1,K),:)',1,K*dd);
states = [1:K]';
index2 = reshape(states(:,ones(1,dd))',1,K*dd);
indexMIX=[1:dd*K];
indexFIX=[K*dd+1:d+(K-1)*dd];
indexMS=[(d+(K-1)*dd+1):(d+(K-1)*dd+dMS)];

if M< 500
   indexmc=[1:M];
else
   ispace=M/500;indexmc=[1:ispace:M];
end   

ifig=ifig+1;
figure(ifig);

for jj=1:2
   i1=-1;i2=0;iplot=0;

  for i=1:fix(dMS/2)
   i1=i1+2;i2=i2+2;ih=4;iplot=iplot+1;
   subplot(fix((fix(dMS/2)+ih-1)/ih),ih,iplot);
      %scatter(alphamc(:,dd*K+i1),etamc(:,i),1.,str(i));
      hold on;
      if jj==1
      scatter(alphamc(indexmc,i1),alphamc(indexmc,i2),1.,str(jj));
   else
      scatter(alphamc(indexmc,i1)-alphamc(indexmc,d+i1),alphamc(indexmc,i2)-alphamc(indexmc,d+i2),1.,str(jj));
      end 
      xlabel(['\theta^R_{' num2str(i1) '}']);
   ylabel(['\theta^R_{' num2str(i2) '}']);
   hold on;
end
end
  