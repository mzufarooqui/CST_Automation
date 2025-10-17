function f_DuplicateAlongLine_HFSS(oProject,activeDsg,partName,xyzComp,numClone)
oDesign = oProject.SetActiveDesign(activeDsg);
oEditor = oDesign.SetActiveEditor('3D Modeler');
oEditor.DuplicateAlongLine({'NAME:Selections','Selections:=',partName,'NewPartsModelFlag:=','Model'}, ... 
	{'NAME:DuplicateToAlongLineParameters','CreateNewObjects:=',true,'XComponent:=',[ num2str(xyzComp(1)) 'mm'],'YComponent:=',[ num2str(xyzComp(2)) 'mm'],'ZComponent:=',[ num2str(xyzComp(3)) 'mm'],'NumClones:=',numClone}, ...
	{'NAME:Options','DuplicateAssignments:=', false},{'CreateGroupsForNewObjects:=',false})

% oEditor.DuplicateAlongLine({'NAME:Selections', 'Selections:=', partName, 'NewPartsModelFlag:=','Model'}, ...
%     {'NAME:DuplicateToAlongLineParameters', 'CreateNewObjects:=', false, 'XComponent:=',xyzComp{1}, 'YComponent:=', xyzComp{2}, 'ZComponent:=', xyzComp{3}, 'NumClones:=', num2str(numClone)}, ...
%     {'NAME:Options', 'DuplicateAssignments:=',false})
end

% 
% 
% invoke(oEditor,'DuplicateMirror',{'NAME:Selections', 'Selections:=', partName, 'NewPartsModelFlag:=',  ...
%     'Model'}, {'NAME:DuplicateToMirrorParameters', 'DuplicateMirrorBaseX:=', { num2str(vBase(1)) '0mm'}, 'DuplicateMirrorBaseY:=',  ...
%     { num2str(vBase(2)) '0mm'}, 'DuplicateMirrorBaseZ:=', { num2str(vBase(3)) '0mm'}, 'DuplicateMirrorNormalX:=', { num2str(vNormal(1)) '0mm'}, 'DuplicateMirrorNormalY:=',  ...
%     { num2str(vNormal(2)) '0mm'}, 'DuplicateMirrorNormalZ:=', { num2str(vNormal(3)) '0mm'}}, {'NAME:Options', 'DuplicateAssignments:=', false});
% end
% 
% oEditor.DuplicateAlongLine({'NAME:Selections', 'Selections:=', 'FeedUCon', 'NewPartsModelFlag:=','Model'}, ...
%     {'NAME:DuplicateToAlongLineParameters', 'CreateNewObjects:=', false, 'XComponent:=','0mm', 'YComponent:=', '29.9835mm', 'ZComponent:=', '0mm', 'NumClones:=', '4'}, ...
%     {'NAME:Options', 'DuplicateAssignments:=',false})
%   
%   
%   
%   oEditor.DuplicateAlongLine Array('NAME:Selections', 'Selections:=', 'FeedUCon', 'NewPartsModelFlag:=',  _
%   'Model'), Array('NAME:DuplicateToAlongLineParameters', 'CreateNewObjects:=', false, 'XComponent:=',  _
%   '0mm', 'YComponent:=', '29.9835mm', 'ZComponent:=', '0mm', 'NumClones:=', '4'), Array('NAME:Options', 'DuplicateAssignments:=',  _
%   false)
