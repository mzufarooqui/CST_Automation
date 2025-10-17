close all;clear all;clc
[pattern_phitheta,phi,theta] = helperPatternImport;
[pattern_azel,az,el] = phitheta2azelpat(pattern_phitheta,phi,theta);

freqVector  = [1 1.25].*1e9;        % Frequency range for element pattern 
antenna     = phased.CustomAntennaElement('FrequencyVector',freqVector,...
                              'AzimuthAngles',az,...
                              'ElevationAngles',el,...
                              'MagnitudePattern',pattern_azel,...
                              'PhasePattern',zeros(size(pattern_azel)));
   


fmax = freqVector(end);
pattern(antenna,fmax,'Type','powerdb');
view(-150,20)



c = 3e8;
lambda = c/fmax;
array = phased.URA('Element',antenna,'Size',10,'ElementSpacing',lambda/2)



figure,
pattern(array,fmax,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');


pattern(array,fmax,-1:0.01:1,0,'PropagationSpeed',c,...
    'CoordinateSystem','UV','Type','powerdb');
axis([-1 1 -50 0]);



% helperPatternScan(array)

%%
% clear helperPatternScan

% %% Radar Vertical Diagram
% % When a radar is deployed in the field, the radiation pattern is modified
% % by the surrounding environment. For example, reflections from the earth
% % may enforce or attenuate the signal arriving at the target via the direct
% % path. In addition, the refraction from the ionosphere can also introduce
% % another path from the top. The resulting pattern in the elevation
% % direction is often quite complicated and a radar engineer often needs to
% % do a rough estimate of the vertical coverage during the system design
% % stage. Next section shows how to estimate the radar vertical diagram,
% % some times also referred to as Blake chart, if the aforementioned array
% % is deployed at a height of 20 meters and covers a free space range of 100
% % km.
% 
% % Derive elevation pattern
% el_ang = -90:90;
% arrayresp = phased.ArrayResponse('SensorArray',array,...
%     'PropagationSpeed',c);
% el_pat = abs(arrayresp(fmax,el_ang));  % elevation pattern
% 
% % Radar vertical diagram
% freespace_rng = 100;  % in km
% ant_height = 20;      % in m
% 
% radarvcd(fmax,freespace_rng,ant_height,...
%     'HeightUnit','m','RangeUnit','km',...
%     'AntennaPattern',el_pat/max(el_pat),'PatternAngles',el_ang.');
% 
% 
% 
% %% Summary
% % This example shows how to construct and analyze an antenna array using a
% % custom antenna pattern. The pattern can be generated using full-wave
% % modeling simulation software with the $\phi$ - $\theta$ convention. The
% % pattern can then be converted to az-el convention. The resulting array is
% % used to generate a vertical coverage diagram and is also scanned from -30
% % degrees to 30 degrees in the azimuth direction to illustrate the phase
% % steering concept.
% 
% displayEndOfDemoMessage(mfilename)