close all;
clear all;clc
c                     = 3e8;
freqVector            = [9.9 10.1].*1e9;        % Frequency range for element pattern
stAngDegArray         = [7];
stAngDegTR_Module     = [stAngDegArray];
stAngDegChan          = [3];
fc                    = 10e9;
numSubArray           = 2;
numTR_Module          = 8;
numChan               = 12;
N                     = numSubArray * numTR_Module * numChan;
interElemSpacing      = 0.5;
lambda                = c/fc;
%-- Create Antenna and array object
antenna            = phased.IsotropicAntennaElement('FrequencyRange',freqVector,'BackBaffled',true);
arrayULA           = phased.ULA('Element',antenna,'NumElements',N,           'ElementSpacing',interElemSpacing*lambda,             'ArrayAxis','y');
arrayULA_SubArray  = phased.ULA('Element',antenna,'NumElements',numSubArray, 'ElementSpacing',interElemSpacing*lambda,             'ArrayAxis','y');
arrayULA_TR_Module = phased.ULA('Element',antenna,'NumElements',numTR_Module,'ElementSpacing',interElemSpacing*lambda,             'ArrayAxis','y');
arrayULA_Chanel    = phased.ULA('Element',antenna,'NumElements',numChan,     'ElementSpacing',numSubArray*numTR_Module*interElemSpacing*lambda,'ArrayAxis','y');
arrayULA_Rep       = phased.ReplicatedSubarray('Subarray',arrayULA_SubArray,'GridSize',[1 numTR_Module*numChan],'Layout','Rectangular','GridSpacing','Auto');
%-- weight for N array elem
sV_ArrayULA           = phased.SteeringVector('SensorArray',arrayULA,'PropagationSpeed',c);
wArrayULA             = sV_ArrayULA(fc,stAngDegArray);
%-- weight for numTR_Module array elem
sV_ArrayULA_TR_Module = phased.SteeringVector('SensorArray',arrayULA_TR_Module,'PropagationSpeed',c);
wArrayULA_TR_Module   = sV_ArrayULA_TR_Module(fc,stAngDegTR_Module);
%-- weight for numChan array elem
sV_ArrayULA_Chanel    = phased.SteeringVector('SensorArray',arrayULA_Chanel,'PropagationSpeed',c);
wArrayULA_Chanel      = sV_ArrayULA_Chanel(fc,stAngDegChan);
% Weight for N element considering subArray
sV_ArrayULA_Rep       = phased.SteeringVector('SensorArray',arrayULA_Rep,'PropagationSpeed',c);
wArrayULA_Rep         = sV_ArrayULA_Rep(fc,stAngDegArray);
release(sV_ArrayULA_Rep);
wArrayULA_RepForChan  = sV_ArrayULA_Rep(fc,stAngDegArray+stAngDegChan);

wArrayULA_Chanel_Adj = [];
cnt                  = 0;
for indDAQ = 1:numChan % Add phase of numChan to numSubArray
    fprintf('\n%d-----%d',cnt*numTR_Module+1,indDAQ*numTR_Module);
    wArrayULA_Chanel_Adj = [wArrayULA_Chanel_Adj;wArrayULA_Chanel(indDAQ,:).*wArrayULA_RepForChan(cnt*numTR_Module+1:indDAQ*numTR_Module,:)];
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
subplot(2,1,1),pattern(arrayULA_Rep,fc,[-90:0.1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',ones(numel(wArrayULA_Rep),1));title(sprintf('Antenna Array %d Elem,f:%.1fGHz,Az. Cut at El.:0^o, No steering',N,fc/1e9));hold on;
subplot(2,1,1),pattern(arrayULA_TR_Module,fc,[-90:0.1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular');                                  title(sprintf('Antenna Array %d Elem,f:%.1fGHz,Az. Cut at El.:0^o,steering:%.1f^o,No Chanel',N,fc/1e9,stAngDegArray));hold on;
legend('Array','Single Channel')

subplot(2,1,2),pattern(arrayULA_Rep,fc,[-90:0.1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',wArrayULA_Rep);               title(sprintf('Antenna Array %d Elem,f:%.1fGHz,Az. Cut at El.:0^o,steering:%.1f^o,No Chanel',N,fc/1e9,stAngDegArray));hold on;
linObj = findobj(gcf,'type','line');
set(linObj(1),'Color','r','LineWidth',3)
subplot(2,1,2),pattern(arrayULA_Rep,fc,[-90:0.1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',wArrayULA_Chanel_Adj);        title(sprintf('Antenna Array %d Elem,f:%.1fGHz,Az. Cut at El.:0^o,steering:%.1f^o, Chanel:%d',N,fc/1e9,stAngDegArray,numChan));hold on;
subplot(2,1,2),pattern(arrayULA_TR_Module,fc,[-90:0.1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',wArrayULA_TR_Module);     title(sprintf('Antenna Array %d Elem,f:%.1fGHz,Az. Cut at El.:0^o,steering:%.1f^o,No Chanel',N,fc/1e9,stAngDegArray));hold on;
legend('Array','DBF Array','Single Channel')


%-- For animation
figure(101),
pattern(arrayULA_Rep,fc,[-90:0.1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',wArrayULA_Rep);               title(sprintf('Antenna Array %d Elem,f:%.1fGHz,Az. Cut at El.:0^o,steering:%.1f^o,No Chanel',N,fc/1e9,stAngDegArray));hold on;
linObj = findobj(gcf,'type','line');
set(linObj(1),'Color','r','LineWidth',3)
pattern(arrayULA_TR_Module,fc,[-90:0.1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',wArrayULA_TR_Module);     title(sprintf('Antenna Array %d Elem,f:%.1fGHz,Az. Cut at El.:0^o,steering:%.1f^o,No Chanel',N,fc/1e9,stAngDegArray));hold on;
pattern(arrayULA_Rep,fc,[-90:0.1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',wArrayULA_Chanel_Adj);        title(sprintf('Antenna Array %d Elem,f:%.1fGHz,Az. Cut at El.:0^o,steering:%.1f^o, Chanel:%d',N,fc/1e9,stAngDegArray,numChan));hold on;
legend('Array','DBF Array','Single Channel')
release(sV_ArrayULA_Chanel);
release(sV_ArrayULA_Rep);
drawnow
    
    
release(sV_ArrayULA_Chanel);
release(sV_ArrayULA_Rep);
frameCnt = 0;
for scanAngDegInd = -(stAngDegArray+3):1:(stAngDegArray+3)
    
    frameCnt = frameCnt + 1
    
    wArrayULA_Chanel      = sV_ArrayULA_Chanel(fc,scanAngDegInd);
    wArrayULA_RepForChan  = sV_ArrayULA_Rep(fc,stAngDegArray+scanAngDegInd);
    
    wArrayULA_Chanel_Adj = [];
    cnt                  = 0;
    for indDAQ = 1:numChan % Add phase of numChan to numSubArray
        %         fprintf('\n%d-----%d',cnt*numTR_Module+1,indDAQ*numTR_Module);
        wArrayULA_Chanel_Adj = [wArrayULA_Chanel_Adj;wArrayULA_Chanel(indDAQ,:).*wArrayULA_RepForChan(cnt*numTR_Module+1:indDAQ*numTR_Module,:)];
        cnt = cnt + 1;
    end          
    linObj = findobj(gcf,'type','line');
    set(linObj(1),'Color','r','LineWidth',3)
    delete(linObj(1))    
    pattern(arrayULA_Rep,fc,[-90:0.1:90],0,'PropagationSpeed',c,'Type','directivity','CoordinateSystem','rectangular','Weights',wArrayULA_Chanel_Adj);        title(sprintf('Antenna Array %d Elem,f:%.1fGHz,Az. Cut at El.:0^o,steering:%.1f^o, Chanel:%d',N,fc/1e9,stAngDegArray,numChan));hold on;    
    release(sV_ArrayULA_Chanel);
    release(sV_ArrayULA_Rep);
    drawnow
    
    linObj = findobj(gcf,'type','line');
    set(linObj(1),'Color','g','LineWidth',1)
    
%     delete(linObj(1)) 
    
    filename = 'testAnimated.gif'; % Specify the output file name
    frame = getframe(gcf);
    im{frameCnt} = frame2im(frame);

    [A,map] = rgb2ind(im{frameCnt},256);
    if frameCnt == 1
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',1);
    else
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',1);
    end
end






figure,
plot(rad2deg((phase(wArrayULA_Chanel))),'-ko');hold on;grid on
plot(rad2deg((phase(wArrayULA_Rep))),'-ro');hold on;grid on
plot(rad2deg((phase(wArrayULA_Chanel_Adj))),'-bo');hold on;grid on
legend('cahnnel','Rep','Rep Adj','Location','SouthEast')
xlabel('Antenna Element Number');ylabel('Excitation Coeff. Phase [deg]')
% figure,
% plot(rad2deg(unwrap(phase(wArrayULA_Chanel))),'-ko');hold on;grid on
% plot(rad2deg(unwrap(phase(wArrayULA_Rep))),'-ro');hold on;grid on
% plot(rad2deg(unwrap(phase(wArrayULA_Chanel_Adj))),'-bo');hold on;grid on
% legend('cahnnel','Rep','Rep Adj','Location','SouthEast')
% xlabel('Antenna Element Number');ylabel('Excitation Coeff. Phase [deg]')

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