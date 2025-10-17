function status = f_RotateShape(oMWS,component,name,angleVector,origin,centerVector,repetitions,shape)
%% ROTATE SHAPE
% # If shape name is empty it will rotate the whole component 
%   Pay attention to define the origin
%% DEFINATION
%  angleVector
%         Sets the rotation angle in degrees around the respective axis. The working coordinate system will be used, if activated. Use in case of rotate transformation only.
%  origin
%         origin could be: 'ShapeCenter', 'CommonCenter', 'Free'. For scale, rotate and mirror transformations, this method defines, whether the origin for the transformation should be the shape center, the center of all named shapes (see .AddName), or a free point defined by the .Center method.
%  centerVector:
%         Sets the center for scale, rotate and mirror transformations. The working coordinate system will be used, if activated. Only applicable, if .Origin is set to "free".
%  repetitions:
%         Defines the number of repetitions, the transformation will be applied to the selected object.
%% EXAMPLE:
% status = f_RotateShape(oMWS,component,name,angleVector,origin,centerVector,repetitions)
% status = f_RotateShape(oMWS,'component1','solid1',[0 0 2],'ShapeCenter',[0 0 0],1)
%% MATLAB SCRIPT

if repetitions
    bMultipleObjects = 'True';% If switch is True, the new solid will be copied and the original will remain untouched. Else (copy = False), the original object will be deleted. In case of repeated execution by usage of the .Repetitions method, copy = True will result in number new objects plus the original object.
elseif( repetitions == 0)
    bMultipleObjects = 'False';% If switch is True, the new solid will be copied and the original will remain untouched. Else (copy = False), the original object will be deleted. In case of repeated execution by usage of the .Repetitions method, copy = True will result in number new objects plus the original object.
    repetitions      = 1;
% else
    %error('Invalid value for Repetitions')
end


if iscell(angleVector)
    xAngleVector = num2str(cell2mat(angleVector(1)));
    yAngleVector = num2str(cell2mat(angleVector(2)));
    zAngleVector = num2str(cell2mat(angleVector(3)));
else
    xAngleVector = num2str((angleVector(1)));
    yAngleVector = num2str((angleVector(2)));
    zAngleVector = num2str((angleVector(3)));
end

if iscell(centerVector)
    xCenterVector = num2str(cell2mat(centerVector(1)));
    yCenterVector = num2str(cell2mat(centerVector(2)));
    zCenterVector = num2str(cell2mat(centerVector(3)));
else
    xCenterVector = num2str((centerVector(1)));
    yCenterVector = num2str((centerVector(2)));
    zCenterVector = num2str((centerVector(3)));
end

bGroupObjects       =  'False';  % If new objects are created during the transformation (.MultipleObjects enabled), unite = True defines that every new object will be a united with the original object after the transformation. If unite = False all new objects will stay separately.
% use default settings for the following flags
bUsePickedPoints    = 'False';
bInvertPickedPoints = 'False';
bMultipleSelection  = 'False';

if isempty(name)
    fullShapeName = component;
else
    fullShapeName = [ component ':' name ];
end
historyStr = [];
historyStr = sprintf('With Transform');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,fullShapeName);
historyStr = sprintf('%s\n\t.Angle "%s", "%s", "%s"',historyStr,xAngleVector,yAngleVector,zAngleVector);
historyStr = sprintf('%s\n\t.Origin "%s"',historyStr,origin);
if ~( strcmp(origin,'Free'))
    historyStr = sprintf('%s\n\t.Center "%s", "%s", "%s"',historyStr,xCenterVector,yCenterVector,zCenterVector);
end
historyStr = sprintf('%s\n\t.UsePickedPoints "%s"',historyStr,bUsePickedPoints);
historyStr = sprintf('%s\n\t.InvertPickedPoints "%s"',historyStr,bInvertPickedPoints);
historyStr = sprintf('%s\n\t.MultipleObjects "%s"',historyStr,bMultipleObjects);
historyStr = sprintf('%s\n\t.GroupObjects "%s"',historyStr,bGroupObjects);
historyStr = sprintf('%s\n\t.Repetitions "%s"',historyStr,num2str(repetitions));
historyStr = sprintf('%s\n\t.MultipleSelection "%s"',historyStr,bMultipleSelection);
historyStr = sprintf('%s\n\t.Destination ""',historyStr);
historyStr = sprintf('%s\n\t.Material ""',historyStr);
if strcmp(shape,'Shape')
historyStr = sprintf('%s\n\t.Transform "%s", "%s"',historyStr,'Shape','Rotate');
elseif strcmp(shape,'Curve')
historyStr = sprintf('%s\n\t.Transform "%s", "%s"',historyStr,'Curve','Rotate');
end
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'transform: rotate ' fullShapeName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end







% With Transform
% 	.Reset
% 	.Name "component1"
% 	.Angle "0", "0", "90"
% 	.Origin "ShapeCenter" Free
% 	.Center "0", "0", "0"
% 	.UsePickedPoints "False"
% 	.InvertPickedPoints "False"
% 	.MultipleObjects "False"
% 	.GroupObjects "False"
% 	.Repetitions "1"
% 	.MultipleSelection "False"
% 	.Destination ""
% 	.Material ""
% 	.Transform "Shape", "Rotate"
% End With
% 
% With Transform 
%      .Reset 
%      .Name "component1" 
%      .Origin "Free" 
%      .Center "0", "0", "0" 
%      .Angle "0", "0", "90" 
%      .MultipleObjects "False" 
%      .GroupObjects "False" 
%      .Repetitions "1" 
%      .MultipleSelection "False" 
%      .Transform "Shape", "Rotate" 
% End With 
