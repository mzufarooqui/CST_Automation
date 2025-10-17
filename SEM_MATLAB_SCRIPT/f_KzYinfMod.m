function[kz,Yinf]=f_KzYinfMod(kt,freq,TipoMod)

global Z0 Clight

k0 = 2*pi*freq/Clight;       %costante di propagazione nel mezzo
krel = sqrt ( 1-(kt/k0).^2 );

I=find(imag(krel)>eps);      %se immaginario, kz deve essere <0
krel(I)=-krel(I);
 
Yinf=NaN*(1+j)*ones(size(kt)); %alloco spazio in memoria per l'ammettenza

I=find(TipoMod==1);      % modi TE 
 Yinf(I)=(1/Z0)*krel(I);
I=find(TipoMod==0);      % modi TM
 Yinf(I)=(1/Z0)./krel(I);

kz=k0*krel;

return