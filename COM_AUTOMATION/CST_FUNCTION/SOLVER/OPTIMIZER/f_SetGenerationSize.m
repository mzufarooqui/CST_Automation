function f_SetGenerationSize(oMWS,genSize,optimizerType)
% It's possible to specify the population size for the Genetic Algorithm or the Particle Swarm Optimization. 
% Keep in mind that choosing a small population size increases the risk that the genes can be depleted.
% If a large population size is chosen there will be more solver evaluations necessary for the calculation of each generation. 
%         'Genetic_Algorithm'
%         'Particle_Swarm' 
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGenerationSize',genSize,optimizerType);
end