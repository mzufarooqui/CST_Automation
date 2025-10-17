function f_SetSigma(oMWS,value,optimizerType)
% This option is only available for CMAES. It sets the sigma of the normal distribution
% used in the algorithm to the defined value, which must be greater zero and less or equal one.
% optimizerType: 'CMAES'
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetSigma',value,optimizerType);
end 