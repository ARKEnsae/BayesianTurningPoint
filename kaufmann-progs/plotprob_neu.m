K = size(Qmc,3);
str=['b';'y';'g';'r';'k';'c'];

daten_read_b;
%sortindex=0;chorder='BLZ'; % kein sortieren
sortindex=2;chorder='size (1996/1)'; % sort by size(1999)
%sortindex=3;chorder='liquidity (1996/1)'; % sort by liquidity(1999)
%sortindex=4;chorder='capital share (1996/1)'; %sort by capital share

if sortindex~=0
   if (sortindex==2)+(sortindex==3)
      [ss is]=sort(squeeze(Zbasis(24,sortindex,:))); end
   if (sortindex==4)
      [ss is]=sort(caprat(24,:)); end
else
  is=[1:nbank]';
end
iss=is(any([is(:,ones(length(indexb),1))==indexb(ones(nbank,1),:)],2)); %platz der bank im ganzen sample

if sortindex~=0
   if (sortindex==2)+(sortindex==3)
      [ss is]=sort(squeeze(Zbasis(24,sortindex,indexb))); end %platz der bank im effektiven sample
   if (sortindex==4)
      [ss is]=sort(caprat(24,indexb)); end
else
  is=[1:length(indexb)]';
end
for i=1:size(Smc,1)
Smcsort(i,:)=Smc(i,is);
end

if K>1 
ifig=ifig+1;
figure(ifig);
prob=zeros(K,size(Smcsort,2));
l=1;
for k=1:K;
%for k=[1 2 4];
   prob(k,:)=sum(Smcsort==k*ones(size(Smcsort)))/size(Smcsort,1)>0.5;
   prob1(k,:)=sum(Smcsort==k*ones(size(Smcsort)))/size(Smcsort,1);
   if k~=K+1
   subplot(K,1,l);
   bar(ss,prob(k,:));
   l=l+1
   end
%   bar(indexb,prob(k,:));
  %axis([0 size(Smc,2) 0 1]);
  axis([ss(1)-1 ss(end) 0 1]);
  if k==1 title(['by ' chorder]);end
end
ifig=ifig+1;
figure(ifig);

index=[1:nbank];
indexsort=index(iss)';
%indexZ=[1:size(Zbasis,3)];%?????????
%indexZ=indexZ(is);%??????????????

BLZsort=BLZ(indexsort);
class=zeros(size(BLZ,1),K+1);
maxprob=max(prob);


var=[];
for k=1:K
 %['Pr(K=' num2str(k) ')>0.8']
%  ip=prob(k,:)>0.8;
%  ip=prob(k,:)==maxprob;
  ip=iss(prob(k,:)==1);
  class(ip,k)=1;
  if k~=K+1
     if (sortindex==2)+(sortindex==3)
  %scatter(Zbasis(24,2,indexZ(ip)),Zbasis(24,3,indexZ(ip)),str(k)); 
  scatter(Zbasis(24,2,ip),Zbasis(24,3,ip),str(k));
  xlabel('size (1996/1)');ylabel('liquidity (1996/1)');
  end
  if sortindex==4
     scatter(Zbasis(24,2,ip),caprat(24,ip),str(k));
     xlabel('size (1996/1)');ylabel('capital share (1996/1)');
  end
   hold on; 
   %var=[var squeeze(Zbasis(24,2,indexsort(ip))) squeeze(Zbasis(24,3,indexsort(ip)))];
end;
  if k==1 title('classification');end
end
class(iout,K+1)=1;
class_size=num2str([[1:size(BLZsort,1)]' index(1,indexsort)' BLZsort class(indexsort,:)])
class_BLZ=num2str([index' BLZ class])

ifig=ifig+1;
figure(ifig);
for k=1:K+1
   subplot(K+1,1,k);
   %bar(index,class(:,k));
   bar(BLZ,class(:,k));
   if k==1 title('classification -- ordered by BLZ');end
end
end

dMS=size(ZMS,2);
if dMS>0
   plotprobMS;
end   