np = size(etaMSmc,1);
it = size(etaMSmc,4);
Keta=size(etaMSmc,3);

for k=1:Keta
ifig=ifig+1;
figure(ifig);
for i = 1:np
for j = 1:np
   subplot(np,np,(i-1)*(np)+j);
   [xa,fa]=dichte(squeeze(etaMSmc(i,j,k,indexmc)));
   plot(xa,fa,str(1));hold on;
   xlabel(['\eta_{' num2str(i) ',' num2str(j)   '}']);
   if and(i==1,j==1) title(['Markov Switching Probabilities, group ' int2str(k)]);end
end
end
end
