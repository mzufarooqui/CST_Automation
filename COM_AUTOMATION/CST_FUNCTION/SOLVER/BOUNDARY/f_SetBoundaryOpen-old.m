function status = f_SetBoundaryOpen(oMWS,boundary)
% Example:
% boundary.reflectionLevel                       = 0.0001;
% boundary.minimumDistanceType                   = 'Fraction';
% boundary.minimumDistancePerWavelength          = 4; 
% boundary.minimumDistanceReferenceFrequencyType = 'User';
% boundary.frequencyForMinimumDistance           = 0.2;
% boundary.setAbsoluteDistance                   = 0.0;
% f_SetBoundaryOpen(oMWS,boundary)
historyStr = [];
historyStr = sprintf('With Boundary');
historyStr = sprintf('%s\n\t.ReflectionLevel "%s"',historyStr,num2str(boundary.reflectionLevel));
historyStr = sprintf('%s\n\t.MinimumDistanceType "%s"',historyStr,num2str(boundary.minimumDistanceType));
historyStr = sprintf('%s\n\t.MinimumDistancePerWavelength "%s"',historyStr,num2str(boundary.minimumDistancePerWavelength));
historyStr = sprintf('%s\n\t.MinimumDistanceReferenceFrequencyType "%s"',historyStr,num2str(boundary.minimumDistanceReferenceFrequencyType));
historyStr = sprintf('%s\n\t.FrequencyForMinimumDistance "%s"',historyStr,num2str(boundary.frequencyForMinimumDistance));
historyStr = sprintf('%s\n\t.SetAbsoluteDistance "%s"',historyStr,num2str(boundary.setAbsoluteDistance));
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define pml specials' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end