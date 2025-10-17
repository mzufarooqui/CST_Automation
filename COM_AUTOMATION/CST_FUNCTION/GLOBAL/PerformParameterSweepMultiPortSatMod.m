DISCRETE_PORT  = 1;
WAVEGUIDE_PORT = 2;
%-- Open CST Studio Suit
oCST_Studio = f_OpenCST_StudioSuit();
if importModel
    %-- Open CST
    oCST_Studio      = f_OpenCST_StudioSuit();
    
    %-- Open CST-MWS Project
    oMWS             = f_CreateCST_MWS_Project(oCST_Studio);
    
    %-- Create Template
    MWS_TemplateName = 'Antenna (Horn, Waveguide)^+MWS';
    f_CreateMWS_Template(oMWS,MWS_TemplateName);
    
    %-- Store Parameters
    f_StoreParameter(oMWS,'fMin',fMin);                     f_SetParameterDescription(oMWS,'fMin','Lower freq.');
    f_StoreParameter(oMWS,'fMax',fMax);                     f_SetParameterDescription(oMWS,'fMax','Upper freq.');
    f_StoreParameter(oMWS,'mL',mL);                         f_SetParameterDescription(oMWS,'mL','Mesh minimum Step Number / lines Per Wavelength');
    
    switch portType
        case DISCRETE_PORT
            f_StoreParameter(oMWS,'Z1',Z1);                         f_SetParameterDescription(oMWS,'Z1','Discrete port impedance');
            %             f_StoreParameter(oMWS,'x1DiscPort',x1DiscPort);         f_SetParameterDescription(oMWS,'x1DiscPort','x1 coord for Discrete port');
            %             f_StoreParameter(oMWS,'y1DiscPort',y1DiscPort);         f_SetParameterDescription(oMWS,'y1DiscPort','y1 coord for Discrete port');
            %             f_StoreParameter(oMWS,'z1DiscPort',z1DiscPort);         f_SetParameterDescription(oMWS,'z1DiscPort','z1 coord for Discrete port');
            %             f_StoreParameter(oMWS,'x2DiscPort',x2DiscPort);         f_SetParameterDescription(oMWS,'x2DiscPort','x2 coord for Discrete port');
            %             f_StoreParameter(oMWS,'y2DiscPort',y2DiscPort);         f_SetParameterDescription(oMWS,'y2DiscPort','y2 coord for Discrete port');
            %             f_StoreParameter(oMWS,'z2DiscPort',z2DiscPort);         f_SetParameterDescription(oMWS,'z2DiscPort','z2 coord for Discrete port');
        case   WAVEGUIDE_PORT
            
    end
    
    
    
    %-- Save Project
    %f_SaveAsCST_MWS_Project(oMWS,[cstProjectPath cstProjectName]);
    
    %-- Import SAT File
    f_ImportSAT(oMWS,fileNameWithPath);
    
    [path,name,ext]=fileparts(fileNameWithPath);
%     translateModel
    if translateModel
        if ~strcmp(name, 'Modello_3_1')
            %-- Add part
            %for ind = 2:5
            %    f_AddSolids(oMWS,'default',['import_1'],'default',['import_' num2str(ind)]);
            %end
            %-- Rename part
            f_RenameComponentPart(oMWS,'default','import_1','Vivaldi');
            %-- Translate object
            %f_TranslateShape(oMWS,'default','Vivaldi',[0 0 370],0);
            f_TranslateShape(oMWS,'default','Vivaldi',[0 0 -19.499903],0);
            
            %-- Change material
            f_ChangeMaterial(oMWS,'default','Vivaldi','PEC');
        end
    end
    switch portType
        case DISCRETE_PORT
            for portInd = 1:numPorts
                %-- Define Discrete port
                oPort.portNumber        = portInd;
                oPort.type              = 'SParameter';
                oPort.label             = '';
                oPort.impedance         = 'Z1';
                oPort.voltage           = 1.0;
                oPort.current           = 1.0;
                oPort.radius            = 0.0;
                %             oPort.setP1             = {'False', 'x1DiscPort', 'y1DiscPort', 'z1DiscPort' };
                %             oPort.setP2             = {'False', 'x2DiscPort', 'y2DiscPort', 'z2DiscPort' };
                oPort.setP1             = {'False', x1DiscPort(portInd), y1DiscPort(portInd), z1DiscPort(portInd) };
                oPort.setP2             = {'False', x2DiscPort(portInd), y2DiscPort(portInd), z2DiscPort(portInd) };
                oPort.bLocalCoordinates = 'False';
                oPort.bInvertDirection  = 'False';
                oPort.bCenterEdge       = 'True';
                oPort.bMonitor          = 'False';
                f_CreateDiscretePort(oMWS,oPort);
            end
        case   WAVEGUIDE_PORT
            for portInd = 1:numPorts
                f_PickFaceFromId(oMWS,componentName,partName,portFaceNum(portInd));
                oPort.portNumber    = portInd;
                oPort.numberOfModes = numModes(portInd);
                oPort.coordinates   = 'Picks';
                oPort.orientation   = 'negative';
                f_CreatePort(oMWS,oPort);
                f_ClearAllPicks(oMWS);
            end
    end
    
    
    %-- Define frequency range
    oSolver.frequencyRange = [fMin fMax];
    f_CreateSolver(oMWS,oSolver);
    
    %-- Mesh defination
    oMesh.meshType                   = 'Tetrahedral';
    oMesh.PBAType                    = 'PBA';
    oMesh.minimumStepNumber          = 'mL';%4; %10;
    oMesh.linesPerWavelength         = 'mL';%5;%10;
    oMesh.bUseRatioLimit             = 'True';
    oMesh.ratioLimit                 = 10.0;
    f_CreateMesh(oMWS,oMesh);
    
    if SYMM_PLANE
        %-- Define symmetry planes
        f_SetSymmetryPlane(oMWS,'magnetic','electric','none');  % X-Symm Plane: magnetic, Y-Symm Plane: electric, Z-Symm Plane: none
    end
    %-- Define Boundary
    boundary.reflectionLevel                       = 0.0001;
    boundary.minimumDistanceType                   = 'Fraction';
    boundary.minimumDistancePerWavelength          = 4;
    boundary.minimumDistanceReferenceFrequencyType = 'User';
    boundary.frequencyForMinimumDistance           = 0.2;
    boundary.setAbsoluteDistance                   = 0.0;
    f_SetBoundaryOpen(oMWS,boundary);
    
    %     %-- Define time domain solver
    %     oTD_Solver.method                    = 'Hexahedral';
    %     oTD_Solver.stimulationPort           = 1;
    %     oTD_Solver.stimulationMode           = 'All';
    %     oTD_Solver.steadyStateLimit          = -30.0;
    %     oTD_Solver.bMeshAdaption             = 'False';
    %     oTD_Solver.bAutoNormImpedance        = 'False';
    %     oTD_Solver.normingImpedance          = 50;
    %     oTD_Solver.bCalculateModesOnly       = 'False';
    %     oTD_Solver.bSParaSymmetry            = 'False';
    %     oTD_Solver.bStoreTDResultsInCache    = 'False';
    %     oTD_Solver.bFullDeembedding          = 'False';
    %     oTD_Solver.bSuperimposePLWExcitation = 'False';
    %     oTD_Solver.bUseSensitivityAnalysis   = 'False';
    %     f_CreateTD_Solver(oMWS,oTD_Solver);
    
    if GPU_Acceleration
        f_GPU_Acceleration(oMWS,oSolver);
    end
else
    %-- Open CST MWS Project
    oMWS = f_OpenCST_MWS_Project(oCST_Studio,[ cstProjectPath cstProjectName]);
end
if ADD_FAR_FIELD_MONITOR
    %-- Add Far Field Monitor
    for ind = farFieldMonitor
        f_AddFieldMonitor(oMWS,ind,[],'Frequency','Farfield');
    end
    f_AddFieldMonitor(oMWS,broadBandFreq,[],'time','Farfield');
end
%-- Get the defination of grid
%return
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
        %-- Delete all results
        f_Delete_All_Results(oMWS);
        %-- Update Mesh
        f_UpdateMesh(oMWS);
        %-- Update model
        f_UpdateModel(oMWS);
        if strcmp(solverType,'TD-Solver')
            oTD_Solver.method                    = 'Hexahedral';
            oTD_Solver.stimulationPort           = portNum;
            oTD_Solver.stimulationMode           = 'All';
            oTD_Solver.steadyStateLimit          = -30.0;
            oTD_Solver.bMeshAdaption             = 'False';
            oTD_Solver.bAutoNormImpedance        = 'False';
            oTD_Solver.normingImpedance          = 'Z1';
            oTD_Solver.bCalculateModesOnly       = 'False';
            oTD_Solver.bSParaSymmetry            = 'False';
            oTD_Solver.bStoreTDResultsInCache    = 'False';
            oTD_Solver.bFullDeembedding          = 'False';
            oTD_Solver.bSuperimposePLWExcitation = 'False';
            oTD_Solver.bUseSensitivityAnalysis   = 'False';
            f_CreateTD_Solver(oMWS,oTD_Solver);
            
            %             if 0
            %                 oTD_Solver.stimulationPort           = portNum;
            %                 oTD_Solver.stimulationMode           = 'All';
            %                 oTD_Solver.steadyStateLimit          = -30.0;
            %                 oTD_Solver.bMeshAdaption             = 'False';
            %                 oTD_Solver.bAutoNormImpedance        = 'False';
            %                 oTD_Solver.normingImpedance          = 50;
            %                 oTD_Solver.bCalculateModesOnly       = 'False';
            %                 oTD_Solver.bSParaSymmetry            = 'False';
            %                 oTD_Solver.bStoreTDResultsInCache    = 'False';
            %                 oTD_Solver.bFullDeembedding          = 'False';
            %                 oTD_Solver.bSuperimposePLWExcitation = 'False';
            %                 oTD_Solver.bUseSensitivityAnalysis   = 'False';
            %                 status = f_CreateTD_Solver(oMWS,oTD_Solver);
            %             end
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
%         f_SaveAsCST_MWS_Project(oMWS,[pwd '\temp_P_' num2str(portNum) '.cst'])
        
        comemat.flag.solverType              = solverType;                 % 'TD-Solver', 'FD-Solver'
        comemat.flag.saveEfficiency          = saveEfficiency;             %  Save Efficiency results              0-No, 1-Yes
        comemat.flag.saveScatMatInTouchStone = saveScatMatInTouchStone ;   %  Save Scat Mat in Touch Stone Format  0-No, 1-Yes
        comemat.flag.saveScatMatInPolar      = saveScatMatInPolar;         %  Save Scat Mat in Polar Form          0-No, 1-Yes
        comemat.flag.saveFarFieldsData       = saveFarFieldsData;          %  Save Farfield Data                   0-No, 1-Yes
        comemat.flag.saveCST_Parameter       = saveCST_Parameter;          %  Save all CST Parameter               0-No, 1-Yes
        comemat.flag.putParamNameInDir       = putParamNameInDir;          %  Chooses format of directory name     0-Selected parameters, 1-All parameters
        comemat.flag.activateGridAnalysis    = activateGridAnalysis;       %  Choice: activate grid analysis       0-Automatic 1-User defined grid or user-defined grid
        comemat.flag.exportSolverLog         = exportSolverLog;
        comemat.flag.importModel             = importModel;
        comemat.flag.exportSATFile           = exportSATFile;
        comemat.flag.exportMaterials         = exportMaterials;

        %-- Save S11 and farfield on the Matlab Current Folder( Current Set Path)
        f_SaveCST_SimulationResults(oMWS,deviceName,parameterName,parameterRange,simPoint,iterInd,comemat);
        %f_SaveCST_SimulationResults(oMWS,deviceName,parameterName,parameterRange,simPoint,iterInd,saveScatMatInTouchStone,saveScatMatInPolar,saveFarFieldsData,saveCST_Parameter,putParamNameInDir,saveEfficiency,exportSolverLog,exportSATFile);
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