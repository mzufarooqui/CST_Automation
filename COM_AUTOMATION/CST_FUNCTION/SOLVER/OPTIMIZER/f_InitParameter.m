function f_InitParameter(oMWS,paramName,paramValIni,paramValMin,paramValMax)
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SelectParameter', paramName,'True');
invoke(oOptimizer,'SetAlwaysStartFromCurrent','False');
invoke(oOptimizer,'SetParameterInit',paramValIni);
invoke(oOptimizer,'SetParameterMin', paramValMin);
invoke(oOptimizer,'SetParameterMax', paramValMax);
end