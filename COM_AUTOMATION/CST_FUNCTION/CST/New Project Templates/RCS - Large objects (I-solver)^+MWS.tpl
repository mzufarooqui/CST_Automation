' Template for RCS calculations (large objects) using I-solver
' ============================================================

' (CSTxMWSxONLY)

' set units to m, ghz

With Units 
     .Geometry "m" 
     .Frequency "GHz" 
     .Time "ns" 
End With 


' set boundary conditions to open

With Boundary
     .Xmin "open" 
     .Xmax "open" 
     .Ymin "open" 
     .Ymax "open" 
     .Zmin "open" 
     .Zmax "open" 
End With


' set background material to vacuum

With Background 
     .Reset 
     .Type "Normal" 
     .Epsilon "1.0" 
     .Mue "1.0" 
     .ThermalType "Normal" 
     .ThermalConductivity "0.0" 
     .XminSpace "1" 
     .XmaxSpace "1" 
     .YminSpace "1" 
     .YmaxSpace "1" 
     .ZminSpace "1" 
     .ZmaxSpace "1" 
     .ApplyInAllDirections "True" 
End With 


MakeSureParameterExists "alpha", "0"
SetParameterDescription "alpha", "Rotation angle of E-field Vector (relative to x-axis)"
MakeSureParameterExists "theta", "0"
SetParameterDescription "theta", "spherical angle of incident plane wave"
MakeSureParameterExists "phi", "0"
SetParameterDescription "phi", "spherical angle of incident plane wave"

With PlaneWave
     .Reset 
     .Normal "-sinD(theta)*cosD(phi)", "-sinD(theta)*sinD(phi)", "-cosD(theta)" 
     .EVector "cosD(phi)*cosD(theta)*cosD(alpha)-sinD(phi)*sinD(alpha)", "sinD(phi)*cosD(theta)*cosD(alpha)+cosD(phi)*sinD(alpha)", "-sinD(theta)*cosD(alpha)"
     .Polarization "Linear" 
     .ReferenceFrequency "0.0" 
     .PhaseDifference "-90.0" 
     .CircularDirection "Left" 
     .AxialRatio "1.0" 
     .SetUserDecouplingPlane "False" 
     .Store
End With

With Mesh 
     .StepsPerWavelengthSrf "2" 
     .MinimumStepNumberSrf "1" 
     .MeshType "Surface" 
     .MaterialRefinementTet "True" 
     .SurfaceSmoothing "6" 
     .DensityTransitions "0.9" 
End With 

Mesh.SetCreator "High Frequency" 

With FDSolver
     .Reset 
     .Method "Surface Mesh" 
     .OrderSrf "First" 
     .SParameterSweep "False" 
     .UseDoublePrecision "False" 
     .MixedOrder "False" 
     .MLFMMAccuracy "LowMem" 
End With