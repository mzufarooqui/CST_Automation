function status = f_ActivateWCS(oMWS,coordSystem)
% Defines a working coordinate system which will be the base for the next new solids.
% coordSystem               = 'local' or 'global';
%
% EXAMPLE:
% status = f_ActivateWCS(oMWS,coordSystem)
% status = f_ActivateWCS(oMWS,'local')
% status = f_ActivateWCS(oMWS,'global')

historyStr = sprintf('WCS.ActivateWCS "%s"',coordSystem);

historyHeader = [ 'activate ' lower(coordSystem) ' coordinates' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end