function [thetaDegAtPhi_0_180,thetaDegAtPhi_90_270,gain_dB_AtPhi_0_180,gain_dB_AtPhi_90_270,gainThetaComp_AtPhi_0_180,gainPhiComp_AtPhi_0_180,gainThetaComp_AtPhi_90_270,gainPhiComp_AtPhi_90_270] = ...
    f_GetCutPlane(dataPath,numElem,ffMonList,isMatFile)
numffMon = numel(ffMonList);
for eeElemInd = 1:numElem
    for ffMonInd = 1:numffMon
        fileName                            = f_GetFileName(dataPath,ffMonList,ffMonInd,eeElemInd);
        
        if isMatFile
            load([strtok(fileName,'.') '.mat'])
        else
            gainffData                          = importdata(fileName);
            thetaDeg      = gainffData.data(:,1);
            phiDeg        = gainffData.data(:,2);
            absGain_dB    = gainffData.data(:,3);
            absTheta_dB   = gainffData.data(:,4);
            phaseThetaDeg = gainffData.data(:,5);
            absPhi_dB     = gainffData.data(:,6);
            phasePhiDeg   = gainffData.data(:,7);
            axRatio_dB    = gainffData.data(:,8);
            
            %-- Derived parameters
            gainThetaComp = sqrt( 10.^(absTheta_dB./10) ) .* exp( 1j .* deg2rad( phaseThetaDeg ));
            gainPhiComp   = sqrt( 10.^(absPhi_dB./10)   ) .* exp( 1j .* deg2rad( phasePhiDeg ));
        end
        phiDeg0Ind   = find(phiDeg == 0 );
        phiDeg180Ind = find(phiDeg == 180 );
        phiDeg90Ind  = find(phiDeg == 90 );
        phiDeg270Ind = find(phiDeg == 270 );
        
        %-- Get H(at 0-180 phi) Plane
        thetaDegAtPhi_0_180(eeElemInd,ffMonInd,:)       = [-flipud(thetaDeg(phiDeg180Ind(2:end)))     ; thetaDeg(phiDeg0Ind)     ];
        gain_dB_AtPhi_0_180(eeElemInd,ffMonInd,:)       = [ flipud(absGain_dB(phiDeg180Ind(2:end)))   ; absGain_dB(phiDeg0Ind)   ];
        gainThetaComp_AtPhi_0_180(eeElemInd,ffMonInd,:) = [ flipud(gainThetaComp(phiDeg180Ind(2:end))); gainThetaComp(phiDeg0Ind)];
        gainPhiComp_AtPhi_0_180(eeElemInd,ffMonInd,:)   = [ flipud(gainPhiComp(phiDeg180Ind(2:end)))  ; gainPhiComp(phiDeg0Ind)  ];
        
        %-- Get E(at 90-270 phi) Plane
        thetaDegAtPhi_90_270(eeElemInd,ffMonInd,:)       = [-flipud(thetaDeg(phiDeg270Ind(2:end)))     ; thetaDeg(phiDeg90Ind)     ];
        gain_dB_AtPhi_90_270(eeElemInd,ffMonInd,:)       = [ flipud(absGain_dB(phiDeg270Ind(2:end)))   ; absGain_dB(phiDeg90Ind)   ];
        gainThetaComp_AtPhi_90_270(eeElemInd,ffMonInd,:) = [ flipud(gainThetaComp(phiDeg270Ind(2:end))); gainThetaComp(phiDeg90Ind)];
        gainPhiComp_AtPhi_90_270(eeElemInd,ffMonInd,:)   = [ flipud(gainPhiComp(phiDeg270Ind(2:end)))  ; gainPhiComp(phiDeg90Ind)  ];
    end
end
end
%------------------------------------------------------------------------
% FUNCTION:
%------------------------------------------------------------------------
function fileName = f_GetFileName(dataPath,ffMonList,ffMonInd,eeElemInd)
fileName      = [dataPath '\farfield(f=' num2str(ffMonList(ffMonInd)) ')[' num2str(eeElemInd) '].txt'];
isExist = exist(fileName,'file');
if ~isExist
    freqStr  = num2str(ffMonList(ffMonInd));
    freqStr  = strrep(freqStr,'.','_');
    fileName = [dataPath '\Gain_EE_' num2str(eeElemInd) '_' freqStr '.txt'];
    isExist = exist(fileName,'file');
    if ~isExist
        fileName      = [dataPath '\farfield(f=' num2str(ffMonList(ffMonInd)) ')[Simulation_' num2str(eeElemInd) '].txt'];
        isExist = exist(fileName,'file');
        if ~isExist
            fileName = [dataPath '\Gain_EE_' num2str(0) '_' freqStr '.txt'];
        end
    end
end
end