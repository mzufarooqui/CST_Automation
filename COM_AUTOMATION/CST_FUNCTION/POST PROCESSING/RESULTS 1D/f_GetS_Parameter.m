function [frequency sParameter ] = f_GetS_Parameter(oMWS,sParamGettingMode,Port2,Mode2,Port1,Mode1)
% EXAMPLE
% [frequency sParameter ] = f_GetS_Parameter(oMWS,sParamGettingMode,Port2,Mode2,Port1,Mode1)
% [frequency sParameter ] = f_GetS_Parameter(oMWS,'BY_ITERATION',Port2,Mode2,Port1,Mode1)
% [frequency sParameter ] = f_GetS_Parameter(oMWS,'BY_SAVEING_RESULTS',Port2,Mode2,Port1,Mode1)

% global projectName
% 
% global tempFolderPath
% 
% if isempty(tempFolderPath)
%     tempFolderPath = [ pwd '\TEMP\'];
% else
%     if ~strcmp(tempFolderPath(end),'\'), tempFolderPath = [ tempFolderPath '\'];end
%     addpath(tempFolderPath);
% end

S_RequestedParameter_a = ['a',num2str(Port2),'(',num2str(Mode2),')',num2str(Port1),'(',num2str(Mode1),')'];
absSParameter_a   = invoke(oMWS,'Result1D',S_RequestedParameter_a);

S_RequestedParameter_p = ['p',num2str(Port2),'(',num2str(Mode2),')',num2str(Port1),'(',num2str(Mode1),')'];
absSParameter_p   = invoke(oMWS,'Result1D',S_RequestedParameter_p);

numOfDataPoints = absSParameter_a.invoke('GetN');

switch sParamGettingMode
    case 'BY_ITERATION'
        frequency       = zeros(numOfDataPoints,1);
        sParameter      = zeros(numOfDataPoints,1);

        for ind = 1: numOfDataPoints
            frequency(ind,1)  = absSParameter_a.invoke('GetX',ind-1);
            sParameter(ind,1) = absSParameter_a.invoke('GetY',ind-1)*exp(j*absSParameter_p.invoke('GetY',ind-1)*pi/180);
        end
    case 'BY_SAVEING_RESULTS'
        invoke(absSParameter_a, 'Save', [ tempdir S_RequestedParameter_a '.txt' ]);
        invoke(absSParameter_a, 'Save', [ tempdir S_RequestedParameter_p '.txt' ]);

        sParamAmplitude  = importdata([ tempdir S_RequestedParameter_a '.txt' ], ' ', 4);
        sParamPhase      = importdata([ tempdir S_RequestedParameter_p '.txt' ], ' ', 4);

        frequency  = sParamAmplitude.data(:, 1);
        sParameter = sParamAmplitude.data(:, 2) .* exp( 1j .* sParamPhase.data(:,2) .* pi /180 );
    case 'BY_EXPORT'
        sParamName = 'S1(1),1(1)';
        oResult1D  = oMWS.invoke('Result1D',sParamName);
        oASCIIExport = oMWS.invoke('ASCIIExport');
        oResultTree  = oMWS.invoke('ResultTree');
        oResultTree.invoke('Type','XYSignal')
        oResultTree.invoke('Subtype','dB')
        oResultTree.invoke('RefreshView')
        oResultTree.invoke('UpdateTree')
        oMWS.invoke('SelectTreeItem',['1D Results\S-Parameters\' sParamName ]);
        oASCIIExport.invoke('Reset');
        oASCIIExport.invoke('FileName',[ tempFolderPath sParamName '.txt']);
        oASCIIExport.invoke('Execute');

        %                         oResult1D  = oMWS.invoke('oResult1D');

        %             oResult1D.invoke('Type','Linear');
        %             firstChildName = oResultTree.invoke('GetFirstChildName','1D Results');
        %             [tok rem] = strtok(firstChildName,'\');
        %             if strcmp(rem(2:end),'S-Parameters')
        %                         oASCIIExport.invoke('Mode',exportMode);

        %                         oASCIIExport.invoke('StepX',stepX);
        %                         oASCIIExport.invoke('StepY',stepY);
        %                         oASCIIExport.invoke('StepZ',stepZ);


        oASCIIExport = oMWS.invoke('ASCIIExport');
        oASCIIExport.invoke('Reset');
        oASCIIExport.invoke('FileName',['s.txt']);
        oASCIIExport.invoke('Execute');
end

end

