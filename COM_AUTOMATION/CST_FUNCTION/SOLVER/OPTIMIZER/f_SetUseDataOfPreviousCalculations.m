function f_SetUseDataOfPreviousCalculations(oMWS,bFlag)
% Activate this method to trigger the import of previously calculated results for new optimizations 
% to speed up the optimization process. If the result templates on which the optimizer goals are based 
% were already evaluated before and the corresponding parameter combinations lie in the defined parameter
% space the results might be imported without the need for recalculation. For the local algorithms 
% it's possible that the initial point is replaced if a more suitable point is found in advance. For the
% algorithms that use a set of initial points, multiple initial points will be replaced by points that lie
% close or have a better goal value than the points in the close neighbourhood. This may disturb the selected
% distribution type but the algorithm will find a good compromise between finding points with good goal value and
% a well distributed set of starting points in the parameter space. Keep in mind that this feature will make the 
% reproducibility of optimizations more difficult because after an optimization there will be more potential imports available than before.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetUseDataOfPreviousCalculations',bFlag);
end