' (CSTxMPSxONLY)

With Units 
     .Geometry "mm" 
End With 

With Mesh 
     .MeshType "Tetrahedral" 
     .Automesh "True" 
End With 

With StructuralMechanicsSolver
     .Accuracy "1e-6" 
     .ReferenceTemperature "293.15"
	 .TetSolverOrder "2"
End With

Solid.SetAutoIntersectionCheckMechanics "True" 

ChangeProblemType "Mechanics"
