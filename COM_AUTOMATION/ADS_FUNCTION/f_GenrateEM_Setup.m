function f_GenrateEM_Setup(workspaceText,libName,cellName,startFreqGHz,stopFreqGHz,maxRefineFreqGHz,MeshDensityCpW,EdgeMeshEnabled,ptsFreq,SubstName,emStateFileInFileName,calibType)
ENABLE_DEBUG       = 0;
% libName          = 'MyAEL1_lib';
% cellName         = 'Dsg05';
% startFreqGHz     = 2.0;
% stopFreqGHz      = 2.6;
% maxRefineFreqGHz = 2.6;
% MeshDensityCpW   = 35;
% EdgeMeshEnabled  = 'True';
% ptsFreq          = 50;
% workspaceText    = 'D:\FAROOQUI2\COUPLER\MyAEL1_wrk';
% SubstName        = 'ArlonAD270';
% emStateFileInFileName = 'D:\FAROOQUI2\COUPLER\SAMPLE_emStateFile.xml';
% emStateFileOutFileName = 'D:\FAROOQUI2\COUPLER\MATLAB_emStateFile.xml';
emStateFileOutFileName = sprintf('%s\\simulation\\%s\\%s\\layout\\emSetup_MoM\\emStateFile.xml',workspaceText,libName,cellName);
[emStatePath,name,ext] = fileparts(emStateFileOutFileName);
if ~isdir(emStatePath)
    mkdir(emStatePath)
end
fidRead = fopen(emStateFileInFileName,'r');
fidWrite = fopen(emStateFileOutFileName,'w');
inLine = fgets(fidRead);
while ischar(inLine)
    if strfind(inLine,'<intermediateLibraryName>') %<intermediateLibraryName>MyAEL1_lib</intermediateLibraryName>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('\t  <intermediateLibraryName>%s</intermediateLibraryName>\n',libName);
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<MaxRefineFrequency>') %<MaxRefineFrequency>2.6 GHz</MaxRefineFrequency>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('\t\t\t<MaxRefineFrequency>%0.2f GHz</MaxRefineFrequency>\n',maxRefineFreqGHz);
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<workspaceText>') %<workspaceText>D:\FAROOQUI2\COUPLER\MyAEL1_wrk</workspaceText>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('\t  <workspaceText>%s</workspaceText>\n',workspaceText);
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<libraryText>') %<libraryText>MyAEL1_lib</libraryText>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('\t  <libraryText>%s</libraryText>\n',libName);
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<cellText>') %<cellText>04</cellText>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('\t  <cellText>%s</cellText>\n',cellName);
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<startFreq>') %<startFreq>2</startFreq>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('<startFreq>%0.2f</startFreq>\n',startFreqGHz);
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<stopFreq>') %<stopFreq>2.6</stopFreq>
        %         if ENABLE_DEBUG,disp(inLine);end
        %         outLine = sprintf('<stopFreq>%0.2f</stopFreq>\n',stopFreqGHz);
        %         if ENABLE_DEBUG,disp(outLine);end
        if ENABLE_DEBUG,disp(inLine);end
        if isempty(stopFreqGHz)
            outLine = sprintf('<stopFreq>-1</stopFreq>\n');
        else
            outLine = sprintf('<stopFreq>%0.2f</stopFreq>\n',stopFreqGHz);
        end
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<ptsFreq>') %<ptsFreq>50 (max)</ptsFreq>
        if ENABLE_DEBUG,disp(inLine);end
        if isempty(ptsFreq)
            outLine = sprintf('<ptsFreq> - </ptsFreq>\n');
        else
            outLine = sprintf('<ptsFreq>%d (max)</ptsFreq>\n',ptsFreq);
        end
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<libSubstName>') %<libSubstName>MyAEL1_lib:ArlonAD270</libSubstName>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('<libSubstName>%s:%s</libSubstName>\n',libName,SubstName);
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<topLibCellView>') %<topLibCellView>MyAEL1_lib:04:layout</topLibCellView>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('<topLibCellView>%s:%s:layout</topLibCellView>\n',libName,cellName);
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<intermediateCellName>') %<intermediateCellName>04_emCosim</intermediateCellName>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('\t  <intermediateCellName>%s_emCosim</intermediateCellName>\n',cellName);
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<givenDatasetName>') %<givenDatasetName>04</givenDatasetName>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('<givenDatasetName>%s</givenDatasetName>\n',cellName);
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<givenDdsName>') %<givenDdsName>04</givenDdsName>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('<givenDdsName>%s</givenDdsName>\n',cellName);
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<dds_givenName>') %<dds_givenName>04</dds_givenName>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('<dds_givenName>%s</dds_givenName>\n',cellName);
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<ds_givenName>') %<ds_givenName>04</ds_givenName>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('<ds_givenName>%s</ds_givenName>\n',cellName);
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<MeshDensityCpW>') %<MeshDensityCpW>109</MeshDensityCpW>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('<MeshDensityCpW>%d</MeshDensityCpW>\n',MeshDensityCpW);
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<EdgeMeshEnabled>') %<EdgeMeshEnabled>True</EdgeMeshEnabled>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('<EdgeMeshEnabled>%s</EdgeMeshEnabled>\n',EdgeMeshEnabled);
        if ENABLE_DEBUG,disp(outLine);end
    elseif strfind(inLine,'<type>') %<type>TML</type>
        if ENABLE_DEBUG,disp(inLine);end
        outLine = sprintf('\t\t\t<type>%s</type>\n',calibType);
        if ENABLE_DEBUG,disp(outLine);end
    else
        %if ENABLE_DEBUG,disp(inLine);end
        outLine = inLine;
    end
    
    fprintf(fidWrite,'%s',outLine);
    inLine = fgets(fidRead);
end
fclose('all');

% emStateFileOutFileName1 = sprintf('%s\\%s\\%%%s\\em%%Setup\\emStateFile.xml',workspaceText,libName,cellName);
emStateFileOutFileName1 = sprintf('%s\\%s\\%s\\em%%Setup\\emStateFile.xml',workspaceText,libName,cellName);
[emStatePath1,name,ext] = fileparts(emStateFileOutFileName1);
if ~isdir(emStatePath1)
    mkdir(emStatePath1)
end
%-- eesof_em_setup.file
fid = fopen([ emStatePath1 '\eesof_em_setup.file'],'w');
fclose(fid);
%-- master.tag
fid = fopen([ emStatePath1 '\master.tag'],'w');
fprintf(fid,'-- Master.tag File, Rev:1.0\n');
fprintf(fid,'eesof_em_setup.file');
fclose(fid);
%-- copy emState.xml
copyfile(emStateFileOutFileName,[emStatePath1 '\']);
end