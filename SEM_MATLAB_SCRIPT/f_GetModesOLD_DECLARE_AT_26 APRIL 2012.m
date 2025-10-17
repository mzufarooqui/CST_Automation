
global Soglia1 Soglia2
global FigGeomOption FigModePlotOption

Soglia1=1e-7;
Soglia2=1e-12;
coeff_r=0.45;

eval(InData_file);

if(TypeMode=='TM' & NumCorner>0)
    % ho verificato che porre per i TM pAlpha=[1,2,3] conduce
    % ad un deterioramento della convergenza: occorre mettere nel set anche
    % le funzioni di base senza alcuna funzione peso => pAlpha=[0,1,2].
    % Difatto ho verificato che porre anche pAlpha=2 non porta ad una
    % modifica delle curve, per cui basta mettere pAlpha=[0, 1]
    pAlpha1=0;0;
    pAlpha2=1;1;
    pAlpha3=0;2; 
elseif(TypeMode=='TE' & NumCorner>0)
    % nel caso dei TE pAlpha contiene sempre il valore 1 ed inoltre il
    % miglior compromesso tra convergenza e complessità si ha per 
    % pAlpha=[0, 1]
    pAlpha1=0;0;
    pAlpha2=1;1;
    pAlpha3=0;2;
else
    pAlpha1=0;
    pAlpha2=0;
    pAlpha3=0;
end

Nquad=Nuv+10;
[nodi,pesi]=quadad('legen',1,Nquad,0,0);
[nodi,I]=sort(nodi);
pesi=pesi(I);

%---definizione funzioni di espansione
%- pAlpha1
PatchInfo_aux=PatchInfo;

pAlpha=pAlpha1;
f_GetBasisFun_SinglepAlpha
PatchInfo_p1=PatchInfo;

%- pAlpha2 & pAlpha3
if((pAlpha2~=pAlpha1) | (pAlpha3~=pAlpha1))

    if(pAlpha2==pAlpha1)
        pAlpha2=pAlpha3;
        pAlpha3=pAlpha1;
    end

    PatchInfo=PatchInfo_aux;
    pAlpha=pAlpha2;
    f_GetBasisFun_SinglepAlpha
    PatchInfo_p2=PatchInfo;

    if(pAlpha3~=pAlpha1 & pAlpha3~=pAlpha2)
        PatchInfo=PatchInfo_aux;
        pAlpha=pAlpha3;
        f_GetBasisFun_SinglepAlpha
        PatchInfo_p3=PatchInfo;
    end
end
PatchInfo=PatchInfo_aux;

%--- unione funzioni di espansione con diversi pesi
for k=1:NumPatch

    if((pAlpha2==pAlpha1) & (pAlpha3==pAlpha2))

        Nfun=PatchInfo_p1(k).Nfun;
        coeff_mn=PatchInfo_p1(k).coeff_mn;
        fEspan=PatchInfo_p1(k).fEspan;
        fEspan1Der_x=PatchInfo_p1(k).fEspan1Der_x;
        fEspan1Der_y=PatchInfo_p1(k).fEspan1Der_y;
        Weight=PatchInfo_p1(k).Weight;
        IntProiez=PatchInfo_p1(k).IntProiez;
        IntProiez2Der=PatchInfo_p1(k).IntProiez2Der;

        for indEdge=1:4
            Edge(indEdge).fEspan=PatchInfo_p1(k).Edge(indEdge).fEspan;
            Edge(indEdge).fEspan1Der_x=PatchInfo_p1(k).Edge(indEdge).fEspan1Der_x;
            Edge(indEdge).fEspan1Der_y=PatchInfo_p1(k).Edge(indEdge).fEspan1Der_y;
            Edge(indEdge).yvet=PatchInfo_p1(k).Edge(indEdge).yvet;

        end


    elseif((pAlpha2~=pAlpha1) & (pAlpha3==pAlpha1))
        Nfun_p1=PatchInfo_p1(k).Nfun;
        coeff_mn_p1=PatchInfo_p1(k).coeff_mn;

        Nfun_p2=PatchInfo_p2(k).Nfun;
        coeff_mn_p2=PatchInfo_p2(k).coeff_mn;

        Weight=PatchInfo_p1(k).Weight;

        fEspan_p1=PatchInfo_p1(k).fEspan;
        fEspan1Der_x_p1=PatchInfo_p1(k).fEspan1Der_x;
        fEspan1Der_y_p1=PatchInfo_p1(k).fEspan1Der_y;

        fEspan_p2=PatchInfo_p2(k).fEspan;
        fEspan1Der_x_p2=PatchInfo_p2(k).fEspan1Der_x;
        fEspan1Der_y_p2=PatchInfo_p2(k).fEspan1Der_y;

        IntProiez_11=PatchInfo_p1(k).IntProiez;
        IntProiez_22=PatchInfo_p2(k).IntProiez;
        IntProiez_21=conj(fEspan_p2.*Weight)*fEspan_p1.';
        IntProiez=[IntProiez_11 IntProiez_21'; IntProiez_21 IntProiez_22];

        IntProiez2Der_11=PatchInfo_p1(k).IntProiez2Der;
        IntProiez2Der_22=PatchInfo_p2(k).IntProiez2Der;
        IntProiez2Der_21=-(conj(fEspan1Der_x_p2.*Weight)*fEspan1Der_x_p1.'+conj(fEspan1Der_y_p2.*Weight)*fEspan1Der_y_p1.');
        IntProiez2Der=[IntProiez2Der_11 IntProiez2Der_21'; IntProiez2Der_21 IntProiez2Der_22];

        fEspan=[fEspan_p1; fEspan_p2];
        fEspan1Der_x=[fEspan1Der_x_p1; fEspan1Der_x_p2];
        fEspan1Der_y=[fEspan1Der_y_p1; fEspan1Der_y_p2];
        coeff_mn=[coeff_mn_p1 zeros(size(coeff_mn_p2)); zeros(size(coeff_mn_p1)) coeff_mn_p2];

        for indEdge=1:4
            Edge(indEdge).fEspan=[PatchInfo_p1(k).Edge(indEdge).fEspan; PatchInfo_p2(k).Edge(indEdge).fEspan];
            Edge(indEdge).fEspan1Der_x=[PatchInfo_p1(k).Edge(indEdge).fEspan1Der_x; PatchInfo_p2(k).Edge(indEdge).fEspan1Der_x];
            Edge(indEdge).fEspan1Der_y=[PatchInfo_p1(k).Edge(indEdge).fEspan1Der_y; PatchInfo_p2(k).Edge(indEdge).fEspan1Der_y];
            Edge(indEdge).xvet=[PatchInfo_p1(k).Edge(indEdge).xvet; PatchInfo_p2(k).Edge(indEdge).xvet];
            Edge(indEdge).yvet=[PatchInfo_p1(k).Edge(indEdge).yvet; PatchInfo_p2(k).Edge(indEdge).yvet];

        end

        Nfun=Nfun_p1+Nfun_p2;
    else
        Nfun_p1=PatchInfo_p1(k).Nfun;
        coeff_mn_p1=PatchInfo_p1(k).coeff_mn;

        Nfun_p2=PatchInfo_p2(k).Nfun;
        coeff_mn_p2=PatchInfo_p2(k).coeff_mn;

        Nfun_p3=PatchInfo_p3(k).Nfun;
        coeff_mn_p3=PatchInfo_p3(k).coeff_mn;

        Weight=PatchInfo_p1(k).Weight;

        fEspan_p1=PatchInfo_p1(k).fEspan;
        fEspan1Der_x_p1=PatchInfo_p1(k).fEspan1Der_x;
        fEspan1Der_y_p1=PatchInfo_p1(k).fEspan1Der_y;

        fEspan_p2=PatchInfo_p2(k).fEspan;
        fEspan1Der_x_p2=PatchInfo_p2(k).fEspan1Der_x;
        fEspan1Der_y_p2=PatchInfo_p2(k).fEspan1Der_y;

        fEspan_p3=PatchInfo_p3(k).fEspan;
        fEspan1Der_x_p3=PatchInfo_p3(k).fEspan1Der_x;
        fEspan1Der_y_p3=PatchInfo_p3(k).fEspan1Der_y;

        IntProiez_11=PatchInfo_p1(k).IntProiez;
        IntProiez_22=PatchInfo_p2(k).IntProiez;
        IntProiez_33=PatchInfo_p3(k).IntProiez;
        IntProiez_21=conj(fEspan_p2.*Weight)*fEspan_p1.';
        IntProiez_31=conj(fEspan_p3.*Weight)*fEspan_p1.';
        IntProiez_32=conj(fEspan_p3.*Weight)*fEspan_p2.';

        IntProiez=[IntProiez_11 IntProiez_21' IntProiez_31';...
            IntProiez_21 IntProiez_22 IntProiez_32';...
            IntProiez_31 IntProiez_32 IntProiez_33];

        IntProiez2Der_11=PatchInfo_p1(k).IntProiez2Der;
        IntProiez2Der_22=PatchInfo_p2(k).IntProiez2Der;
        IntProiez2Der_33=PatchInfo_p3(k).IntProiez2Der;
        IntProiez2Der_21=-(conj(fEspan1Der_x_p2.*Weight)*fEspan1Der_x_p1.'+conj(fEspan1Der_y_p2.*Weight)*fEspan1Der_y_p1.');
        IntProiez2Der_31=-(conj(fEspan1Der_x_p3.*Weight)*fEspan1Der_x_p1.'+conj(fEspan1Der_y_p3.*Weight)*fEspan1Der_y_p1.');
        IntProiez2Der_32=-(conj(fEspan1Der_x_p3.*Weight)*fEspan1Der_x_p2.'+conj(fEspan1Der_y_p3.*Weight)*fEspan1Der_y_p2.');

        IntProiez2Der=[IntProiez2Der_11 IntProiez2Der_21' IntProiez2Der_31';...
            IntProiez2Der_21 IntProiez2Der_22 IntProiez2Der_32';...
            IntProiez2Der_31 IntProiez2Der_32 IntProiez2Der_33];


        fEspan=[fEspan_p1; fEspan_p2; fEspan_p3];
        fEspan1Der_x=[fEspan1Der_x_p1; fEspan1Der_x_p2; fEspan1Der_x_p3];
        fEspan1Der_y=[fEspan1Der_y_p1; fEspan1Der_y_p2; fEspan1Der_y_p3];
        coeff_mn=[coeff_mn_p1 zeros(size(coeff_mn_p2)) zeros(size(coeff_mn_p3));...
            zeros(size(coeff_mn_p1)) coeff_mn_p2 zeros(size(coeff_mn_p3));...
            zeros(size(coeff_mn_p1)) zeros(size(coeff_mn_p2)) coeff_mn_p3];

        for indEdge=1:4
            Edge(indEdge).fEspan=[PatchInfo_p1(k).Edge(indEdge).fEspan; PatchInfo_p2(k).Edge(indEdge).fEspan; PatchInfo_p3(k).Edge(indEdge).fEspan];
            Edge(indEdge).fEspan1Der_x=[PatchInfo_p1(k).Edge(indEdge).fEspan1Der_x; PatchInfo_p2(k).Edge(indEdge).fEspan1Der_x; PatchInfo_p3(k).Edge(indEdge).fEspan1Der_x];
            Edge(indEdge).fEspan1Der_y=[PatchInfo_p1(k).Edge(indEdge).fEspan1Der_y; PatchInfo_p2(k).Edge(indEdge).fEspan1Der_y; PatchInfo_p3(k).Edge(indEdge).fEspan1Der_y];
            Edge(indEdge).xvet=[PatchInfo_p1(k).Edge(indEdge).xvet; PatchInfo_p2(k).Edge(indEdge).xvet; PatchInfo_p3(k).Edge(indEdge).xvet];
            Edge(indEdge).yvet=[PatchInfo_p1(k).Edge(indEdge).yvet; PatchInfo_p2(k).Edge(indEdge).yvet; PatchInfo_p3(k).Edge(indEdge).yvet];

        end
        Nfun=Nfun_p1+Nfun_p2+Nfun_p3;
    end


    PatchInfo(k).Nfun=Nfun;
    PatchInfo(k).coeff_mn=coeff_mn;
    PatchInfo(k).fEspan=fEspan;
    PatchInfo(k).fEspan1Der_x=fEspan1Der_x;
    PatchInfo(k).fEspan1Der_y=fEspan1Der_y;
    PatchInfo(k).Weight=Weight(1,:); % memorizzo solo una volta il peso
    PatchInfo(k).IntProiez=IntProiez;
    PatchInfo(k).IntProiez2Der=IntProiez2Der;
    PatchInfo(k).Edge=Edge;

    PatchInfo(k).x=PatchInfo_p1(k).x;
    PatchInfo(k).y=PatchInfo_p1(k).y;
    PatchInfo(k).nu=PatchInfo_p1(k).nu;
    PatchInfo(k).nv=PatchInfo_p1(k).nv;

end

%------ ortonormalizzazione
Aoc=zeros(Nfun,Nfun);
for k=1:NumPatch
    Aoc_k=PatchInfo(k).coeff_mn'*PatchInfo(k).IntProiez*PatchInfo(k).coeff_mn;
    Aoc=Aoc+Aoc_k;
end

%-- calcolo SVD per trovare le funzioni che soddisfano la condizione di ortonormalita'
[U,S,V]=svd(Aoc);
S=diag(S);
I=find(S>=Soglia2*S(1));
U=U(:,I)./sqrt((ones(Nfun,1)*S(I).'));
for k=1:NumPatch
    PatchInfo(k).coeff_mn=PatchInfo(k).coeff_mn*U;
    PatchInfo(k).Nfun=size(PatchInfo(k).coeff_mn,2);
end
Nfun=PatchInfo(1).Nfun;

% figure(1)
% subplot(2,2,4),cla(gcf)
% plot(1:length(S),log10(S/S(1)),'bs-',[1,length(S)],log10([Soglia2 Soglia2]),'r--')
% title(['orthonormalization: Nfun = ',num2str(Nfun)])
% xlabel('index')
% ylabel('singular value')
% grid on
% axis([-Inf Inf -16 1])

Aeig=zeros(Nfun,Nfun);
Beig=zeros(Nfun,Nfun);
for k=1:NumPatch
    Aeig_k=-PatchInfo(k).coeff_mn'*PatchInfo(k).IntProiez2Der*PatchInfo(k).coeff_mn;
    Beig_k=PatchInfo(k).coeff_mn'*PatchInfo(k).IntProiez*PatchInfo(k).coeff_mn;
    Aeig=Aeig+Aeig_k;
    Beig=Beig+Beig_k;
end

kt=[];
%---- calcolo funzioni modali
[V,D] = eig(Aeig);
kt=sqrt(diag(real(D)));
[kt,I]=sort(kt);
if(kt(1)<kt(2)*1e-4); I=I(2:end); kt=kt(2:end); end
V=V(:,I);
for k=1:NumPatch
    PatchInfo(k).coeff_mn=PatchInfo(k).coeff_mn*V;
    PatchInfo(k).Nfun=size(V,2);
end
Nfun=PatchInfo(1).Nfun;

%%%% imposizione segno dei modi
xvet=PatchInfo(1).x;
yvet=PatchInfo(1).y;
Weight=PatchInfo(1).Weight;

fEspan=PatchInfo(1).fEspan;
coeff_mn=PatchInfo(1).coeff_mn; 
Psi1=coeff_mn.'*fEspan;

SignInfo=Weight*Psi1.';
SignVett=sign(SignInfo);
for k=1:NumPatch
    PatchInfo(k).coeff_mn=PatchInfo(k).coeff_mn.*(ones(size(PatchInfo(k).coeff_mn,1),1)*SignVett); 
end


Aeig=zeros(Nfun,Nfun);
Beig=zeros(Nfun,Nfun);
for k=1:NumPatch
    Aeig_k=-PatchInfo(k).coeff_mn'*PatchInfo(k).IntProiez2Der*PatchInfo(k).coeff_mn;
    Beig_k=PatchInfo(k).coeff_mn'*PatchInfo(k).IntProiez*PatchInfo(k).coeff_mn;
    Aeig=Aeig+Aeig_k;
    Beig=Beig+Beig_k;
end

%=== definizione matrici di sistema =====
TGradHxGradHx=Aeig;
THxHx=Beig;

%-- grafico modi
if(FigModePlotOption==1)
    
    Nx=0;
    Ny=0;
    for k=1:NumPatch
        Nx=Nx+PatchInfo(k).nu;
        Ny=Ny+PatchInfo(k).nv;
    end
    
    for ind=1:10;Nfun;
        X=NaN*ones(Nx,Ny);
        Y=NaN*ones(Nx,Ny);
        F=NaN*ones(Nx,Ny);
        
        hFig=figure(k+3);cla(gca)
        %set(hFig,'Position',[4   278   560   420]);
        %set(hFig,'Position',[-3 33 1024 673]);
        indr=0;
        indc=0;
        for k=1:NumPatch
            %---regione Dk
            x=reshape(PatchInfo(k).x,PatchInfo(k).nu,PatchInfo(k).nv);
            y=reshape(PatchInfo(k).y,PatchInfo(k).nu,PatchInfo(k).nv);
            
            f=PatchInfo(k).coeff_mn(:,ind).'*PatchInfo(k).fEspan;%PatchInfo_p2(k).wfun1Der_x;%
            f=reshape(f,PatchInfo(k).nu,PatchInfo(k).nv);
            
            %         surfc(x,y,real(f))
            %         grid on
            %         hold on
            
            X(indr+1:indr+PatchInfo(k).nu,indc+1:indc+PatchInfo(k).nv)=x;
            Y(indr+1:indr+PatchInfo(k).nu,indc+1:indc+PatchInfo(k).nv)=y;
            F(indr+1:indr+PatchInfo(k).nu,indc+1:indc+PatchInfo(k).nv)=f;
            indr=indr+PatchInfo(k).nu;
            indc=indc+PatchInfo(k).nv;
        end
        surfc(X,Y,(F))
        view([75,45]);
        
        %        contour(X,Y,abs(F),51)
        %        grid on
        hold on
        axis tight
        title(['ind = ',num2str(ind),' out of ',num2str(Nfun)]);
        xlabel('x')
        ylabel('y')
        
        
        hold off
        pause
    end
end
