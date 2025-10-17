function status = f_TranslateShape(oMWS,component,name,vector,repetitions,bGroupObjects)
%% TRANSLATE SHAPE
% # If shape name is empty it will TRANSLATE the whole component 
%   Pay attention to define the origin
%% DEFINATION
% vector:
%         Sets the translation vector. The working coordinate system will be used, if activated. Use in case of translate transformation only.
% repetitions:
%         Defines the number of repetitions, the transformation will be
%         applied to the selected object.
%% EXAMPLE:
% status = f_TranslateShape(oMWS,component,name,vector,repetitions)
% status = f_TranslateShape(oMWS,'component1','solid1',[0 0 1],1)
% status = f_TranslateShape(oMWS,'component1','solid1',{0 0 'zParam'},1)
%% MATLAB SCRIPT
if( repetitions >= 1)
    bMultipleObjects = 'True';% If switch is True, the new solid will be copied and the original will remain untouched. Else (copy = False), the original object will be deleted. In case of repeated execution by usage of the .Repetitions method, copy = True will result in number new objects plus the original object.
elseif( repetitions == 0)
    bMultipleObjects = 'False';% If switch is True, the new solid will be copied and the original will remain untouched. Else (copy = False), the original object will be deleted. In case of repeated execution by usage of the .Repetitions method, copy = True will result in number new objects plus the original object.
    repetitions      = 1;
else
    error('Invalid value for Repetitions')
end

% bGroupObjects       =  'False';  % If new objects are created during the transformation (.MultipleObjects enabled), unite = True defines that every new object will be a united with the original object after the transformation. If unite = False all new objects will stay separately.
% use default settings for the following flags
bUsePickedPoints    = 'False';
bInvertPickedPoints = 'False';
bMultipleSelection  = 'False';

if iscell(vector(1))
    xVector = num2str(cell2mat(vector(1)));
    yVector = num2str(cell2mat(vector(2)));
    zVector = num2str(cell2mat(vector(3)));
else
    xVector = num2str(vector(1));
    yVector = num2str(vector(2));
    zVector = num2str(vector(3));
end

if isempty(name)
    fullShapeName = component;
else
    fullShapeName = [ component ':' name ];
end
historyStr = [];
historyStr = sprintf('With Transform');
historyStr = sprintf('%s\n.Reset',historyStr);
historyStr = sprintf('%s\n.Name "%s"',historyStr,fullShapeName);
historyStr = sprintf('%s\n.Vector "%s", "%s", "%s"',historyStr,xVector,yVector,zVector);
historyStr = sprintf('%s\n.UsePickedPoints "%s"',historyStr,bUsePickedPoints);
historyStr = sprintf('%s\n.InvertPickedPoints "%s"',historyStr,bInvertPickedPoints);
historyStr = sprintf('%s\n.MultipleObjects "%s"',historyStr,bMultipleObjects);
historyStr = sprintf('%s\n.GroupObjects "%s"',historyStr,bGroupObjects);
historyStr = sprintf('%s\n.Repetitions "%s"',historyStr,num2str(repetitions));
historyStr = sprintf('%s\n.MultipleSelection "%s"',historyStr,bMultipleSelection);
historyStr = sprintf('%s\n.Destination ""',historyStr);
historyStr = sprintf('%s\n.Material ""',historyStr);
historyStr = sprintf('%s\n.Transform "%s", "%s"',historyStr,'Shape','Translate');
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'transform: translate ' fullShapeName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end