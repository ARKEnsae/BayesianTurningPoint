
ifig=ifig+1;
figure(ifig);

if M< 500
    indexmc=[1:M];
else
    ispace=M/500;indexmc=[1:ispace:M];
end   


ifig=ifig+1;
figure(ifig);
for i1=1:dMS
    subplot(nv,nh,i1);
    for j=1:K
        for k=1:1
%            [xa,fa]=dichte((-1).^(k+1).*alphamc(indexmc,indexMS((j-1)*dMS+i1)));
            [xa,fa]=dichte(alphamc(indexmc,indexMS((j-1)*dMS+i1)));
            plot(xa,fa,str((j-1)*dMS+i1));hold on;
            xlabel(['\beta^R_{' num2str(i1) '}']);
        end
    end
    if i1==1 title('MS parameters ');end
end

