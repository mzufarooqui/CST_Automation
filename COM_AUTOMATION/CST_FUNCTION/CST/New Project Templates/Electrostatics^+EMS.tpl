' (CSTxEMSxPSxONLY)

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
     .MeshType "Tetrahedral"
     .UseRatioLimit "True" 
     .RatioLimit "50" 
     .MinimumStepNumber "20" 
     .MinimumStepNumberTet "5"
     .SetAutomeshRefineDielectricsType "None"
     .MaterialRefinementTet "False"
     .SurfaceOptimization "True"
     .SurfaceSmoothing "3"
     .MinimumCurvatureRefinement "100"
     .CurvatureRefinementFactor "0.05"
     .SmallFeatureSize "0.0"
     .VolumeOptimization "True"
     .VolumeSmoothing "True"
     .DensityTransitions "1.0"
     .Automesh "True" 
End With 

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

ChangeProblemType "lf:e-static"
