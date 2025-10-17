function f_SetDataStorageStrategy(oMWS,storageType)
% Sets the storage strategy for the 1D results produced during the optimization. 
% For optimizations which generate much results on each evaluation or are expected to
% run for many evaluations it's possible to save time and disc space by avoiding the storage
% of the signals via the option 'None'. This setting doesn't apply to the template based post processing results.
% storageType: 'All', 'Automatic', 'None'
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetDataStorageStrategy',storageType);
end 