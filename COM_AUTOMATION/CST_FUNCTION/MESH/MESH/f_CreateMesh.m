function status = f_CreateMesh(oMWS,oMesh)
%% DEFINE FREQUENCY DOMAIN SOLVER
%% FIELD DEFINATION
%  oMesh.meshType:
%     Selection are: 'PBA','Staircase','Tetrahedral','Surface', 'SurfaceML'
%  oMesh.PBAType:
%     Selection are: 'PBA','Fast PBA'
%  oMesh.stepsPerWavelengthTet ( double value )
%     This value modifies the mesh generation with regard to the wavelength of the highest frequency set for the simulation. It specifies the maximum length of a mesh edge as a fraction of the wave length. A setting of 4, e.g. specifies a maximum mesh edge length of a quarter of a wave length. This setting applies to tetrahedral grids only.
%  oMesh.minimumStepNumberTet ( double value )
%     This setting defines an upper limit of the mesh edge length to be used for the mesh creation, regardless of the settings done using the StepsPerWavelengthTet method. In fact it defines a maximum mesh edge length by dividing the diagonal of the calculation volume by this number. This setting applies to tetrahedral grids only.
%  oMesh.curvatureRefinementFactor:
%     This method specifies how accurately curves structure edges should be sampled by mesh edges. This parameter specifies an upper limit for the maximum distance of the structure edge from the corresponding mesh edge divided by the length of the mesh edge. The smaller this value, the more accurate the curved structure edges are sampled. Please note that small settings provide a good approximation of structure edges, but also result in large numbers of tetrahedrons. Please note that this setting applies only to structure edges, but not to faces of the structure.
%  oMesh.minimumCurvatureRefinement:
%     This factor specifies the maximum refinement which can be achieved due to the CurvatureRefinementFactor setting. Some geometries (like the tip of a cone) correspond to extremely large curvatures. This in turn would result in very dense meshes due to the curvature refinement if not limited otherwise. This limit specifies how much the curvature refinement must refine the mesh around geometric singularities. A setting of e.g. 30 allows a 30-fold refinement due to curvature refinement settings. In order to allow at least a little refinement in the mesh, this setting must be at least 2.0.
%  oMesh.bUseRatioLimit ( bool bFlag ) NOT AVAILABLE WITH 'Tetrahedral' MESH  TYPE
%     Use the ratio limit defined by RatioLimit instead of the smallest mesh step width defined with SmallestMeshStep.
%  oMesh.ratioLimit:
%     This setting forces the mesh module not to overcome an absolute ratio between the maximum distance between two neighbouring mesh lines and the minimum distance between two neighbouring meshlines. Please note that this setting holds for the manual mesh as well. If two fixpoints are set too close to another (according to this definition) these fixpoints may not lay on a mesh lines although expected.
%  oMesh.smallestMeshStep ( double value )
%     Sets a smallest mesh step width.
%% EXAMPLE:
%   1-
%   For Hexahedral mesh(may use with TD)
%  oMesh.bUseRatioLimit         = 'True' ;
%  oMesh.ratioLimit             = 10.0;
%  oMesh.linesPerWavelength     = 10;
%  oMesh.minimumStepNumber      = 10.0;
%  oMesh.bAutomesh              = 'True';
%  oMesh.meshType               = 'PBA';
%  status = f_CreateMesh(oMWS,oMesh)
%  2-
%  For Tetrahedral mesh
%  oMesh.stepsPerWavelengthTet  = 4;
%  oMesh.minimumStepNumberTet   = 10.0;
%  oMesh.meshType               = 'Tetrahedral';
%  oMesh.bMeshAllRegions        = 'False';
%  oMesh.bMaterialRefinementTet = 'True';
%  status = f_CreateMesh(oMWS,oMesh)
%  3-
%  Usual Setting with FD
%  oMesh.stepsPerWavelengthTet      = 4;
%  oMesh.minimumStepNumberTet       = 10;
%  oMesh.meshType                   = 'Tetrahedral';
%  oMesh.PBAType                    = 'PBA';
%  oMesh.curvatureRefinementFactor  = 0.05;
%  oMesh.minimumCurvatureRefinement = 100;
%  oMesh.curvatureOrder             = 5;
%  f_CreateMesh(oMWS,oMesh);
%% MATLAB SCRIPT

if isfield(oMesh,'curvatureOrder'),
    status = f_CreateAutoMesh(oMWS,oMesh);
end
historyStr = [];
if isfield(oMesh,'setMeshType') % This is only for TD-Solver
    historyStr = sprintf('%s\nWith MeshSettings',historyStr);
    historyStr = sprintf('%s\n\t.SetMeshType "%s"',historyStr,num2str(oMesh.setMeshType));
    historyStr = sprintf('%s\n\t.Set "Version", 0%',historyStr);
    historyStr = sprintf('%s\nEnd With\n',historyStr);
end

historyStr = sprintf('%s\nWith Mesh',historyStr);
if isfield(oMesh,'PBAType'),                     historyStr = sprintf('%s\n\t.PBAType "%s"',                        historyStr,num2str(oMesh.PBAType));                   end
if isfield(oMesh,'stepsPerWavelengthTet'),       historyStr = sprintf('%s\n\t.StepsPerWavelengthTet "%s"',          historyStr,num2str(oMesh.stepsPerWavelengthTet));     end
if isfield(oMesh,'minimumStepNumberTet'),        historyStr = sprintf('%s\n\t.MinimumStepNumberTet "%s"',           historyStr,num2str(oMesh.minimumStepNumberTet));      end



if isfield(oMesh,'linesPerWavelength'),          historyStr = sprintf('%s\n\t.LinesPerWavelength "%s"',             historyStr,num2str(oMesh.linesPerWavelength));        end
if isfield(oMesh,'minimumStepNumber'),           historyStr = sprintf('%s\n\t.MinimumStepNumber "%s"',     			historyStr,num2str(oMesh.minimumStepNumber));         end
if isfield(oMesh,'bAutomesh'),                   historyStr = sprintf('%s\n\t.Automesh "%s"',              			historyStr,num2str(oMesh.bAutomesh));                 end
if isfield(oMesh,'bUseRatioLimit')
    if strcmp(lower(oMesh.bUseRatioLimit),'true')
        if isfield(oMesh,'bUseRatioLimit'),      historyStr = sprintf('%s\n\t.UseRatioLimit "%s"',                  historyStr,num2str(oMesh.bUseRatioLimit));            end
        if isfield(oMesh,'ratioLimit'),          historyStr = sprintf('%s\n\t.RatioLimit "%s"',                     historyStr,num2str(oMesh.ratioLimit));                end
        if isfield(oMesh,'smallestMeshStep'),    historyStr = sprintf('%s\n\t.SmallestMeshStep "%s"',               historyStr,num2str(oMesh.smallestMeshStep));          end
    end
end
if isfield(oMesh,'meshType'),
    historyStr = sprintf('%s\n\t.MeshType "%s"',historyStr,num2str(oMesh.meshType));
    if strcmp(oMesh.meshType,'PBA'),
        historyStr = sprintf('%s\n\t.SetCreator "High Frequency"',historyStr);
    end
    if strcmp(oMesh.meshType,'Tetrahedral'),
        if isfield(oMesh,'bMeshAllRegions'),             historyStr = sprintf('%s\n\t.MeshAllRegions "%s"',        			historyStr,num2str(oMesh.bMeshAllRegions));        else, historyStr = sprintf('%s\n\t.MeshAllRegions "False"',      historyStr);end
        if isfield(oMesh,'bMaterialRefinementTet'),      historyStr = sprintf('%s\n\t.MaterialRefinementTet "%s"', 			historyStr,num2str(oMesh.bMaterialRefinementTet)); else, historyStr = sprintf('%s\n\t.MaterialRefinementTet "True"',historyStr);end
    end
end
historyStr    = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'set mesh properties' ];
status        = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end

function status = f_CreateAutoMesh(oMWS,oMesh)


historyStr = [];
historyStr = sprintf('With MeshSettings');
historyStr = sprintf('%s\n\t.SetMeshType "Tet"',historyStr);
historyStr = sprintf('%s\n\t.Set "Version", 0%',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);

historyStr = sprintf('%s\nWith Mesh',historyStr); 
historyStr = sprintf('%s\n\t.AutomeshStraightLines "True"',historyStr); 
historyStr = sprintf('%s\n\t.AutomeshEllipticalLines "True"',historyStr); 
if isfield(oMesh,'automeshRefineAtPecLines'),    historyStr = sprintf('%s\n\t.AutomeshRefineAtPecLines "%s", "%s"', historyStr,cell2mat(oMesh.automeshRefineAtPecLines(1)),num2str(cell2mat(oMesh.automeshRefineAtPecLines(2))));end
historyStr = sprintf('%s\n\t.AutomeshRefinePecAlongAxesOnly "False"',historyStr); 
historyStr = sprintf('%s\n\t.AutomeshAtEllipseBounds "True", "10"',historyStr); 
historyStr = sprintf('%s\n\t.AutomeshAtWireEndPoints "True"',historyStr); 
historyStr = sprintf('%s\n\t.AutomeshAtProbePoints "True"',historyStr); 
historyStr = sprintf('%s\n\t.SetAutomeshRefineDielectricsType "Generalized"',historyStr); 
historyStr = sprintf('%s\n\t.MergeThinPECLayerFixpoints "False"',historyStr); 
historyStr = sprintf('%s\n\t.EquilibrateMesh "False"',historyStr); 
historyStr = sprintf('%s\n\t.EquilibrateMeshRatio "1.19"',historyStr); 
historyStr = sprintf('%s\n\t.UseCellAspectRatio "False"',historyStr); 
historyStr = sprintf('%s\n\t.CellAspectRatio "50.0"',historyStr); 
historyStr = sprintf('%s\n\t.UsePecEdgeModel "True"',historyStr); 
historyStr = sprintf('%s\n\t.MeshType "Tetrahedral"',historyStr); 
historyStr = sprintf('%s\n\t.AutoMeshLimitShapeFaces "True"',historyStr); 
historyStr = sprintf('%s\n\t.AutoMeshNumberOfShapeFaces "1000"',historyStr); 
historyStr = sprintf('%s\n\t.PointAccEnhancement "0"',historyStr); 
historyStr = sprintf('%s\n\t.SurfaceOptimization "True"',historyStr); 
historyStr = sprintf('%s\n\t.SurfaceSmoothing "3"',historyStr); 
if isfield(oMesh,'minimumCurvatureRefinement'),  historyStr = sprintf('%s\n\t.MinimumCurvatureRefinement "%s"',     historyStr,num2str(oMesh.minimumCurvatureRefinement));end
if isfield(oMesh,'curvatureRefinementFactor'),   historyStr = sprintf('%s\n\t.CurvatureRefinementFactor "%s"',      historyStr,num2str(oMesh.curvatureRefinementFactor)); end
historyStr = sprintf('%s\n\t.AnisotropicCurvatureRefinement "False"',historyStr); 
historyStr = sprintf('%s\n\t.SmallFeatureSize "0.0"',historyStr); 
historyStr = sprintf('%s\n\t.SurfaceTolerance "0.0"',historyStr); 
historyStr = sprintf('%s\n\t.SurfaceToleranceType "Relative"',historyStr); 
historyStr = sprintf('%s\n\t.NormalTolerance "22.5"',historyStr); 
historyStr = sprintf('%s\n\t.AnisotropicCurvatureRefinementFSM "False"',historyStr); 
historyStr = sprintf('%s\n\t.SurfaceMeshEnrichment "0"',historyStr); 
historyStr = sprintf('%s\n\t.DensityTransitionsFSM "0.5"',historyStr); 
historyStr = sprintf('%s\n\t.VolumeOptimization "True"',historyStr); 
historyStr = sprintf('%s\n\t.VolumeSmoothing "True"',historyStr); 
historyStr = sprintf('%s\n\t.VolumeMeshMethod "Delaunay"',historyStr); 
historyStr = sprintf('%s\n\t.SurfaceMeshMethod "General"',historyStr); 
historyStr = sprintf('%s\n\t.SurfaceMeshGeometryAccuracy "1.0e-6"',historyStr); 
historyStr = sprintf('%s\n\t.DelaunayOptimizationLevel "2"',historyStr); 
historyStr = sprintf('%s\n\t.DelaunayPropagationFactor "1.050000"',historyStr); 
historyStr = sprintf('%s\n\t.DensityTransitions "0.5"',historyStr); 
if isfield(oMesh,'bMeshAllRegions'),             historyStr = sprintf('%s\n\t.MeshAllRegions "%s"',        			historyStr,num2str(oMesh.bMeshAllRegions));        else, historyStr = sprintf('%s\n\t.MeshAllRegions "False"',      historyStr);end
historyStr = sprintf('%s\n\t.ConvertGeometryDataAfterMeshing "True"',historyStr); 
historyStr = sprintf('%s\n\t.AutomeshFixpointsForBackground "True"',historyStr); 
historyStr = sprintf('%s\n\t.PBAType "Fast PBA"',historyStr); 
historyStr = sprintf('%s\n\t.AutomaticPBAType "True"',historyStr); 
historyStr = sprintf('%s\n\t.DetectSmallSolidPEC "False"',historyStr); 
historyStr = sprintf('%s\n\t.ConsiderSpaceForLowerMeshLimit "True"',historyStr); 
historyStr = sprintf('%s\n\t.RatioLimitGovernsLocalRefinement "False"',historyStr); 
historyStr = sprintf('%s\n\t.GapDetection "False"',historyStr); 
historyStr = sprintf('%s\n\t.FPBAGapTolerance "1e-3"',historyStr); 
historyStr = sprintf('%s\n\t.SetMaxParallelMesherThreads "Hex", "8"',historyStr);
historyStr = sprintf('%s\n\t.SetParallelMesherMode "Hex", "Maximum"',historyStr);
historyStr = sprintf('%s\n\t.AutomeshRefineThermalMaterials "False"',historyStr); 
historyStr = sprintf('%s\n\t.SetThermalRefinementConductivityReference "1e-3"',historyStr); 
historyStr = sprintf('%s\n\t.SetThermalRefinementHeatCapacityReference "1e-3"',historyStr);
historyStr = sprintf('%s\n\t.SetParallelMesherMode "Tet", "maximum"',historyStr);
historyStr = sprintf('%s\n\t.SetMaxParallelMesherThreads "Tet", "1"',historyStr);
historyStr = sprintf('%s\n\t.ConnectivityCheck "False"',historyStr);
historyStr = sprintf('%s\n\t.SelfIntersectingCheck "True"',historyStr);
historyStr = sprintf('%s\n\t.FPBAAccuracyEnhancement "default"',historyStr);
historyStr = sprintf('%s\n\t.FastPBAAccuracy "3"',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr); 

historyStr = sprintf('%s\nWith Solver',historyStr); 
historyStr = sprintf('%s\n\t.UseSplitComponents "True"',historyStr); 
historyStr = sprintf('%s\n\t.PBAFillLimit "99"',historyStr); 
historyStr = sprintf('%s\n\t.EnableSubgridding "False"',historyStr); 
historyStr = sprintf('%s\n\t.AlwaysExcludePec "False"',historyStr); 
historyStr = sprintf('%s\nEnd With',historyStr); 

historyStr = sprintf('%s\nWith MeshSettings',historyStr); 
historyStr = sprintf('%s\n\t.SetMeshType "Tet"',historyStr);
historyStr = sprintf('%s\n\t.Set "CurvatureOrder", "%s"',historyStr,num2str(oMesh.curvatureOrder));
historyStr = sprintf('%s\nEnd With',historyStr); 

historyStr = sprintf('%s\nWith MeshSettings',historyStr); 
historyStr = sprintf('%s\n\t.SetMeshType "Unstr"',historyStr);
historyStr = sprintf('%s\n\t.Set "UseDC", "0"',historyStr); 
historyStr = sprintf('%s\nEnd With',historyStr);

historyHeader = [ 'define automesh parameters' ];
status        = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end