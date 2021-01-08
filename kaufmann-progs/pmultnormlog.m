function fd = pmultnormlog(beta,prm,prv)

% auswerten einer multivariaten normalverteilung fuer verscheidene argumente mit identischen
% parametern - ergebnis: log des funktionswertes

%input: 
% beta ... spaltenvektor (1 argument)
%      ... matrix; anzahl der spalten = verschiedene argumente; die spalten  enthalten
%                  die argumante
% prm ... mean - spaltenvektor
% prv ... informationsmatrix

%output: funktionswerte ... 1 zeile

k = size(beta,1);
m = size(beta,2);
fln = 0.5*log(det(prv))-0.5*k*log(2*pi);

v=chol(prv)*(beta-prm(:,ones(1,m)));
flg = -0.5*sum(v.*v,1);
fd = fln+flg;

