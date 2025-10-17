function [thetaDeg_AtPhi_0Deg,gain_dB_AtPhi_0Deg,thetaDeg_AtPhi_90Deg,gain_dB_AtPhi_90Deg,thetaDeg,phiDeg,E_Theta,E_Phi,directivity,gain,directivity_dB,gain_dB] = f_ReadProj_fff(adsWorkspacePath,libName,cellName)
% close all;clear all;clc
% fileName_proj_fff = 'E:\WORK\COUPLER\proj.fff';
% fileName_proj_ant = 'E:\WORK\COUPLER\proj.ant';
%-- Read proj.fff
cnt = 1;
fileNameProj_fff = [adsWorkspacePath '\simulation\' libName '\' cellName '\layout\emSetup_MoM\proj.fff'];
% fid = fopen([ adsWorkspacePath '\simulation\Single_patch_lib\Single_patch\layout\emSetup_MoM\proj.fff'],'r');
fid = fopen(fileNameProj_fff,'r');
strLine = fgetl(fid);
while strLine ~= -1
    if(strfind(strLine,'#Frequency'))
        freqGHz = cell2mat(textscan(strLine,'#Frequency %f GHz'));
    elseif(strfind(strLine,'#Excitation'))
        portNum = cell2mat(textscan(strLine,'#Excitation # %d'));
    elseif(strfind(strLine,'#Begin cut'))
        strLine = fgetl(fid);
        while ~(strcmp(strLine,'#End cut'))
            farfieldData    = cell2mat(textscan(strLine,'%f %f %f %f %f %f'));
            thetaDeg(cnt,1) = farfieldData(1);
            phiDeg(cnt,1)   = farfieldData(2);
            normE_Theta(cnt,1)  = farfieldData(3)+1j*farfieldData(4);
            normE_Phi(cnt,1)    = farfieldData(5)+1j*farfieldData(6);
            cnt = cnt + 1;
            strLine = fgetl(fid);
        end
        strLine = fgetl(fid); % skip empty line after #End cut
    end
    strLine = fgetl(fid);
end
fclose(fid);

%-- Read Proj.ant file
fileNameProj_ant = [adsWorkspacePath '\simulation\' libName '\' cellName '\layout\emSetup_MoM\proj.ant'];
fid = fopen(fileNameProj_ant,'r');
for ind =1:5, fgetl(fid); end % SKIP 5 lines

strLine = fgetl(fid);
portNumAnt = cell2mat(textscan(strLine,'Excitation %d'));

strLine = fgetl(fid);
freqGHzAnt = cell2mat(textscan(strLine,'Frequency %f GHz'));

for ind =1:2, fgetl(fid); end % SKIP 2 lines

strLine = fgetl(fid);
maxVal = cell2mat(textscan(strLine,'E_theta_max %f ; E_phi_max %f'));
E_ThetaMax = maxVal(1);
E_PhiMax   = maxVal(2);
normE = sqrt(E_ThetaMax^2+E_PhiMax^2);

for ind =1:5, fgetl(fid); end % SKIP 5 lines

strLine = fgetl(fid);
powerVal = cell2mat(textscan(strLine,'Power radiated %f %f'));
radPower = powerVal(2);

for ind =1:1, fgetl(fid); end % SKIP 1 lines

strLine = fgetl(fid);
maxDirectivity_dB = cell2mat(textscan(strLine,'Directivity %f dB'));

strLine = fgetl(fid);
maxGain_dB = cell2mat(textscan(strLine,'Gain %f dB'));

maxRadEff_dB   = maxGain_dB-maxDirectivity_dB;
maxRadEff      = 10^(maxRadEff_dB/10);
injPower    = radPower/maxRadEff;

fclose(fid);
mu0     = 4*pi*1e-7;          % permeability of free space in N/A^2
eps0    = 8.854187817e-12;    % permittivity of free spaced in Farad per meter(F. m?1)
Z_Omega = sqrt( mu0 / eps0 ); % impedance of free space

E_Theta = normE_Theta .* normE;
E_Phi   = normE_Phi   .* normE;

radIntensity = ((abs(E_Theta)).^2 + (abs(E_Phi)).^2)/(2*Z_Omega);
directivity = 4 * pi * radIntensity / radPower;
gain        = 4 * pi * radIntensity / injPower;

directivity_dB = 10*log10(abs(directivity));
gain_dB        = 10*log10(abs(gain));

phiCutAt = 0;
thetaDeg_AtPhi_0Deg = [-flipud(thetaDeg(phiDeg == phiCutAt+180)); (thetaDeg(phiDeg == phiCutAt))];
gain_dB_AtPhi_0Deg  = [ flipud(gain_dB(phiDeg == phiCutAt+180));  (gain_dB(phiDeg == phiCutAt)) ];

phiCutAt = 90;
thetaDeg_AtPhi_90Deg = [-flipud(thetaDeg(phiDeg == phiCutAt+180)); (thetaDeg(phiDeg == phiCutAt))];
gain_dB_AtPhi_90Deg  = [ flipud(gain_dB(phiDeg == phiCutAt+180));  (gain_dB(phiDeg == phiCutAt)) ];
DEBUG = 0;
if DEBUG
    %--
    figure,
    xCoord = [-flipud(thetaDeg(phiDeg == 0+180)); (thetaDeg(phiDeg == 0))];
    yCoord = [flipud(gain_dB(phiDeg == 0+180));   (gain_dB(phiDeg == 0)) ];
    
    plot(xCoord,yCoord,'-b');grid on;hold on;
    
    guiData = load('E:\WORK\COUPLER\test22.txt');
    plot(guiData(:,1),guiData(:,2),'--r');
    legend('cmd','GUI');
    
    %--
    figure,
    xCoord = [-flipud(thetaDeg(phiDeg == 90+180)); (thetaDeg(phiDeg == 90))];
    yCoord = [flipud(gain_dB(phiDeg == 90+180));   (gain_dB(phiDeg == 90)) ];
    
    plot(xCoord,yCoord,'-b');grid on;hold on;
    
    guiData = load('E:\WORK\COUPLER\test222.txt');
    plot(guiData(:,1),guiData(:,2),'--r');
    legend('cmd','GUI');
end
end