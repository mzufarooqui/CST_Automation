function status = f_AddFieldMonitor(oMWS,frequency,dimension,domain,fieldType)
% frequency
%         Sets the frequency for frequency domain monitor to freq.
% dimension
%         could be  'plane' or 'volume'
%         This option decides to monitor the fields only on a cutting plane or for the entire calculation volume.
% Domain
%         could be  'frequency' or 'time'
%         Defines whether the monitor stores time-domain or frequency-domain information. In case of a farfield monitor type, the setting "time" refers to a broadband farfield monitor offering both frequency and transient farfield information.
% fieldType
%         Sets what field is to be monitored.
%         'Efield'     : The electric field will be monitored.
%         'Hfield'     : The magnetic field and the surface current will be monitored.
%         'Powerflow'  : The Pointing vector will be monitored.
%         'Current'    : The current density will be monitored.
%         'Powerloss'  : The power loss density will be monitored.
%         'Eenergy'    : The electric energy density will be monitored.
%         'Henergy'    : The magnetic energy density will be monitored.
%         'Farfield'   : A monitor for the farfield will be created.
%         'Fieldsource': A monitor for the field source will be created.
% EXAMPLE
% status = f_AddFieldMonitor(oMWS,frequency,dimension,domain,fieldType)
%creates a frequency domain electric field monitor for the entire calculation domain
% status = f_AddFieldMonitor(oMWS,2.5,'Volume','Frequency','Efield')
switch fieldType
    case 'Efield'
        name = 'e-field';
    case 'Hfield'
        name = 'h-field';
    case 'Powerflow'
        name = 'power';
    case 'Current'
        name = 'current';
    case 'Powerloss'
        name = 'loss';
    case 'Eenergy'
        name = 'e-energy';
    case 'Henergy'
        name = 'h-energy';
    case 'Farfield'
        name = 'farfield';
    case 'Fieldsource'
        name = 'field-source';
end





if (strcmp(domain,'time') & strcmp(fieldType,'Farfield')) % For broadband
    frequencySamples      = 45;
    bTransientFarfield    = 'False';
    bExportFarfieldSource = 'False';
    
    historyStr = [];
    historyStr = sprintf('With Monitor');
    historyStr = sprintf('%s\n.Reset',                  historyStr);
    historyStr = sprintf('%s\n.Name ("%s (%s)")',historyStr,name,num2str('broadband'));
    if ~isempty(dimension)
        historyStr = sprintf('%s\n.Dimension "%s"',         historyStr,num2str(dimension));
    end
    historyStr = sprintf('%s\n.Domain "%s"',            historyStr,num2str(domain));
    historyStr = sprintf('%s\n.FieldType "%s"',         historyStr,num2str(fieldType));
    historyStr = sprintf('%s\n.Frequency "%s"',         historyStr,num2str(frequency));
    
    historyStr = sprintf('%s\n.FrequencySamples "%s"',         historyStr,num2str(frequencySamples));
    historyStr = sprintf('%s\n.TransientFarfield "%s"',         historyStr,num2str(bTransientFarfield));
    historyStr = sprintf('%s\n.ExportFarfieldSource "%s"',         historyStr,num2str(bExportFarfieldSource));
    
    historyStr = sprintf('%s\n.Create',                 historyStr);
    historyStr = sprintf('%s\nEnd With',                historyStr);
    historyHeader = [ 'define ' name ' monitor: ' name '(' num2str('broadband') ')'];
else
    historyStr = [];
    historyStr = sprintf('With Monitor');
    historyStr = sprintf('%s\n.Reset',                  historyStr);
    historyStr = sprintf('%s\n.Name ("%s (f=%s)")',historyStr,name,num2str(frequency));
    if ~isempty(dimension)
        historyStr = sprintf('%s\n.Dimension "%s"',         historyStr,num2str(dimension));
    end
    historyStr = sprintf('%s\n.Domain "%s"',            historyStr,num2str(domain));
    historyStr = sprintf('%s\n.FieldType "%s"',         historyStr,num2str(fieldType));
    historyStr = sprintf('%s\n.Frequency "%s"',         historyStr,num2str(frequency));
    historyStr = sprintf('%s\n.Create',                 historyStr);
    historyStr = sprintf('%s\nEnd With',                historyStr);
    historyHeader = [ 'define ' name ' monitor: ' name '(f=' num2str(frequency) ')'];
end
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end