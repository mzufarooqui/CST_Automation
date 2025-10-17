close all;clear all;clc
tic
hfssDataRadPathSt     = importdata('F:\FAROOQUI\FAROOQUI_TOOLS\GLOBAL UTILITIES\PAA\quasiYagiElem_HFSS.csv');
c      = 3e8;
freqVector  = [9.98 10].*1e9;        % Frequency range for element pattern
thetaad = -30:5:30;     % look directions
thetaan = 40;           % interference direction
fmax = freqVector(end);
lambda = c/fmax;
N = 32;
Nsubarray = 4;
interElemSpacing = 0.5;

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
%-- Radiation pattern in Az El Fram at fmax
figure,pattern(antenna,fmax,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','polar');title(['freq:' num2str(fmax/1e9) 'GHz'])
figure,
subplot(2,1,1),pattern(antenna,fmax,0,[-90:1:90],'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fmax/1e9));
subplot(2,1,2),pattern(antenna,fmax,[-90:1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('f:%.1fGHzAzimuth Cut at Elevation angle 0^o',fmax/1e9));
%-- Construct the rectangular Antenna Array of size
array  = phased.URA('Element',antenna,'Size',[N N],'ElementSpacing',interElemSpacing*lambda,'ArrayNormal','x');
%-- Radiation Patt of the antenna array
figure,pattern(array,fmax,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','polar');
title(sprintf('f:%.1fGHz',fmax/1e9))
figure,viewArray(array)
getNumElements(array)
figure,
subplot(2,1,1),pattern(array,fmax,0,[-90:1:90],'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fmax/1e9));
subplot(2,1,2),pattern(array,fmax,[-90:1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('f:%.1fGHzAzimuth Cut at Elevation angle 0^o',fmax/1e9));

%-- For SUB Array
%-- Construct the rectangular Sub Antenna Array of size
% subURA  = phased.URA(N/Nsubarray,0.5*c/fmax,'Element',antenna);
% subURA  = phased.ULA('Element',antenna,'Size',[1 Nsubarray],'ElementSpacing',0.5*lambda);
subURA  = phased.ULA(Nsubarray,interElemSpacing*lambda,'Element',antenna);
figure,viewArray(subURA)
replarray = phased.ReplicatedSubarray('Subarray',subURA,'GridSize',[N N/Nsubarray]);
figure,viewArray(replarray)


%-- compare the radiation pattern of SUB array to the radiation pattern of URA with no subarrays.
% refula = phased.ULA(N,0.5*c/fc,'Element',antenna);
figure,
subplot(2,1,1), pattern(replarray,fmax,-180:180,0,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c);
title('Subarrayed URA Azimuth Cut');
subplot(2,1,2), pattern(array,fmax,-180:180,0,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c);
title('URA Azimuth Cut'); 

% steer both arrays to "steerang" degrees azimuth.
steerang = [-10:2:10];
steeringvec_replarray = phased.SteeringVector('SensorArray',replarray,'PropagationSpeed',c);
w = steeringvec_replarray(fmax,steerang);
steeringvec_array = phased.SteeringVector('SensorArray',array,'PropagationSpeed',c);
wref = steeringvec_array(fmax,steerang);

for ind = 1:numel(steerang)
    legStr{ind} = sprintf('\\theta:%.1f^o',steerang(ind));
end

[fieldvalSub,azimuthSub,elevationSub] = pattern(replarray,fmax,-180:1:180,0,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',w);
[fieldvalArr,azimuthArr,elevationArr] = pattern(array,fmax,-180:1:180,0,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',wref);

for ind = 1:numel(steerang)    
    pks_azSub(ind,:)  = findpeaks(fieldvalSub(:,ind),'NPeaks',2,'SortStr','descend');
    pks_azArr(ind,:)  = findpeaks(fieldvalArr(:,ind),'NPeaks',2,'SortStr','descend');    
    
    sll_dBArr(ind)    = pks_azArr(ind,1)-pks_azArr(ind,2);
    sll_dBSub(ind)    = pks_azSub(ind,1)-pks_azSub(ind,2);
    
    
%     pks_az(ind,:)  = findpeaks(fieldval(:,ind),'NPeaks',2,'SortStr','descend');
%     sll_dB(ind)    = pks_az(ind,1)-pks_az(ind,2);
    
    legStrSub{ind} = sprintf('\\theta:%.1f^o, SLL:%.1f',steerang(ind),sll_dBSub(ind));
    legStrArr{ind} = sprintf('\\theta:%.1f^o, SLL:%.1f',steerang(ind),sll_dBArr(ind));
end
figure,
subplot(2,1,1),pattern(replarray,fmax,-180:1:180,0,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',w);
title('Subarrayed URA Azimuth Cut');legend(legStrSub)
subplot(2,1,2), pattern(array,fmax,-180:1:180,0,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',wref);
title('URA Azimuth Cut');legend(legStrArr)





% % Compute relative sidelobe level
% pks_az = findpeaks(fieldval,'NPeaks',2,'SortStr','descend');
% pks_el = findpeaks(elpat,'NPeaks',2,'SortStr','descend');
% 
% 
% 
% 
% 
% % Compute relative sidelobe level
% pks_az = findpeaks(azpat,'NPeaks',2,'SortStr','descend');
% pks_el = findpeaks(elpat,'NPeaks',2,'SortStr','descend');
% 
% % find the smaller sidelobe level between two cuts
% sllopt = min(pks_az(1)-pks_az(2),pks_el(1)-pks_el(2))
% 


if 0
    % ula = phased.ULA(10,lambda/2);
    % antenna.Element.BackBaffled = true;
    
    % Calculate the steering vector for null directions
    wn = steervec(getElementPosition(array)/lambda,thetaan);
    
    % Calculate the steering vectors for lookout directions
    wd = steervec(getElementPosition(array)/lambda,thetaad);
    
    % Compute the response of desired steering at null direction
    rn = wn'*wd/(wn'*wn);
    
    % Sidelobe canceler - remove the response at null direction
    w = wd-wn*rn;
    
    % Plot the pattern
    figure,pattern(array,fmax,-180:180,0,'PropagationSpeed',c,'Type','powerdb','CoordinateSystem','rectangular','Weights',w);
    hold on; legend off;
    plot([40 40],[-100 0],'r--','LineWidth',2)
    text(40.5,-5,'\leftarrow Interference Direction','Interpreter','tex','Color','r','FontSize',10)
end
toc