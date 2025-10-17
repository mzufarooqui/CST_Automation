function [sll_dBArr,sll_dBSub,sllPosDegSub,sllPosDegArr,totNumElemInOneRow] = f_BeamSteeringWithCustomRadPat(Plot_3D,Plot_2D,hfssDataRadPathSt,c,freqVector,fc,steerang,Nsubarray,interElemSpacing,gain_dB)

lambda                = c/fc;
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
%-- Radiation pattern in Az El Fram at fc
if Plot_3D == 1
    figure,pattern(antenna,fc,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','polar');title(['freq:' num2str(fc/1e9) 'GHz'])
end
if Plot_2D == 1
    figure,
    subplot(2,1,1),pattern(antenna,fc,0,[-90:1:90],'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fc/1e9));
    subplot(2,1,2),pattern(antenna,fc,[-90:1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('f:%.1fGHzAzimuth Cut at Elevation angle 0^o',fc/1e9));
end

%-- Calculate number of elements
[fieldval,azimuth,elevation] = pattern(antenna,fc,'PropagationSpeed',c,'Type','directivity');
singleElemGain_dB  = max(max(fieldval));
if mod(ceil(sqrt((10^((gain_dB-singleElemGain_dB)/10)))),2) == 1
    totNumElemInOneRow = ceil(sqrt((10^((gain_dB-singleElemGain_dB)/10)))) + 1;
else
    totNumElemInOneRow = ceil(sqrt((10^((gain_dB-singleElemGain_dB)/10))));
end
% 10*log10(totNumElemInOneRow*totNumElemInOneRow)+baseElemGain_dB
N = totNumElemInOneRow;

while mod(N,Nsubarray)~= 0    
    fprintf(1,'\n Estimated number of elements in a row is :%d',N)
    fprintf(1,'\n Given number of elements in sub array:%d',Nsubarray)
    fprintf(1,'\n Enter number of elements in a row which should be multiple of "%d" : ',Nsubarray)
    N = input(':>>');
    fprintf('\n')
end

%-- Construct the rectangular Antenna Array of size
array  = phased.URA('Element',antenna,'Size',[N N],'ElementSpacing',interElemSpacing*lambda,'ArrayNormal','x');
%-- Radiation Patt of the antenna array
if Plot_3D == 1
    figure,pattern(array,fc,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','polar');
    title(sprintf('f:%.1fGHz',fc/1e9))
    figure,viewArray(array)
end
if Plot_2D == 1
    figure,
    subplot(2,1,1),pattern(array,fc,0,[-90:1:90],'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('f:%.1fGHz,Elevation Cut at azimuth angle 0^o',fc/1e9));
    subplot(2,1,2),pattern(array,fc,[-90:1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');title(sprintf('f:%.1fGHzAzimuth Cut at Elevation angle 0^o',fc/1e9));
end
%-- For SUB Array
%-- Construct the rectangular Sub Antenna Array of size
% subURA  = phased.URA(N/Nsubarray,0.5*c/fc,'Element',antenna);
% subURA  = phased.ULA('Element',antenna,'Size',[1 Nsubarray],'ElementSpacing',0.5*lambda);
subURA  = phased.ULA(Nsubarray,interElemSpacing*lambda,'Element',antenna);
replarray = phased.ReplicatedSubarray('Subarray',subURA,'GridSize',[N N/Nsubarray]);
if Plot_3D == 1
    figure,viewArray(subURA)
    figure,viewArray(replarray)
end
%-- compare the radiation pattern of SUB array to the radiation pattern of URA with no subarrays.
% refula = phased.ULA(N,0.5*c/fc,'Element',antenna);
if Plot_2D == 1
    figure,
    subplot(2,1,1), pattern(replarray,fc,-180:180,0,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c);
    title('Subarrayed URA Azimuth Cut');
    subplot(2,1,2), pattern(array,fc,-180:180,0,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c);
    title('URA Azimuth Cut');
end
% steer both arrays to "steerang" degrees azimuth.
steeringvec_replarray = phased.SteeringVector('SensorArray',replarray,'PropagationSpeed',c);
w = steeringvec_replarray(fc,steerang);
steeringvec_array = phased.SteeringVector('SensorArray',array,'PropagationSpeed',c);
wref = steeringvec_array(fc,steerang);

[fieldvalSub,azimuthSub,elevationSub] = pattern(replarray,fc,-180:1:180,0,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',w);
[fieldvalArr,azimuthArr,elevationArr] = pattern(array,fc,-180:1:180,0,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',wref);

for ind = 1:numel(steerang)
    [pks_azSub(ind,:),angSub(ind,:)]  = findpeaks(fieldvalSub(:,ind),'NPeaks',2,'SortStr','descend');
    [pks_azArr(ind,:),angArr(ind,:)]  = findpeaks(fieldvalArr(:,ind),'NPeaks',2,'SortStr','descend');
    
    sll_dBArr(ind)    = pks_azArr(ind,1)-pks_azArr(ind,2);
    sll_dBSub(ind)    = pks_azSub(ind,1)-pks_azSub(ind,2);
    sllPosDegSub(ind) = azimuthSub(angSub(ind,2));
    sllPosDegArr(ind) = azimuthArr(angArr(ind,2));
    
    legStrSub{ind} = sprintf('\\theta:%.1f^o, SLL:%.1f, SLL Pos:%.1f^o',steerang(ind),sll_dBSub(ind),sllPosDegSub(ind));
    legStrArr{ind} = sprintf('\\theta:%.1f^o, SLL:%.1f, SLL Pos:%.1f^o',steerang(ind),sll_dBArr(ind),sllPosDegArr(ind));
end
if Plot_2D == 1
    figure,
    subplot(2,1,1),pattern(replarray,fc,-180:1:180,0,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',w);
    title('Subarrayed URA Azimuth Cut');legend(legStrSub)
    subplot(2,1,2), pattern(array,fc,-180:1:180,0,'Type','directivity','CoordinateSystem','rectangular','PropagationSpeed',c,'Weights',wref);
    title('URA Azimuth Cut');legend(legStrArr)
end
end