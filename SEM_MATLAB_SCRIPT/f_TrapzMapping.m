function[x,y,detJac,DxDu,DxDv,DyDu,DyDv,DuDx,DuDy,DvDx,DvDy]=f_TrapzMapping(u,v,xP,yP)
%
% Ver. 0.1 by O. A. Peverini-IEIIT
%
% applica la trasformazione del quadrilatero normalizzato (0,1) nel piano (u,v) in un quadrilatero definito dai
% 4 punti (xP,yP) nel piano (X,Y);

Nr=size(u,1);
Nc=size(u,2);
u=u(:);
v=v(:);

cx0=xP(1);
cxu=xP(2)-xP(1);
cxv=xP(4)-xP(1);
cxuv=(xP(1)-xP(2))+(xP(3)-xP(4));
x=cx0+cxu*u+cxv*v+cxuv*u.*v;

cy0=yP(1);
cyu=yP(2)-yP(1);
cyv=yP(4)-yP(1);
cyuv=(yP(1)-yP(2))+(yP(3)-yP(4));
y=cy0+cyu*u+cyv*v+cyuv*u.*v;

% dv=(cxuv*cyv-cyuv*cxv);
% du=(-cyu*cxuv+cxu*cyuv);
% d0=cxu*cyv-cyu*cxv;
% detJac=dv*v+du*u+d0;

DxDu=(cxu+cxuv*v); %derivata di X rispetto a u
DyDu=(cyu+cyuv*v); %derivata di Y rispetto a u
DxDv=(cxv+cxuv*u); %derivata di X rispetto a v
DyDv=(cyv+cyuv*u); %derivata di Y rispetto a v
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



