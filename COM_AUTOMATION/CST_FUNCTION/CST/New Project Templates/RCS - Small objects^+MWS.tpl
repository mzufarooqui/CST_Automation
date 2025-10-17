' Template for RCS calculations (small objects)
' =============================================

' (CSTxMWSxONLY)

' set units to mm, ghz

With Units 
     .Geometry "mm" 
     .Frequency "ghz" 
     .Time "ns" 
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

Mesh.FPBAAvoidNonRegUnite "True" 