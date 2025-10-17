function f_SaveS11_FarFieldResults(oMWS,deviceName,parameterName,parameterRange,simPoint,iterInd,saveScatMatInTouchStone,saveScatMatInPolar,saveFarFieldsData,saveCST_Parameter,putParamNameInDir)
if ~isdir(deviceName)
    dirStr = [pwd '/' deviceName ];
    mkdir(dirStr);
    addpath(dirStr);
end


subDirName = [];
%-- Create Directory Name
paramList = f_GetAllParameters(oMWS);

if putParamNameInDir==1
    %-- It will put the all variable name in the directory name
    numParam = size(paramList,1);
    for paramInd = 1:numParam
        subDirName = sprintf('%s%s=%s,',subDirName,cell2mat(paramList(paramInd,1)),cell2mat(paramList(paramInd,2)));
    end
elseif putParamNameInDir==0
    %-- It will create Directory according to the varying parameter
    numParam = size(parameterRange,2);
    for paramInd = 1:numParam
        subDirName = sprintf('%s%s=%s, ',subDirName,cell2mat(parameterName(paramInd)),num2str(simPoint(iterInd,paramInd)));
    end
end

subDirName(end-1:end)=[];
dirStr = [pwd '/' deviceName '/' subDirName ];
%-- if only saveScatMatInTouchStone flag is set then do not create the directory, save touch stone file in a single folder
if(saveScatMatInTouchStone & saveScatMatInPolar & saveFarFieldsData &  saveCST_Parameter & putParamNameInDir)
    touchStonefileName     = [ dirStr '/scatMat' ];
    if isdir(subDirName)
        fprintf(1,'\n Warning: %s Directory already exist and data will be overwritten \n ',subDirName);
    else
        mkdir(dirStr);
        addpath(dirStr);
    end
else
    touchStonefileName     = [ dirStr ];
end
%-- Save Scat Mat in Touch Stone Format
if saveScatMatInTouchStone        
    f_SaveS11(oMWS,touchStonefileName); % Save scattering matrix in touchstone format
end
%-- Save Scat Mat in Polar Form
if saveScatMatInPolar
    f_ExportScatMatTextFormat(oMWS,dirStr,'polar'); % save scattering matrix in text format with theta
end
%-- Save Farfield Data
if saveFarFieldsData
    f_ExportFarfieldResultsInDir(oMWS,dirStr);
end
%-- Save all CST Parameter
if saveCST_Parameter
    f_SaveAllParameters(oMWS,[ dirStr '/' subDirName '_Parameterlist.dat'])
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f_SaveS11(oMWS,touchStonefileName)
% saveFileName = ['Ref_Coeff_S11'];
% exportTCH.fileName       = [ dirStr '/' saveFileName];
exportTCH.fileName       = touchStonefileName;
exportTCH.frequencyRange = 'Full';
exportTCH.bRenormalize   = 'False';
exportTCH.bUseARResults  = 'False';
exportTCH.setNSamples    = 0;
f_ExportTOUCH(oMWS,exportTCH);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f_ExportFarfieldResultsInDir(oMWS,dirStr)
farfieldFileName = [dirStr '/Directivity_'];
farFieldData = f_GetFarfields(oMWS,farfieldFileName);
end