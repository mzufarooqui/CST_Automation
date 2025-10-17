function f_SetOptimizerType(oMWS,optType)
% You can choose between seven kinds of optimizer types here. If the runtime 
% of the solver is long the Trust Region Framework is recommended, especially when the 
% starting point of the optimization is already in the neighbourhood of the expected optimum.
% If the solver evaluation is quick the Covariance Matrix Adaptation Evolutionary Strategy may
% be superior because of it's global optimization algorithm properties. The Nelder Mead Simplex 
% algorithm is also know to work well on multiple problems.
% optimizerType can have one of the following values:
%
% 'Trust_Region'
%         Selects a local optimizing technique embedded in a trust region framework. 
%         The algorithm starts with building a linear model on primary data in a 'trust' region around 
%         the starting point. For building this model sensitivity information of the primary data will
%         be exploited if provided. Fast optimizations are done based on this local model to achieve a 
%         candidate for a new solver evaluation. The new point is accepted, if it is superior to the anchors
%         of the model. If the model is not accurate enough the radius of the trust region will be decreased
%         and a model on the new trust region will be created. The algorithm will be converged once the trust
%         region radius or distance to the next predicted optimum becomes smaller than the specified domain accuracy.
% 
% 'Nelder_Mead_Simplex'
%        Selects the local Simplex optimization algorithm by Nelder and Mead. This method is a local
%        optimization technique. If N is the number of parameters, it starts with N+1 points distributed in the parameter space.
% 
% 'CMAES'
%       Selects the global Covariance Matrix Adaptation Evolutionary Strategy. The method follows 
%       a global optimization approach in general. An internal step size parameter introduces a convergence property to the method.
% 
% 'Genetic_Algorithm'
%       Selects the global genetic optimizer.
% 
% 'Particle_Swarm'
%       Selects the global particle swarm optimizer.
%
% 'Interpolated_NR_VariableMetric'
%         Selects the local optimizer supporting interpolation of primary data. This optimizer is fast
%         in comparison to the Classic Powell optimizer but may be less accurate. In addition, you can set
%         the number N of optimizer passes (1 to 10) for this optimizer type. A number N greater than 1 forces 
%         the optimizer to start over (N-1) times. Within each optimizer pass the minimum and maximum settings
%         of the parameters are changed approaching the optimal parameter setting. Increase the number of passes
%         to values greater than 1 (e.g., 2 or 3)  to obtain more accurate results. It is recommended for the
%         most common EM optimizations not to increase the number higher than 3 but to increase the number of
%         samples in the parameter list, if the results are not suitable.
% 
% 'Classic Powell'
%         Selects the local optimizer without interpolation of primary data. In addition, it is 
%         necessary to set the accuracy, which effects the accuracy of the optimal parameter settings and the
%         time of termination of the optimization process. For optimizations with more than one parameter the 
%         Trust Region Framework, the Interpolated Quasi Newton or the Nelder Mead Simplex Algorithm should be
%         preferred to this technique.

oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetOptimizerType',optType);
end