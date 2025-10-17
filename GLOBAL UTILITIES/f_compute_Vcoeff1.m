function VCoeff=f_compute_Vcoeff(VDx,VDy,freq,ThetaMax,PhiMax)
epsilonR = 1.00059;  		           
muR      = 1;			                   
Clight   = 299.7925/sqrt(epsilonR*muR);  
%Vdx  x coordinate of elements  (row vectors)
%Vdy  y coordinate of elements (row vectors)
lambda = Clight/freq;
K0     = 2*pi/lambda;

VKx    = K0.*sin(ThetaMax/180*pi).*cos(PhiMax/180*pi);
VKy    = K0.*sin(ThetaMax/180*pi).*sin(PhiMax/180*pi);
VCoeff = exp(-j*(VKx.*VDx+VKy.*VDy));
end

