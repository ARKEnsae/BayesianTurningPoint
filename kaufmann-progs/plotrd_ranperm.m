dd = size(Q,1);
dMS=size(ZMS,2);
str=['r';'k';'b';'y';'g';'c'];
K = size(etamc,2);
M = size(etamc,1);

% index1 = [1:dd];
% index = reshape(index1(ones(1,K),:)',1,K*dd);
% states = [1:K]';
% index2 = reshape(states(:,ones(1,dd))',1,K*dd);
% indexMIX=[1:dd*K];
% indexFIX=[K*dd+1:d+(K-1)*dd];
% indexMS=[(d+(K-1)*dd+1):(d+(K-1)*dd+dMS)];
indexG = kron(ones(1,K),[1:dd]); %reshape(index1(ones(1,K),:)',1,K*dd);
%index2 = [1:K]';
indexK = kron([1:K]',ones(dd,1))'; %reshape(states(:,ones(1,dd))',1,K*dd);
indexR = kron(ones(1,K),[1:dMS]);
indexM = kron([1:K]',ones(dMS,1))';
indexMIX=[1:dd*K];
indexFIX=[K*dd+1:d+(K-1)*dd];
indexMS=[(d+(K-1)*dd+1):(d+(K-1)*dd+dMS*K)];

if M< 500
    indexmc=[1:M];
else
    ispace=M/500;indexmc=[1:ispace:M];
end   
nh=4;%number of horizental plots
nv=fix((dd+nh-1)/nh);
if size(etamc,2)>1
    plotrdalpha;
    subplot(nv,nh,1);
    title('Marginals  Random Permutation Sampler')
end
if dMS>0
    ifig=ifig-1;plotrdalphaR_ranperm;
end
nvfix=fix(((d-dd)+nh-1)/nh);
%plotrdalpha_fix;
if size(etamc,2)>1
    plotrdeta;
end
if dMS>0
    plotrdetaMS_ranperm;
end