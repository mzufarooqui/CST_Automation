function sFullCompString = f_PlotFarfieldWithAllSettings(oMWS,oFarfieldPlot,oFarfieldArray,ffnameShort, ibbFF_status, dfrq_now, dtime_now)

sCoordSystem  = invoke(oMWS,'GetScriptSetting','CoordinateSystemType','spherical');
sPolarization = invoke(oMWS,'GetScriptSetting','PolarisationType','linear');
sComponent    = invoke(oMWS,'GetScriptSetting','sComponentName','abs');

%-- case for abs
sFullCompString = [ sCoordSystem ' abs' ];
invoke(oFarfieldArray,'Reset');
switch str2num(invoke(oMWS,'GetScriptSetting','GroupArrayType','0'))
    case 0
        invoke(oFarfieldArray,'UseArray','false');
    case 1
    case 2
end

invoke(oFarfieldPlot,'SetCoordinateSystemType',sCoordSystem);
invoke(oFarfieldPlot,'SetPolarizationType',sPolarization);
invoke(oFarfieldPlot,'SlantAngle',invoke(oMWS,'GetScriptSetting','SlantAngle','0'));

nRange = round(str2num((invoke(oMWS,'GetScriptSetting','GroupPlotrange','2')))); %  check CInt func
switch nRange
    case 0 % "3D Plot"
        invoke(oFarfieldPlot,'Plottype','3d');
    case 1,2,3 % "polar - const theta" and "const phi" and "single direction"
        invoke(oFarfieldPlot,'Plottype','polar');
end

invoke(oFarfieldPlot,'SetTheta360','True');
invoke(oFarfieldPlot,'CartSymRange','True');
invoke(oFarfieldPlot,'Step',invoke(oMWS,'GetScriptSetting','Stepsize','5.0'));
invoke(oFarfieldPlot,'UseFarfieldApproximation','True');
invoke(oFarfieldPlot,'SetInverseAxialRatio','False');

sMode = 'gain'; % directivity/gain/efield/hfield/pfield/rcs/rcssw/scale2max>
invoke(oFarfieldPlot,'SetPlotMode',sMode);
invoke(oFarfieldPlot,'Distance',invoke(oMWS,'GetScriptSetting','Distance','1.0'));
invoke(oFarfieldPlot,'SetScaleLinear','False');
% always call the next two lines, even if linear scale is selected
invoke(oFarfieldPlot,'DBUnit',invoke(oMWS,'GetScriptSetting','DBUnit','0'));
invoke(oFarfieldPlot,'SetLogRange',invoke(oMWS,'GetScriptSetting','LogRangedB','40'));
invoke(oFarfieldPlot,'SetMainLobeThreshold',invoke(oMWS,'GetScriptSetting','xAngularWidth','3'));
invoke(oFarfieldPlot,'EnablePhaseCenterCalculation','False');


switch ibbFF_status    % special handling bb-monitor from TD-solver: "farfield (broadband)"
    case 1 % frq-domain
        invoke(oFarfieldPlot,'SetTimeDomainFF','False');
        if (dfrq_now == 0.0)
            invoke(oMWS,'ReportWarning','Farfield (broadband) cannot be evaluated at zero frequency, frequency value changed to 0.01');
            invoke(oFarfieldPlot,'Setfrequency','0.01');
        else
            invoke(oFarfieldPlot,'Setfrequency',num2str(dfrq_now));
        end
    case 2 % time-domain
        invoke(oFarfieldPlot,'SetTimeDomainFF','True');
        invoke(oFarfieldPlot,'SetTime',num2str(dtime_now));
end
invoke(oFarfieldPlot,'Plot');
invoke(oFarfieldPlot,'SelectTreeComponent',ffnameShort,sFullCompString);
invoke(oFarfieldPlot,'Plot');
end