function f_SetUseMaxEval(oMWS,bFlag,optimizerType)
% Set this option to enable the use of the maximal number of evaluations. 
% This option is only available for the Nelder Mead Simplex Algorithm and CMAES.
% optimizerType: 'Nelder_Mead_Simplex', 'CMAES' 
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetUseMaxEval',bFlag,optimizerType);
end