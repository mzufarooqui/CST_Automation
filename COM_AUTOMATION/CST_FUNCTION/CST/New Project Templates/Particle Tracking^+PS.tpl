' (CSTxPSxONLY)

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

With Mesh 
     .UseRatioLimit "True" 
     .RatioLimit "50" 
     .LinesPerWavelength "10" 
     .MinimumStepNumber "20" 
     .Automesh "True" 
End With 
Mesh.FPBAAvoidNonRegUnite "True" 

With MeshAdaption3D
    .SetType "EStatic" 
    .SetAdaptionStrategy "Energy" 
End With

With VectorPlot3D
     .Objects 2000
End With

With VectorPlot2D
     .Arrows 1000
End with

MStaticSolver.IgnorePECMaterial "True" 

ChangeProblemType "tracking"

