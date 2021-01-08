function [Q] = ranwi_eye(nu,r)

%  sampling from an  Wishart distribution with S=I
% input: nu ... shape parameter
%        r .... dimesnion of Q

n=2*nu+1;
z=randn(n,r);
covz=nu*cov(z,1);
Q=covz;

