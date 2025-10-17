function f_SetUseInterpolation(oMWS,interpType,optimizerType)
% This option is only available for the Genetic Algorithm or the Particle Swarm Optimization. 
% Check this box to activate the interpolation, and disables the sample values in the parameter list.
% For both global optimizers it is possible to switch on the Interpolation of Primary Data.
% If the interpolation is applied the only true solver runs that will be done are the ones for the evaluation
% of the specified anchors and a final solver run for the estimated  best parameters. All other goal function evaluations will be interpolated.
% Please note that global optimization algorithms have the probability of exploring most of the parameter
% space. Thus it is most likely that all or nearly all anchor points will actually be evaluated. Keep in mind 
% that the number of solver runs needed for interpolation is dependant of the number of parameters whereas the
% number of solver runs needed for the two global optimization algorithms are independent of the number of parameters.
% Because of this, the usage of the interpolation feature will only pay off if the parameter space is not too high dimensional or a large number of iterations is planned.
% Since the possible goal functions that can be defined have always non negative values the optimization will
% automatically be stopped if one of the anchor evaluations yields a goal value equal zero.
% 
% interpType   : 'Second_Order'
% optimizerType: 'Genetic_Algorithm', 'Particle_Swarm' 
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetUseInterpolation',interpType,optimizerType);
end