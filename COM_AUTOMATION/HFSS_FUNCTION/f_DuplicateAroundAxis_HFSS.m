function f_DuplicateAroundAxis_HFSS(oProject,activeDsg,name,rotAxis,angDeg,numClone)
oDesign       = oProject.SetActiveDesign(activeDsg);
oEditor       = oDesign.SetActiveEditor('3D Modeler');
oEditor.DuplicateAroundAxis({'NAME:Selections','Selections:=',name,'NewPartsModelFlag:=', 'Model'}, ...
    {'NAME:DuplicateAroundAxisParameters','CreateNewObjects:=',false,'WhichAxis:=',rotAxis,'AngleStr:=',[ num2str(angDeg) 'deg'],'NumClones:=',num2str(numClone)}, ...
    {'NAME:Options','DuplicateAssignments:=',false},{'CreateGroupsForNewObjects:=',false})
end