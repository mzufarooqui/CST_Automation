function [Th3dB_H_p,Th3dB_E_p,Th3dB_0_H_p,Th3dB_0_E_p,D0,Dmax_H,Dmax_E,minD45_H,minD45_E,maxD145_H,maxD145_E,D45_H,D45_E,D180_H,D180_E] = f_GetAntennaParameters(VThetaHplane,VDirHplaneCo,VThetaEplane,VDirEplaneCo)
% 
% [Th3dB_H_p,Th3dB_H_m,Th3dB_E_p,Th3dB_E_m,D0,Dmax_H,Dmax_E,minD45_H,minD45_E,D45_H,D45_E,D180_H,D180_E] = f_GetAntennaParameters(VThetaHplane,VDirHplaneCo,VThetaEplane,VDirEplaneCo)
%
% This function evaluates the most significative parameters for an antenna.
%
% Input parameters:
%
% VThetaHplane, VThetaEplane : values of theta for the H-plane and E-plane
% respectively.
%
% VDirHplaneCo, VDirEplaneCo : magnitude (in dB) of the radiation pattern
% for the H-plane and the E-plane respectively. These values are evaluated
% in VThetaHplane, VThetaEplane points.
%

ind0_E=find(VThetaEplane==0);
ind0_H=find(VThetaHplane==0);

[Dmax_H,indMax_H]=max(VDirHplaneCo(ind0_H:end));
[Dmax_E,indMax_E]=max(VDirEplaneCo(ind0_E:end));

indMax_H=indMax_H+ind0_H-1;
indMax_E=indMax_E+ind0_E-1;

% this two should be exactly the same!
D0_E=VDirEplaneCo(ind0_E);
% D0_H=VDirEplaneCo(ind0_H);
D0=D0_E;

ind45_E=find(VThetaEplane==45);
ind45_H=find(VThetaHplane==45);
ind145_E=find(VThetaEplane==145);
ind145_H=find(VThetaHplane==145);
D45_E=VDirEplaneCo(ind45_E);
D45_H=VDirHplaneCo(ind45_H);

ind180_E=find(VThetaEplane==-180);
ind180_H=find(VThetaHplane==-180);
D180_E=VDirEplaneCo(ind180_E);
D180_H=VDirHplaneCo(ind180_H);

minD45_H=min(VDirHplaneCo(ind0_H:1:ind45_H));
minD45_E=min(VDirEplaneCo(ind0_E:1:ind45_E));

maxD145_H=max(VDirHplaneCo(ind145_H:end));
maxD145_E=max(VDirEplaneCo(ind145_E:end));

[ind_3dB_H]=find(VDirHplaneCo-(Dmax_H-3)<0);
[ind_3dB_E]=find(VDirEplaneCo-(Dmax_E-3)<0);

[ind_3dB_0_H]=find(VDirHplaneCo-(D0-3)<0);
[ind_3dB_0_E]=find(VDirEplaneCo-(D0-3)<0);

ind_3dB_H_p=find(ind_3dB_H>=indMax_H); ind_3dB_H_p=ind_3dB_H(ind_3dB_H_p);
ind_3dB_E_p=find(ind_3dB_E>=indMax_E); ind_3dB_E_p=ind_3dB_E(ind_3dB_E_p);

ind_3dB_0_H_p=find(ind_3dB_0_H>=indMax_H); ind_3dB_0_H_p=ind_3dB_0_H(ind_3dB_0_H_p);
ind_3dB_0_E_p=find(ind_3dB_0_E>=indMax_E); ind_3dB_0_E_p=ind_3dB_0_E(ind_3dB_0_E_p);

ind_3dB_H_p_1=min(ind_3dB_H_p);
ind_3dB_E_p_1=min(ind_3dB_E_p);
ind_3dB_0_H_p_1=min(ind_3dB_0_H_p);
ind_3dB_0_E_p_1=min(ind_3dB_0_E_p);

if VDirHplaneCo(ind_3dB_H_p_1)>Dmax_H-3
    ind_3dB_H_p_2=ind_3dB_H_p_1+1;
else
    ind_3dB_H_p_2=ind_3dB_H_p_1-1;
end

if VDirEplaneCo(ind_3dB_E_p_1)>Dmax_E-3
    ind_3dB_E_p_2=ind_3dB_E_p_1+1;
else
    ind_3dB_E_p_2=ind_3dB_E_p_1-1;
end

Th3dB_E_p=((Dmax_E-3)-VDirEplaneCo(ind_3dB_E_p_1))./(VDirEplaneCo(ind_3dB_E_p_2)-VDirEplaneCo(ind_3dB_E_p_1)).*(VThetaEplane(ind_3dB_E_p_2)-VThetaEplane(ind_3dB_E_p_1))+VThetaEplane(ind_3dB_E_p_1);
Th3dB_H_p=((Dmax_H-3)-VDirHplaneCo(ind_3dB_H_p_1))./(VDirHplaneCo(ind_3dB_H_p_2)-VDirHplaneCo(ind_3dB_H_p_1)).*(VThetaHplane(ind_3dB_H_p_2)-VThetaHplane(ind_3dB_H_p_1))+VThetaHplane(ind_3dB_H_p_1);

Th3dB_0_E_p=((D0-3)-VDirEplaneCo(ind_3dB_E_p_1))./(VDirEplaneCo(ind_3dB_E_p_2)-VDirEplaneCo(ind_3dB_E_p_1)).*(VThetaEplane(ind_3dB_E_p_2)-VThetaEplane(ind_3dB_E_p_1))+VThetaEplane(ind_3dB_E_p_1);
Th3dB_0_H_p=((D0-3)-VDirHplaneCo(ind_3dB_H_p_1))./(VDirHplaneCo(ind_3dB_H_p_2)-VDirHplaneCo(ind_3dB_H_p_1)).*(VThetaHplane(ind_3dB_H_p_2)-VThetaHplane(ind_3dB_H_p_1))+VThetaHplane(ind_3dB_H_p_1);

if isempty(Th3dB_E_p)==1
    Th3dB_E_p=NaN;
end
if isempty(Th3dB_H_p)==1
    Th3dB_H_p=NaN;
end

if isempty(Th3dB_0_E_p)==1
    Th3dB_0_E_p=NaN;
end
if isempty(Th3dB_0_H_p)==1
    Th3dB_0_H_p=NaN;
end

return
