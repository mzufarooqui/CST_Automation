function cst_value = f_Get0DResultValue(oMWS,oFarfieldPlot,sFullCompString)
s0DValue = invoke(oMWS,'GetScriptSetting','a0DValue','Max. Value');

selected_ffname      = 'Farfields\farfield (broadband) [1]';
selected_ffname2     = invoke(oMWS,'GetScriptSetting','ffname2','');
dcst_stepsize        = str2num(invoke(oMWS,'GetScriptSetting','Stepsize','5'));
dcst_thetaStart      = str2num(invoke(oMWS,'GetScriptSetting','thetaStart','0'));
dcst_phiStart        = str2num(invoke(oMWS,'GetScriptSetting','phiStart','0'));
dcst_thetaEnd        = str2num(invoke(oMWS,'GetScriptSetting','thetaEnd','180'));
dcst_phiEnd          = str2num(invoke(oMWS,'GetScriptSetting','phiEnd','360'));
dcst_XPRdB           = str2num(invoke(oMWS,'GetScriptSetting','XPRdB','0'));
icst_distType        = str2num(invoke(oMWS,'GetScriptSetting','distType','0'));
dcst_meanHorizontal  = str2num(invoke(oMWS,'GetScriptSetting','meanHorizontal','0'));
dcst_sigmaHorizontal = str2num(invoke(oMWS,'GetScriptSetting','sigmaHorizontal','20'));
dcst_meanVertical    = str2num(invoke(oMWS,'GetScriptSetting','meanVertical','0'));
dcst_sigmaVertical   = str2num(invoke(oMWS,'GetScriptSetting','sigmaVertical','20'));
scst_vPDFExpr        = invoke(oMWS,'GetScriptSetting','vPDFExpr', '1');
scst_hPDFExpr        = invoke(oMWS,'GetScriptSetting','hPDFExpr', '1');
dcst_Wrms            = str2num(invoke(oMWS,'GetScriptSetting','Wrms', '1'));
sMode                = 'gain'; % directivity/gain/efield/hfield/pfield/rcs/rcssw/scale2max>

dcst_theta           = str2num(invoke(oMWS,'GetScriptSetting','Theta','0'));
dcst_phi             = str2num(invoke(oMWS,'GetScriptSetting','Phi','0'));

if round(str2num(invoke(oMWS,'GetScriptSetting','UseFFApprox','1')))== 1
    % Farfield
    cst_value = invoke(oFarfieldPlot,'CalculatePoint',dcst_theta,dcst_phi,sFullCompString,'');  % '' is taking selected monitor
else
    %Nearfield
    %cst_value = .CalculatePointNoApprox(dcst_theta, dcst_phi, Evaluate(GetScriptSetting('Distance','1.0')), sFullCompString, '')  ' '' is taking selected monitor
end
end