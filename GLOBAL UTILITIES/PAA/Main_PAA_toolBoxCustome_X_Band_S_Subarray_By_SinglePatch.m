close all;
clear all;clc
% hfssDataRadPathSt     = importdata('F:\FAROOQUI\OCE\X_Band_SinglePatch_ProbeFeed_ZYFD80Mil.csv');
c                = 3e8;
freqVector       = [9.9 10.1].*1e9;        % Frequency range for element pattern
steerang         = [-10:2:10];
fc               = 10e9;

N                     = 64;
Nsubarray             = 8;
interElemSpacing      = 0.5;
lambda                = c/fc;
% hfssDataRadPat        = hfssDataRadPathSt.data;
% hfss_phi              = hfssDataRadPat(:,1);
% hfss_theta            = hfssDataRadPat(:,2);
% hfss_pattern_phitheta = hfssDataRadPat(:,3);
% theta                 = unique(hfss_theta)';
% phi                   = unique(hfss_phi)';
% pattern_phitheta      = reshape(hfss_pattern_phitheta,numel(phi),numel(theta)).';
% % [pattern_phitheta,phi,theta] = helperPatternImport;
% [pattern_azel,az,el]  = phitheta2azelpat(pattern_phitheta,phi,theta);

%-- Create Antenna Object
% antenna       = phased.CustomAntennaElement('FrequencyVector',freqVector,'AzimuthAngles',az,'ElevationAngles',el,'MagnitudePattern',pattern_azel,'PhasePattern',zeros(size(pattern_azel)));
antenna = phased.IsotropicAntennaElement('BackBaffled',true);
arrayULA      = phased.ULA('Element',antenna,'NumElements',N/Nsubarray,'ElementSpacing',interElemSpacing*lambda,'ArrayAxis','y');
arrayULA_Repl = phased.ReplicatedSubarray('Subarray',arrayULA,'GridSize',[1 Nsubarray]);
figure,viewArray(arrayULA);
figure,viewArray(arrayULA_Repl);

steerAngDeg = [-60:1:60];
stVecSenArray = phased.SteeringVector('SensorArray',arrayULA,'PropagationSpeed',c);
w = stVecSenArray(fc,steerAngDeg);
stVecRepArray = phased.SteeringVector('SensorArray',arrayULA_Repl,'PropagationSpeed',c);
wReplArray    = stVecRepArray(fc,steerAngDeg);


figure,pattern(antenna,fc,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','polar');title(['freq:' num2str(fc/1e9) 'GHz'])
figure,
subplot(2,1,1),pattern(antenna,fc,0,[-90:1:90],'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('Antenna: f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fc/1e9));hold on;
subplot(2,1,2),pattern(antenna,fc,[-90:1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('Antenna: f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fc/1e9));hold on;
figure,
subplot(2,1,1),pattern(arrayULA,fc,[-90:1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('Antenna: f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fc/1e9));hold on;
subplot(2,1,2),pattern(arrayULA,fc,[-90:1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',w);title(sprintf('Antenna: f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fc/1e9));hold on;


figure,
plot(rad2deg(angle(w)));grid on;hold on;xlabel('Num');ylabel('Phase [deg]');
pAngDegVec = [-90:0.5:90];
arrElCutData = pattern(arrayULA,fc,pAngDegVec,0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',w);
[maxVal,maxValInd]=max(arrElCutData,[],1);

[steerAngDeg.',pAngDegVec(maxValInd).',maxVal.']
for ind = 1:numel(maxValInd)
legStr{ind} = sprintf(' %.1f ',pAngDegVec(maxValInd(ind)));
end

figure,
% subplot(2,1,1),pattern(arrayULA,fc,0,[-90:0.5:90],'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',w);title(sprintf('Array: f:%.1fGHzAzimuth Cut at Elevation angle 0^o',fc/1e9));%legend('Ant','Arr')
% subplot(2,1,2),
pattern(arrayULA,fc,[-90:0.5:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',w);title(sprintf('Array: f:%.1fGHzElevation Cut at Azimuth angle 0^o',fc/1e9));%legend('Ant','Arr')
legend(legStr)