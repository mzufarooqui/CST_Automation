close all;clear all;clc
fc = 3e8;
c = 3e8;
antenna = phased.IsotropicAntennaElement('BackBaffled',true);
N = 64;
Nsubarray = 8;
subula = phased.ULA(N/Nsubarray,0.5*c/fc,'Element',antenna);
replarray = phased.ReplicatedSubarray('Subarray',subula,'GridSize',[1 Nsubarray])
refula = phased.ULA(N,0.5*c/fc,'Element',antenna);

steerang = 6;
steeringvec_replarray = phased.SteeringVector('SensorArray',replarray,'PropagationSpeed',c);
w = steeringvec_replarray(fc,steerang);
steeringvec_refula = phased.SteeringVector('SensorArray',refula,'PropagationSpeed',c);
wref = steeringvec_refula(fc,steerang);

figure,
subplot(2,1,1), pattern(replarray,fc,-180:180,0,'Type','powerdb','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',w); 
title('Subarrayed ULA Azimuth Cut'); axis([-90 90 -50 0]);
subplot(2,1,2), pattern(refula,fc,-180:180,0,'Type','powerdb','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',wref); 
title('ULA Azimuth Cut'); axis([-90 90 -50 0]);
%
release(replarray);
replarray.SubarraySteering = 'Phase';
replarray.PhaseShifterFrequency = fc;
figure,
subplot(2,1,1);
pattern(replarray,fc,-180:180,0,'Type','powerdb','Weights',w,...
    'CoordinateSystem','rectangular','PropagationSpeed',c,'SteerAngle',6);
title('Subarrayed ULA Azimuth Cut'); axis([-90 90 -50 0]);
subplot(2,1,2);
pattern(refula,fc,-180:180,0,'Type','powerdb',...
    'CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',wref);
title('ULA Azimuth Cut'); axis([-90 90 -50 0]);

%
% As a side note, the element and the subarrays do not necessarily steer to
% the same direction. In some applications, the elements inside the
% subarrays are steered toward a specific direction. The subarrays can then
% be steered to slightly different directions to search the vicinity.