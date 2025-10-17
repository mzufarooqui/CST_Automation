% close all;
clear all;clc
tic
hfssDataRadPathSt     = importdata('F:\FAROOQUI\FAROOQUI_TOOLS\GLOBAL UTILITIES\PAA\quasiYagiElem_HFSS.csv');
c                = 3e8;
freqVector       = [9.98 10].*1e9;        % Frequency range for element pattern
steerang         = [-10:2:10];
fc             = freqVector(end);

N                = 64;
Nsubarray        = 8;
interElemSpacing = 0.5;
lambda           = c/fc;
hfssDataRadPat        = hfssDataRadPathSt.data;
hfss_phi              = hfssDataRadPat(:,1);
hfss_theta            = hfssDataRadPat(:,2);
hfss_pattern_phitheta = hfssDataRadPat(:,3);
theta                 = unique(hfss_theta)';
phi                   = unique(hfss_phi)';
pattern_phitheta      = reshape(hfss_pattern_phitheta,numel(phi),numel(theta)).';
% [pattern_phitheta,phi,theta] = helperPatternImport;
[pattern_azel,az,el]  = phitheta2azelpat(pattern_phitheta,phi,theta);
%-- Create Antenna Object
antenna     = phased.CustomAntennaElement('FrequencyVector',freqVector,'AzimuthAngles',az,'ElevationAngles',el,'MagnitudePattern',pattern_azel,'PhasePattern',zeros(size(pattern_azel)));
subula      = phased.ULA('Element',antenna,'NumElements',N/Nsubarray,'ElementSpacing',interElemSpacing*lambda);
replarray   = phased.ReplicatedSubarray('Subarray',subula,'GridSize',[1 Nsubarray]);
figure,viewArray(replarray)

steerang = 6;
steeringvec_replarray = phased.SteeringVector('SensorArray',replarray,'PropagationSpeed',c);
w = steeringvec_replarray(fc,steerang);

figure,
subplot(2,1,1), pattern(replarray,fc,-180:180,0,'Type','powerdb','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',w); 
title('Subarrayed ULA Azimuth Cut'); axis([-90 90 -50 0]);

%
release(replarray);
replarray.SubarraySteering = 'Phase';
replarray.PhaseShifterFrequency = fc;

subplot(2,1,2);
pattern(replarray,fc,-180:180,0,'Type','powerdb','Weights',w,...
    'CoordinateSystem','rectangular','PropagationSpeed',c,'SteerAngle',6);
title('Subarrayed ULA Azimuth Cut'); axis([-90 90 -50 0]);


%
% As a side note, the element and the subarrays do not necessarily steer to
% the same direction. In some applications, the elements inside the
% subarrays are steered toward a specific direction. The subarrays can then
% be steered to slightly different directions to search the vicinity.