% DESCRIPTION: Demostration of bessel function
% it compute the bessel function from 0 to range i.e. 100
% m: Expand bessel function around m
% n: nth zero of the bessel function
clear all;close all;clc;
pColor = {'r','g','b'};
besselRange = 100;
x = [-besselRange:0.001:besselRange];
figure;
for ind = 0:2
    y  = besselj(ind,x);
    legendStr{ind+1} = sprintf('J_%d(x)',ind);
    plot(x,y,pColor{ind+1});hold on;legend(legendStr);drawnow;grid on;
end


% clear all
m = 1; n = [1:3];
h_besselj = @(x)besselj(m,x);
for ind = 1:besselRange    
    besselFunc(ind) = fzero(h_besselj,[(ind-1) ind]*pi);
end
besselFunc(n)

plot(besselFunc,zeros(size(besselFunc)),'x')
