function VCoeff=f_compute_Vcoeff(VDx,VDy,freq,ThetaMax,PhiMax)

epsilonR = 1.00059;  		           % permettivita' elettrica relativa
muR = 1;			                   % permeabilita' magnetica relativa
Clight = 299.7925/sqrt(epsilonR*muR);  % velocita' luce (mm/ns)


%Vdx  x coordinate of elements  (row vectors)
%Vdy  y coordinate of elements (row vectors)

lambda=Clight/freq;
K0=2*pi/lambda;



VKx=K0.*sin(ThetaMax/180*pi).*cos(PhiMax/180*pi);
VKy=K0.*sin(ThetaMax/180*pi).*sin(PhiMax/180*pi);


VCoeff=exp(-1j*(VKx.*VDx+VKy.*VDy));


