function f_SetMutaionRate(oMWS,rate,optimizerType)
% If the genes of  two parents are similar enough the mutation rate specifies 
% the probability that a mutation occurs. This option is only available for the
% Genetic Algorithm and the Particle Swarm Optimization. 
%
% optimizerType   : 'Genetic_Algorithm', 'Particle_Swarm'
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetMutaionRate',rate,optimizerType);
end