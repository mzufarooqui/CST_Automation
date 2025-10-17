function f_SetUsePreDefPointInInitDistribution(oMWS,bFlag,optimizerType)
% This option is only available for the Nelder Mead Simplex Algorithm and CMAES. 
% If this feature is switched on then the point that is defined as anchor point
% in the parameter list will be included in the initial data set of the algorithm. 
% If the current parameter settings are already quite good then it makes sense to
% include this point in the starting set. After the set of initial points is generated 
% the closest point from the automatically generated set will be substituted with the
% predefined point. However if the current point was created by a previous optimization run
% of a local optimizer and a second optimization is planned on a reduced parameter
% space this setting should be turned off because it increases the risk that the second 
% optimization will converge to the same local optimum as before. In this case
% the second optimization won't yield any improvement.
% 
% optimizerType: 'Nelder_Mead_Simplex', 'CMAES' 
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetUsePreDefPointInInitDistribution ',bFlag,optimizerType);
end