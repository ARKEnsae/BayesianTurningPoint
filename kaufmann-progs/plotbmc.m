K = size(Qmc,3);
D = size(Qmc,2);
M = size(Qmc,1);
dd = -.5 + (.25 + 2*D)^.5;
Mb=size(bmc,1);
N=size(bmc,2);
index=[M-Mb+1:M];
for n=1:N
   %scatter(alphamc(:,dd*K+i1),etamc(:,i),1.,str(i));
   scatter(mean(alphamc(index,i1)+squeeze(bmc(:,n,i1))),mean(alphamc(index,i2)+squeeze(bmc(:,n,i2))));
   hold on;
end


  