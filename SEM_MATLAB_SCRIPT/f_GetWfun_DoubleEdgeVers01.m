function[wfun,wfun1Der_x,wfun1Der_y,CornerInfo]=f_GetWfun_DoubleEdgeVers01(xvet,yvet,CornerInfo,pAlpha,TypeMode)
% programma che valuta la funzione peso per un doppio edge

zvet=xvet+j*yvet;

wfun=ones(size(zvet));
wfun1Der_x=zeros(size(zvet));
wfun1Der_y=zeros(size(zvet));

NumCorner=size(CornerInfo,2);

% %---
% Alpha=pAlpha*pi/CornerInfo(1).delta;
% [wfun,wfun1Der_x,wfun1Der_y]=f_GetWfun_DoubleEdge(xvet,yvet,CornerInfo(1).z,CornerInfo(2).z,Alpha,Alpha,TypeMode);
% return


if(pAlpha~=0 & NumCorner~=0)
    for i=1:NumCorner
        RefAngle=CornerInfo(i).RefAngle;
        zvet_i=zvet-CornerInfo(i).z;
        rho=abs(zvet_i);
        phi=angle(exp(j*RefAngle)*zvet_i);

        switch CornerInfo(i).Rot
            case 'RHS'
                I=find(phi<-eps);phi(I)=phi(I)+2*pi; % mi fa girare in senso destrorso RHS
            case 'LHS'
                I=find(phi>0);phi(I)=phi(I)-2*pi; % mi fa girare in senso sinistrorso LHS
        end

        alpha=pAlpha*pi/CornerInfo(i).delta;

        switch TypeMode
            case 'TM'
                wfun_i=rho.^alpha.*sin(alpha*phi);
                wfun1Der_ui=alpha.*rho.^(alpha-1).*sin((alpha-1).*phi);
                wfun1Der_vi=alpha.*rho.^(alpha-1).*cos((alpha-1).*phi);
                %                 wfun_i=rho.^alpha.*exp(j*alpha*phi);
                %                 wfun1Der_ui=alpha.*rho.^(alpha-1).*exp(j*(alpha-1).*phi);
                %                 wfun1Der_vi=j*alpha.*rho.^(alpha-1).*exp(j*(alpha-1).*phi);


            case 'TE'
                wfun_i=rho.^alpha.*cos(alpha*phi);
                wfun1Der_ui=alpha.*rho.^(alpha-1).*cos((alpha-1).*phi);
                wfun1Der_vi=-alpha.*rho.^(alpha-1).*sin((alpha-1).*phi);

                %                 wfun_i=rho.^alpha.*exp(j*alpha*phi);
                %                 wfun1Der_ui=alpha.*rho.^(alpha-1).*exp(j*(alpha-1).*phi);
                %                 wfun1Der_vi=j*alpha.*rho.^(alpha-1).*exp(j*(alpha-1).*phi);
            otherwise
                error('unknown value for TypeMode')
        end
        wfun1Der_xi=cos(RefAngle)*wfun1Der_ui+sin(RefAngle)*wfun1Der_vi; %ok
        wfun1Der_yi=-sin(RefAngle)*wfun1Der_ui+cos(RefAngle)*wfun1Der_vi;


        CornerInfo(i).wfun=wfun_i;
        CornerInfo(i).wfun1Der_x=wfun1Der_xi;
        CornerInfo(i).wfun1Der_y=wfun1Der_yi;

    end
%         if(NumCorner==2)
%             wfun=CornerInfo(1).wfun.*CornerInfo(2).wfun;
%             wfun1Der_x=CornerInfo(1).wfun1Der_x.*CornerInfo(2).wfun+CornerInfo(1).wfun.*CornerInfo(2).wfun1Der_x;
%             wfun1Der_y=CornerInfo(1).wfun1Der_y.*CornerInfo(2).wfun+CornerInfo(1).wfun.*CornerInfo(2).wfun1Der_y;
%         else
%             wfun=CornerInfo(1).wfun;
%             wfun1Der_x=CornerInfo(1).wfun1Der_x;
%             wfun1Der_y=CornerInfo(1).wfun1Der_y;
%         end

    for k=1:NumCorner
        f=ones(size(zvet));
        for i=1:NumCorner
            if(i~=k)
                f=f.*CornerInfo(i).wfun;
            end
        end
        wfun=wfun.*CornerInfo(k).wfun;
        wfun1Der_x=wfun1Der_x+CornerInfo(k).wfun1Der_x.*f;
        wfun1Der_y=wfun1Der_y+CornerInfo(k).wfun1Der_y.*f;

    end

end
% wfunMAX=max(abs(wfun(:)));
% wfun=wfun./wfunMAX;
% wfun1Der_x=wfun1Der_x./wfunMAX;
% wfun1Der_y=wfun1Der_y./wfunMAX;


