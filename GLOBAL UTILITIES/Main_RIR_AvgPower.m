close all;clear all;clc
pulsePeriod  = 1.7e-3;
Ton          = 1e-6;
peakPower    = 1e6;
PRF          = 1/pulsePeriod;
dutyCyle     = Ton * PRF;
avgPwr       = dutyCyle * peakPower;
fprintf(1,'Average Power(watt): %.1f',avgPwr);
fprintf(1,'\n');