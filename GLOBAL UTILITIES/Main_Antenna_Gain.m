close all;clear all; clc
c0      = 299;
f0      = 3.25;
Area    = 4e3*2.5e3;
eff     = 0.65;
lambda0 = c0/f0;
gain    = 4*pi*Area*eff/lambda0^2;
gain_dBFormula = 10*log10(gain)
gain_dBMatlab  = aperture2gain(eff*Area,c0/f0)
%% 
c0      = 299;
f0      = 10;
gain_dB = 49.0;
eff     = 0.65;
lambda0 = c0/f0;
gain    = 10^(gain_dB/10);
area_mm2 = gain*lambda0^2/(4*pi*eff)
area_m2 = gain*lambda0^2/(4*pi*eff)/1e6

8.6940/4


Reflector_Depth = Diameter^2/(16*f)
%%
close all;clear all; clc
c0      = 299;
f0      = 2.3;
r_Dish  = 1.5e3;
Area    = pi*r_Dish^2;
eff     = 0.65;
lambda0 = c0/f0;
gain    = 4*pi*Area*eff/lambda0^2;
gain_dBFormula = 10*log10(gain)
gain_dBMatlab  = aperture2gain(eff*Area,c0/f0)
%% Ku Band: 12GHz-15GHz,  Ka Band: 15GHz-18GHz, K Band: 12GHz-18GHz
close all;clear all; clc
c0      = 299;
f0      = 15;
r_Dish  = 34e3/2;
Area    = pi*r_Dish^2;
eff     = 0.65;
lambda0 = c0/f0;
gain    = 4*pi*Area*eff/lambda0^2;
gain_dBFormula = 10*log10(gain)
gain_dBMatlab  = aperture2gain(eff*Area,c0/f0)
%%
close all;clear all; clc
c0      = 299;
f0      = 3.2;
Area    = 2e3*1.5e3;
eff     = 0.65;
lambda0 = c0/f0;
gain    = 4*pi*Area*eff/lambda0^2;
gain_dBFormula = 10*log10(gain)
gain_dBMatlab  = aperture2gain(eff*Area,c0/f0)
%%
close all;clear all; clc
c0      = 299;
f0      = 2.7;
Area    = 172*172*4*4;
eff     = 1.0;
lambda0 = c0/f0;
gain    = 4*pi*Area*eff/lambda0^2;
gain_dBFormula = 10*log10(gain)
gain_dBMatlab  = aperture2gain(eff*Area,c0/f0)
%% TTS Dish Gain
close all;clear all; clc
c0      = 299;
f0      = 2.3;
Dia     = 3048;
r       = Dia/2;
Area    = pi*r^2;
eff     = 0.55;
lambda0 = c0/f0;
gain    = 4*pi*Area*eff/lambda0^2;
gain_dBFormula = 10*log10(gain)
gain_dBMatlab  = aperture2gain(eff*Area,c0/f0)
%% RIR Dish Gain
close all;clear all; clc
c0      = 299;
f0      = 5.63;
Dia     = 3048;
r       = Dia/2;
Area    = pi*r^2;
eff     = 0.72;
lambda0 = c0/f0;
gain    = 4*pi*Area*eff/lambda0^2;
gain_dBFormula = 10*log10(gain)
gain_dBMatlab  = aperture2gain(eff*Area,c0/f0)
%%
close all;clear all; clc
c0      = 299;
f0      = 3.25;
Area    = 4e3*2.5e3;
eff     = 1;
lambda0 = c0/f0;
gain    = 4*pi*Area*eff/lambda0^2;
gain_dBFormula = 10*log10(gain)
gain_dBMatlab  = aperture2gain(eff*Area,c0/f0)
%% S-Band FHDR
close all;clear all; clc
c0      = 299;
f0      = 2.7;
% feetPerMeter = unitsratio('inch', 'mm')
Area    = 36*25.4*36*25.4;
eff     = 0.65;
lambda0 = c0/f0;
gain    = 4*pi*Area*eff/lambda0^2;
gain_dBFormula = 10*log10(gain)
gain_dBMatlab  = aperture2gain(eff*Area,c0/f0)

(16*0.65*299/2.7)/25.4
(16*0.65*299/2.7)/25.4
%% C-Band RIR
close all;clear all; clc
c0      = 299;
f0      = 5.63;
% feetPerMeter = unitsratio('inch', 'mm')
dishRad = 3000/2;
Area    = pi*dishRad^2;
eff     = 0.55;
lambda0 = c0/f0;
gain    = 4*pi*Area*eff/lambda0^2;
gain_dBFormula = 10*log10(gain)
gain_dBMatlab  = aperture2gain(eff*Area,c0/f0)
%%
%% C-Band by OS
close all;clear all; clc
c0      = 299;
f0      = 3;
% feetPerMeter = unitsratio('inch', 'mm')
cylinDia = 2*1e3;
cylinHe = 0.35*1e3;
Area    = cylinDia*cylinHe;
eff     = 0.6;
lambda0 = c0/f0;
gain    = 4*pi*Area*eff/lambda0^2;
gain_dBFormula = 10*log10(gain)
gain_dBMatlab  = aperture2gain(eff*Area,c0/f0)
