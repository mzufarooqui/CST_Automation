

for k=1:NumPatch
    f_GetBasisFun_Patch
end

f_GetCC


%-- calcolo SVD per trovare le funzioni che soddisfano le condizioni di raccordo
if(size(Arc,1)>0)

    [U,S,V]=svd(Arc);
    S=diag(S);
    S=S/S(1);
    I=find(S<=Soglia1);
    if(length(I)~=0)
        ibeg=I(1);
    else
        ibeg=length(S)+1;
    end
    V=V(:,ibeg:end);
else
    Nfun=0;
    for k=1:NumPatch
        Nfun=Nfun+PatchInfo(k).Nfun;
    end
    V=eye(Nfun);
end

for k=1:NumPatch
    if(k==1)
        I=1:PatchInfo(k).Nfun;
    else
        I=I(end)+[1:PatchInfo(k).Nfun];
    end
    PatchInfo(k).coeff_mn=PatchInfo(k).coeff_mn*V(I,:);
    PatchInfo(k).Nfun=size(PatchInfo(k).coeff_mn,2);
end
Nfun=PatchInfo(1).Nfun;

return % da ri-imporre

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
% subplot(2,2,2),cla(gcf)
% plot(1:length(S),log10(S/S(1)),'bs-',[1,length(S)],log10([Soglia2 Soglia2]),'r--')
% title(['orthonormalization: Nfun = ',num2str(Nfun)])
% xlabel('index')
% ylabel('singular value')
% grid on
% axis([-Inf Inf -16 1])


%return

%---- calcolo funzioni modali
Aeig=zeros(Nfun,Nfun);
Beig=zeros(Nfun,Nfun);
for k=1:NumPatch
    Aeig_k=-PatchInfo(k).coeff_mn'*PatchInfo(k).IntProiez2Der*PatchInfo(k).coeff_mn;
    Beig_k=PatchInfo(k).coeff_mn'*PatchInfo(k).IntProiez*PatchInfo(k).coeff_mn;
    Aeig=Aeig+Aeig_k;
    Beig=Beig+Beig_k;
end

[V,D] = eig(Aeig);
kt=sqrt(diag(real(D)));
[kt,I]=sort(kt);
V=V(:,I);
for k=1:NumPatch
    PatchInfo(k).coeff_mn=PatchInfo(k).coeff_mn*V;
    PatchInfo(k).Nfun=size(V,2);
end
Nfun=PatchInfo(1).Nfun;

for ind=1:Nfun

    hFig=figure(k+3);cla(gca)
    %set(hFig,'Position',[4   278   560   420]);
    set(hFig,'Position',[-3 33 1024 673]);
    for k=1:NumPatch
        %---regione Dk
        x=reshape(PatchInfo(k).x,PatchInfo(k).nu,PatchInfo(k).nv);
        y=reshape(PatchInfo(k).y,PatchInfo(k).nu,PatchInfo(k).nv);

        fEspan_mn=PatchInfo(k).coeff_mn(:,ind).'*PatchInfo(k).fEspan;%PatchInfo(k).wfun1Der_y;%
        fEspan_mn=reshape(fEspan_mn,PatchInfo(k).nu,PatchInfo(k).nv);

        surfc(x,y,abs(fEspan_mn))
        grid on
        hold on
    end
    axis tight
    title(['ind = ',num2str(ind),' out of ',num2str(Nfun)]);
    xlabel('x')
    ylabel('y')
    %view([75,45]);

    hold off
    pause
end