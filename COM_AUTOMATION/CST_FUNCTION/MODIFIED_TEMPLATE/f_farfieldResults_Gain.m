function f_farfieldResults_Gain(oMWS,plotName)

oFarfieldPlot  = invoke(oMWS,'FarfieldPlot');
oSolver        = invoke(oMWS,'Solver');
oResultTree    = invoke(oMWS,'ResultTree');
Evaluate1D     = invoke(oMWS,'Result1D','');
oFarfieldArray = invoke(oMWS,'FarfieldArray');
oUnits         = invoke(oMWS,'Units');
oResulttree    = invoke(oMWS,'Resulttree');
%invoke(oFarfieldPlot,'StoreAllSettings','PreEval1D'); % % not working in
%cst 2013
invoke(oFarfieldPlot,'SetSpecials','disableplot');

invoke(oMWS,'ActivateScriptSettings','True');    
b0dTemplate = strcmp(invoke(oMWS,'GetTemplateType'),'0D');
bDSTemplate = strcmp(invoke(oMWS,'GetApplicationName'),'DS');

ffname = 'Farfields\farfield (broadband) [1]';
ffnameShort = ffname(length('Farfields\')+1:end);
oMWS.invoke('SelectTreeItem',ffname);
ibbFF_status = 0;
dfrq_now     = 0.0;
dtime_now    = 0.0;
%-- case sweep freq
ibbFF_status = 1;
dvmin = str2num(invoke(oMWS,'GetScriptSetting','flow',invoke(oSolver,'GetFmin')));
if ((dvmin < invoke(oSolver,'GetFmin')) | (dvmin > invoke(oSolver,'GetFmax'))), dvmin = invoke(oSolver,'GetFmin'); end
dvmax = str2num(invoke(oMWS,'GetScriptSetting','fhigh',invoke(oSolver,'GetFmax')));
if ((dvmax < invoke(oSolver,'GetFmin')) | (dvmax > invoke(oSolver,'GetFmax'))), dvmax = invoke(oSolver,'GetFmax'); end
fstep = (dvmax-dvmin)/20;
dvstp = str2num(invoke(oMWS,'GetScriptSetting','fstepsize',fstep));
simPort = num2str(invoke(oSolver,'GetStimulationPort'))
invoke(oMWS,'StoreScriptSetting','ExcitationString','[' simPort ']');

for dfrq_now = dvmin:dvstp:dvmax+0.01*dvstp % +0.99dvstp to make sure dvmax is included
    invoke(oMWS,'StoreScriptSetting','BroadbandMonitorCurrentSample', num2str(dfrq_now));
    %-- Function
    sFullCompString = f_PlotFarfieldWithAllSettings(oMWS,oFarfieldPlot,oFarfieldArray,ffnameShort, ibbFF_status, dfrq_now, dtime_now);
    %-- Function
    cst_value = f_Get0DResultValue(oMWS,oFarfieldPlot,sFullCompString);
    
    if( dfrq_now == 0 ),inParam1 = 0.01;else inParam1 = dfrq_now;end
    
    invoke(Evaluate1D,'AppendXY',inParam1,cst_value);
    if (invoke(oMWS,'GetTemplateAborted')),break;end % only exit function, not all - if multiple, script settings need to be reset in calling function!
end
invoke(Evaluate1D,'Xlabel',['Frequency / ' invoke(oUnits,'GetFrequencyUnit') ]);

invoke(oFarfieldPlot,'SetSpecials','enableplot');
%invoke(oFarfieldPlot,'ReStoreAllSettings','PreEval1D'); % not working in
%cst 2013

stmpfile = 'Test1D_tmp.txt';
invoke(Evaluate1D,'Save',stmpfile);
invoke(Evaluate1D,'AddToTree',['1D Results\' plotName]);
invoke(oMWS,'SelectTreeItem',['1D Results\' plotName]);
invoke(oResulttree,'UpdateTree');
invoke(oResulttree,'RefreshView');
invoke(oMWS,'ResetApplicationName');
invoke(oMWS,'ResetTemplateType');
invoke(oMWS,'ActivateScriptSettings','False');
end