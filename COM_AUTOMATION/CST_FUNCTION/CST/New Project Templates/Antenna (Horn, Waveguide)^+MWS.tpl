' Template for Antenna in Free Space
' ==================================

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

' switch on FD-TET setting for accurate farfields

FDSolver.ExtrudeOpenBC "True" 

Mesh.FPBAAvoidNonRegUnite "True" 
Mesh.ConsiderSpaceForLowerMeshLimit "False" 
Mesh.MinimumStepNumber "5" 
