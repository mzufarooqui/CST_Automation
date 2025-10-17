function f_AssignWavePort_HFSS(oProject,activeDsg,pNum,portLabel,numModes,modeLabel,stVec,endVec)
% f_AssignWavePort_HFSS(oProject,1,'Port1',1,'Mode1',[67.3 0 13.525],[69.357 0 -13.525])
oDesign = oProject.SetActiveDesign(activeDsg);
oEditor = oDesign.SetActiveEditor('3D Modeler');
oModule = oDesign.GetModule('BoundarySetup');

% Set oDesign = oProject.SetActiveDesign('HFSSDesign1')
% Set oModule = oDesign.GetModule('BoundarySetup')
% oModule.AssignWavePort Array('NAME:1', 'Objects:=', Array('Port1'), 'NumModes:=', 1, 'RenormalizeAllTerminals:=',  _
%   true, 'UseLineModeAlignment:=', false, 'DoDeembed:=', false, Array('NAME:Modes', Array('NAME:Mode1', 'ModeNum:=',  _
%   1, 'UseIntLine:=', true, Array('NAME:IntLine', 'Start:=', Array('67.3mm', '0mm',  _
%   '-13.525mm'), 'End:=', Array('69.357mm', '-1.25954923292305e-016mm', '-13.525mm')), 'CharImp:=',  _
%   'Zpi', 'AlignmentGroup:=', 0)), 'ShowReporterFilter:=', false, 'ReporterFilter:=', Array( _
%   true), 'UseAnalyticAlignment:=', false)

% 
invoke(oModule,'AssignWavePort', {['NAME:' num2str(pNum)], 'Objects:=', {portLabel}, 'NumModes:=', numModes, 'RenormalizeAllTerminals:=',  ...
    true, 'UseLineModeAlignment:=', false, 'DoDeembed:=', false, {'NAME:Modes', {['NAME:' modeLabel], 'ModeNum:=',  ...
    numModes, 'UseIntLine:=', true, {'NAME:IntLine', 'Start:=', {[ num2str(stVec(1)) 'mm'], [ num2str(stVec(2)) 'mm'], [ num2str(stVec(3)) 'mm']}, 'End:=', {[ num2str(endVec(1)) 'mm'], [ num2str(endVec(2)) 'mm'], [ num2str(endVec(3)) 'mm']}}, ...
    'CharImp:=', 'Zpi', 'AlignmentGroup:=', 0}}, 'ShowReporterFilter:=', false, 'ReporterFilter:=', {true}, 'UseAnalyticAlignment:=', false})


% invoke(oModule,'AssignWavePort', {['NAME:' num2str(pNum)], 'Objects:=', {portLabel}, 'NumModes:=', numModes, 'RenormalizeAllTerminals:=',  ...
%     true, 'UseLineModeAlignment:=', false, 'DoDeembed:=', false, {'NAME:Modes', {['NAME:' modeLabel], 'ModeNum:=',  ...
%     numModes, 'UseIntLine:=', true, {'NAME:IntLine', 'Start:=', {[ num2str(stVec(1)) 'mm'], [ num2str(stVec(2)) 'mm'], ['-lPort']}, 'End:=', {[ num2str(endVec(1)) 'mm'], [ num2str(endVec(2)) 'mm'], [ ['-lPort']]}}, ...
%     'CharImp:=', 'Zpi', 'AlignmentGroup:=', 0}}, 'ShowReporterFilter:=', false, 'ReporterFilter:=', {true}, 'UseAnalyticAlignment:=', false})
% 



% invoke(oModule,'AssignWavePort', {['NAME:' num2str(pNum)], 'Objects:=', {portLabel}, 'NumModes:=', numModes, 'RenormalizeAllTerminals:=',  ...
%     true, 'UseLineModeAlignment:=', false, 'DoDeembed:=', false, {'NAME:Modes', {['NAME:' modeLabel], 'ModeNum:=',  ...
%     numModes, 'UseIntLine:=', true, {'NAME:IntLine', 'Start:=', {[ stVec{1}], [ stVec{2}], [ stVec{3}]}, 'End:=', {[ endVec{1}], [ endVec{2}], [ endVec{3}]}}, ...
%     'CharImp:=', 'Zpi', 'AlignmentGroup:=', 0}}, 'ShowReporterFilter:=', false, 'ReporterFilter:=', {true}, 'UseAnalyticAlignment:=', false})

% oDesign = oProject.SetActiveDesign('HFSSDesign1')
% oModule = oDesign.GetModule('BoundarySetup')
% invoke(oModule,'AssignWavePort',{'NAME:1', 'Objects:=', {'Port1'}, 'NumModes:=', 1, 'RenormalizeAllTerminals:=',true, 'UseLineModeAlignment:=', false, 'DoDeembed:=', false, {'NAME:Modes', {'NAME:Mode1', 'ModeNum:=',1, 'UseIntLine:=', true, ...
%     {'NAME:IntLine', 'Start:=', {'-1.10895192291511e-016mm', '0mm', '-2mm'), 'End:=', {'2.8448mm', '0mm','-2mm'}}, 'CharImp:=', 'Zpi', 'AlignmentGroup:=', 0}}, 'ShowReporterFilter:=', false, 'ReporterFilter:=', {true}, 'UseAnalyticAlignment:=', false})


end





