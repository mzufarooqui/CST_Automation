' EDA Template

Sub Main ()

' define units

With Units 
     .Geometry "mm" 
     .Frequency "GHz" 
     .Time "ns" 
     .TemperatureUnit "Kelvin" 
     .Voltage "V" 
     .Current "A" 
     .Resistance "Ohm" 
     .Conductance "S" 
     .Capacitance "pF" 
     .Inductance "nH" 
End With 


' define background

With Background 
     .Reset 
     .Type "Normal" 
     .Epsilon "1.0" 
     .Mue "1.0" 
     .ThermalType "Normal" 
     .ThermalConductivity "0.0" 
     .HeatCapacity "0.0" 
     .Rho "0.0" 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "0.0" 
     .ApplyInAllDirections "False" 
End With 


' define boundaries

With Boundary
     .Xmin "magnetic" 
     .Xmax "magnetic" 
     .Ymin "magnetic" 
     .Ymax "magnetic" 
     .Zmin "magnetic" 
     .Zmax "magnetic" 
     .Xsymmetry "none" 
     .Ysymmetry "none" 
     .Zsymmetry "none" 
     .XminThermal "isothermal" 
     .XmaxThermal "isothermal" 
     .YminThermal "isothermal" 
     .YmaxThermal "isothermal" 
     .ZminThermal "isothermal" 
     .ZmaxThermal "isothermal" 
     .XsymmetryThermal "none" 
     .YsymmetryThermal "none" 
     .ZsymmetryThermal "none" 
     .ApplyInAllDirections "True" 
     .XminTemperature "" 
     .XminTemperatureType "None" 
     .XmaxTemperature "" 
     .XmaxTemperatureType "None" 
     .YminTemperature "" 
     .YminTemperatureType "None" 
     .YmaxTemperature "" 
     .YmaxTemperatureType "None" 
     .ZminTemperature "" 
     .ZminTemperatureType "None" 
     .ZmaxTemperature "" 
     .ZmaxTemperatureType "None" 
End With


' define automesh parameters

With Mesh 
     .AutomeshRefineAtPecLines "False", "2" 
     .AutomeshRefinePecAlongAxesOnly "False" 
     .UsePecEdgeModel "False" 
     .EquilibrateMesh "True" 
     .EquilibrateMeshRatio "1.5" 

     .UseRatioLimit "True" 
     .RatioLimit "100" 
     .LinesPerWavelength "10" 
     .MinimumStepNumber "10.0" 
     .Automesh "True" 
     .MeshType "PBA" 
     .SetCreator "High Frequency" 
End With 

MeshSettings.SetMeshType "HexTLM" 

With MeshSettings 
     .Set "RatioLimitGeometry", "100" 
     .Set "EdgeRefinementOn", "0" 
End With 


End Sub