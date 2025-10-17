function status = f_CreateSolver(oMWS,oSolver)
% Mesh object have following field
% oSolver.frequencyRange      = [10 20];
% oSolver.numberOfPulseWidths = 50;
% oSolver.bUseArfilter        = 'True';
%
% Field Defination:-%
% frequencyRange ( double fmin, double fmax )
%       Sets the frequency range for the simulation. Changing the frequency range has several side effects. The mesh will be changed and all previous simulation results will be deleted. However, before the frequency range is actually changed, a dialog window will appear that asks to save the old results to another file.
% numberOfPulseWidths ( int nPulses )
%         Limits the maximum simulation time. This setting should not be used to stop the simulation generally. By default the steady state monitor should stop it before the maximum simulation time is reached. If the simulation is stopped before the steady state monitors stop it, the calculated scattering parameters will be incorrect. The pulse width is directly related to the chosen frequency range. It is defined by the Gaussian pulse that is used for a default broadband time domain simulation.
% bUseArfilter ( bool flag )
%         The Auto Regressive (AR)-filter is a signal processing method to predict time signals to save simulation time. These predicted signals are then used to calculate the scattering matrices. AR-filtering should be used when simulating very resonant structures.
%         By this function the AR-filter analysis during the time domain calculation can be switched on or off.
%         If an AR-Filter is calculated during the simulation a energy balance from the extrapolated signals is calculated as well. If this energy balance reaches one within a specified limit faster than the EnergyBalanceLimit, it stops the simulation.

if ~isfield(oSolver,'object')
    oSolver.object = oMWS.invoke('Solver');
end
if iscell(oSolver.frequencyRange)
    fMin = oSolver.frequencyRange{1};
    fMax = oSolver.frequencyRange{2};
else
    fMin = oSolver.frequencyRange(1);
    fMax = oSolver.frequencyRange(2);
end
historyStr = [];
historyStr = sprintf('With Solver');
if isfield(oSolver,'frequencyRange'),      historyStr = sprintf('%s\n\t.FrequencyRange "%s", "%s"',historyStr,num2str(fMin),num2str(fMax));end
if isfield(oSolver,'numberOfPulseWidths'), historyStr = sprintf('%s\n\t.NumberOfPulseWidths "%s"', historyStr,num2str(oSolver.numberOfPulseWidths));end
if isfield(oSolver,'bUseArfilter'),        historyStr = sprintf('%s\n\t.UseArfilter "%s"',         historyStr,oSolver.bUseArfilter);end
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'Solver' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);

end