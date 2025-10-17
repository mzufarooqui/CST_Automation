function f_SetMinSimplexSize(oMWS,sSize)
% Sets the minimal simplex size for the Nelder Mead Simplex Algorithm.
% For optimization the parameter space is mapped onto the unit cube. 
% The simplex is a geometrical figure that moves in this multidimensional space.
% The algorithm will stop as soon as the largest edge of the Simplex will be smaller
% than the specified size. If the optimization is defined over  just one parameter
% in the interval [0;1] then this setting corresponds with the desired accuracy in the parameter space. 
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetMinSimplexSize',sSize);
end