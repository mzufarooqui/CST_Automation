function f_SweepFacesAlongNormal_HFSS(oProject,activeDsg,linName,lenSwp,faceNum)
oDesign       = oProject.SetActiveDesign(activeDsg);
oEditor       = oDesign.SetActiveEditor('3D Modeler');
oEditor.SweepFacesAlongNormal({'NAME:Selections','Selections:=',linName,'NewPartsModelFlag:=','Model'}, ...
    {'NAME:Parameters',{'NAME:SweepFaceAlongNormalToParameters','FacesToDetach:=',{faceNum},'LengthOfSweep:=',[ num2str(lenSwp) 'mm']}});
end