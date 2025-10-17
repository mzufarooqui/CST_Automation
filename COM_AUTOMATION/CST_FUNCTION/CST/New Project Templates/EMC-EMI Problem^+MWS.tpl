' Template for EMC-EMI Problem
' ============================

' (CSTxMWSxONLY)

' set units to mm, mhz, us

With Units 
     .Geometry "mm" 
     .Frequency "mhz" 
     .Time "us" 
End With 

' set background material to vacuum

With Background 
     .Type "Normal" 
     .Epsilon "1.0" 
     .Mue "1.0" 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "0.0" 
End With 

' set boundary conditions to open

With Boundary
     .Xmin "expanded open" 
     .Xmax "expanded open" 
     .Ymin "expanded open" 
     .Ymax "expanded open" 
     .Zmin "expanded open" 
     .Zmax "expanded open" 
     .Xsymmetry "none" 
     .Ysymmetry "none" 
     .Zsymmetry "none" 
End With

' increase maximum number of pulses to simulation (resonant structure)

With Solver 
     .NumberOfPulseWidths "50" 
End With 

MakeSureParameterExists "theta", "90"
SetParameterDescription "theta", "spherical angle of incident plane wave"
MakeSureParameterExists "phi", "0"
SetParameterDescription "phi", "spherical angle of incident plane wave"
MakeSureParameterExists "zdeg2rad", "pi/180"
SetParameterDescription "zdeg2rad", "factor degree to radian"
MakeSureParameterExists "e_vector", "0"
SetParameterDescription "e_vector", "0=Etheta, 1=Ephi (plane wave evector direction)"

With PlaneWave
     .Reset 
     .Normal "-sin(theta*zdeg2rad)*cos(phi*zdeg2rad)", "-sin(theta*zdeg2rad)*sin(phi*zdeg2rad)", "-cos(theta*zdeg2rad)" 
     .EVector "IIf(e_vector, -sin(phi*zdeg2rad), sin((theta-90)*zdeg2rad)*cos(phi*zdeg2rad))", "IIf(e_vector, cos(phi*zdeg2rad), sin((theta-90)*zdeg2rad)*sin(phi*zdeg2rad))", "IIf(e_vector, 0, cos((theta-90)*zdeg2rad))"
     .Polarization "Linear" 
     .ReferenceFrequency "0.0" 
     .PhaseDifference "-90.0" 
     .CircularDirection "Left" 
     .AxialRatio "1.0" 
     .SetUserDecouplingPlane "False" 
     .Store
End With

Mesh.FPBAAvoidNonRegUnite "True" 
Mesh.ConsiderSpaceForLowerMeshLimit "False" 
