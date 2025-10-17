function f_SweepFacesAlongNormal(oProject,activeDsgmnumFacesToDetach,lengthOfSweep)
oDesign = oProject.SetActiveDesign(activeDsg);
oEditor = oDesign.SetActiveEditor('3D Modeler');
invoke(oEditor,'SweepFacesAlongNormal',{'NAME:Selections', 'Selections:=', name, 'NewPartsModelFlag:=','Model'}, ...
    {'NAME:Parameters', {'NAME:SweepFaceAlongNormalToParameters', 'FacesToDetach:=', {numFacesToDetach}, 'LengthOfSweep:=', lengthOfSweep}});
end