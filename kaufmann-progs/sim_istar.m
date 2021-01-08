function istar = sim_istar(lik,Istar,etaMS,etaMSind);

% function to simulate the indicator of the combined (leading-contemporaneous) and the independent groups

% Input
% lik .. likelihood (L times M times T)
% 
% lik(k,m,t) is the log-likelihood of all data at time t which are relevant for process m,
%    if we assume that the process m takes the value k at time t

% Istar .. the rows of the matrix K*(K-1) times K
%          containing all possible combinations of a leading (2) and
%          independent (0) groups, give the contemporaneous group (1)

% xia first line: lead out of recession, second line: lead into recession

ngrp=size(lik,2);

n_comb=size(Istar,1);
istar_vec=zeros(n_comb,1);

% if size(etaMS,3)==1;
%     etaMS=etaMS(:,:,ones(1,n_comb));
% end


for j=1:n_comb
    lead=find(Istar(j,:)==2);
    cont=find(Istar(j,:)==1);
    ind=find(Istar(j,:)==0);
    
       
    %state 1 = I_1t=1,I_2t=1 ; state 2 = I_1t=1,I_2t=2 ; state 3 = I_1t=2,I_2t=1  ; state 4 = I_1t=2,I_2t=2 
    lik_enc = [lik(1,cont,:)+lik(1,lead,:);lik(1,cont,:)+lik(2,lead,:);lik(2,cont,:)+lik(1,lead,:);lik(2,cont,:)+lik(2,lead,:)];
    
    
    % marginal likelihood of the dependent groups    
    istar_vec(j) = istar_vec(j) + marglik_states(etaMS,lik_enc);
    if ngrp>2
        % marginal likelihood of the independent groups
        istar_vec(j) = istar_vec(j) + marglik_states(etaMSind(:,:,ind),lik(:,ind,:));
    end
end

maxl = max(istar_vec);

istar_vec=exp(istar_vec-maxl)./sum(exp(istar_vec-maxl));

istar = Istar(sum(cumsum(istar_vec) < rand) + 1,:);  

istar;