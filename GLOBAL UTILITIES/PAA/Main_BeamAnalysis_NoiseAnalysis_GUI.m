close all;clear all;clc
inputParmStr = {
    'Velocity of light in free space in [m/sec]'
    'Frequency range for element pattern [Hz]'
    'Steering vector [deg]'
    'Center frequency [Hz]'
    'Antenna gain [dB]'
    'Antenna efficiency [%]'
    'Number of elements in Sub array'
    'Inter element spacing in lambda'
    'Bandwidth [Hz]'
    'RCS of the target [m^2]'
    'Transmit power [watt]'
    'SNR [dB]'
    'Noise figure [dB]'
    'Noise temperature [Kelvin]'
    'maximum range [meter]'
    };
hFig = figure;
set(hFig,'Units','Normalized','ToolBar','none','MenuBar','none','NumberTitle','off','Name','Phased Array Antenna Analysis Tool','Position',[0.3536    0.3908    0.4188    0.5233]);
hInPanel = uipanel('Title','Input Parameter','FontSize',12,'Units','Normalized','Position',[0.01 0.01 0.5-0.01 0.9]);
hOutPanel = uipanel('Title','Output Parameter','FontSize',12,'Units','Normalized','Position',[0.5+0.01 0.01 0.5-0.01 0.9]);
yPos = 20
for ind = 1:size(inputParmStr,1)
    hh = uicontrol('Parent',hInPanel,'Style','edit','String',inputParmStr{ind},'Position',[10 330-yPos 200 20],'Units','Normalized');
    yPos = yPos + 20;
end
% for ind = 1:size(inputParmStr,1)
%     uicontrol('Parent',hInPanel,'Style','text','String','Antenna Gain [dB]','Position',[10 330 100 20],'Units','Normalized');
%     yPos = yPos + 20;
% end
% hbsp = uicontrol('Parent',hInPanel,'Style','edit','String','0.0','Position',[10+100 330 100 20],'Units','Normalized');
% % txt = uicontrol('Style','text','Position',[0 0],'String','Vertical Exaggeration','Units','Normalized');





