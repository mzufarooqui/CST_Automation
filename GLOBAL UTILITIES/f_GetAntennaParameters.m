function [Th3dB_H_p,Th3dB_E_p,Th3dB_0_H_p,Th3dB_0_E_p,D0,Dmax_H,Dmax_E,minD45_H,minD45_E,meanD90_H,meanD90_E,maxD145_H,maxD145_E,D45_H,D45_E,D180_H,D180_E] = f_GetAntennaParameters(VThetaHplane,VDirHplaneCo,VThetaEplane,VDirEplaneCo)
% 
% [Th3dB_H_p,Th3dB_E_p,Th3dB_0_H_p,Th3dB_0_E_p,D0,Dmax_H,Dmax_E,minD45_H,minD45_E,maxD145_H,maxD145_E,D45_H,D45_E,D180_H,D180_E] = f_GetAntennaParameters(VThetaHplane,VDirHplaneCo,VThetaEplane,VDirEplaneCo)
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
% Ver. 0.3
%
% Alberto Tibaldi - 30/10/2012

%-- Finding the vector index for theta=0
ind0_E=find(VThetaEplane==0);
ind0_H=find(VThetaHplane==0);

%-- Maximum directivity value and angle determination
[Dmax_H,indMax_H]=max(VDirHplaneCo(ind0_H:end));
[Dmax_E,indMax_E]=max(VDirEplaneCo(ind0_E:end));

indMax_H=indMax_H+ind0_H-1;
indMax_E=indMax_E+ind0_E-1;

%-- Directivity in theta=0 (the same in E and H-plane since we are in the
%   pole)
D0_E=VDirEplaneCo(ind0_E);
% D0_H=VDirEplaneCo(ind0_H);
D0=D0_E;

%-- Finding vector index for theta=45°, 145°.
ind45_E=find(VThetaEplane==45);
ind45_H=find(VThetaHplane==45);
ind90_E=find(VThetaEplane==90);
ind90_H=find(VThetaHplane==90);
ind145_E=find(VThetaEplane==145);
ind145_H=find(VThetaHplane==145);
D45_E=VDirEplaneCo(ind45_E);
D45_H=VDirHplaneCo(ind45_H);

%-- Finding vector index for theta=180°
ind180_E=find(VThetaEplane==-180);
ind180_H=find(VThetaHplane==-180);
D180_E=VDirEplaneCo(ind180_E);
D180_H=VDirHplaneCo(ind180_H);

%-- Finding the minimum directivity in the range 0<theta<45° (parameter fot
%   the determination of the beam width)
minD45_H=min(VDirHplaneCo(ind0_H:1:ind45_H));
minD45_E=min(VDirEplaneCo(ind0_E:1:ind45_E));

%-- Finding the maximum directivity in the range 145°<theta<180° (parameter
%   for the determination of a realistic front-to-back ratio)
maxD145_H=max(VDirHplaneCo(ind145_H:end));
maxD145_E=max(VDirEplaneCo(ind145_E:end));

%-- Finding the average directivity for theta>90° in each plane.
meanD90_H=mean(VDirHplaneCo(ind90_H:end));
meanD90_E=mean(VDirEplaneCo(ind90_E:end));

%-- Determination of the -3dB angle.
%-- The criterion for the determination of this angle is: the first point
%   of the radiation pattern which intersects the Dmax-3dB horizontal line,
%   AFTER Dmax

%-- Determination of the set of indexes where Dmax-3dB is less than 0
%   (points below the Dmax-3dB line), for H-plane and E-plane
[ind_3dB_H]=find(VDirHplaneCo-(Dmax_H-3)<0);
[ind_3dB_E]=find(VDirEplaneCo-(Dmax_E-3)<0);

%-- Determination of the set of indexes where D(0)-3dB is less than 0
%   (points below the D(0)-3dB line), for H-plane and E-plane
[ind_3dB_0_H]=find(VDirHplaneCo-(D0-3)<0);
[ind_3dB_0_E]=find(VDirEplaneCo-(D0-3)<0);

%-- Considering only angles greater than the Dmax angle (so their indexes)
ind_3dB_H_p=find(ind_3dB_H>=indMax_H); ind_3dB_H_p=ind_3dB_H(ind_3dB_H_p);
ind_3dB_E_p=find(ind_3dB_E>=indMax_E); ind_3dB_E_p=ind_3dB_E(ind_3dB_E_p);

ind_3dB_0_H_p=find(ind_3dB_0_H>=indMax_H); ind_3dB_0_H_p=ind_3dB_0_H(ind_3dB_0_H_p);
ind_3dB_0_E_p=find(ind_3dB_0_E>=indMax_E); ind_3dB_0_E_p=ind_3dB_0_E(ind_3dB_0_E_p);

%-- Considering the minimum index after the Dmax angle, so the first
%   Dmax-3dB point after theta_{Dmax}, H-plane and E-plane
ind_3dB_H_p_1=min(ind_3dB_H_p);
ind_3dB_E_p_1=min(ind_3dB_E_p);
ind_3dB_0_H_p_1=min(ind_3dB_0_H_p);
ind_3dB_0_E_p_1=min(ind_3dB_0_E_p);

%-- The "exact" angle is found by means of linear interpolation of the two
%   closest angles; therefore it is necessary to find their indexes...
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

%-- Linear interpolation formula: line passing through two points:
%   (y-y1)/(y2-y1) = (x-x1)/(x2-x1), x-axis is theta, y-axis is D(theta)
Th3dB_E_p=((Dmax_E-3)-VDirEplaneCo(ind_3dB_E_p_1))./(VDirEplaneCo(ind_3dB_E_p_2)-VDirEplaneCo(ind_3dB_E_p_1)).*(VThetaEplane(ind_3dB_E_p_2)-VThetaEplane(ind_3dB_E_p_1))+VThetaEplane(ind_3dB_E_p_1);
Th3dB_H_p=((Dmax_H-3)-VDirHplaneCo(ind_3dB_H_p_1))./(VDirHplaneCo(ind_3dB_H_p_2)-VDirHplaneCo(ind_3dB_H_p_1)).*(VThetaHplane(ind_3dB_H_p_2)-VThetaHplane(ind_3dB_H_p_1))+VThetaHplane(ind_3dB_H_p_1);

Th3dB_0_E_p=((D0-3)-VDirEplaneCo(ind_3dB_E_p_1))./(VDirEplaneCo(ind_3dB_E_p_2)-VDirEplaneCo(ind_3dB_E_p_1)).*(VThetaEplane(ind_3dB_E_p_2)-VThetaEplane(ind_3dB_E_p_1))+VThetaEplane(ind_3dB_E_p_1);
Th3dB_0_H_p=((D0-3)-VDirHplaneCo(ind_3dB_H_p_1))./(VDirHplaneCo(ind_3dB_H_p_2)-VDirHplaneCo(ind_3dB_H_p_1)).*(VThetaHplane(ind_3dB_H_p_2)-VThetaHplane(ind_3dB_H_p_1))+VThetaHplane(ind_3dB_H_p_1);

%-- Control: if the radiation pattern is too large, there may be no -3dB
%   point
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
