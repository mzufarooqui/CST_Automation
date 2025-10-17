' Template for RFID Antenna
' =========================

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

' set boundary conditions to open+add space

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

' optimize mesh settings for planar structures

With Mesh 
     .MergeThinPECLayerFixpoints "True" 
     .RatioLimit "20" 
     .AutomeshRefineAtPecLines "True", "6"
     .ConsiderSpaceForLowerMeshLimit "False" 
     .MinimumStepNumber "5" 
End With 

Mesh.FPBAAvoidNonRegUnite "True" 

MeshSettings.SetMeshType "HexTLM" 

With MeshSettings 
     .Set "RatioLimitGeometry", "20" 
End With 


' change mesh adaption scheme to energy 
' 		(planar structures tend to store high energy 
'     	 locally at edges rather than globally in volume)

MeshAdaption3D.SetAdaptionStrategy "Energy" 
