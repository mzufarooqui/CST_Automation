
% queste istruzioni permettono di introdurre nodi solo per la valutazione
% delle condizioni di raccordo
% NquadCC=50;
% [nodiCC,pesiCC]=quadad('legen',1,NquadCC,0,0);
% [nodiCC,I]=sort(nodiCC);
% pesiCC=pesiCC(I);
% altrimenti:
NquadCC=Nquad;
nodiCC=nodi;
pesiCC=pesi;



Arc=[];
Ntot=0;for k=1:NumPatch;Ntot=Ntot+PatchInfo(k).Nfun;end

EpsPos=1e-10; % posizione dove si valuta la condizione al contorno

%==== definizione condizioni di continuita': 
for indCC=1:size(CCInfo,1)
    
    %=== Patch k1 e EdgeIndex1
    k1=CCInfo(indCC,1);
    EdgeIndex1=CCInfo(indCC,2);

    switch EdgeIndex1
        case 1
            u=1/2*nodiCC+1/2; % in [0, 1]
            v=EpsPos;
            wu=1/2*pesiCC;
            wv=1/2;
            [v,u]=meshgrid(v,u);v=v(:).';u=u(:).';
            [wv,wu]=meshgrid(wv,wu);wv=wv(:).';wu=wu(:).';
            NProiez1=PatchInfo(k1).Nu;
        case 2
            u=1-EpsPos;
            v=1/2*nodiCC+1/2; % in [0, 1];
            wu=1/2;
            wv=1/2*pesiCC;
            [v,u]=meshgrid(v,u);v=v(:).';u=u(:).';
            [wv,wu]=meshgrid(wv,wu);wv=wv(:).';wu=wu(:).';
            NProiez1=PatchInfo(k1).Nv;
        case 3
            u=1/2*nodiCC+1/2; % in [0, 1]
            v=1-EpsPos;
            wu=1/2*pesiCC;
            wv=1/2;
            [v,u]=meshgrid(v,u);v=v(:).';u=u(:).';
            [wv,wu]=meshgrid(wv,wu);wv=wv(:).';wu=wu(:).';
            NProiez1=PatchInfo(k1).Nu;
        case 4
            u=EpsPos;
            v=1/2*nodiCC+1/2; % in [0, 1];
            wu=1/2;
            wv=1/2*pesiCC;
            [v,u]=meshgrid(v,u);v=v(:).';u=u(:).';
            [wv,wu]=meshgrid(wv,wu);wv=wv(:).';wu=wu(:).';
            NProiez1=PatchInfo(k1).Nv;
    end
    u1=u;
    v1=v;
    wu1=wu;
    wv1=wv;
  
    
    
    %=== Patch k2 e EdgeIndex2
    k2=CCInfo(indCC,3);
    EdgeIndex2=CCInfo(indCC,4);

    switch EdgeIndex2
        case 1
            u=1/2*nodiCC+1/2; % in [0, 1]
            v=EpsPos;
            wu=1/2*pesiCC;
            wv=1/2;
            [v,u]=meshgrid(v,u);v=v(:).';u=u(:).';
            [wv,wu]=meshgrid(wv,wu);wv=wv(:).';wu=wu(:).';
            NProiez2=PatchInfo(k2).Nu;
        case 2
            u=1-EpsPos;
            v=1/2*nodiCC+1/2; % in [0, 1];
            wu=1/2;
            wv=1/2*pesiCC;
            [v,u]=meshgrid(v,u);v=v(:).';u=u(:).';
            [wv,wu]=meshgrid(wv,wu);wv=wv(:).';wu=wu(:).';
            NProiez2=PatchInfo(k2).Nv;
        case 3
            u=1/2*nodiCC+1/2; % in [0, 1]
            v=1-EpsPos;
            wu=1/2*pesiCC;
            wv=1/2;
            [v,u]=meshgrid(v,u);v=v(:).';u=u(:).';
            [wv,wu]=meshgrid(wv,wu);wv=wv(:).';wu=wu(:).';
            NProiez2=PatchInfo(k2).Nu;
        case 4
            u=EpsPos;
            v=1/2*nodiCC+1/2; % in [0, 1];
            wu=1/2;
            wv=1/2*pesiCC;
            [v,u]=meshgrid(v,u);v=v(:).';u=u(:).';
            [wv,wu]=meshgrid(wv,wu);wv=wv(:).';wu=wu(:).';
            NProiez2=PatchInfo(k2).Nv;
    end
    u2=u;
    v2=v;
    wu2=wu;
    wv2=wv;
        
    NProiez=max([NProiez1 NProiez2]);
                 
    %-- valutazione matrice di proiezione su Patch k1 Edge EdgeIndex1
    [x,y,fEspan,fEspan1Der_x,fEspan1Der_y,fEspan1Der_nu,wfun,wfun1Der_x,wfun1Der_y,fProiez,Weight]=f_EvalWeightedChebyshevPol(u1,v1,wu1,wv1,PatchInfo(k1),CornerInfo,EdgeIndex1,pAlpha,TypeMode,NProiez);
    
    Weight=ones(NProiez,1)*pesiCC;
    
    A1=(fProiez.*Weight)*fEspan.';
    A1=A1*PatchInfo(k1).coeff_mn;

    B1=(fProiez.*Weight)*fEspan1Der_nu.';
    B1=B1*PatchInfo(k1).coeff_mn;

    B1x=(fProiez.*Weight)*fEspan1Der_x.';
    B1x=B1x*PatchInfo(k1).coeff_mn;

    B1y=(fProiez.*Weight)*fEspan1Der_y.';
    B1y=B1y*PatchInfo(k1).coeff_mn;
    
    
    %-- valutazione matrice di proiezione su Patch k2 Edge EdgeIndex2
    [x,y,fEspan,fEspan1Der_x,fEspan1Der_y,fEspan1Der_nu,wfun,wfun1Der_x,wfun1Der_y,fProiez_dummy,Weight_dummy]=f_EvalWeightedChebyshevPol(u2,v2,wu2,wv2,PatchInfo(k2),CornerInfo,EdgeIndex2,pAlpha,TypeMode,[]);

    %if(abs(EdgeIndex1-EdgeIndex2)<=1);
%     if(EdgeIndex1==EdgeIndex2)
%         fProiez=fliplr(fProiez);
%         Weight=fliplr(Weight);
%     end
    
    if(EdgeIndex1==1 & (EdgeIndex2==1 | EdgeIndex2==2))
        fProiez=fliplr(fProiez);
        Weight=fliplr(Weight);
    end
    
    if(EdgeIndex1==2 & (EdgeIndex2==1 | EdgeIndex2==2))
        fProiez=fliplr(fProiez);
        Weight=fliplr(Weight);
    end
    
    if(EdgeIndex1==3 & (EdgeIndex2==3 | EdgeIndex2==4))
        fProiez=fliplr(fProiez);
        Weight=fliplr(Weight);
    end
    
    if(EdgeIndex1==4 & (EdgeIndex2==3 | EdgeIndex2==4))
        fProiez=fliplr(fProiez);
        Weight=fliplr(Weight);
    end
    
    %-- valutazione matrice di proiezione
    A2=(fProiez.*Weight)*fEspan.';
    A2=A2*PatchInfo(k2).coeff_mn;

    B2=(fProiez.*Weight)*fEspan1Der_nu.';
    B2=B2*PatchInfo(k2).coeff_mn;

    B2x=(fProiez.*Weight)*fEspan1Der_x.';
    B2x=B2x*PatchInfo(k2).coeff_mn;

    B2y=(fProiez.*Weight)*fEspan1Der_y.';
    B2y=B2y*PatchInfo(k2).coeff_mn;
    
   
    
    A=zeros(NProiez,Ntot);
    B=zeros(NProiez,Ntot);
    Bx=zeros(NProiez,Ntot);
    By=zeros(NProiez,Ntot);
    J1=0;for k=1:k1-1;J1=J1+PatchInfo(k).Nfun;end
    J1=[1:PatchInfo(k1).Nfun]+J1;

    J2=0;for k=1:k2-1;J2=J2+PatchInfo(k).Nfun;end
    J2=[1:PatchInfo(k2).Nfun]+J2;
    
    A(:,J1)=[A1];
    A(:,J2)=-[A2];
    B(:,J1)=[B1];
    B(:,J2)=-[B2];
    Bx(:,J1)=[B1x];
    Bx(:,J2)=-[B2x];
    By(:,J1)=[B1y];
    By(:,J2)=-[B2y];
    
    
    %ho verificato che imporre la continuità delle derivate in x & in y oppure
    %nella sola direzione normale conduce ad un deterioramento della
    %convergenza, come facevo con l'istruzione:
    %Arc=[Arc; [A; Bx; By]];
    
    % BISOGNA IMPORRE SOLO LA CONTINUITA' DLLE FUNZIONI E NON ANCHE DI
    % QUALCHE LORO DERIVATA !!!! 
    % Quindi l'istruzione corretta e' la seguente:
    Arc=[Arc; A]; % NON TOCCARE PIU'
    
end
    


