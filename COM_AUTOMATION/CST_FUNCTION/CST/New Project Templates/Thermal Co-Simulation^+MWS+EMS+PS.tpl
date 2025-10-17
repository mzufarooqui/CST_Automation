' Template for Thermal Co-Simulation
' ==================================
' (CSTxMWSxEMSxPS)

Solid.SetAutoIntersectionCheckThermal "True" 

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

With Background 
     .Type "Normal" 
     .Epsilon "1.0" 
     .Mue "1.0" 
     .ThermalConductivity "0.024" 
     .HeatCapacity "1.005" 
     .Rho "1.293" 
End With 


