' Template for IC Package
' =======================

' (CSTxMWSxONLY)

' set units to um, ghz

With Units 
     .Geometry "um" 
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

' set boundary conditions to absorbing, zmin to electric

With Boundary
     .Xmin "conducting wall" 
     .Xmax "conducting wall" 
     .Ymin "conducting wall" 
     .Ymax "conducting wall" 
     .Zmin "electric" 
     .Zmax "conducting wall" 
     .Xsymmetry "none" 
     .Ysymmetry "none" 
     .Zsymmetry "none" 
     .WallConductivity "1000" 
End With

' optimize mesh settings for planar structures

With Mesh 
     .MergeThinPECLayerFixpoints "True" 
     .RatioLimit "20" 
     .FPBAAvoidNonRegUnite "True" 
End With 

MeshSettings.SetMeshType "HexTLM" 

With MeshSettings 
     .Set "RatioLimitGeometry", "20" 
End With 

