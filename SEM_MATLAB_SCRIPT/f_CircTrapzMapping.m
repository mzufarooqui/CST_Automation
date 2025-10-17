function[x,y,detJac,DxDu,DxDv,DyDu,DyDv,DuDx,DuDy,DvDx,DvDy]=f_CircTrapzMapping(u,v,xP,yP,R,xc,yc)

th=atan2((yP(2)-yP(1)),(xP(2)-xP(1)));

rP=cos(th)*xP+sin(th)*yP;
tP=-sin(th)*xP+cos(th)*yP;
rc=cos(th)*xc+sin(th)*yc;
tc=-sin(th)*xc+cos(th)*yc;

[r,t,detJac,DrDu,DrDv,DtDu,DtDv,DuDr,DuDt,DvDr,DvDt]=f_CircTrapzMappingBase(u,v,rP,tP,R,rc,tc);

x=cos(th)*r-sin(th)*t;
y=sin(th)*r+cos(th)*t;

DxDu=cos(th)*DrDu-sin(th)*DtDu;
DxDv=cos(th)*DrDv-sin(th)*DtDv;

DyDu=sin(th)*DrDu+cos(th)*DtDu;
DyDv=sin(th)*DrDv+cos(th)*DtDv;

detJac=DxDu.*DyDv-DxDv.*DyDu;

DuDx=DyDv./detJac;
DuDy=-DxDv./detJac;
DvDx=-DyDu./detJac;
DvDy=DxDu./detJac;

return