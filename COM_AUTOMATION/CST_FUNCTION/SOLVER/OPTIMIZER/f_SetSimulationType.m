function status = f_SetSimulationType(oMWS,simType)
% Transient Solver				Selects the time domain solver
% Eigenmode Solver				Selects the eigenmode solver
% Asymptotic Solver				Selects the asymtotic solver.
% Multilayer Solver				Selects the multilayer solver..
% Frequency Domain 				Solver	Selects the frequency domain solver.
% Integral Equation Solver		Selects the integral equation solver.
% Template Based Postprocessing	Selects the template based postprocessing.

oOptimizer = invoke(oMWS,'Optimizer');
status     = invoke(oOptimizer,'SetSimulationType',simType);
end