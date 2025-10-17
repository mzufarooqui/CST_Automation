function[x,y,fEspan,fEspan1Der_x,fEspan1Der_y,fEspan1Der_nu,wfun,wfun1Der_x,wfun1Der_y,fProiez,Weight]=f_EvalWeightedChebyshevPol(u,v,wu,wv,PatchInfo,CornerInfo,EdgeIndex,pAlpha,TypeMode,NProiez)

Nu=PatchInfo.Nu;
Nv=PatchInfo.Nv;
Ntot=Nu*Nv;

m=0:Nu-1;
n=0:Nv-1;
[M,N]=meshgrid(m,n);M=M(:);N=N(:);

hFig=[]; 
nu_angle=[];

if(PatchInfo.Type==0)
    [x,y,detJac,DxDu,DxDv,DyDu,DyDv,DuDx,DuDy,DvDx,DvDy]=f_TrapzMapping(u,v,PatchInfo.Geom.px,PatchInfo.Geom.py);
    if(length(EdgeIndex)>0)
        nu_angle=(PatchInfo.Geom.phie(EdgeIndex)-pi/2)*ones(1,length(u));
    end
elseif(PatchInfo.Type==1 || PatchInfo.Type==2)
    [x,y,detJac,DxDu,DxDv,DyDu,DyDv,DuDx,DuDy,DvDx,DvDy]=f_CircTrapzMapping(u,v,PatchInfo.Geom.px,PatchInfo.Geom.py,PatchInfo.R,PatchInfo.xc,PatchInfo.yc);
    if(length(EdgeIndex)>0)
        nu_angle=(PatchInfo.Geom.phie(EdgeIndex)-pi/2)*ones(1,length(u));
        if(EdgeIndex==2 && isinf(PatchInfo.R(2))==0)
            z=x+j*y;
            zc2=PatchInfo.xc(2)+j*PatchInfo.yc(2);
            nu_angle=angle(z-zc2);
        elseif(EdgeIndex==4 && isinf(PatchInfo.R(4))==0)
            z=x+j*y;
            zc4=PatchInfo.xc(4)+j*PatchInfo.yc(4);
            nu_angle=angle(-(z-zc4));
        end
    end
else
    error('Unknown value for PatchInfo.Type')
end

if(PatchInfo.Type==2)
    [r,t,detJacSW,DrDu,DrDv,DtDu,DtDv,DuDr,DuDt,DvDr,DvDt]=f_TrapzMapping(u,v,PatchInfo.Geom.pr,PatchInfo.Geom.pt);
    DrDx=DrDu.*DuDx+DrDv.*DvDx;
    DtDx=DtDu.*DuDx+DtDv.*DvDx;
    DrDy=DrDu.*DuDy+DrDv.*DvDy;
    DtDy=DtDu.*DuDy+DtDv.*DvDy;
end


%-- polinomi di Chebyshev di 1 e 2 specie
thu=acos(2*(u-1/2));
thv=acos(2*(v-1/2));

Tm=cos(M*thu);
Tn=cos(N*thv);
Um=sin(M*thu)./sin(ones(Ntot,1)*thu);
Un=sin(N*thv)./sin(ones(Ntot,1)*thv);

%-- derivate prime dei polinomi nell'intervallo [-1, 1]
Tm1Der=(M*ones(size(u))).*Um;
Tn1Der=(N*ones(size(v))).*Un;

%-- funzione peso e sue derivate
if(PatchInfo.Type==0 || PatchInfo.Type==1)
    if(size(CornerInfo,2)>0)
        [wfun,wfun1Der_x,wfun1Der_y,CornerInfo]=f_GetWfun_DoubleEdgeVers01(x,y,CornerInfo(PatchInfo.Corners),pAlpha,TypeMode);
    else
        [wfun,wfun1Der_x,wfun1Der_y,CornerInfo]=f_GetWfun_DoubleEdgeVers01(x,y,CornerInfo,pAlpha,TypeMode);
    end
    wfun=ones(Ntot,1)*wfun;
    wfun1Der_x=ones(Ntot,1)*wfun1Der_x;
    wfun1Der_y=ones(Ntot,1)*wfun1Der_y;
elseif(PatchInfo.Type==2)
    if(size(CornerInfo,2)>0)
        [wfun,wfun1Der_r,wfun1Der_t,CornerInfo]=f_GetWfun_DoubleEdgeVers01(r,t,CornerInfo(PatchInfo.Corners),pAlpha,TypeMode);
    else
        [wfun,wfun1Der_r,wfun1Der_t,CornerInfo]=f_GetWfun_DoubleEdgeVers01(r,t,CornerInfo,pAlpha,TypeMode);
    end
    wfun=ones(Ntot,1)*wfun;
    wfun1Der_r=ones(Ntot,1)*wfun1Der_r;
    wfun1Der_t=ones(Ntot,1)*wfun1Der_t;
    wfun1Der_x=((ones(Ntot,1)*DrDx).*wfun1Der_r+(ones(Ntot,1)*DtDx).*wfun1Der_t);
    wfun1Der_y=((ones(Ntot,1)*DrDy).*wfun1Der_r+(ones(Ntot,1)*DtDy).*wfun1Der_t);
end

%-- funzioni di espansione
Tmn=Tm.*Tn;
fEspan=Tmn.*wfun;

%-- derivate prime delle funzioni di espansione 
Tmn1Der_u=(2*Tm1Der).*Tn;   % derivata rispetto a u definita tra [0 e 1] => fattore *2
Tmn1Der_v=Tm.*(2*Tn1Der); % derivata rispetto a v definita tra [0 e 1] => fattore *2
Tmn1Der_x=((ones(Ntot,1)*DuDx).*Tmn1Der_u+(ones(Ntot,1)*DvDx).*Tmn1Der_v);
Tmn1Der_y=((ones(Ntot,1)*DuDy).*Tmn1Der_u+(ones(Ntot,1)*DvDy).*Tmn1Der_v);
fEspan1Der_x=wfun.*Tmn1Der_x+Tmn.*wfun1Der_x;
fEspan1Der_y=wfun.*Tmn1Der_y+Tmn.*wfun1Der_y;
if(length(EdgeIndex)>0)
    fEspan1Der_nu=(ones(Ntot,1)*cos(nu_angle)).*fEspan1Der_x+(ones(Ntot,1)*sin(nu_angle)).*fEspan1Der_y;
else
    fEspan1Der_nu=[];
end

%-- valutazione funzioni di proiezione
if(length(NProiez)>0)
    pProiez=[0:1:NProiez-1].';
    switch EdgeIndex
        case 1
            fProiez=cos(pProiez*thu);
        case 2
            fProiez=cos(pProiez*thv);
        case 3
            fProiez=cos(pProiez*thu);
        case 4
            fProiez=cos(pProiez*thv);
    end
else
    NProiez=Ntot;
    fProiez=fEspan;
end

Weight=ones(NProiez,1)*(wu.*wv.*detJac);

wfun=wfun(1,:);
wfun1Der_x=wfun1Der_x(1,:);
wfun1Der_y=wfun1Der_y(1,:);

return
