K = size(etamc,2);
if M< 500
   indexmc=[1:M];
else
   ispace=M/500;indexmc=[1:ispace:M];
end   

ifig=ifig+1;
figure(ifig);
for k=1:K
   [xa,fa]=dichte(etamc(indexmc,k));
   plot(xa,fa,str(k));hold on;
end
title('posterior of group probabilities');
