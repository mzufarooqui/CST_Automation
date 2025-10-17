function f_InsertFarFieldSphereSetup(oProject,spName,thetaRangeDeg,phiRangeDeg)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('RadField');
invoke(oModule,'InsertFarFieldSphereSetup', {['NAME:' spName], 'UseCustomRadiationSurface:=',  ...
    false, 'ThetaStart:=', [ num2str(thetaRangeDeg(1)) 'deg'], 'ThetaStop:=', [ num2str(thetaRangeDeg(2)) 'deg'], 'ThetaStep:=', [ num2str(thetaRangeDeg(3)) 'deg'], ...
    'PhiStart:=', [ num2str(phiRangeDeg(1)) 'deg'], 'PhiStop:=', [ num2str(phiRangeDeg(2)) 'deg'], 'PhiStep:=', [ num2str(phiRangeDeg(3)) 'deg'], 'UseLocalCS:=', false});
end

