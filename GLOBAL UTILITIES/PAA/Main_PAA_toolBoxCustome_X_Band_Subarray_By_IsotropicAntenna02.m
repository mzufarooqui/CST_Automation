close all;
clear all;clc
c                     = 3e8;
freqVector            = [9.9 10.1].*1e9;        % Frequency range for element pattern
steerAngDeg           = [10];
fc                    = 10e9;
numSubArray           = 2;
numTR_Module          = 32;
numChan               = 4;
N                     = numSubArray * numTR_Module * numChan;
interElemSpacing      = 0.5;
lambda                = c/fc;
%-- Create Antenna and array object
antenna           = phased.IsotropicAntennaElement('FrequencyRange',freqVector,'BackBaffled',true);
arrayULA          = phased.ULA('Element',antenna,'NumElements',N,          'ElementSpacing',interElemSpacing*lambda,                         'ArrayAxis','y');
arrayULA_SubArray = phased.ULA('Element',antenna,'NumElements',numSubArray,'ElementSpacing',interElemSpacing*lambda,                         'ArrayAxis','y');
arrayULA_Chanel   = phased.ULA('Element',antenna,'NumElements',numChan,    'ElementSpacing',numTR_Module*numSubArray*interElemSpacing*lambda,'ArrayAxis','y');
arrayULA_Rep      = phased.ReplicatedSubarray('Subarray',arrayULA_SubArray,'GridSize',[1 numTR_Module*numChan],'Layout','Rectangular','GridSpacing','Auto');

% Weight for N element
sVarrayULA = phased.SteeringVector('SensorArray',arrayULA,'PropagationSpeed',c);
wArrayULA  = sVarrayULA(fc,steerAngDeg);

% Weight for N element considering subArray
sVarrayULA_Rep = phased.SteeringVector('SensorArray',arrayULA_Rep,'PropagationSpeed',c);
wArrayULA_Rep  = sVarrayULA_Rep(fc,steerAngDeg);

figure,
plot(rad2deg((phase(wArrayULA))),'-ko');hold on;grid on
plot(rad2deg((phase(wArrayULA_Rep))),'-ro');hold on;grid on
legend('linear','2 sub','Location','SouthEast')
xlabel('Antenna Element Number');ylabel('Excitation Coeff. Phase [deg]')

% Weight for numChan element
sV_arrayULA_Chanel  = phased.SteeringVector('SensorArray',arrayULA_Chanel,'PropagationSpeed',c);
wArrayULA_Chanel    = sV_arrayULA_Chanel(fc,steerAngDeg);

wArrayULA_Chanel_Adj = [];
cnt                  = 0;
for indDAQ = 1:numChan % Add phase of numChan to numSubArray
%     fprintf('\n%d-----%d',cnt*numTR_Module+1,indDAQ*numTR_Module);
    wArrayULA_Chanel_Adj = [wArrayULA_Chanel_Adj;wArrayULA_Chanel(indDAQ).*wArrayULA_Rep(cnt*numTR_Module+1:indDAQ*numTR_Module)];
    cnt = cnt + 1;
end

figure,
viewArray(arrayULA_SubArray);
figure,
viewArray(arrayULA_Rep);
%-- 3D Antenna Element Pattern
figure,
pattern(antenna,fc,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','polar');title(['Isotropic Antenna Element, freq:' num2str(fc/1e9) 'GHz'])
%-- Antenna Element Pattern
figure,
subplot(2,1,1),pattern(antenna,fc,0,[-90:0.5:90],'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('Isotropic Antenna: f:%.1fGHz,Elevation Cut at Azimuth angle 0^o',fc/1e9));hold on;
subplot(2,1,2),pattern(antenna,fc,[-90:0.5:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('Isotropic Antenna: f:%.1fGHz,Azimuth Cut at Elevation angle 0^o',fc/1e9));hold on;

figure,
%-- Antenna Array Pattern
subplot(4,1,1),pattern(arrayULA_Rep,fc,[-90:0.1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',ones(numel(wArrayULA_Rep),1));title(sprintf('Antenna Array %d Elem,f:%.1fGHz,Az. Cut at El.:0^o, No steering',N,fc/1e9));hold on;
subplot(4,1,2),pattern(arrayULA_Rep,fc,[-90:0.1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',wArrayULA_Rep);title(sprintf('Antenna Array %d Elem,f:%.1fGHz,Az. Cut at El.:0^o,steering:%.1f^o,No Chanel',N,fc/1e9,steerAngDeg));hold on;
subplot(4,1,3),pattern(arrayULA_Rep,fc,[-90:0.1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',wArrayULA_Chanel_Adj);title(sprintf('Antenna Array %d Elem,f:%.1fGHz,Az. Cut at El.:0^o,steering:%.1f^o',N,fc/1e9,steerAngDeg));hold on;

figure,
plot(rad2deg((phase(wArrayULA_Chanel))),'-ko');hold on;grid on
plot(rad2deg((phase(wArrayULA_Rep))),'-ro');hold on;grid on
plot(rad2deg((phase(wArrayULA_Chanel_Adj))),'-bo');hold on;grid on
legend('cahnnel','Rep','Rep Adj','Location','SouthEast')
xlabel('Antenna Element Number');ylabel('Excitation Coeff. Phase [deg]')
figure,
plot(rad2deg(unwrap(phase(wArrayULA_Chanel))),'-ko');hold on;grid on
plot(rad2deg(unwrap(phase(wArrayULA_Rep))),'-ro');hold on;grid on
plot(rad2deg(unwrap(phase(wArrayULA_Chanel_Adj))),'-bo');hold on;grid on
legend('cahnnel','Rep','Rep Adj','Location','SouthEast')
xlabel('Antenna Element Number');ylabel('Excitation Coeff. Phase [deg]')

% k0 = 2*pi/lambda;
% d  = numTR_Module*numSubArray*interElemSpacing*lambda;
% (k0*d*cos((deg2rad(1))))*
% 2*pi/lambda*d*cos(1)
% 
% 360*d/lambda*cos()

% 
% %-- Antenna Array Pattern with sub array weight
% subplot(4,1,3),pattern(arrayULA,fc,[-90:0.2:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',wULA_SubArrayAdj);title(sprintf('Antenna Array %d Elem,with Sub Array Size %d,steering:%.1f^o',N,numSubArray,steerAngDeg));hold on;
% %-- Antenna Array Pattern with DAQ weight
% subplot(4,1,4),pattern(arrayULA,fc,[-90:0.2:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',wULA_DAQ_Adj);title(sprintf('Antenna Array %d Elem,with Sub Array Size %d, DAQ weight,steering:%.1f^o',N,numSubArray,steerAngDeg));hold on;




% 
% legend('Diff','Same','rep4','Location','SouthEast')
% 
% figure,
% plot(rad2deg(unwrap(phase(w))));hold on;grid on
% plot(rad2deg(unwrap(phase(wEightElem1))));hold on;grid on
% plot(rad2deg(unwrap(phase(wFourElem1))));hold on;grid on
% legend('Diff','Same','rep4','Location','SouthEast')

% gain = phased.ArrayGain('SensorArray',arrayULA_eightElem,'PropagationSpeed',c);

% phased.ArrayGain('SensorArray',PropagationSpeed,c)
% 
% 
% 
% 
% arrayULA_Repl = phased.ReplicatedSubarray('Subarray',arrayULA,'GridSize',[1 Nsubarray]);
% figure,viewArray(arrayULA);
% figure,viewArray(arrayULA_Repl);
% 
% steerAngDeg = [3];
% stVecSenArray = phased.SteeringVector('SensorArray',arrayULA,'PropagationSpeed',c);
% w = stVecSenArray(fc,steerAngDeg);
% stVecRepArray = phased.SteeringVector('SensorArray',arrayULA_Repl,'PropagationSpeed',c);
% wReplArray    = stVecRepArray(fc,steerAngDeg);
% 
% 
% figure,pattern(antenna,fc,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','polar');title(['freq:' num2str(fc/1e9) 'GHz'])
% figure,
% subplot(2,4,1),pattern(antenna,fc,0,[-90:1:90],'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('Antenna: f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fc/1e9));hold on;
% subplot(2,4,5),pattern(antenna,fc,[-90:1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('Antenna: f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fc/1e9));hold on;
% figure,
% subplot(2,3,1),pattern(arrayULA,fc,[-90:1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('sub no st Antenna: f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fc/1e9));hold on;
% subplot(2,3,4),pattern(arrayULA,fc,[-90:1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',w);title(sprintf('sub st Antenna: f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fc/1e9));hold on;
% % figure,
% subplot(2,3,2),pattern(arrayULA_Repl,fc,[-90:1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('rep no st Antenna: f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fc/1e9));hold on;
% subplot(2,3,5),pattern(arrayULA_Repl,fc,[-90:1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',wReplArray);title(sprintf('rep st Antenna: f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fc/1e9));hold on;
% % figure,
% subplot(2,3,6),pattern(arrayULA,fc,[-90:1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',w);title(sprintf('sub st Antenna: f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fc/1e9));hold on;
% subplot(2,3,6),pattern(arrayULA_Repl,fc,[-90:1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',wReplArray);title(sprintf('rep st Antenna: f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fc/1e9));hold on;
% legend('Sub array','Array','Location','SouthEast')
% % 
% % figure,
% % plot(rad2deg(angle(w)));grid on;hold on;xlabel('Num');ylabel('Phase [deg]');
% % pAngDegVec = [-90:0.5:90];
% % arrElCutData = pattern(arrayULA,fc,pAngDegVec,0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',w);
% % [maxVal,maxValInd]=max(arrElCutData,[],1);
% % 
% % [steerAngDeg.',pAngDegVec(maxValInd).',maxVal.']
% % for ind = 1:numel(maxValInd)
% % legStr{ind} = sprintf(' %.1f ',pAngDegVec(maxValInd(ind)));
% % end
% % 
% % figure,
% % % subplot(2,1,1),pattern(arrayULA,fc,0,[-90:0.5:90],'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',w);title(sprintf('Array: f:%.1fGHzAzimuth Cut at Elevation angle 0^o',fc/1e9));%legend('Ant','Arr')
% % % subplot(2,1,2),
% % pattern(arrayULA,fc,[-90:0.5:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',w);title(sprintf('Array: f:%.1fGHzElevation Cut at Azimuth angle 0^o',fc/1e9));%legend('Ant','Arr')
% % legend(legStr)