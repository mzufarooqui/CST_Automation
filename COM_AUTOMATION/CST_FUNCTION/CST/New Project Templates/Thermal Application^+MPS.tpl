' (CSTxEMSxONLY)

With Units 
     .Geometry "mm" 
End With 

With Background 
     .Type "Normal" 
     .Epsilon "1.0" 
     .Mue "1.0" 
     .ThermalConductivity "0.024" 
     .HeatCapacity "1.005" 
     .Rho "1.293" 
End With 

Solid.SetAutoIntersectionCheckThermal "True" 

With Boundary
     .Xmin "electric" 
     .Xmax "electric" 
     .Ymin "electric" 
     .Ymax "electric" 
     .Zmin "electric" 
     .Zmax "electric" 
End With

With Mesh 
     .UseRatioLimit "True" 
     .RatioLimit "50" 
     .MinimumStepNumber "20" 
     .Automesh "True" 
End With 

With VectorPlot3D
     .Objects 2000
End With

With VectorPlot2D
     .Arrows 1000
End with

With ThermalSolver
     .Accuracy "1e-6" 
     .BackgroundTemperature "293.1" 
End With

With ThermalTDSolver
     .StartSolutionAccuracy "1e-6"
     .TransientSolverAccuracy "1e-4"
     .BackgroundTemperature "293.1" 
     .TimeStepScheme "Automatic"
End With

