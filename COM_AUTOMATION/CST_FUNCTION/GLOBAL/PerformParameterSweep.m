
%-- Open CST Studio Suit
hCST_Studio = f_OpenCST_StudioSuit();
%-- Open CST MWS Project
oMWS = f_OpenCST_MWS_Project(hCST_Studio,[ cstProjectPath cstProjectName]);
%-- Get the defination of grid

%-- Create lookup table for the grid
if activateGridAnalysis 
	simPoint = f_CreateLookupTableForAntenna(parameterRange);
else
    simPoint = parameterRange;
end
for iterInd = 1:size(simPoint,1)
    %-- pick a grid point and update structure accordingly
    numParam = size(parameterRange,2);
    %-- Create an statement like this: a = 5
    for paramInd = 1:numParam
        evalInst = [ 'f_StoreDoubleParameter(oMWS,''' cell2mat(parameterName(paramInd)) ''',' num2str(simPoint(iterInd,paramInd)) ');' ];
        eval(evalInst);
    end
    %-- Update model
    f_UpdateModel(oMWS);
    if strcmp(solverType,'TD-Solver')
        %-- Start Time Domain solver
        f_StartSolver(oMWS);
    elseif strcmp(solverType,'FD-Solver')
        f_StartFD_Solver(oMWS);
    end
    if saveFarFieldsData
        %-- Set Farfields Parameters
        oFarField.plotType        = '3d'; % '2d','cartesian';
        oFarField.plotMode        = 'directivity';
        oFarField.step            = 5;
        oFarField.step2           = 5;
        oFarField.dBUnit          = -1;
        oFarField.bSetTheta360    = 'True';
        oFarField.bSymmetricRange = 'True';
        f_SetFarfieldsParameter(oMWS,oFarField);
    end
    %-- Save S11 and farfield on the Matlab Current Folder( Current Set Path)
    f_SaveS11_FarFieldResults(oMWS,deviceName,parameterName,parameterRange,simPoint,iterInd,saveScatMatInTouchStone,saveScatMatInPolar,saveFarFieldsData,saveCST_Parameter,putParamNameInDir);
    fprintf(1,'\n Iter:%3d , Remaining: %3d, Total Iter: %3d',iterInd,(size(simPoint,1)-iterInd),size(simPoint,1));
end

% f_CloseCST_MWS_Project(oMWS); % Close CST MWS Project
% f_CloseCST_StudioSuit(hCST_Studio); % Close CST Studio suit