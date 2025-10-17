function status = f_SetBoundaryType(oMWS,oBoundaryType)
% DO NOT USE THIS FUNCTION, I HAVE VALIDATE IT :)
%% FIELD DEFINATION
%  xMin,xMax,yMin,yMax,zMin,zMax 
%         boundary Types are
%         'electric'        Electric boundary condition (Etan = 0)
%         'magnetic'        Magnetic boundary condition (Htan = 0)
%         'open'            Simulates the open space.
%         'expanded open'   Same as 'open' but adds some extra space to the calculation domain.
%         'periodic'	      Simulates a periodic expansion of the calculation domain.
%         'conducting wall' This boundary behaves like a wall of lossy metal material.
%         'unit cell'       Simulates a unit cell structure.
%  layer
% 	Specifies the number of PML layers. Usually 4 layers are sufficient.
%  minimumLinesDistance 
% 	Specifies the minimum distance from the PML boundary to the structure to be modeled. The distance is determined by the absolute number of grid lines.
%  minimumDistanceType 'Fraction', 'Absolute'
% 	Selecting the Fraction option activates the geometrical domain enlargement computed as a fraction of the wavelength. With the Absolute option the distance is directly given in geometrical user units. To this purpose use the SetAbsoluteDistance command.
%  setAbsoluteDistance
% 	Specifies the absolute distance to enlarge the simulation domain. To be used selecting the Absolute option with the command MinimumDistanceType.
%  minimumDistanceReferenceFrequencyType  "Center", "Centernmonitors", "User"
% 	The command determines the reference frequency where the wavelength has to be computed. The command should be used jointly with the MinimumDistanceType command activating the Fraction option.
%   Center means that the reference frequency is the mid simulation frequency, in formula (FMin+FMax)/2.
% 	The second choice Centernmonitors computes the reference frequency as the minimum non zero frequency selected among the center frequency and the user defined relevant  monitor frequencies.
% 	The third possibility is User, which enables to specify directly the frequency with the companion FrequencyForMinimumDistance command.
%  minimumDistancePerWavelength 
% 	Specifies the minimum distance from the PML boundary to the structure to be modeled. The distance is determined relatively to the wavelength, either in respect to the center frequency, center and monitor frequencies or to a user defined frequency value. See also the MinimumDistanceReferenceFrequencyType command.
%  frequencyForMinimumDistance  
% 	Specifies the frequency which represents the reference value for the MinimumDistancePerWavelength method.
%% EXAMPLE 
% oBoundaryType.layer                                 = 4;
% oBoundaryType.minimumDistanceType                   = 'Fraction';
% oBoundaryType.minimumDistancePerWavelength          = 8;
% oBoundaryType.minimumDistanceReferenceFrequencyType = 'User';
% oBoundaryType.frequencyForMinimumDistance           = fMin; 
%% MATLAB SCRIPT
historyStr = [];
historyStr = sprintf('With Boundary');
if isfield(oBoundaryType,'xMin'),                                   historyStr = sprintf('%s\n\t.Xmin "%s"',historyStr,num2str(oBoundaryType.xMin));                                 end
if isfield(oBoundaryType,'xMax'),                                   historyStr = sprintf('%s\n\t.Xmax "%s"',historyStr,num2str(oBoundaryType.xMax));                                 end
if isfield(oBoundaryType,'yMin'),                                   historyStr = sprintf('%s\n\t.Ymin "%s"',historyStr,num2str(oBoundaryType.yMin));                                 end
if isfield(oBoundaryType,'yMax'),                                   historyStr = sprintf('%s\n\t.Ymax "%s"',historyStr,num2str(oBoundaryType.yMax));                                 end
if isfield(oBoundaryType,'zMin'),                                   historyStr = sprintf('%s\n\t.Zmin "%s"',historyStr,num2str(oBoundaryType.zMin));                                 end
if isfield(oBoundaryType,'zMax'),                                   historyStr = sprintf('%s\n\t.Zmax "%s"',historyStr,num2str(oBoundaryType.zMax));                                 end
if isfield(oBoundaryType,'layer'),                                  historyStr = sprintf('%s\n\t.Layer "%s"',historyStr,num2str(oBoundaryType.layer)); else historyStr = sprintf('%s\n\t.Layer "4"',historyStr);                                end
if isfield(oBoundaryType,'minimumLinesDistance'),                   historyStr = sprintf('%s\n\t.MinimumLinesDistance "%s"',historyStr,num2str(oBoundaryType.minimumLinesDistance));                 end
if isfield(oBoundaryType,'minimumDistanceType'),                    historyStr = sprintf('%s\n\t.MinimumDistanceType "%s"',historyStr,num2str(oBoundaryType.minimumDistanceType));                  end
if isfield(oBoundaryType,'setAbsoluteDistance'),                    historyStr = sprintf('%s\n\t.SetAbsoluteDistance "%s"',historyStr,num2str(oBoundaryType.setAbsoluteDistance));                  end
if isfield(oBoundaryType,'minimumDistanceReferenceFrequencyType'),  historyStr = sprintf('%s\n\t.MinimumDistanceReferenceFrequencyType "%s"',historyStr,num2str(oBoundaryType.minimumDistanceReferenceFrequencyType));end
if isfield(oBoundaryType,'minimumDistancePerWavelength'),           historyStr = sprintf('%s\n\t.MinimumDistancePerWavelength "%s"',historyStr,num2str(oBoundaryType.minimumDistancePerWavelength));else historyStr = sprintf('%s\n\t.MinimumDistancePerWavelength "8"',historyStr);         end
if isfield(oBoundaryType,'frequencyForMinimumDistance'),            historyStr = sprintf('%s\n\t.FrequencyForMinimumDistance "%s"',historyStr,num2str(oBoundaryType.frequencyForMinimumDistance));          end
historyStr = sprintf('%s\nEnd With',historyStr);

historyHeader = [ 'define pml specials' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end