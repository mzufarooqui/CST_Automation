function[x,y,detJac,DxDu,DxDv,DyDu,DyDv,DuDx,DuDy,DvDx,DvDy]=f_CircTrapzMappingBase(u,v,xP,yP,R,xc,yc)
%
% Ver. 0.1 by O. A. Peverini-IEIIT
%
% applica la trasformazione del quadrilatero normalizzato (0,1) nel piano (u,v) in un quadrilatero definito dai
% 4 punti (xP,yP) nel piano (X,Y) con archi di cerchio (per ora solo sul lato 2 e 4);

Nr=size(u,1);
Nc=size(u,2);
u=u(:);
v=v(:);

cx0=xP(1);
cxu=xP(2)-xP(1);
cxv=xP(4)-xP(1);
cxuv=(xP(1)-xP(2))+(xP(3)-xP(4));
%x=cx0+cxu*u+cxv*v+cxuv*u.*v;

cy0=yP(1);
cyu=yP(2)-yP(1);
cyv=yP(4)-yP(1);
cyuv=(yP(1)-yP(2))+(yP(3)-yP(4));
%y=cy0+cyu*u+cyv*v+cyuv*u.*v;

R2=R(2);
xc2=xc(2);
yc2=yc(2);

R4=R(4);
xc4=xc(4);
yc4=yc(4);

ax=cxu+cxuv*v; 
ay=cyu+cyuv*v;
bx=cx0+cxv*v;
by=cy0+cyv*v;

ax_Der1=cxuv;
ay_Der1=cyuv;

bx_Der1=cxv;
by_Der1=cyv;

if(isinf(R4)==0)
   
    Abeta=(bx.^2+by.^2);
    Bbeta=-(bx*xc4+by*yc4);
    Cbeta=xc4^2+yc4^2-R4^2;

    Abeta_Der1=2*bx.*bx_Der1+2*by.*by_Der1;
    Bbeta_Der1=-(bx_Der1*xc4+by_Der1*yc4);
    Cbeta_Der1=zeros(size(u));

    beta=(-Bbeta+sqrt(Bbeta.^2-Abeta.*Cbeta))./Abeta;

    beta_DerA=-1/2./(Bbeta.^2-Abeta.*Cbeta).^(1/2).*Cbeta./Abeta-(-Bbeta+(Bbeta.^2-Abeta.*Cbeta).^(1/2))./Abeta.^2;
    beta_DerB=(-1+1./(Bbeta.^2-Abeta.*Cbeta).^(1/2).*Bbeta)./Abeta;
    beta_DerC=-1/2./(Bbeta.^2-Abeta.*Cbeta).^(1/2);

    beta_Der1=beta_DerA.*Abeta_Der1+beta_DerB.*Bbeta_Der1+beta_DerC.*Cbeta_Der1;
else
    beta=ones(size(u));
    beta_Der1=zeros(size(u));
end
bxt=beta.*bx;
byt=beta.*by;
bxt_Der1=beta_Der1.*bx+beta.*bx_Der1;
byt_Der1=beta_Der1.*by+beta.*by_Der1;


if(isinf(R2)==0)
    
    Aalpha=(ax.^2+ay.^2);
    Balpha=(ax.*(bxt-xc2)+ay.*(byt-yc2));
    Calpha=(bxt-xc2).^2+(byt-yc2).^2-R2^2;

    Aalpha_Der1=2*ax.*ax_Der1+2*ay*ay_Der1;
    Balpha_Der1=ax_Der1.*(bxt-xc2)+ax.*bxt_Der1+ay_Der1.*(byt-yc2)+ay.*byt_Der1;
    Calpha_Der1=2*(bxt-xc2).*bxt_Der1+2*(byt-yc2).*byt_Der1;

    alpha=(-Balpha+sqrt(Balpha.^2-Aalpha.*Calpha))./Aalpha;

    alpha_DerA=-1/2./(Balpha.^2-Aalpha.*Calpha).^(1/2).*Calpha./Aalpha-(-Balpha+(Balpha.^2-Aalpha.*Calpha).^(1/2))./Aalpha.^2;
    alpha_DerB=(-1+1./(Balpha.^2-Aalpha.*Calpha).^(1/2).*Balpha)./Aalpha;
    alpha_DerC=-1/2./(Balpha.^2-Aalpha.*Calpha).^(1/2);

    alpha_Der1=alpha_DerA.*Aalpha_Der1+alpha_DerB.*Balpha_Der1+alpha_DerC.*Calpha_Der1;
else
    alpha=(ax+bx-bxt)./(ax);
    alpha_Der1=((ax_Der1+bx_Der1-bxt_Der1).*ax-(ax+bx-bxt).*ax_Der1)./ax.^2;
end
axt=alpha.*ax;
ayt=alpha.*ay;
axt_Der1=alpha_Der1.*ax+alpha.*ax_Der1;
ayt_Der1=alpha_Der1.*ay+alpha.*ay_Der1;

x=axt.*u+bxt;
y=ayt.*u+byt;

DxDu=axt; %derivata di X rispetto a u
DyDu=ayt; %derivata di Y rispetto a u
DxDv=axt_Der1.*u+bxt_Der1; %derivata di X rispetto a v
DyDv=ayt_Der1.*u+byt_Der1; %derivata di Y rispetto a v
detJac=DxDu.*DyDv-DxDv.*DyDu;

x=reshape(x,Nr,Nc);
y=reshape(y,Nr,Nc);
DxDu=reshape(DxDu,Nr,Nc);
DxDv=reshape(DxDv,Nr,Nc);
DyDu=reshape(DyDu,Nr,Nc);
DyDv=reshape(DyDv,Nr,Nc);
detJac=reshape(detJac,Nr,Nc);

DuDx=DyDv./detJac;
DuDy=-DxDv./detJac;
DvDx=-DyDu./detJac;
DvDy=DxDu./detJac;

DuDx=reshape(DuDx,Nr,Nc);
DuDy=reshape(DuDy,Nr,Nc);
DvDx=reshape(DvDx,Nr,Nc);
DvDy=reshape(DvDy,Nr,Nc);

return



