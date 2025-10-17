function f_InsertFarFieldSphereSetup_HFSS(oProject,name,phiDeg,thetaDeg,bCustRadSurf,faceList)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('RadField');
if bCustRadSurf
invoke(oModule,'InsertFarFieldSphereSetup',{['NAME:' name], 'UseCustomRadiationSurface:=',bCustRadSurf,'CustomRadiationSurface:=', faceList, 'ThetaStart:=', [ num2str(thetaDeg(1)) 'deg'], 'ThetaStop:=', [ num2str(thetaDeg(2)) 'deg'], 'ThetaStep:=', [ num2str(thetaDeg(3)) 'deg'], 'PhiStart:=',...
    [ num2str(phiDeg(1)) 'deg'], 'PhiStop:=', [ num2str(phiDeg(2)) 'deg'], 'PhiStep:=', [ num2str(phiDeg(3)) 'deg'], 'UseLocalCS:=', false});
else
    invoke(oModule,'InsertFarFieldSphereSetup',{['NAME:' name], 'UseCustomRadiationSurface:=',bCustRadSurf, 'ThetaStart:=', [ num2str(thetaDeg(1)) 'deg'], 'ThetaStop:=', [ num2str(thetaDeg(2)) 'deg'], 'ThetaStep:=', [ num2str(thetaDeg(3)) 'deg'], 'PhiStart:=',...
    [ num2str(phiDeg(1)) 'deg'], 'PhiStop:=', [ num2str(phiDeg(2)) 'deg'], 'PhiStep:=', [ num2str(phiDeg(3)) 'deg'], 'UseLocalCS:=', false});
end
% invoke(oModule,'InsertFarFieldSphereSetup',{['NAME:' name], 'UseCustomRadiationSurface:=', true, 'CustomRadiationSurface:=', 'radFace', 'ThetaStart:=', '-18deg', 'ThetaStop:=','180deg', 'ThetaStep:=', '1deg', 'PhiStart:=', '0deg', 'PhiStop:=', '360deg', 'PhiStep:=','1deg', 'UseLocalCS:=', false})
end


% 
% oModule.InsertFarFieldSphereSetup({'NAME:Infinite Sphere1', 'UseCustomRadiationSurface:=',  ...
%   true, 'CustomRadiationSurface:=', 'radFace', 'ThetaStart:=', '-18deg', 'ThetaStop:=',  ...
%   '180deg', 'ThetaStep:=', '1deg', 'PhiStart:=', '0deg', 'PhiStop:=', '360deg', 'PhiStep:=',  ...
%   '1deg', 'UseLocalCS:=', false})