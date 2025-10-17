function f_SetMaxIt(oMWS,maxIt,optimizerType)
% Set the maximal number of iterations. The Genetic Algorithm or the Particle Swarm Optimization 
% will stop after the maximal number of iterations have been done. Like this, it is possible to 
% estimate the maximal optimization time a priori. If "n" is the population size and "m" is the
% maximal number of iterations "(m+1)*n/2 + 1" solver runs will be done. However this estimation
% is not valid if the Interpolation feature SetUseInterpolation is switched on, the optimization
% is aborted or the desired accuracy is reached
%         'Genetic_Algorithm'
%         'Particle_Swarm' 
%         'CMAES'
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetMaxIt',maxIt,optimizerType);
end