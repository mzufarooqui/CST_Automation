function status = f_CreateMWS_Template(oMWS,MWS_TemplateName)
% Available Template
%
% Antenna (Horn, Waveguide)^+MWS
% Antenna (Mobile Phone)^+MWS
% Antenna (Planar)^+MWS
% Antenna (Wire)^+MWS
% Antenna Array Unit Cell (FD)^+MWS
% Connector (Coaxial)^+MWS
% Connector (Multipin)^+MWS
% Coupler (Planar, Microstrip, cpw)^+MWS
% Coupler (Waveguide)^+MWS
% EDA^+MWS
% Eigenmode^+PS
% Electrostatics^+EMS
% Electrostatics^+PS
% EMC-EMI Problem^+MWS
% Filter (Planar, Microstrip, cpw)^+MWS
% Filter (Waveguide)^+MWS
% FSS - Unit Cell (FD)^+MWS
% IC Package^+MWS
% Low Frequency^+EMS
% LTCC^+MWS
% Magnetostatics^+EMS
% Magnetostatics^+PS
% Mechanical Application^+MPS
% Particle Tracking^+PS
% PIC (Particle In Cell)^+PS
% RCS - Large objects (I-solver)^+MWS
% RCS - Small objects^+MWS
% Resonator^+MWS
% RFID^+MWS
% Stationary Currents^+EMS
% Thermal Application^+MPS
% Thermal Co-Simulation^+MPS
% Thermal Co-Simulation^+MWS+EMS+PS
% Wakefield^+PS
% EXAMPLE:
% status = f_CreateMWS_Template(oMWS,MWS_TemplateName)
% status = f_CreateMWS_Template(oMWS,'Coupler (Waveguide)^+MWS')

fileName = [MWS_TemplateName '.tpl'];
historyStr = readProjectTemplate(fileName);
historyHeader = [ 'use template: ' strtok(fileName,'^')];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
function historyStr = readProjectTemplate(fileName)
fid = fopen(fileName,'r');
historyStr = [];
line       = fgets(fid);
while line ~= -1
    historyStr = sprintf('%s%s',historyStr,line(1:end-1));
    line = fgets(fid);
end
fclose(fid);
end