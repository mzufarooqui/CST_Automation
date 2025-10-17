function status = f_CreateDiscretePort(oMWS,oPort)
%% DEFINE DISCREATE PORT
%% FIELD DEFINATION
%% EXAMPLE:
%  oPort.portNumber        = 1;
%  oPort.type              = 'SParameter'
%  oPort.label             = '';
%  oPort.impedance         = 'Z1';
%  oPort.voltage           = 1.0;
%  oPort.current           = 1.0;
%  oPort.radius            = 1.0;
%  oPort.setP1             = {'True', '-5', '0', '0' }; OR oPort.setP1 = 'True'; 
%  oPort.setP2             = {'True', '5', '0', '0' };  OR oPort.setP2 = 'True'; 
%  oPort.bLocalCoordinates = 'False';
%  oPort.bInvertDirection  = 'False';
%  oPort.bCenterEdge       = 'True';
%  oPort.bMonitor          = 'False';
%% MATLAB SCRIPT
historyStr = [];
historyStr = sprintf('With DiscretePort');
historyStr = sprintf('%s\n\t.Reset',                historyStr);
if isfield(oPort,'portNumber'),                     historyStr = sprintf('%s\n\t.PortNumber "%s"',            historyStr,num2str(oPort.portNumber));                          else historyStr = sprintf('%s\n\t.PortNumber "1"',                        historyStr); end
if isfield(oPort,'type'),                           historyStr = sprintf('%s\n\t.Type"%s"',                   historyStr,num2str(oPort.type));                          end
if isfield(oPort,'portLabel'),                      historyStr = sprintf('%s\n\t.Label "%s"',                 historyStr,oPort.portLabel);                                    else historyStr = sprintf('%s\n\t.Label ""',                              historyStr); end
if isfield(oPort,'impedance'),                      historyStr = sprintf('%s\n\t.Impedance "%s"',             historyStr,oPort.impedance);                                    end
if isfield(oPort,'voltage'),                        historyStr = sprintf('%s\n\t.Voltage"%s"',                historyStr,num2str(oPort.voltage));                             end
if isfield(oPort,'current'),                        historyStr = sprintf('%s\n\t.Current"%s"',                historyStr,num2str(oPort.current));                             end
if isfield(oPort,'setP1'),
    if strcmp(oPort.setP1,'True')
        historyStr = sprintf('%s\n\t.SetP1 "%s","0","0","0"',  historyStr,oPort.setP1);
    else
        historyStr = sprintf('%s\n\t.SetP1 "%s","%s","%s","%s"',  historyStr,oPort.setP1{1},num2str(oPort.setP1{2}),num2str(oPort.setP1{3}),num2str(oPort.setP1{4}));
    end
end
if isfield(oPort,'setP2'),
    if strcmp(oPort.setP2,'True')
        historyStr = sprintf('%s\n\t.SetP2 "%s","0","0","0"',  historyStr,oPort.setP2);
    else
        historyStr = sprintf('%s\n\t.SetP2 "%s","%s","%s","%s"',  historyStr,oPort.setP2{1},num2str(oPort.setP2{2}),num2str(oPort.setP2{3}),num2str(oPort.setP2{4}));
    end
end
if isfield(oPort,'bInvertDirection'),               historyStr = sprintf('%s\n\t.InvertDirection "%s"',       historyStr,oPort.bInvertDirection);                              end
if isfield(oPort,'bLocalCoordinates'),              historyStr = sprintf('%s\n\t.LocalCoordinates "%s"',      historyStr,oPort.bLocalCoordinates);                             end
% if isfield(oPort,'bCenterEdge'),                    historyStr = sprintf('%s\n\t.CenterEdge "%s"',            historyStr,oPort.bCenterEdge);                                   end
if isfield(oPort,'bMonitor'),                       historyStr = sprintf('%s\n\t.Monitor "%s"',               historyStr,oPort.bMonitor);                                      end
if isfield(oPort,'radius'),                         historyStr = sprintf('%s\n\t.Radius"%s"',                 historyStr,num2str(oPort.radius));                              end
historyStr = sprintf('%s\n\t.Create',         historyStr);
historyStr = sprintf('%s\nEnd With',        historyStr);
historyHeader = [ 'define discrete face port: ' num2str(oPort.portNumber) ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end


