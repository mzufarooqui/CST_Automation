function [Pattern]=f_ArrayFactor2D(VDx,VDy,VCoeff,freq,MTheta,MPhi)
% Written by Giuseppe Virone

epsilonR = 1.00059;  		           % permettivita' elettrica relativa
muR = 1;			                   % permeabilita' magnetica relativa
Clight = 299.7925/sqrt(epsilonR*muR);  % velocita' luce (mm/ns)

%Vdx  x coordinate of elements  (row vectors)
%Vdy  y coordinate of elements (row vectors)

lambda=Clight/freq;
K0=2*pi/lambda;


MKx=K0.*sin(MTheta/180*pi).*cos(MPhi/180*pi);
MKy=K0.*sin(MTheta/180*pi).*sin(MPhi/180*pi);

[nr,nc]=size(MKx);


Data=exp(j*(MKx(:)*VDx+MKy(:)*VDy)).*(ones(length(MKx(:)),1)*VCoeff);

Pattern=sum(Data,2);

Pattern=reshape(Pattern,nr,nc);
end