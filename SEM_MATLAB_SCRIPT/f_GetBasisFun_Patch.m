
Abc=[];
xbc=[];
ybc=[];
funbc=[];

for indEdge=1:4
    PatchInfo(k).Edge(indEdge).fEspan=[];
    PatchInfo(k).Edge(indEdge).fEspan1Der_x=[];
    PatchInfo(k).Edge(indEdge).fEspan1Der_y=[];
    PatchInfo(k).Edge(indEdge).xvet=[];
    PatchInfo(k).Edge(indEdge).yvet=[];
end


%=== edge 1 ========================================================
EdgeIndex=1;
if(PatchInfo(k).PatchBC(EdgeIndex)~=0)
    NProiez=PatchInfo(k).Nu;%[];
    u=1/2*nodi+1/2; % in [0, 1]
    v=1e-10;  
    wu=1/2*pesi;
    wv=1/2;
    [v,u]=meshgrid(v,u);v=v(:).';u=u(:).';
    [wv,wu]=meshgrid(wv,wu);wv=wv(:).';wu=wu(:).';
    [x,y,fEspan,fEspan1Der_x,fEspan1Der_y,fEspan1Der_nu,wfun,wfun1Der_x,wfun1Der_y,fProiez,Weight]=f_EvalWeightedChebyshevPol(u,v,wu,wv,PatchInfo(k),CornerInfo,EdgeIndex,pAlpha,TypeMode,NProiez);
    
    %-- valutazione matrice di proiezione
    if(PatchInfo(k).PatchBC(EdgeIndex)==1)
        Abc_k=(conj(fProiez).*Weight)*fEspan.';
        funbc_k=fEspan;
    elseif(PatchInfo(k).PatchBC(EdgeIndex)==2)
        Abc_k=(conj(fProiez).*Weight)*fEspan1Der_nu.';
        funbc_k=fEspan1Der_nu;
    else
        Abc_k==[];
        funbc_k=[];
        PatchInfo(k).Edge(EdgeIndex).fEspan=fEspan;
        PatchInfo(k).Edge(EdgeIndex).fEspan1Der_x=fEspan1Der_x;
        PatchInfo(k).Edge(EdgeIndex).fEspan1Der_y=fEspan1Der_y;
        PatchInfo(k).Edge(EdgeIndex).xvet=x;
        PatchInfo(k).Edge(EdgeIndex).yvet=y;
    end
     
    Abc=[Abc; Abc_k];
    xbc=[xbc x];
    ybc=[ybc y];
    funbc=[funbc funbc_k];
end

%=== edge 2 ========================================================
EdgeIndex=2;
if(PatchInfo(k).PatchBC(EdgeIndex)~=0)
    NProiez=PatchInfo(k).Nv;%[];
    u=1-1e-10;  
    v=1/2*nodi+1/2; % in [0, 1]
    wu=1/2;
    wv=1/2*pesi;
    [v,u]=meshgrid(v,u);v=v(:).';u=u(:).';
    [wv,wu]=meshgrid(wv,wu);wv=wv(:).';wu=wu(:).';
    [x,y,fEspan,fEspan1Der_x,fEspan1Der_y,fEspan1Der_nu,wfun,wfun1Der_x,wfun1Der_y,fProiez,Weight]=f_EvalWeightedChebyshevPol(u,v,wu,wv,PatchInfo(k),CornerInfo,EdgeIndex,pAlpha,TypeMode,NProiez);
    
    %-- valutazione matrice di proiezione
    if(PatchInfo(k).PatchBC(EdgeIndex)==1)
        Abc_k=(conj(fProiez).*Weight)*fEspan.';
        funbc_k=fEspan;
    elseif(PatchInfo(k).PatchBC(EdgeIndex)==2)
        Abc_k=(conj(fProiez).*Weight)*fEspan1Der_nu.';
        funbc_k=fEspan1Der_nu;
    else
        Abc_k=[];
        funbc_k=[];
        PatchInfo(k).Edge(EdgeIndex).fEspan=fEspan;
        PatchInfo(k).Edge(EdgeIndex).fEspan1Der_x=fEspan1Der_x;
        PatchInfo(k).Edge(EdgeIndex).fEspan1Der_y=fEspan1Der_y;
        PatchInfo(k).Edge(EdgeIndex).xvet=x;
        PatchInfo(k).Edge(EdgeIndex).yvet=y;
    end
    
    Abc=[Abc; Abc_k];
    xbc=[xbc x];
    ybc=[ybc y];
    funbc=[funbc funbc_k];
end

%=== edge 3 ========================================================
EdgeIndex=3;
if(PatchInfo(k).PatchBC(EdgeIndex)~=0)
    NProiez=PatchInfo(k).Nu;%[];
    u=1/2*nodi+1/2; % in [0, 1]
    v=1-1e-10;  
    wu=1/2*pesi;
    wv=1/2;
    [v,u]=meshgrid(v,u);v=v(:).';u=u(:).';
    [wv,wu]=meshgrid(wv,wu);wv=wv(:).';wu=wu(:).';
    [x,y,fEspan,fEspan1Der_x,fEspan1Der_y,fEspan1Der_nu,wfun,wfun1Der_x,wfun1Der_y,fProiez,Weight]=f_EvalWeightedChebyshevPol(u,v,wu,wv,PatchInfo(k),CornerInfo,EdgeIndex,pAlpha,TypeMode,NProiez);
    
    %-- valutazione matrice di proiezione
    if(PatchInfo(k).PatchBC(EdgeIndex)==1)
        Abc_k=(conj(fProiez).*Weight)*fEspan.';
        funbc_k=fEspan;
    elseif(PatchInfo(k).PatchBC(EdgeIndex)==2)
        Abc_k=(conj(fProiez).*Weight)*fEspan1Der_nu.';
        funbc_k=fEspan1Der_nu;
    else
        Abc_k=[];
        funbc_k=[];
        PatchInfo(k).Edge(EdgeIndex).fEspan=fEspan;
        PatchInfo(k).Edge(EdgeIndex).fEspan1Der_x=fEspan1Der_x;
        PatchInfo(k).Edge(EdgeIndex).fEspan1Der_y=fEspan1Der_y;
        PatchInfo(k).Edge(EdgeIndex).xvet=x;
        PatchInfo(k).Edge(EdgeIndex).yvet=y;
    end
     
    Abc=[Abc; Abc_k];
    xbc=[xbc x];
    ybc=[ybc y];
    funbc=[funbc funbc_k];
end

%=== edge 4 ========================================================
EdgeIndex=4;
if(PatchInfo(k).PatchBC(EdgeIndex)~=0)
    NProiez=PatchInfo(k).Nv;[];
    u=1e-10;  
    v=1/2*nodi+1/2; % in [0, 1]
    wu=1/2;
    wv=1/2*pesi;
    [v,u]=meshgrid(v,u);v=v(:).';u=u(:).';
    [wv,wu]=meshgrid(wv,wu);wv=wv(:).';wu=wu(:).';
    [x,y,fEspan,fEspan1Der_x,fEspan1Der_y,fEspan1Der_nu,wfun,wfun1Der_x,wfun1Der_y,fProiez,Weight]=f_EvalWeightedChebyshevPol(u,v,wu,wv,PatchInfo(k),CornerInfo,EdgeIndex,pAlpha,TypeMode,NProiez);
    
    %-- valutazione matrice di proiezione
    if(PatchInfo(k).PatchBC(EdgeIndex)==1)
        Abc_k=(conj(fProiez).*Weight)*fEspan.';
        funbc_k=fEspan;
    elseif(PatchInfo(k).PatchBC(EdgeIndex)==2)
        Abc_k=(conj(fProiez).*Weight)*fEspan1Der_nu.';
        funbc_k=fEspan1Der_nu;
    else
        Abc_k=[];
        funbc_k=[];
        PatchInfo(k).Edge(EdgeIndex).fEspan=fEspan;
        PatchInfo(k).Edge(EdgeIndex).fEspan1Der_x=fEspan1Der_x;
        PatchInfo(k).Edge(EdgeIndex).fEspan1Der_y=fEspan1Der_y;
        PatchInfo(k).Edge(EdgeIndex).xvet=x;
        PatchInfo(k).Edge(EdgeIndex).yvet=y;
    end
    
    Abc=[Abc; Abc_k];
    xbc=[xbc x];
    ybc=[ybc y];
    funbc=[funbc funbc_k];
end

%-- calcolo SVD per trovare le funzioni che soddisfano le condizioni al contorno
if(length(Abc)>0)
    [U,S,V]=svd(Abc);
    S=diag(S);
    S=S/S(1);
    I=find(S<=Soglia1);
    if(length(I)~=0)
        ibeg=I(1);
    else
        ibeg=length(S)+1;
    end
    coeff_mn=V(:,ibeg:end);
    Nfun=size(coeff_mn,2);
else
    Nfun=PatchInfo(k).Ntot;
    coeff_mn=eye(Nfun,Nfun);
end


% figure(1)
% subplot(2,2,1),cla(gcf)
% plot(1:length(S),log10(S+eps),'bs-',[1,length(S)],log10([Soglia1 Soglia1]),'r--')
% title(['boundary condition: Nfun = ',num2str(Nfun)])
% xlabel('index')
% ylabel('singular value')
% grid on
% axis([-Inf Inf -16 1]) 

% %== grafico di controllo
% for indFun=1:Nfun     
%     
%     hFig=figure(2);cla(gca)
%     
%     xPlot=xbc;
%     yPlot=ybc;
%     
%     FunPlot=coeff_mn(:,indFun).'*funbc;
%     
%     plot3(xPlot,yPlot,real(FunPlot),'b.',xPlot,yPlot,imag(FunPlot),'r.')
%     grid on
%     axis tight
%     title(['ind = ',num2str(indFun),' out of ',num2str(Nfun)]);
%     xlabel('x')
%     ylabel('y')
%     pause
% end


%=== ortonormalizzazione
u=1/2*nodi+1/2;
wu=1/2*pesi;
Nquad_u=length(u);
nu=Nquad_u;

v=1/2*nodi+1/2;
wv=1/2*pesi;
Nquad_v=length(v);
nv=Nquad_v;

[v,u]=meshgrid(v,u);u=u(:).';v=v(:).';
[wv,wu]=meshgrid(wv,wu);wu=wu(:).';wv=wv(:).';

NProiez=[];
EdgeIndex=[];
[x,y,fEspan,fEspan1Der_x,fEspan1Der_y,fEspan1Der_nu,wfun,wfun1Der_x,wfun1Der_y,fProiez,Weight]=f_EvalWeightedChebyshevPol(u,v,wu,wv,PatchInfo(k),CornerInfo,EdgeIndex,pAlpha,TypeMode,NProiez);

%-- calcolo integrali
IntProiez=(conj(fEspan).*Weight)*fEspan.';
IntProiez2Der=-(conj(fEspan1Der_x.*Weight)*fEspan1Der_x.'+conj(fEspan1Der_y.*Weight)*fEspan1Der_y.');

Aoc=coeff_mn'*IntProiez*coeff_mn;

% %-- calcolo SVD per trovare le funzioni che soddisfano la condizione di ortonormalita'
% [U,S,V]=svd(Aoc);
% S=diag(S);
% I=find(S./S(1)>=Soglia2);
% U=U(:,I)./sqrt((ones(Nfun,1)*S(I).'));
% coeff_mn=coeff_mn*U;
% Nfun=length(I);
% 
% figure(1)
% subplot(2,2,2),cla(gcf)
% plot(1:length(S),log10(S/S(1)),'bs-',[1,length(S)],log10([Soglia2 Soglia2]),'r--')
% title(['orthonormalization: Nfun = ',num2str(Nfun)])
% xlabel('index')
% ylabel('singular value')
% grid on
% axis([-Inf Inf -16 1]) 

% %---- calcolo funzioni modali
% Aeig=zeros(Nfun,Nfun);
% Beig=zeros(Nfun,Nfun);
% 
% Aeig=-coeff_mn'*IntProiez2Der*coeff_mn;
% Beig=coeff_mn'*IntProiez*coeff_mn;
% 
% [V,D] = eig(Aeig);
% kt=sqrt(diag(real(D)));
% [kt,I]=sort(kt);
% V=V(:,I);
% coeff_mn=coeff_mn*V;
% Nfun=size(V,2);



%%%
PatchInfo(k).Nfun=Nfun;
PatchInfo(k).coeff_mn=coeff_mn;
PatchInfo(k).IntProiez=IntProiez;
PatchInfo(k).IntProiez2Der=IntProiez2Der;
PatchInfo(k).nu=nu;
PatchInfo(k).nv=nv;
PatchInfo(k).x=x;
PatchInfo(k).y=y;
PatchInfo(k).Weight=Weight;
PatchInfo(k).fEspan=fEspan;
PatchInfo(k).fEspan1Der_x=fEspan1Der_x;
PatchInfo(k).fEspan1Der_y=fEspan1Der_y;
PatchInfo(k).wfun=wfun(1,:);
PatchInfo(k).wfun1Der_x=wfun1Der_x(1,:);
PatchInfo(k).wfun1Der_y=wfun1Der_y(1,:);

xPlot=reshape(x,nu,nv);
yPlot=reshape(y,nu,nv);

return
for ind=1:5;Nfun;
    f=coeff_mn(:,ind).'*fEspan;
    fPlot=reshape(f,nu,nv);

    figure(2),
    %subplot(2,2,4)
    cla(gcf);
    %hLi=line([xP],[yP]);
    view([-45 45]);
    %set(hLi,'Marker','s','Color','r','LineWidth',2)
    hold on
    surfc(xPlot,yPlot,abs(fPlot))
    grid on
    xlabel('x')
    ylabel('y')
    pause
end

