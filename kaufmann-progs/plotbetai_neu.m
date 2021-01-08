K = size(Qmc,3);
D = size(Qmc,2);
M = size(Qmc,1);
dd = -.5 + (.25 + 2*D)^.5;
Mb=size(bmc,1);
N=size(bmc,2);
index=[M-Mb+1:M];

am=mean(alphamc(index,:),1);
betai=squeeze(mean(bmc,1))+am(ones(N,1),:);

figure(1);   
for i1=1:1+2*(lag_dir+1)
   subplot(3,lag_dir+1,i1+lag_dir)
   [xb,fb]=dichte(betai(:,i1));
   [xa,fa]=dichte(bols(:,i1));
   plot(xa,fa,'r-',xb,fb,'b--');
end
ni=1+2*(lag_dir+1);

figure(2);   
for i1=ni+1:ni+1+2*(lag_dir+1)
   subplot(3,lag_dir+1,i1+lag_dir-ni)
   [xb,fb]=dichte(betai(:,i1));
   [xa,fa]=dichte(bols(:,i1));
   plot(xa,fa,'r-',xb,fb,'b--');
end
ni=ni+1+2*(lag_dir+1);


figure(3);   
for i1=ni+1:ni+1+2*(lag_dir+1)
   subplot(3,lag_dir+1,i1+lag_dir-ni)
   [xb,fb]=dichte(betai(:,i1));
   [xa,fa]=dichte(bols(:,i1));
   plot(xa,fa,'r-',xb,fb,'b--');
end
ni=ni+1+2*(lag_dir+1);

figure(4);   
for i1=ni+1:ni+lag_dlo
   subplot(fix(0.5*(lag_dlo+1)),2,i1-ni)
   [xb,fb]=dichte(betai(:,i1));
   [xa,fa]=dichte(bols(:,i1));
   plot(xa,fa,'r-',xb,fb,'b--');
end
ni=ni+lag_dlo;

figure(5);   
for i1=ni+1:ni+6
   subplot(3,2,i1-ni)
   [xb,fb]=dichte(betai(:,i1));
   [xa,fa]=dichte(bols(:,i1));
   plot(xa,fa,'r-',xb,fb,'b--');
end

