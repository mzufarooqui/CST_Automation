function[T]=f_TgenCircAperVers01(GuideCirc,GuideGen,PatchIndex,Aperture)
% tutti gli integrali si riferiscono solo alla parte della regione 2 corrispondente ai patch considerati:
% eventuali fattori per la simmetria della struttura o per modi somma/differenza vanno aggiunti;
% gli integrali si riferiscono gia' ai modi della guida Gen normalizzati ad 1 su tutta la regione 2
% Il flag Aperture definisce chi è l'apertura: se = 'Cir' => è la guida Circ 

NumPatch=length(PatchIndex);
NumTEmodesGen=GuideGen.TEmodes.NumModes;
NumTMmodesGen=GuideGen.TMmodes.NumModes;

a=GuideCirc.R;
xo=GuideCirc.xo;
yo=GuideCirc.yo;
th=GuideCirc.RotAngle;
NumTEmodesCirc=GuideCirc.NumTEmodes;
NumTMmodesCirc=GuideCirc.NumTMmodes;

%--- matrici di proiezione

%--- calcolo matrice di proiez. T_TETE
T_TETE=0;

% info modi TE guida Gen
ktGen=GuideGen.TEmodes.kt;

% info modi TE guida Circ
mvet=GuideCirc.TEmodes.mvet;
ktCirc=GuideCirc.TEmodes.kt;
chip=GuideCirc.TEmodes.chip;

for ind=1:NumPatch;
    indPatch=PatchIndex(ind);

    xvet=GuideGen.TEmodes.PatchInfo(indPatch).x;
    yvet=GuideGen.TEmodes.PatchInfo(indPatch).y;
    Weight=GuideGen.TEmodes.PatchInfo(indPatch).Weight;

    x0=cos(th)*(xvet-xo)+sin(th)*(yvet-yo);
    y0=-sin(th)*(xvet-xo)+cos(th)*(yvet-yo);
    [phi,rho]=cart2pol(x0,y0);

    % modi guida Gen
    fEspan=GuideGen.TEmodes.PatchInfo(indPatch).fEspan;
    coeff_mn=0.5*GuideGen.TEmodes.PatchInfo(indPatch).coeff_mn; % vedere appunti per fattore 0.5

    % modi guida Circ
    Epsm=2*ones(size(mvet));I=find(mvet==0);Epsm(I)=ones(size(I));
    Cmn=(sqrt(Epsm/pi).*chip./sqrt(chip.^2-mvet.^2)/a./besselj(mvet,chip))*ones(size(xvet));
    PsiCirc=Cmn.*besselj(mvet*ones(size(xvet)),(chip/a)*rho).*cos(mvet*phi);

    A=conj(fEspan.*(ones(size(fEspan,1),1)*Weight))*PsiCirc.';
    A=(coeff_mn'*A);
    if(Aperture=='Cir')
        T_TETE=T_TETE+((1./ktGen)*ktCirc').*A;
    else
        T_TETE=T_TETE+((1./ktCirc)*ktGen.').*A';
    end
    
%     xPl=reshape(xvet,GuideGen.TEmodes.PatchInfo(indPatch).nu,GuideGen.TEmodes.PatchInfo(indPatch).nv);
%     yPl=reshape(yvet,GuideGen.TEmodes.PatchInfo(indPatch).nu,GuideGen.TEmodes.PatchInfo(indPatch).nv);
%     zPl=reshape(PsiCirc(1,:),GuideGen.TEmodes.PatchInfo(indPatch).nu,GuideGen.TEmodes.PatchInfo(indPatch).nv);
%     
%     figure(100),hold on
%     surfc(xPl,yPl,zPl)
%     grid on
end

%--- calcolo matrice di proiez. T_TMTM
T_TMTM=0;

% info modi TM guida Gen
ktGen=GuideGen.TMmodes.kt;

% info modi TM guida Circ
mvet=GuideCirc.TMmodes.mvet;
ktCirc=GuideCirc.TMmodes.kt;
chi=GuideCirc.TMmodes.chi;

for ind=1:NumPatch;
    indPatch=PatchIndex(ind);

    xvet=GuideGen.TMmodes.PatchInfo(indPatch).x;
    yvet=GuideGen.TMmodes.PatchInfo(indPatch).y;
    Weight=GuideGen.TMmodes.PatchInfo(indPatch).Weight;

    x0=cos(th)*(xvet-xo)+sin(th)*(yvet-yo);
    y0=-sin(th)*(xvet-xo)+cos(th)*(yvet-yo);
    [phi,rho]=cart2pol(x0,y0);

    % modi guida Gen
    fEspan=GuideGen.TMmodes.PatchInfo(indPatch).fEspan;
    coeff_mn=0.5*GuideGen.TMmodes.PatchInfo(indPatch).coeff_mn; % vedere appunti per fattore 0.5

    % modi guida Circ
    Epsm=2*ones(size(mvet));I=find(mvet==0);Epsm(I)=ones(size(I));
    Cmn=(sqrt(Epsm/pi)/a./besselj(mvet+1,chi))*ones(size(xvet));
    PhiCirc=Cmn.*besselj(mvet*ones(size(xvet)),(chi/a)*rho).*sin(mvet*phi);

    A=conj(fEspan.*(ones(size(fEspan,1),1)*Weight))*PhiCirc.';
    A=(coeff_mn'*A);
    if(Aperture=='Cir')
        T_TMTM=T_TMTM+(ktGen*(1./ktCirc.')).*A;
    else
        T_TMTM=T_TMTM+(ktCirc*(1./ktGen.')).*A';
    end
    
    
%     xPl=reshape(xvet,GuideGen.TEmodes.PatchInfo(indPatch).nu,GuideGen.TEmodes.PatchInfo(indPatch).nv);
%     yPl=reshape(yvet,GuideGen.TEmodes.PatchInfo(indPatch).nu,GuideGen.TEmodes.PatchInfo(indPatch).nv);
%     zPl=reshape(PhiCirc(1,:),GuideGen.TEmodes.PatchInfo(indPatch).nu,GuideGen.TEmodes.PatchInfo(indPatch).nv);
%     
%     figure(101),hold on
%     surfc(xPl,yPl,zPl)
%     grid on
end

%--- calcolo matrice di proiez. T_TMTE
T_TMTE=0;

if(Aperture=='Cir')
    % info modi TM guida Gen
    ktGen=GuideGen.TMmodes.kt;

    % info modi TE guida Circ
    mvet=GuideCirc.TEmodes.mvet;
    ktCirc=GuideCirc.TEmodes.kt;
    chip=GuideCirc.TEmodes.chip;

    for ind=1:NumPatch;
        indPatch=PatchIndex(ind);

        xvet=GuideGen.TMmodes.PatchInfo(indPatch).x;
        yvet=GuideGen.TMmodes.PatchInfo(indPatch).y;
        Weight=GuideGen.TMmodes.PatchInfo(indPatch).Weight;

        x0=cos(th)*(xvet-xo)+sin(th)*(yvet-yo);
        y0=-sin(th)*(xvet-xo)+cos(th)*(yvet-yo);
        [phi,rho]=cart2pol(x0,y0);

        % modi guida Gen
        fEspan1Der_x=GuideGen.TMmodes.PatchInfo(indPatch).fEspan1Der_x;
        fEspan1Der_y=GuideGen.TMmodes.PatchInfo(indPatch).fEspan1Der_y;
        coeff_mn=0.5*GuideGen.TMmodes.PatchInfo(indPatch).coeff_mn; % vedere appunti per fattore 0.5

        % modi guida Circ
        Epsm=2*ones(size(mvet));I=find(mvet==0);Epsm(I)=ones(size(I));

        Cmn=-(sqrt(Epsm/pi).*chip.*mvet./sqrt(chip.^2-mvet.^2)/a./besselj(mvet,chip))*ones(size(xvet));
        PsiCircDer_phi=Cmn.*besselj(mvet*ones(size(xvet)),(chip/a)*rho).*sin(mvet*phi);

        Cmn=(sqrt(Epsm/pi).*chip.^2./sqrt(chip.^2-mvet.^2)/a^2./besselj(mvet,chip))*ones(size(xvet));
        PsiCircDer_rho=Cmn.*besselj_Derz(mvet*ones(size(xvet)),(chip/a)*rho).*cos(mvet*phi);

        PsiCircDer_x0=(ones(size(mvet))*cos(phi)).*PsiCircDer_rho-(ones(size(mvet))*(sin(phi)./rho)).*PsiCircDer_phi;
        PsiCircDer_y0=(ones(size(mvet))*sin(phi)).*PsiCircDer_rho+(ones(size(mvet))*(cos(phi)./rho)).*PsiCircDer_phi;
        
        PsiCircDer_x=cos(th)*PsiCircDer_x0-sin(th)*PsiCircDer_y0;
        PsiCircDer_y=sin(th)*PsiCircDer_x0+cos(th)*PsiCircDer_y0;

        A=conj(fEspan1Der_x.*(ones(size(fEspan1Der_x,1),1)*Weight))*PsiCircDer_y.'...
            -conj(fEspan1Der_y.*(ones(size(fEspan1Der_y,1),1)*Weight))*PsiCircDer_x.';
        A=(coeff_mn'*A);
        T_TMTE=T_TMTE+(1./(ktGen*ktCirc.')).*A;
    end
else
    % info modi TE guida Gen
    ktGen=GuideGen.TEmodes.kt;

    % info modi TM guida Circ
    mvet=GuideCirc.TMmodes.mvet;
    ktCirc=GuideCirc.TMmodes.kt;
    chi=GuideCirc.TMmodes.chi;

    for ind=1:NumPatch;
        indPatch=PatchIndex(ind);

        xvet=GuideGen.TEmodes.PatchInfo(indPatch).x;
        yvet=GuideGen.TEmodes.PatchInfo(indPatch).y;
        Weight=GuideGen.TEmodes.PatchInfo(indPatch).Weight;

        x0=cos(th)*(xvet-xo)+sin(th)*(yvet-yo);
        y0=-sin(th)*(xvet-xo)+cos(th)*(yvet-yo);
        [phi,rho]=cart2pol(x0,y0);

        % modi guida Gen
        fEspan1Der_x=GuideGen.TEmodes.PatchInfo(indPatch).fEspan1Der_x;
        fEspan1Der_y=GuideGen.TEmodes.PatchInfo(indPatch).fEspan1Der_y;
        coeff_mn=0.5*GuideGen.TEmodes.PatchInfo(indPatch).coeff_mn; % vedere appunti per fattore 0.5

        % modi guida Circ
        Epsm=2*ones(size(mvet));I=find(mvet==0);Epsm(I)=ones(size(I));

        Cmn=(sqrt(Epsm/pi).*mvet./a./besselj(mvet+1,chi))*ones(size(xvet));
        PhiCircDer_phi=Cmn.*besselj(mvet*ones(size(xvet)),(chi/a)*rho).*cos(mvet*phi);

        Cmn=(sqrt(Epsm/pi).*chi/a^2./besselj(mvet+1,chi))*ones(size(xvet));
        PhiCircDer_rho=Cmn.*besselj_Derz(mvet*ones(size(xvet)),(chi/a)*rho).*sin(mvet*phi);

        PhiCircDer_x0=(ones(size(mvet))*cos(phi)).*PhiCircDer_rho-(ones(size(mvet))*(sin(phi)./rho)).*PhiCircDer_phi;
        PhiCircDer_y0=(ones(size(mvet))*sin(phi)).*PhiCircDer_rho+(ones(size(mvet))*(cos(phi)./rho)).*PhiCircDer_phi;
        
        PhiCircDer_x=cos(th)*PhiCircDer_x0-sin(th)*PhiCircDer_y0;
        PhiCircDer_y=sin(th)*PhiCircDer_x0+cos(th)*PhiCircDer_y0;

        A=conj(fEspan1Der_y.*(ones(size(fEspan1Der_y,1),1)*Weight))*PhiCircDer_x.'...
            -conj(fEspan1Der_x.*(ones(size(fEspan1Der_x,1),1)*Weight))*PhiCircDer_y.';
        A=(coeff_mn'*A);
        T_TMTE=T_TMTE+(1./(ktCirc*ktGen.')).*A';
        
%         xPl=reshape(xvet,GuideGen.TEmodes.PatchInfo(indPatch).nu,GuideGen.TEmodes.PatchInfo(indPatch).nv);
%     yPl=reshape(yvet,GuideGen.TEmodes.PatchInfo(indPatch).nu,GuideGen.TEmodes.PatchInfo(indPatch).nv);
%     zPl=reshape(PhiCircDer_y(1,:),GuideGen.TEmodes.PatchInfo(indPatch).nu,GuideGen.TEmodes.PatchInfo(indPatch).nv);
%     
%     figure(102),hold on
%     surfc(xPl,yPl,abs(zPl))
%     grid on
    end

end


%--- calcolo matrice di proiez. T_TETM
if(Aperture=='Cir')
    T_TETM=zeros(NumTEmodesGen,NumTMmodesCirc);
else
    T_TETM=zeros(NumTEmodesCirc,NumTMmodesGen);
end


%--- matrice di proiezione complessiva
T=[T_TETE T_TETM; T_TMTE T_TMTM];

return
