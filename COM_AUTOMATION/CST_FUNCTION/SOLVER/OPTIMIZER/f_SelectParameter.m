function status = f_SelectParameter(oMWS,paraName,bFlag)
% Select the parameter specified by its name paraName. 
% If bFlag is True the parameter named paraName is chosen to be optimized.
oOptimizer = invoke(oMWS,'Optimizer');
status     = invoke(oOptimizer,'SelectParameter',paraName,bFlag);
end