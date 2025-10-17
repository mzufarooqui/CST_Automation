function f_SetDomainAccuracy(oMWS,accuracy,optimizerType)
% Set the accuracy of the optimizer in the parameter space if all parameter ranges
% are mapped to the interval [0,1]. This option is only available for the Trust Region Framework.
% optimizerType: 'Trust_Region'
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetDomainAccuracy',accuracy,optimizerType);
end 