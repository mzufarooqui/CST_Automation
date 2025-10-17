' Template for Antenna Array Unit Cell With Ground Plane
' ======================================================

' (CSTxMWSxONLY)

' draw the bounding box

Plot.DrawBox True

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

' define Floquet port boundaries

With FloquetPort
     .Reset
     .SetDialogTheta "0" 
     .SetDialogPhi "0" 
     .SetSortCode "+beta/pw" 
     .SetCustomizedListFlag "False" 
     .Port "Zmax" 
     .SetNumberOfModesConsidered "2" 
End With

' define boundaries, the open boundary at Zmax defines floquet port
' zmin = electric

MakeSureParameterExists "theta", "0"
SetParameterDescription "theta", "spherical angle of incident plane wave"
MakeSureParameterExists "phi", "0"
SetParameterDescription "phi", "spherical angle of incident plane wave"

With Boundary
     .Xmin "unit cell" 
     .Xmax "unit cell" 
     .Ymin "unit cell" 
     .Ymax "unit cell" 
     .Zmin "electric" 
     .Zmax "open" 
     .Xsymmetry "none" 
     .Ysymmetry "none" 
     .Zsymmetry "none" 
     .XPeriodicShift "0.0" 
     .YPeriodicShift "0.0" 
     .ZPeriodicShift "0.0" 
     .PeriodicUseConstantAngles "False" 
     .SetPeriodicBoundaryAngles "theta", "phi" 
     .SetPeriodicBoundaryAnglesDirection "outward"
     .UnitCellFitToBoundingBox "True" 
     .UnitCellDs1 "0.0" 
     .UnitCellDs2 "0.0" 
     .UnitCellAngle "90.0" 
End With

' set tet mesh as default

With Mesh 
     .MeshType "Tetrahedral" 
End With 

' set FD solver excitation to all non-Floquet ports

With FDSolver
     .Reset 
     .Stimulation "All", "All" 
     .LowFrequencyStabilization "False" 
End With

