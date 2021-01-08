K = size(etamc,2);
M = size(etamc,1);
dd = size(Q,1);
dMS=size(ZMS,2);
%D = size(Qmc,2);dd = -.5 + (.25 + 2*D)^.5;
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

if size(etamc,2)>1
   plotgroupalpha;
end   
if dMS>0
   if size(etamc,2)>1
   plotgroupalpha_R;
   end
   plotgroupMS;
end   