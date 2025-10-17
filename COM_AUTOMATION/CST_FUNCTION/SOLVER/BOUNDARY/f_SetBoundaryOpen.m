function status = f_SetBoundaryOpen(oMWS,boundary)
% Example: CST 2012
% boundary.definitionType                         = 'Default';
% boundary.layer                                  = 4;
% boundary.absoluteDepth                          = 0;
% boundary.fractionPMLDepth                       = 0;
% boundary.baseFrequencyPMLDepth                  = 0;
% boundary.minimumDistanceType                    = 'Fraction';
% boundary.minimumDistancePerWavelength           = 8;
% boundary.minimumDistanceReferenceFrequencyType  = 'User';
% boundary.frequencyForMinimumDistance            = 0.05;
% status = f_SetBoundaryOpen(oMWS,boundary)
%
% Example: CST 2013
% boundary.reflectionLevel                        = 0.0001;
% boundary.setAbsoluteDistance                    = 0;
% boundary.minimumDistanceType                    = 'Fraction';
% boundary.minimumDistancePerWavelength           = 8;
% boundary.minimumDistanceReferenceFrequencyType  = 'User';
% boundary.frequencyForMinimumDistance            = 0.05;
% status = f_SetBoundaryOpen(oMWS,boundary)

historyStr = [];
historyStr = sprintf('With Boundary');

if isfield(boundary,'reflectionLevel'),                         historyStr = sprintf('%s\n\t.ReflectionLevel "%s"'                      ,historyStr,num2str(boundary.reflectionLevel));                         end
if isfield(boundary,'setAbsoluteDistance'),                     historyStr = sprintf('%s\n\t.SetAbsoluteDistance "%s"'                  ,historyStr,num2str(boundary.setAbsoluteDistance));                     end
if isfield(boundary,'definitionType'),                          historyStr = sprintf('%s\n\t.DefinitionType "%s"'                       ,historyStr,num2str(boundary.definitionType));                          end
if isfield(boundary,'layer'),                                   historyStr = sprintf('%s\n\t.Layer "%s"'                                ,historyStr,num2str(boundary.layer));                                   end
if isfield(boundary,'absoluteDepth'),                           historyStr = sprintf('%s\n\t.AbsoluteDepth "%s"'                        ,historyStr,num2str(boundary.absoluteDepth));                           end
if isfield(boundary,'fractionPMLDepth'),                        historyStr = sprintf('%s\n\t.FractionPMLDepth "%s"'                     ,historyStr,num2str(boundary.fractionPMLDepth));                        end
if isfield(boundary,'baseFrequencyPMLDepth'),                   historyStr = sprintf('%s\n\t.BaseFrequencyPMLDepth "%s"'                ,historyStr,num2str(boundary.baseFrequencyPMLDepth));                   end
if isfield(boundary,'minimumDistanceType'),                     historyStr = sprintf('%s\n\t.MinimumDistanceType "%s"'                  ,historyStr,num2str(boundary.minimumDistanceType));                     end
if isfield(boundary,'minimumDistancePerWavelength'),            historyStr = sprintf('%s\n\t.MinimumDistancePerWavelength "%s"'         ,historyStr,num2str(boundary.minimumDistancePerWavelength));            end
if isfield(boundary,'minimumDistanceReferenceFrequencyType'),   historyStr = sprintf('%s\n\t.MinimumDistanceReferenceFrequencyType "%s"',historyStr,num2str(boundary.minimumDistanceReferenceFrequencyType));   end
if isfield(boundary,'frequencyForMinimumDistance'),             historyStr = sprintf('%s\n\t.FrequencyForMinimumDistance "%s"'          ,historyStr,num2str(boundary.frequencyForMinimumDistance));             end

historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define pml specials' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end