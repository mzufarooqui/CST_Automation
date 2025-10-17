' Template for Coaxial Connector
' ==============================

' (CSTxMWSxONLY)

' set units to mm, ghz

With Units 
     .Geometry "mm" 
     .Frequency "ghz" 
     .Time "ns" 
End With 

' set background material to pec

With Background 
     .Type "pec" 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "0.0" 
End With 

' set boundary conditions to electric

With Boundary
     .Xmin "electric" 
     .Xmax "electric" 
     .Ymin "electric" 
     .Ymax "electric" 
     .Zmin "electric" 
     .Zmax "electric" 
     .Xsymmetry "none" 
     .Ysymmetry "none" 
     .Zsymmetry "none" 
End With

' increase solver accuracy (non resonant structure)

With Solver 
     .SteadyStateLimit "-40" 
End With 
