function f_SetAccuracy(oMWS,accuracy)
% This value defines when the Classic Powell optimizer stops. It is a norm of the
% difference between the actual and the previous set of parameters.
% So general speaking the Powell optimizer stops, if  the change of all the parameters
% used is smaller than the value given here.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetAccuracy',accuracy);
end 