K = size(etamc,2);
M = size(alphamc,1);

dd=size(Q,1);

ifig=ifig+1;
figure(ifig);

if M< 500
   indexmc=[1:M];
else
   ispace=M/500;indexmc=[1:ispace:M];
end   

for i1=1:(d-dd)
   subplot(nvfix,nh,i1);
   [xa,fa]=dichte(alphamc(indexmc,K*dd+i1));
   plot(xa,fa,str(k));hold on;
   xlabel(['\beta_{' num2str(dd+i1) '}']);
   if i1==1 title('fixed parameters');end
end

