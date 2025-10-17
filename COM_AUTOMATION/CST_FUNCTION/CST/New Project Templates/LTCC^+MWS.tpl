' Template for LTCC Application
' =============================

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

' optimize mesh settings for planar structures

With Mesh 
	.MergeThinPECLayerFixpoints "True"
	.RatioLimit "20" 
	.AutomeshRefineAtPecLines "True", "6"
	.ConsiderSpaceForLowerMeshLimit "False" 
	.MinimumStepNumber "5" 
	.FPBAAvoidNonRegUnite "True" 
End With 

MeshSettings.SetMeshType "HexTLM" 

With MeshSettings 
     .Set "RatioLimitGeometry", "20" 
End With 


' increase maximum number of pulses to simulation (resonant structure)
' use Online AR Filter

With Solver 
     .NumberOfPulseWidths "50" 
     .UseArfilter "True"
End With 

' change mesh adaption scheme to energy 
' 		(planar structures tend to store high energy 
'     	 locally at edges rather than globally in volume)

MeshAdaption3D.SetAdaptionStrategy "Energy" 
