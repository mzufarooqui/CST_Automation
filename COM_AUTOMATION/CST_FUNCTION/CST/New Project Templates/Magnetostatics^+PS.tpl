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
     .UseRatioLimit "True" 
     .RatioLimit "50" 
     .MinimumStepNumber "20" 
     .SetAutomeshRefineDielectricsType "None"
     .MaterialRefinementTet "False"
     .MinimumStepNumberTet "10"
     .SurfaceOptimization "True"
     .SurfaceSmoothing "3"
     .MinimumCurvatureRefinement "100"
     .CurvatureRefinementFactor "0.05"
     .SmallFeatureSize "0.0"
     .VolumeOptimization "True"
     .VolumeSmoothing "True"
     .DensityTransitions "0.8"     
     .Automesh "True" 
End With 
Mesh.FPBAAvoidNonRegUnite "True" 

With MeshAdaption3D
    .SetType "MStatic" 
    .SetAdaptionStrategy "Energy" 
End With

With MStaticSolver
     .Reset
     .NlinCycles  "50"
     .NlinAccuracy  "1e-2"
     .MeshAdaption "False"
     .TetSolverType "Auto"
End With

With VectorPlot3D
     .Objects 2000
End With

With VectorPlot2D
     .Arrows 1000
End with

MStaticSolver.IgnorePECMaterial "True" 

ChangeProblemType "tracking"

