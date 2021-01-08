ifig=ifig+1
for i=1:dd;
    figure(ifig);
    subplot(2,3,i)
    plot(alphamc(:,indexMIX([i:dd:dd*K])))
    figure(ifig+1);
    subplot(2,3,i)
    plot(alphamc(:,indexMS([i:dd:dd*K])))
end

