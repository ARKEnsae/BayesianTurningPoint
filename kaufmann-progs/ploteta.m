%function ploteta(res)
res.eta=etaMSmc;
np = size(etaMSmc,1);
it = size(res.eta,3);
for i = 1:np
for j = 1:np
   subplot(np,np,(i-1)*(np)+j);
   axis([0 it 0 1]);
   plot(squeeze(res.eta(i,j,:))',str(1));hold on;
   axis([0 it 0 1]);
   xlabel(['\eta_{' num2str(i) ',' num2str(j)   '}']);
   if and(i==1,j==1) title('Markov Switching Probabilities');end
end
end
