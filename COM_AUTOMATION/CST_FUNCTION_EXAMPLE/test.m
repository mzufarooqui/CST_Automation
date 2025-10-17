% [farFieldData,Vfreq,mTheta,mPhi,mabs_Dir_dBi,...
%    mabs_Theta_dBi,mphase_Theta_Deg,mabs_Phi_dBi,mphase_Phi_Deg]=...
%    f_GetFarfields_GAversion(oMWS);

% pos_phi0deg=find(vphi==0);
%     Theta=mTheta(pos_phi0deg,indf);
for indf=1:9
    freq=Vfreq(indf);
    xx=mTheta(:,indf); Ntheta=length(unique(xx));
    yy=mPhi(:,indf);Nphi=length(unique(yy));
    
    Theta=reshape(xx,Ntheta,Nphi);
    Phi=reshape(yy,Ntheta,Nphi);
    EthetadBi=mabs_Theta_dBi(:,indf);
    EthetadBi=reshape(EthetadBi,Ntheta,Nphi);
    EphidBi=mabs_Phi_dBi(:,indf);
    EphidBi=reshape(EphidBi,Ntheta,Nphi);

    
    figure
    plot(Theta(Phi==90),EthetadBi(Phi==90),'b',Theta(Phi==0),EphidBi(Phi==0),'r')
    titles('freq %.1f ', Vfreq(indf));
    axis([-180 180 -20 20])
    grid on
%     figure,plot(Theta(Phi==0),EphidBi(Phi==0)),grid on
    
    figure
    mesh(Theta,Phi,EthetadBi)
    grid on
    disp('')
    
%         figure
%     mesh(Theta,Phi,EphidBi)
%     grid on
%     disp('')
end
