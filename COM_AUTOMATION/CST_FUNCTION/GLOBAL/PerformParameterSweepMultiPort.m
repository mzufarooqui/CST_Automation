
%-- Open CST Studio Suit
hCST_Studio = f_OpenCST_StudioSuit();
%-- Open CST MWS Project
oMWS = f_OpenCST_MWS_Project(hCST_Studio,[ cstProjectPath cstProjectName]);
%-- Get the defination of grid

%-- Create lookup table for the grid
simPoint = f_CreateLookupTableForAntenna(parameterRange,activateGridAnalysis);
for portInd = 1:length(simulationPort)
    portNum    = simulationPort(portInd);
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
            oTD_Solver.stimulationPort           = portNum;
            oTD_Solver.stimulationMode           = 'All';
            oTD_Solver.steadyStateLimit          = -30.0;
            oTD_Solver.bMeshAdaption             = 'False';
            oTD_Solver.bAutoNormImpedance        = 'False';
            oTD_Solver.normingImpedance          = 50;
            oTD_Solver.bCalculateModesOnly       = 'False';
            oTD_Solver.bSParaSymmetry            = 'False';
            oTD_Solver.bStoreTDResultsInCache    = 'False';
            oTD_Solver.bFullDeembedding          = 'False';
            oTD_Solver.bSuperimposePLWExcitation = 'False';
            oTD_Solver.bUseSensitivityAnalysis   = 'False';
            status = f_CreateTD_Solver(oMWS,oTD_Solver);
            %-- Start Time Domain solver
            f_StartSolver(oMWS);
        elseif strcmp(solverType,'FD-Solver')
            f_StartFD_Solver(oMWS);
        end
        if saveFarFieldsData
            %-- Set Farfields Parameters
            oFarField.plotType        = '3d'; % '2d','cartesian';
            oFarField.plotMode        = 'directivity';
            oFarField.step            = 1;
            oFarField.step2           = 1;
            oFarField.dBUnit          = -1;
            oFarField.bSetTheta360    = 'False';
            oFarField.bSymmetricRange = 'False';
            f_SetFarfieldsParameter(oMWS,oFarField);
        end
        %-- Save S11 and farfield on the Matlab Current Folder( Current Set Path)
        f_SaveS11_FarFieldResults(oMWS,deviceName,parameterName,parameterRange,simPoint,iterInd,saveScatMatInTouchStone,saveScatMatInPolar,saveFarFieldsData,saveCST_Parameter,putParamNameInDir,saveEfficiency);
        %-- Display Status
        currIter   = iterInd*portInd;
        totNumIter = size(simPoint,1) * length(simulationPort);
        remIter    = totNumIter - currIter;
        fprintf(1,'\n Iter:%3d , Remaining: %3d, Total Iter: %3d, Port Number:%2d, Total Sim. Port %2d',currIter,remIter,totNumIter,portNum,length(simulationPort));
        %fprintf(1,'\n Iter:%3d , Remaining: %3d, Total Iter: %3d, Port Number:%2d, Total Sim. Port %2d',iterInd,(size(simPoint,1)-iterInd),size(simPoint,1),portNum,length(simulationPort));
    end
end
if ~isempty(recipients)
    f_SendMail('cnr.ieiit.ae.ed@gmail.com','cnr1e11t@e@d',recipients, 'COM-EM-AT Notification', 'Your current set of simulations have been finished', []);
end
% f_CloseCST_MWS_Project(oMWS); % Close CST MWS Project
% f_CloseCST_StudioSuit(hCST_Studio); % Close CST Studio suit