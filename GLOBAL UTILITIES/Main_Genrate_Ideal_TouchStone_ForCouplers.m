clearvars;close all;clc
fStart  = 2.0e9; %Hz
fStop   = 2.6e9; %Hz
fStep   = 1e6;
%-- Quadrature(90 deg) Hybrid
% P1(Input)    --------------------------------------- P2(Output)
%                       |                |
%                       |                |
%                       |                |
% P4(Isolated) --------------------------------------- P3(Output)
S_QH90 = -1/sqrt(2)*[ ...
    0 1j 1 0
    1j 0 0 1
    1 0 0 1j
    0 1 1j 0];

%-- Rat-race hubrid 180 deg coupler
% P1(Input)    --------------------------------------- P2(Output)
%                       |                |
%                       |                |
%                       |                |
% P4(Isolated) --------------------------------------- P3(Output)
S_RRH180 = 1/sqrt(2)*[ ...
    0 1  1  0
    1 0  0 -1
    1 0  0  1
    0 -1 1  0 ];

vFreqHz = fStart:fStep:fStop;
numElem = numel(vFreqHz);
sParamDataQH90   = nan(4,4,numElem);
sParamDataRRH180 = nan(4,4,numElem);
for r = 1:4
    for c = 1:4
        sParamDataQH90(r,c,:)   = S_QH90(r,c)*ones(1,numElem);
        sParamDataRRH180(r,c,:) = S_RRH180(r,c)*ones(1,numElem);
    end
end
rfwrite(sParamDataQH90, vFreqHz,[pwd '\HybridCouplerQuadrature.s4p']);
rfwrite(sParamDataRRH180, vFreqHz,[pwd '\Rat-raceCoupler.s4p']);
