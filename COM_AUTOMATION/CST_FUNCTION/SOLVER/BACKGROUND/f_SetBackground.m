function status = f_SetBackground(oMWS,type,epsilon,mue,xMinSpace,xMaxSpace,yMinSpace,yMaxSpace,zMinSpace,zMaxSpace,thermalType,thermalConductivity,bApplyInAllDirections)
% The background object defines the kind of material that surrounds your structure. And defines its volume. 
% By default the volume is defined by the maximum distances of your structure.
%
% type:                        type: 'normal' or 'pec'
% epsilon:
% mue:
% xMinSpace:                   Adds space to the lower or upper x, y or z boundary of the current calculation volume respectively.
% xMaxSpace:
% yMinSpace:
% yMaxSpace:
% zMinSpace:
% zMaxSpace:
% thermalType:                 thermal type: 'normal' or 'pec'
% thermalConductivity:
% bApplyInAllDirections:        could be 'True' or 'False'. Is at the moment used for the background dialog to identify if the xmin value should be applied in all directions.
% EXAMPLE:
% status = f_SetBackground(oMWS,type,epsilon,mue,xMinSpace,xMaxSpace,yMinSpace,yMaxSpace,zMinSpace,zMaxSpace,thermalType,thermalConductivity,bApplyInAllDirections)
% status = f_SetBackground(oMWS,'normal',1.0,1.0,50.0,50.0,25.0,25.0,50.0,50.0,'normal',0.0,'False')

historyStr = [];
historyStr = sprintf('With Background');
historyStr = sprintf('%s\n\t.Reset',                    historyStr);
historyStr = sprintf('%s\n\t.Type "%s"',                historyStr,num2str(type));
historyStr = sprintf('%s\n\t.Epsilon "%s"',             historyStr,num2str(epsilon));
historyStr = sprintf('%s\n\t.Mue "%s"',                 historyStr,num2str(mue));
historyStr = sprintf('%s\n\t.XminSpace "%s"',           historyStr,num2str(xMinSpace));
historyStr = sprintf('%s\n\t.XmaxSpace "%s"',           historyStr,num2str(xMaxSpace));
historyStr = sprintf('%s\n\t.YminSpace "%s"',           historyStr,num2str(yMinSpace));
historyStr = sprintf('%s\n\t.YmaxSpace "%s"',           historyStr,num2str(yMaxSpace));
historyStr = sprintf('%s\n\t.ZminSpace "%s"',           historyStr,num2str(zMinSpace));
historyStr = sprintf('%s\n\t.ZmaxSpace "%s"',           historyStr,num2str(zMaxSpace));
historyStr = sprintf('%s\n\t.ThermalType "%s"',         historyStr,num2str(thermalType));
historyStr = sprintf('%s\n\t.ThermalConductivity "%s"', historyStr,num2str(thermalConductivity));
historyStr = sprintf('%s\n\t.ApplyInAllDirections "%s"',historyStr,num2str(bApplyInAllDirections));
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define background'];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);

% hBackground.invoke('Reset');
% hBackground.invoke('Type',type);
% hBackground.invoke('Epsilon',epsilon);
% hBackground.invoke('Mue', mue);
% hBackground.invoke('XminSpace', xMinSpace);
% hBackground.invoke('XmaxSpace', xMaxSpace);
% hBackground.invoke('YminSpace', yMinSpace);
% hBackground.invoke('YmaxSpace', yMaxSpace);
% hBackground.invoke('ZminSpace', zMinSpace);
% hBackground.invoke('ZmaxSpace', zMaxSpace);
% hBackground.invoke('ThermalType',thermalType);
% hBackground.invoke('ThermalConductivity',thermalConductivity);
% hBackground.invoke('ApplyInAllDirections', bApplyInAllDirections);

end