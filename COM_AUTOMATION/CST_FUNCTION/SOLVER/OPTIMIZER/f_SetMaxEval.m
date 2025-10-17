function f_SetMaxEval(oMWS,num,optimizerType)
% Sets the maximal number of evaluations for the Nelder Mead Simplex Algorithm or CMAES. 
% Depending on the optimization problem definition it is possible that the specified goal 
% function level can't be reached. In this case it is convenient to define a maximal
% number of function evaluations to restrict optimization time a priory.
% This number has to be greater than one.
% optimizerType: 'Nelder_Mead_Simplex', 'CMAES' 
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetMaxEval',num,optimizerType);
end