function plotrdprioreta(ngr,e0,N)
etasim=zeros(N,ngr);
for j=1:N;
[etasim(j,:),etapost] = simtransex(zeros(1,ngr),e0*ones(1,ngr));
end
figure(double(gcf)+1)
for k=1:ngr
[xa,fa]=dichte(etasim(:,k));
 plot(xa,fa);
hold on;
end
