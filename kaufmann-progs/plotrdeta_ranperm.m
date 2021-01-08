K = size(Qmc,3);
if M< 500
   indexmc=[1:M];
else
   ispace=M/500;indexmc=[1:ispace:M];
end   
str=['r';'g';'b';'y';'k';'c'];

ifig=ifig+1;
figure(ifig);
for i=1:K
   for j=1:K
   if i==j   
   subplot(2,1,1)   
   [xa,fa]=dichte(etaMSmc(i,j,indexmc));
   plot(xa,fa,str(k));hold on;
   title('marginal of randpm permutation sampler');
   xlabel(['\eta_{i,i}']);
   else
   subplot(2,1,2)   
   [xa,fa]=dichte(etaMSmc(i,j,indexmc));
   plot(xa,fa,str(k));hold on;
   xlabel(['\eta_{i,j}']);
   end
end
