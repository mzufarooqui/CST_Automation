function f_Create3D_PolarReport(oDesign,repName,sol,freq,repType)
%f_Create3D_PolarReport(oDesign,'3D TotGain','Setup1 : LastAdaptive','2.3GHz','dB(GainTotal)')
%f_Create3D_PolarReport(oDesign,'3D TotGain','Setup1 : LastAdaptive','2.3GHz',''dB(AxialRatioValue)')
oModule = oDesign.GetModule('ReportSetup');
oModule.CreateReport(repName, 'Far Fields', '3D Polar Plot', ...  
  sol, {'Context:=', 'Infinite Sphere1'}, {'Phi:=', {'All'}, 'Theta:=', {'All'}, 'Freq:=', {freq}}, ...
  {'Phi Component:=', 'Phi', 'Theta Component:=', 'Theta', 'Mag Component:=', {repType}}, {});
end