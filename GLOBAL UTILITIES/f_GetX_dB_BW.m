function [maxG_Val,X_dBBeamWidth,maxG_At_Theta] = f_GetX_dB_BW(thetaDegAtPhi,absGain_dB_AtPhi,refX_dBVal)

[maxGain_dB,maxInd] = max(absGain_dB_AtPhi);
%-- RHS
trunc_RHS_thetaDeg     = thetaDegAtPhi(maxInd:end);
trunc_RHS_absGain_dB   = absGain_dB_AtPhi(maxInd:end);
reqInd1                = find( trunc_RHS_absGain_dB <= maxGain_dB+refX_dBVal );
% X_dB_RHS_BeamWidth     = trunc_RHS_thetaDeg(reqInd1(1));

intAbsGain_dB            = linspace(trunc_RHS_absGain_dB(reqInd1(1)),trunc_RHS_absGain_dB(reqInd1(1)-1),10000);
intThetaDeg              = linspace(trunc_RHS_thetaDeg(reqInd1(1)),trunc_RHS_thetaDeg(reqInd1(1)-1),10000);
refGain_dB_RoundVal      = (round((maxGain_dB+refX_dBVal)*1000))/1000;
intGain_dB_RoundVal      = (round((intAbsGain_dB)*1000))/1000;
intThetaDeg_RoundVal     = (round((intThetaDeg)*1000))/1000;
x_dB_GainInd             = find(intGain_dB_RoundVal == refGain_dB_RoundVal);
X_dB_RHS_BeamWidth    = intThetaDeg_RoundVal(x_dB_GainInd(1));


%-- LHS
trunc_LHS_thetaDeg     = thetaDegAtPhi(1:maxInd);
trunc_LHS_absGain_dB   = absGain_dB_AtPhi(1:maxInd);
reqInd2                = find( trunc_LHS_absGain_dB >= maxGain_dB+refX_dBVal );
% X_dB_LHS_BeamWidth     = trunc_LHS_thetaDeg(reqInd2(1));

intAbsGain_dB            = linspace(trunc_LHS_absGain_dB(reqInd2(1)),trunc_LHS_absGain_dB(reqInd2(1)-1),10000);
intThetaDeg              = linspace(trunc_LHS_thetaDeg(reqInd2(1)),trunc_LHS_thetaDeg(reqInd2(1)-1),10000);
refGain_dB_RoundVal      = (round((maxGain_dB+refX_dBVal)*1000))/1000;
intGain_dB_RoundVal      = (round((intAbsGain_dB)*1000))/1000;
intThetaDeg_RoundVal     = (round((intThetaDeg)*1000))/1000;
x_dB_GainInd             = find(intGain_dB_RoundVal == refGain_dB_RoundVal);
X_dB_LHS_BeamWidth    = intThetaDeg_RoundVal(x_dB_GainInd(1));

X_dBBeamWidth          = abs(X_dB_LHS_BeamWidth) + abs(X_dB_RHS_BeamWidth);

[maxG_Val,maxGValInd] = max(absGain_dB_AtPhi);
maxG_At_Theta = thetaDegAtPhi(maxGValInd);
end






% 
% figure,plot(thetaDegAtPhi,absGain_dB_AtPhi,'-r');grid on;hold on;
% plot(trunc_RHS_thetaDeg,trunc_RHS_absGain_dB,'--k')
% plot(trunc_LHS_thetaDeg,trunc_LHS_absGain_dB,'--b')
%-- OLD
% function [maxG_Val,X_dBBeamWidth,maxG_At_Theta] = f_GetX_dB_BW(thetaDegAtPhi,absGain_dB_AtPhi,refX_dBVal)
% trunc_absDir_dB     = absGain_dB_AtPhi(find(thetaDegAtPhi == 0):end);
% trunc_thetaDeg      = thetaDegAtPhi(find(thetaDegAtPhi == 0):end);
% [maxGain_dB,maxInd] = max(trunc_absDir_dB);
% trunc_absDir_dB1    = trunc_absDir_dB(maxInd:end);
% trunc_thetaDeg1     = trunc_thetaDeg(maxInd:end);
% reqInd              =         find( trunc_absDir_dB1 <= maxGain_dB+refX_dBVal );
% X_dBBeamWidth       = trunc_thetaDeg1(reqInd(1));
% [maxG_Val,maxGValInd] = max(absGain_dB_AtPhi);
% maxG_At_Theta = thetaDegAtPhi(maxGValInd);
%
% end
%--

% -- OLD
% function [maxG_Val,three_dB_G_AngWidth,ten_dB_G_AngWidth] = f_GetX_dB_BW(thetaDegAtPhi,absGain_dB_AtPhi,bSum)
% if bSum
%     % For Sum
%     thetaDegAtPhi_0ThetaTrunc    = thetaDegAtPhi;
%     absGain_dB_AtPhi_0ThetaTrunc = absGain_dB_AtPhi;
% else
%     % For Delta
%     thetaDegAtPhi_0ThetaTrunc    = thetaDegAtPhi(181:end);
%     absGain_dB_AtPhi_0ThetaTrunc = absGain_dB_AtPhi(181:end);
% end
%
%
%
% [maxG_Val maxG_Ind ] = max(absGain_dB_AtPhi_0ThetaTrunc);
% three_dB_BW_G_Val    = maxG_Val-3;
% ten_dB_BW_G_Val      = maxG_Val-10;
% x = absGain_dB_AtPhi_0ThetaTrunc(maxG_Ind:end);
% y = thetaDegAtPhi_0ThetaTrunc(maxG_Ind:end);
% %-- define parameter t
% t = [0; cumsum(diff(x).^2+diff(y).^2)];  %t = [0; cumsum(diff(x).^2+diff(y).^2)];
% ti = linspace(0,t(end),1000000);
% xi = spline(t,x,ti);
% yi = spline(t,y,ti);
%
% xInd = find(round(xi*100)/100==round(three_dB_BW_G_Val*100)/100);
% three_dB_G_AngWidth = yi(xInd(1));
%
% xInd = find(round(xi*100)/100==round(ten_dB_BW_G_Val*100)/100);
% ten_dB_G_AngWidth = yi(xInd(1));
%
% end