function [thetaDegAtPhi_0_180,thetaDegAtPhi_90_270,gain_dB_AtPhi_0_180,gain_dB_AtPhi_90_270] = ...
    f_GetArrayPattern(dataPath,numElem,ffMonList)
numffMon = numel(ffMonList);
for eeElemInd = 1:numel(numElem)
    for ffMonInd = 1:numffMon
        fileName      = ['farfield(f=' num2str(ffMonList(ffMonInd)) ')[' num2str(eeElemInd) '].txt'];
        
        gainffData    = importdata([dataPath '\' fileName]);
        thetaDeg(eeElemInd,ffMonInd,:)      = gainffData.data(:,1);
        phiDeg(eeElemInd,ffMonInd,:)        = gainffData.data(:,2);
        absGain_dB(eeElemInd,ffMonInd,:)    = gainffData.data(:,3);
        absTheta_dB(eeElemInd,ffMonInd,:)   = gainffData.data(:,4);
        phaseThetaDeg(eeElemInd,ffMonInd,:) = gainffData.data(:,5);
        absPhi_dB(eeElemInd,ffMonInd,:)     = gainffData.data(:,6);
        phasePhiDeg(eeElemInd,ffMonInd,:)   = gainffData.data(:,7);
        axRatio_dB(eeElemInd,ffMonInd,:)    = gainffData.data(:,8);
    end
end
dim = 1; % sum dimension i.e number of array element
gainThetaComp = squeeze(sum(sqrt( 10.^(absTheta_dB./10) ) .* exp( 1j .* deg2rad( phaseThetaDeg )),dim));
gainPhiComp   = squeeze(sum(sqrt( 10.^(absPhi_dB./10) )   .* exp( 1j .* deg2rad( phasePhiDeg )),dim));
gain_dB       = 10 * log10(abs( gainThetaComp.^2 + gainPhiComp.^2 )/numel(numElem));

for eeElemInd = 1:numel(numElem)
    parfor ffMonInd = 1:numffMon
        phiDeg0Ind   = find(phiDeg(eeElemInd,ffMonInd,:) == 0 );
        phiDeg180Ind = find(phiDeg(eeElemInd,ffMonInd,:) == 180 );
        phiDeg90Ind  = find(phiDeg(eeElemInd,ffMonInd,:) == 90 );
        phiDeg270Ind = find(phiDeg(eeElemInd,ffMonInd,:) == 270 );
        
        %-- Get H(at 0-180 phi) Plane
        thetaDegAtPhi_0_180(ffMonInd,:) = [-fliplr(squeeze(thetaDeg(eeElemInd,ffMonInd,phiDeg180Ind(2:end))).') squeeze(thetaDeg(eeElemInd,ffMonInd,phiDeg0Ind)).'];
        gain_dB_AtPhi_0_180(ffMonInd,:) = [ fliplr(gain_dB(ffMonInd,phiDeg180Ind(2:end)))  gain_dB(ffMonInd,phiDeg0Ind) ];
        
        %-- Get E(at 90-270 phi) Plane
        thetaDegAtPhi_90_270(ffMonInd,:) = [-fliplr(squeeze(thetaDeg(eeElemInd,ffMonInd,phiDeg270Ind(2:end))).') squeeze(thetaDeg(eeElemInd,ffMonInd,phiDeg90Ind)).'];
        gain_dB_AtPhi_90_270(ffMonInd,:) = [ fliplr(gain_dB(ffMonInd,phiDeg270Ind(2:end)))  gain_dB(ffMonInd,phiDeg90Ind) ];
    end
end
end