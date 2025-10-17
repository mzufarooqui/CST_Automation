function status  = f_CreateMeshAdaption3D(oMWS,oMeshAdaption3D)
% oMeshAdaption3D object have following field
% oMeshAdaption3D.setType        = 'HighFrequencyTet';
% oMeshAdaption3D.minPasses      = 3;
% oMeshAdaption3D.maxPasses      = 5;
% oMeshAdaption3D.maxDeltaS      = 1e-14;
% oMeshAdaption3D.meshIncrement  = 6;
%
% Field Defination:-%
% setType ( enum type )
% Sets the type.key may have one of  the following values:
% 'EStatic'   'MStatic'   'JStatic'   'LowFrequency'' HighFrequencyHex'   'HighFrequencyTet'  'Time' 
% MinPasses ( int passes )
% Specifies the minimum number of passes which will be performed for the adaptive mesh refinement, even if the results do not change significantly.
% MaxPasses ( int passes )
% Specifies the maximum number of passes to be performed for the adaptive mesh refinement, even if the results have not sufficiently converged so far. This setting is useful to limit the total calculation time to reasonable amounts.
% MaxDeltaS ( double value )
% The S-parameter error (Delta S) is determined as the maximal deviation of the absolute value of the complex difference of the S-parameters between two subsequent passes. Specify a value between 0.0 and 1.0.
% MeshIncrement ( int value )
% Only for Expert system based strategy. Specifies the number of mesh lines to add to the Mesh.MinimumLineNumber setting after a pass has been completed.

historyStr = [];
historyStr = sprintf('With MeshAdaption3D');
if isfield(oMeshAdaption3D,'setType'),         historyStr = sprintf('%s\n\t.SetType "%s"',       historyStr,num2str(oMeshAdaption3D.setType));end
if isfield(oMeshAdaption3D,'minPasses'),       historyStr = sprintf('%s\n\t.MinPasses "%s"',     historyStr,num2str(oMeshAdaption3D.minPasses));end
if isfield(oMeshAdaption3D,'maxDeltaS'),       historyStr = sprintf('%s\n\t.MaxPasses "%s"',     historyStr,num2str(oMeshAdaption3D.maxPasses));end
if isfield(oMeshAdaption3D,'maxDeltaS'),       historyStr = sprintf('%s\n\t.MaxDeltaS "%s"',     historyStr,num2str(oMeshAdaption3D.maxDeltaS));end
if isfield(oMeshAdaption3D,'meshIncrement'),   historyStr = sprintf('%s\n\t.MeshIncrement "%s"', historyStr,num2str(oMeshAdaption3D.minPasses));end
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define MeshAdaption3D' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end