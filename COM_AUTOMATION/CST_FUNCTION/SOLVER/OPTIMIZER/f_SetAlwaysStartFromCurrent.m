function f_SetAlwaysStartFromCurrent(oMWS,bFlag)
% Activate this method to initialize the optimizer with the current settings (bFlag = True), 
% i.e. you can proceed optimizing your model starting each time from the previously optimized 
% parameter results. However, if you want to restart the optimizer several times with the same 
% initial parameter settings this method should be deactivated (bFlag = False). 
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetAlwaysStartFromCurrent',bFlag);
end