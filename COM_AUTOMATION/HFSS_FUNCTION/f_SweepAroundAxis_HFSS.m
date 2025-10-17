function f_SweepAroundAxis_HFSS(oProject,activeDsg,name,draftAngDeg,draftType,swpAxis,swpAngDeg,numSeg)
oDesign       = oProject.SetActiveDesign(activeDsg);
oEditor       = oDesign.SetActiveEditor('3D Modeler');
oEditor.SweepAroundAxis({'NAME:Selections','Selections:=',name,'NewPartsModelFlag:=','Model'}, ... 
	{'NAME:AxisSweepParameters','DraftAngle:=',draftAngDeg,'DraftType:=',draftType,'CheckFaceFaceIntersection:=',false,'SweepAxis:=',swpAxis,'SweepAngle:=',[ num2str(swpAngDeg) 'deg'],'NumOfSegments:=',num2str(numSeg)});
end



