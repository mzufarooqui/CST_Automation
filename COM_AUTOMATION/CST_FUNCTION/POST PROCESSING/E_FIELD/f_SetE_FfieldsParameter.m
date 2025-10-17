function f_SetE_FfieldsParameter(oMWS,oFarField)
%% SET FAR FIELD PARAMETER
%% FUNCTION ARGUMENT DEFINATION
%  oFarField.plotType
%       polar
%         - Plots the farfield with one coordinate varying and one fixed as a polar plot. Underneath the plot there will be shown some secondary coefficients like main lobe direction, 3dB-angular width and side lobe suppression.
%       cartesian
%         - Plots the farfield with one coordinate varying and one fixed as a cartesian plot.
%       2d
%         - Plots the farfield with both coordinates varying as a 2D plot with each point colored according to its field value (see the color bar below the plot).
%       3d
%         - Plots the farfield with both coordinates varying as a 3D plot.% 
%  oFarField.plotMode
%       directivity
%           - The directivity is plotted in the farfield plot.
%       gain
%           - The gain is plotted in the farfield plot.
%       realized gain
%           - The realized gain is plotted in the farfield plot.
%       efield
%           - The electric field is plotted in the farfield plot.
%       hfield
%           - The magnetic field is plotted in the farfield plot.
%       pfield
%           - The power pattern is plotted in the farfield plot.
%       rcs
%           - The radar cross section (square meters) is plotted in the farfield plot.
%       rcssw
%           - The radar cross section (square wavelength)  is plotted in the farfield plot.
% oFarField.dBUnit
%       Sets the a unit for linear and logarithmic farfield plots.
%       unitCode can have one of the following values:
%           -1      Maximum = 1             Maximum = 0 dB
%            0      V/m, A/m, W/m2          dBV/m, dBA/m, dBW/m2
%            60     mV/m, mA/m, uW/m2       dBmV/m, dBmA/m, dBpW/m2
%            120    uV/m, uA/m, pW/m2       dBuV/m, dBuA/m, dBpW/m2
%           -60    kV/m, kA/m, MW/m2       dBkV/m, dBkA/m, dBMW/m2
%  oFarField.bSetTheta360
%       This settings extends the plot range of the polar angle (theta, elevation, alpha) to the full circle. The plot range of the corresponding lateral angle (phi, azimuth, epsilon) is reduced accordingly, depending on the active plot type.
%  oFarField.bSymmetricRange
%       Choose the plot range of the lateral angles (phi, azimuth, epsilon) symmetric about the origin. This setting is also applied to the polar angles if possible. 
%% EXAMPLE:
% oFarField.plotType        = 'cartesian';
% oFarField.plotMode        = 'efield';
% oFarField.dBUnit          = -1;
% oFarField.bSetTheta360    = 'True';
% oFarField.bSymmetricRange = 'True';
% f_SetFarfieldsParameter(oMWS,oFarField)

%% MATLAB SCRIPT
oFarfieldPlot = invoke(oMWS,'FarfieldPlot');
invoke(oFarfieldPlot,'Reset');
if isfield(oFarField,'plotType'),        invoke(oFarfieldPlot,'Plottype',oFarField.plotType);             end
if isfield(oFarField,'plotMode'),        invoke(oFarfieldPlot,'SetPlotMode',oFarField.plotMode);          end
if isfield(oFarField,'dBUnit'),          invoke(oFarfieldPlot,'DBUnit',oFarField.dBUnit);                 end
if isfield(oFarField,'bSetTheta360'),    invoke(oFarfieldPlot,'SetTheta360',oFarField.bSetTheta360);      end
if isfield(oFarField,'bSymmetricRange'), invoke(oFarfieldPlot,'SymmetricRange',oFarField.bSymmetricRange);end
if isfield(oFarField,'phi'),             invoke(oFarfieldPlot,'Phi',oFarField.phi);                       end
if isfield(oFarField,'theta'),           invoke(oFarfieldPlot,'Theta',oFarField.theta);                   end
if isfield(oFarField,'step'),            invoke(oFarfieldPlot,'Step',oFarField.step);                    end
if isfield(oFarField,'step2'),           invoke(oFarfieldPlot,'Step2',oFarField.step2);                   end
invoke(oFarfieldPlot,'Plot');










