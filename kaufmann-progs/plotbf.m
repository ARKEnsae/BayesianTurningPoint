%index=[1:size(loglikq,1)];
'abschneiden: MMCit0=' 
MMCit0
index=[MMCit0+1:size(loglikq,1)];
subplot(3,2,1)
plot([loglikq(index) loglikmc(index)])
legend('q','mc')
title('loglik')

subplot(3,2,2)
hist([loglikq(index) loglikmc(index)])
legend('q','mc')

subplot(3,2,3)
plot([priorq(index) priormc(index)])
legend('q','mc')
title('prior')

subplot(3,2,4)
hist([priorq(index) priormc(index)])
legend('q','mc')

subplot(3,2,5)
plot([qq(index) qmc(index)])
%plot([exp(qq(index)) exp(qmc(index))])
legend('q','mc')
title('q(.)')

subplot(3,2,6)
hist([qq(index) qmc(index)])
%hist([exp(qq(index)) exp(qmc(index))])
legend('q','mc')
