function  p= prob_mix_logit(y,gam,ZG,Zlogit,Q,alpha,seps,dd,sp)

% S .. (1 times N) vector of group-number

K = size(gam,2);
T = size(y,1);
d = size(ZG,2);
N = size(y,2);

m = zeros(T,K);
llh = zeros(K,N);
ZG = squeeze(ZG);
Vinvk = zeros(T,T,K);

llh1 = -.5*T*(log(2*pi)); 

alpha1=alpha';
alpha2(1:dd,1:K) = reshape(alpha1(1:dd*K,1),dd,K);
% alpha2(dd+1:8*dd,1:K) = alpha1(dd*K+1:dd*(K+7),ones(1,K)); % für 7 cons.-charact.
alpha2(dd+1:d,1:K) = alpha1(dd*K+1:dd*(K-1)+d,ones(1,K));

m = ZG*alpha2; 
eps = y(:,ones(1,K)) - m; 

for k=1:K,
          
   Vinvk(:,:,k) = inv(ZG(:,1:dd)*(squeeze(Q(:,:,k)))*(ZG(:,1:dd))' + seps*eye(T));

   llh(k,1) = llh1 +.5*(log(det(Vinvk(:,:,k))))- .5*eps(:,k)'*Vinvk(:,:,k)*eps(:,k);   
   
end

maxl = max(llh);
lh = exp(llh - maxl(ones(1,K),1));

% prediction from logit model:

eta=exp(Zlogit*gam);eta=eta/sum(eta,2);
   
p = eta'.*lh;
sp = sp + log(sum(p))+maxl;
p = p ./ sum(p);
fv = p';

rnd = rand;
S = (sum(cumsum(fv,2) < rnd(:,ones(K,1)),2) + 1)';      % sampling
   

Vinv = Vinvk(:,:,S);   % Vinv fuer i.tes Objekt 
