function fd = pmultnormchol(beta,prm,prvchol)

% auswerten einer multivariaten normalverteilung fuer verscheidene argumente mit identischem
% mittelwert und informationsmatrix
% input: zerlegung der informationsmatrix! prvchol'*prvchol

%   NEUE VERSION  kopieren!!!

% beta ... spaltenvektor (1 argument)
%      ... matrix; anzahl der spalten = verschiedene argumente; die spalten  enthalten
%                  die argumante
% prm ... mean - spaltenvektor
% prvchol ... cholesky zerlegung der informationsmatrix: prvchol'*prvchol=prv

%output: funktionswerte ... 1 zeile

k = size(beta,1);
m = size(beta,2);
prvcov = prvchol'*prvchol;
fln = log(abs(det(prvchol)))-0.5*k*(log(2*pi));

v=prvchol*(beta-prm(:,ones(1,m)));
flg = -0.5*sum(v.*v,1);
fd = fln+flg;

