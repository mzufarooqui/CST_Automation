' (CSTxEMSxONLY)

With Units 
     .Geometry "mm" 
End With 

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

With Boundary
     .Xmin "tangential" 
     .Xmax "tangential" 
     .Ymin "tangential" 
     .Ymax "tangential" 
     .Zmin "tangential" 
     .Zmax "tangential" 
End With

With Mesh 
     .MeshType "Tetrahedral"
     .UseRatioLimit "True" 
     .RatioLimit "50" 
     .MinimumStepNumber "20" 
     .MinimumStepNumberTet "5"
     .Automesh "True" 
     .SetAutomeshRefineDielectricsType "None"
     .MaterialRefinementTet "False"
End With 

With MeshAdaption3D
    .SetType "JStatic" 
    .SetAdaptionStrategy "Energy" 
End With

With VectorPlot3D
     .Objects 2000
End With

With VectorPlot2D
     .Arrows 1000
End with

ChangeProblemType "lf:j-static"