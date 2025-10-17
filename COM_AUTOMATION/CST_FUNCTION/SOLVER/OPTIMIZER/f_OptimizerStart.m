function status = f_OptimizerStart(oMWS)
oOptimizer = invoke(oMWS,'Optimizer');
status     = invoke(oOptimizer,'Start');
end