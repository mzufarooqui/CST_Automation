' TurnStile_2803

Sub Main ()

'@ use template: Coupler (Waveguide)

' Template for Waveguide Coupler
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
Mesh.MinimumCurvatureRefinement "150"

'@ new component: component1

Component.New "component1"

'@ define cylinder: component1:GuidaRidge

With Cylinder 
     .Reset 
     .Name "GuidaRidge" 
     .Component "component1" 
     .Material "Vacuum" 
     .OuterRadius "wgRc" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "-Lcirc", "Lin" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ switch working plane

Plot.DrawWorkplane "false"

'@ define brick: component1:Ridge

With Brick
     .Reset 
     .Name "Ridge" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "-wgAr/2", "wgAr/2" 
     .Yrange "wgR-wgHr", "wgR" 
     .Zrange "-Lcirc", "Lin" 
     .Create
End With

'@ transform: rotate component1:Ridge

With Transform 
     .Reset 
     .Name "component1:Ridge" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .Angle "0", "0", "90" 
     .MultipleObjects "True" 
     .GroupObjects "True" 
     .Repetitions "3" 
     .MultipleSelection "False" 
     .Component "" 
     .Material "" 
     .RotateAdvanced 
End With

'@ boolean subtract shapes: component1:GuidaRidge, component1:Ridge

Solid.Subtract "component1:GuidaRidge", "component1:Ridge"

'@ pick face

Pick.PickFaceFromId "component1:GuidaRidge", "27"

'@ define port: 1

With Port 
     .Reset 
     .PortNumber "1" 
     .NumberOfModes "5" 
     .AdjustPolarization False 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-26.88401011754", "26.88401011754" 
     .Yrange "-26.88401011754", "26.88401011754" 
     .Zrange "0", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With

'@ define boundaries

With Boundary
     .Xmin "electric" 
     .Xmax "electric" 
     .Ymin "electric" 
     .Ymax "electric" 
     .Zmin "electric" 
     .Zmax "electric" 
     .Xsymmetry "magnetic" 
     .Ysymmetry "electric" 
     .Zsymmetry "none" 
     .XminThermal "isothermal" 
     .XmaxThermal "isothermal" 
     .YminThermal "isothermal" 
     .YmaxThermal "isothermal" 
     .ZminThermal "isothermal" 
     .ZmaxThermal "isothermal" 
     .XsymmetryThermal "isothermal" 
     .YsymmetryThermal "isothermal" 
     .ZsymmetryThermal "none" 
     .ApplyInAllDirections "False" 
     .XminTemperature "" 
     .XminTemperatureType "None" 
     .XmaxTemperature "" 
     .XmaxTemperatureType "None" 
     .YminTemperature "" 
     .YminTemperatureType "None" 
     .YmaxTemperature "" 
     .YmaxTemperatureType "None" 
     .ZminTemperature "" 
     .ZminTemperatureType "None" 
     .ZmaxTemperature "" 
     .ZmaxTemperatureType "None" 
End With

'@ define frequency range

Solver.FrequencyRange "fmin", "fmax"

'@ set mesh properties

With Mesh 
     .UseRatioLimit "True" 
     .RatioLimit "10.0" 
     .LinesPerWavelength "25" 
     .MinimumStepNumber "25" 
     .Automesh "True" 
     .MeshType "PBA" 
     .SetCreator "High Frequency" 
End With

'@ define solver parameters

Mesh.SetCreator "High Frequency" 
With Solver 
     .CalculationType "TD-S" 
     .StimulationPort "All" 
     .StimulationMode "All" 
     .SteadyStateLimit "-30" 
     .MeshAdaption "False" 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .CalculateModesOnly "True" 
     .SParaSymmetry "False" 
     .StoreTDResultsInCache "False" 
     .FullDeembedding "False" 
     .UseDistributedComputing "False" 
     .DistributeMatrixCalculation "False" 
End With

'@ define brick: component1:solid1

With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "-wgBs/2", "wgBs/2" 
     .Yrange "0", "wgR+Lrect" 
     .Zrange "-wgAs", "0" 
     .Create
End With

'@ transform: rotate component1:solid1

With Transform 
     .Reset 
     .Name "component1:solid1" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .Angle "0", "0", "90" 
     .MultipleObjects "True" 
     .GroupObjects "True" 
     .Repetitions "3" 
     .MultipleSelection "False" 
     .Component "" 
     .Material "" 
     .RotateAdvanced 
End With

'@ boolean add shapes: component1:GuidaRidge, component1:solid1

Solid.Add "component1:GuidaRidge", "component1:solid1"

'@ pick face

Pick.PickFaceFromId "component1:GuidaRidge", "23"

'@ define port: 2

With Port 
     .Reset 
     .PortNumber "2" 
     .NumberOfModes "3" 
     .AdjustPolarization False 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-6.5", "6.5" 
     .Yrange "36", "36" 
     .Zrange "-27", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With

'@ pick face

Pick.PickFaceFromId "component1:GuidaRidge", "5"

'@ define port: 3

With Port 
     .Reset 
     .PortNumber "3" 
     .NumberOfModes "3" 
     .AdjustPolarization False 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "36", "36" 
     .Yrange "-6.5", "6.5" 
     .Zrange "-27", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With

'@ define solver parameters

Mesh.SetCreator "High Frequency" 
With Solver 
     .CalculationType "TD-S" 
     .StimulationPort "1" 
     .StimulationMode "1" 
     .SteadyStateLimit "-50" 
     .MeshAdaption "False" 
     .CalculateModesOnly "False" 
     .SParaSymmetry "False" 
     .StoreTDResultsInCache "False" 
     .FullDeembedding "False" 
     .UseDistributedComputing "False" 
     .DistributeMatrixCalculation "False" 
End With

'@ set 3d mesh adaptation properties

With MeshAdaption3D
    .SetType "HighFrequencyTet" 
    .SetAdaptionStrategy "ExpertSystem" 
    .MinPasses "3" 
    .MaxPasses "12" 
    .MeshIncrement "5" 
    .MaxDeltaS "0.0001" 
    .NumberOfDeltaSChecks "2" 
    .PropagationConstantAccuracy "0.005" 
    .NumberOfPropConstChecks "2" 
    .MinimumAcceptedCellGrowth "0.5" 
    .RefThetaFactor            "30" 
    .ImproveBadElementQuality "True" 
    .SubsequentChecksOnlyOnce "False" 
    .WavelengthBasedRefinement "True" 
    .ManualThetaRef "False" 
    .MultipleEdgeRef "False" 
End With

'@ clear picks

Pick.ClearAllPicks

'@ pick face

Pick.PickFaceFromId "component1:GuidaRidge", "62"

'@ define frequency domain solver parameters

Mesh.SetCreator "High Frequency" 
With FDSolver
     .Reset 
     .Method "Tetrahedral Mesh" 
     .OrderTet "Second" 
     .OrderSrf "Second" 
     .UseDistributedComputing "False" 
     .NetworkComputingStrategy "RunRemote" 
     .NetworkComputingJobCount "3" 
     .Stimulation "1", "1" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-4" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .LimitCPUs "False" 
     .MaxCPUs "8" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "True" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .HexMORSettings "", "1001" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "False" 
     .SetOpenBCTypeHex "Default" 
     .AddMonitorSamples "True" 
     .SParameterSweep "False" 
     .CalcStatBField "False" 
     .UseDoublePrecision "False" 
     .MixedOrder "False" 
     .UsePreconditionerIntEq "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.20" 
     .UseCFIEForCPECIntEq "true" 
     .UseFastRCSSweepIntEq "true" 
     .SetRCSSweepProperties "0.0", "0.0", "0", "0.0", "0.0", "0", "0" 
     .SweepErrorThreshold "True", "0.01" 
     .SweepErrorChecks "2" 
     .SweepMinimumSamples "3" 
     .SweepConsiderAll "True" 
     .SweepConsiderReset 
     .InterpolationSamples "1001" 
     .SweepWeightEvanescent "1.0" 
     .AddSampleInterval "", "", "1", "Automatic", "True" 
     .AddSampleInterval "", "", "91", "Equidistant", "False" 
End With

'@ set tetrahedral mesh type

Mesh.MeshType "Tetrahedral"

'@ define frequency domain solver parameters

Mesh.SetCreator "High Frequency" 
With FDSolver
     .Reset 
     .Method "Tetrahedral Mesh" 
     .OrderTet "Second" 
     .OrderSrf "Second" 
     .UseDistributedComputing "False" 
     .NetworkComputingStrategy "RunRemote" 
     .NetworkComputingJobCount "3" 
     .Stimulation "1", "1" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-5" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .LimitCPUs "False" 
     .MaxCPUs "8" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "True" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .HexMORSettings "", "1001" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "False" 
     .SetOpenBCTypeHex "Default" 
     .AddMonitorSamples "True" 
     .SParameterSweep "False" 
     .CalcStatBField "False" 
     .UseDoublePrecision "False" 
     .MixedOrder "False" 
     .UsePreconditionerIntEq "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.20" 
     .UseCFIEForCPECIntEq "true" 
     .UseFastRCSSweepIntEq "true" 
     .SetRCSSweepProperties "0.0", "0.0", "0", "0.0", "0.0", "0", "0" 
     .SweepErrorThreshold "True", "0.01" 
     .SweepErrorChecks "2" 
     .SweepMinimumSamples "3" 
     .SweepConsiderAll "True" 
     .SweepConsiderReset 
     .InterpolationSamples "1001" 
     .SweepWeightEvanescent "1.0" 
     .AddSampleInterval "", "", "1", "Automatic", "True" 
     .AddSampleInterval "", "", "81", "Automatic", "False" 
End With

'@ set tetrahedral mesh type

Mesh.MeshType "Tetrahedral"

'@ define solver parameters

Mesh.SetCreator "High Frequency" 
With Solver 
     .CalculationType "TD-S" 
     .StimulationPort "1" 
     .StimulationMode "1" 
     .SteadyStateLimit "-50" 
     .MeshAdaption "False" 
     .CalculateModesOnly "False" 
     .SParaSymmetry "False" 
     .StoreTDResultsInCache "False" 
     .FullDeembedding "False" 
     .UseDistributedComputing "False" 
     .DistributeMatrixCalculation "False" 
End With

'@ set parametersweep options

With ParameterSweep
    .SetSimulationType "Transient" 
End With

'@ define solver parameters

Mesh.SetCreator "High Frequency" 
With Solver 
     .CalculationType "TD-S" 
     .StimulationPort "1" 
     .StimulationMode "1" 
     .SteadyStateLimit "-50" 
     .MeshAdaption "False" 
     .CalculateModesOnly "True" 
     .SParaSymmetry "False" 
     .StoreTDResultsInCache "False" 
     .FullDeembedding "False" 
     .UseDistributedComputing "False" 
     .DistributeMatrixCalculation "False" 
End With

'@ define frequency domain solver parameters

Mesh.SetCreator "High Frequency" 
With FDSolver
     .Reset 
     .Method "Tetrahedral Mesh" 
     .OrderTet "Second" 
     .OrderSrf "Second" 
     .UseDistributedComputing "False" 
     .NetworkComputingStrategy "RunRemote" 
     .NetworkComputingJobCount "3" 
     .Stimulation "1", "1" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-5" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .LimitCPUs "False" 
     .MaxCPUs "8" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "True" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .HexMORSettings "", "1001" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "False" 
     .SetOpenBCTypeHex "Default" 
     .AddMonitorSamples "True" 
     .SParameterSweep "False" 
     .CalcStatBField "False" 
     .UseDoublePrecision "False" 
     .MixedOrder "False" 
     .UsePreconditionerIntEq "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.20" 
     .UseCFIEForCPECIntEq "true" 
     .UseFastRCSSweepIntEq "true" 
     .SetRCSSweepProperties "0.0", "0.0", "0", "0.0", "0.0", "0", "0" 
     .SweepErrorThreshold "True", "0.01" 
     .SweepErrorChecks "2" 
     .SweepMinimumSamples "3" 
     .SweepConsiderAll "True" 
     .SweepConsiderReset 
     .InterpolationSamples "1001" 
     .SweepWeightEvanescent "1.0" 
     .AddSampleInterval "", "", "1", "Automatic", "True" 
     .AddSampleInterval "", "", "81", "Automatic", "False" 
End With

'@ set tetrahedral mesh type

Mesh.MeshType "Tetrahedral"

'@ define frequency domain solver parameters

Mesh.SetCreator "High Frequency" 
With FDSolver
     .Reset 
     .Method "Tetrahedral Mesh" 
     .OrderTet "Second" 
     .OrderSrf "Second" 
     .UseDistributedComputing "False" 
     .NetworkComputingStrategy "RunRemote" 
     .NetworkComputingJobCount "3" 
     .Stimulation "1", "1" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-5" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .LimitCPUs "False" 
     .MaxCPUs "8" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "True" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .HexMORSettings "", "1001" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "False" 
     .SetOpenBCTypeHex "Default" 
     .AddMonitorSamples "True" 
     .SParameterSweep "False" 
     .CalcStatBField "False" 
     .UseDoublePrecision "False" 
     .MixedOrder "False" 
     .UsePreconditionerIntEq "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.20" 
     .UseCFIEForCPECIntEq "true" 
     .UseFastRCSSweepIntEq "true" 
     .SetRCSSweepProperties "0.0", "0.0", "0", "0.0", "0.0", "0", "0" 
     .SweepErrorThreshold "True", "0.01" 
     .SweepErrorChecks "2" 
     .SweepMinimumSamples "3" 
     .SweepConsiderAll "True" 
     .SweepConsiderReset 
     .InterpolationSamples "1001" 
     .SweepWeightEvanescent "1.0" 
     .AddSampleInterval "", "", "1", "Automatic", "True" 
     .AddSampleInterval "", "", "161", "Equidistant", "False" 
End With

'@ define solver parameters

Mesh.SetCreator "High Frequency" 
With Solver 
     .CalculationType "TD-S" 
     .StimulationPort "1" 
     .StimulationMode "1" 
     .SteadyStateLimit "-50" 
     .MeshAdaption "False" 
     .CalculateModesOnly "False" 
     .SParaSymmetry "False" 
     .StoreTDResultsInCache "False" 
     .FullDeembedding "False" 
     .UseDistributedComputing "False" 
     .DistributeMatrixCalculation "False" 
End With

'@ set pba mesh type

Mesh.MeshType "PBA"

'@ define frequency domain solver parameters

Mesh.SetCreator "High Frequency" 
With FDSolver
     .Reset 
     .Method "Tetrahedral Mesh" 
     .OrderTet "Second" 
     .OrderSrf "Second" 
     .UseDistributedComputing "False" 
     .NetworkComputingStrategy "RunRemote" 
     .NetworkComputingJobCount "3" 
     .Stimulation "1", "1" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-5" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .LimitCPUs "False" 
     .MaxCPUs "8" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "True" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .HexMORSettings "", "1001" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "False" 
     .SetOpenBCTypeHex "Default" 
     .AddMonitorSamples "True" 
     .SParameterSweep "False" 
     .CalcStatBField "False" 
     .UseDoublePrecision "False" 
     .MixedOrder "False" 
     .UsePreconditionerIntEq "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.20" 
     .UseCFIEForCPECIntEq "true" 
     .UseFastRCSSweepIntEq "true" 
     .SetRCSSweepProperties "0.0", "0.0", "0", "0.0", "0.0", "0", "0" 
     .SweepErrorThreshold "True", "0.01" 
     .SweepErrorChecks "2" 
     .SweepMinimumSamples "3" 
     .SweepConsiderAll "True" 
     .SweepConsiderReset 
     .InterpolationSamples "1001" 
     .SweepWeightEvanescent "1.0" 
     .AddSampleInterval "", "", "1", "Automatic", "True" 
     .AddSampleInterval "", "", "91", "Equidistant", "False" 
End With

'@ set tetrahedral mesh type

Mesh.MeshType "Tetrahedral"

'@ clear picks

Pick.ClearAllPicks

'@ define solver parameters

Mesh.SetCreator "High Frequency" 
With Solver 
     .CalculationType "TD-S" 
     .StimulationPort "1" 
     .StimulationMode "1" 
     .SteadyStateLimit "-50" 
     .MeshAdaption "False" 
     .CalculateModesOnly "False" 
     .SParaSymmetry "False" 
     .StoreTDResultsInCache "False" 
     .FullDeembedding "False" 
     .UseDistributedComputing "False" 
     .DistributeMatrixCalculation "False" 
End With

'@ set pba mesh type

Mesh.MeshType "PBA"

'@ define frequency domain solver parameters

Mesh.SetCreator "High Frequency" 
With FDSolver
     .Reset 
     .Method "Tetrahedral Mesh" 
     .OrderTet "Second" 
     .OrderSrf "Second" 
     .UseDistributedComputing "False" 
     .NetworkComputingStrategy "RunRemote" 
     .NetworkComputingJobCount "3" 
     .Stimulation "1", "1" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-5" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .LimitCPUs "False" 
     .MaxCPUs "8" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "True" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .HexMORSettings "", "1001" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "False" 
     .SetOpenBCTypeHex "Default" 
     .AddMonitorSamples "True" 
     .SParameterSweep "False" 
     .CalcStatBField "False" 
     .UseDoublePrecision "False" 
     .MixedOrder "False" 
     .UsePreconditionerIntEq "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.20" 
     .UseCFIEForCPECIntEq "true" 
     .UseFastRCSSweepIntEq "true" 
     .SetRCSSweepProperties "0.0", "0.0", "0", "0.0", "0.0", "0", "0" 
     .SweepErrorThreshold "True", "0.01" 
     .SweepErrorChecks "2" 
     .SweepMinimumSamples "3" 
     .SweepConsiderAll "True" 
     .SweepConsiderReset 
     .InterpolationSamples "1001" 
     .SweepWeightEvanescent "1.0" 
     .AddSampleInterval "", "", "1", "Automatic", "True" 
     .AddSampleInterval "", "", "91", "Equidistant", "False" 
End With

'@ set tetrahedral mesh type

Mesh.MeshType "Tetrahedral"

'@ define solver parameters

Mesh.SetCreator "High Frequency" 
With Solver 
     .CalculationType "TD-S" 
     .StimulationPort "1" 
     .StimulationMode "1" 
     .SteadyStateLimit "-50" 
     .MeshAdaption "False" 
     .CalculateModesOnly "False" 
     .SParaSymmetry "False" 
     .StoreTDResultsInCache "False" 
     .FullDeembedding "False" 
     .UseDistributedComputing "False" 
     .DistributeMatrixCalculation "False" 
End With

'@ set pba mesh type

Mesh.MeshType "PBA" 

'@ define automesh parameters

With Mesh 
     .AutomeshStraightLines "True" 
     .AutomeshEllipticalLines "True" 
     .AutomeshRefineAtPecLines "True", "2" 
     .AutomeshRefinePecAlongAxesOnly "False" 
     .AutomeshAtEllipseBounds "True", "10" 
     .AutomeshAtWireEndPoints "True" 
     .AutomeshAtProbePoints "True" 
     .SetAutomeshRefineDielectricsType "Generalized" 
     .MergeThinPECLayerFixpoints "False" 
     .EquilibrateMesh "False" 
     .EquilibrateMeshRatio "1.19" 
     .UseCellAspectRatio "False" 
     .CellAspectRatio "50.0" 
     .UsePecEdgeModel "True" 
     .MeshType "Tetrahedral" 
     .AutoMeshLimitShapeFaces "True" 
     .AutoMeshNumberOfShapeFaces "1000" 
     .PointAccEnhancement "0" 
     .SurfaceOptimization "True" 
     .SurfaceSmoothing "3" 
     .MinimumCurvatureRefinement "200" 
     .CurvatureRefinementFactor "0.01" 
     .SmallFeatureSize "0.0" 
     .SurfaceTolerance "0.0" 
     .SurfaceToleranceType "Relative" 
     .NormalTolerance "22.5" 
     .SurfaceMeshEnrichment "0" 
     .VolumeOptimization "True" 
     .VolumeSmoothing "True" 
     .VolumeMeshMethod "Delaunay" 
     .SurfaceMeshMethod "General" 
     .DelaunayOptimizationLevel "2" 
     .DelaunayPropagationFactor "1.050000" 
     .DensityTransitions "0.5" 
     .MeshAllRegions "False" 
     .ConvertGeometryDataAfterMeshing "True" 
     .AutomeshFixpointsForBackground "True" 
     .PBAType "Fast PBA" 
     .AutomaticPBAType "True" 
     .FPBAAvoidNonRegUnite "True" 
     .DetectSmallSolidPEC "False" 
     .ConsiderSpaceForLowerMeshLimit "True" 
     .RatioLimitGovernsLocalRefinement "False" 
     .FastPBAGapDetection "False" 
     .FPBAGapTolerance "0.001" 
     .SetMaxParallelThreads "8"
     .SetParallelMode "Maximum"
End With 

With Solver 
     .UseSplitComponents "True" 
     .PBAFillLimit "99" 
     .EnableSubgridding "False" 
     .AlwaysExcludePec "False" 
End With 


'@ set mesh properties

With Mesh 
     .StepsPerWavelengthTet "5" 
     .MinimumStepNumberTet "10" 
     .MeshType "Tetrahedral" 
     .MeshAllRegions "False" 
     .MaterialRefinementTet "True" 
End With 


'@ set 3d mesh adaptation properties

With MeshAdaption3D
    .SetType "HighFrequencyTet" 
    .SetAdaptionStrategy "ExpertSystem" 
    .MinPasses "3" 
    .MaxPasses "12" 
    .MeshIncrement "5" 
    .MaxDeltaS "0.0001" 
    .NumberOfDeltaSChecks "2" 
    .PropagationConstantAccuracy "0.005" 
    .NumberOfPropConstChecks "4" 
    .MinimumAcceptedCellGrowth "0.5" 
    .RefThetaFactor            "30" 
    .ImproveBadElementQuality "True" 
    .SubsequentChecksOnlyOnce "False" 
    .WavelengthBasedRefinement "True" 
    .ManualThetaRef "False" 
    .MultipleEdgeRef "False" 
End With


'@ define frequency domain solver parameters

Mesh.SetCreator "High Frequency" 

With FDSolver
     .Reset 
     .Method "Tetrahedral Mesh" 
     .OrderTet "Second" 
     .OrderSrf "Second" 
     .UseDistributedComputing "False" 
     .NetworkComputingStrategy "RunRemote" 
     .NetworkComputingJobCount "3" 
     .Stimulation "1", "1" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-5" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .LimitCPUs "False" 
     .MaxCPUs "8" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "True" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .HexMORSettings "", "1001" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "False" 
     .SetOpenBCTypeHex "Default" 
     .AddMonitorSamples "True" 
     .SParameterSweep "False" 
     .CalcStatBField "False" 
     .UseDoublePrecision "False" 
     .MixedOrder "False" 
     .UsePreconditionerIntEq "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.20" 
     .UseCFIEForCPECIntEq "true" 
     .UseFastRCSSweepIntEq "true" 
     .SetRCSSweepProperties "0.0", "0.0", "0", "0.0", "0.0", "0", "0" 
     .SweepErrorThreshold "True", "0.01" 
     .SweepErrorChecks "2" 
     .SweepMinimumSamples "3" 
     .SweepConsiderAll "True" 
     .SweepConsiderReset 
     .InterpolationSamples "1001" 
     .SweepWeightEvanescent "1.0" 
     .AddSampleInterval "", "", "1", "Automatic", "True" 
     .AddSampleInterval "", "", "7", "Equidistant", "False" 
End With


End Sub
