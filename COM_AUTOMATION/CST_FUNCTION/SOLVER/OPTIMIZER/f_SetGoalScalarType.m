function f_SetGoalScalarType(oMWS,goalScalType)
% Defines the real scalar type of the complex valued result on which the goal operator is evaluated.
%      'maglin'
%      'magdb10'
%      'magdb20'
%      'real'
%      'imag'
%      'phase'
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGoalScalarType',goalScalType);
end