function [deviceName parameterName parameterRange] = f_GridDefination()
deviceName = 'RectWaveguide';
parameterName = {'a','b','z'};
parameterRange = [...
    5.0 2.4 09 % Min. value
    5.5 2.6 11 % Max. value
    03  03  03 % Number of points
    ];         % The number of columns shoud be equal to the parameterName column

end