function f_SetGoalFunctionLevel(oMWS,level,optimizerType)
% A desired goal function level can be specified for the Genetic Algorithm or 
% the Particle Swarm Optimization. The algorithm will be stopped if the goal function
% value is less than the specified level. However, if the optimization is done distributed 
% this criterion will only be checked after the complete population was calculated.
% If the desired level is set to zero then the Maximal Number of Iterations is the only
% breaking condition. This setting is very convenient if the defined goals can't be
% satisfied per definition or are very unlikely to be reached exactly.
%
% optimizerType   : 'Genetic_Algorithm', 'Particle_Swarm', 'Nelder_Mead_Simplex'
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGoalFunctionLevel',level,optimizerType);
end