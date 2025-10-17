close all;clear all;clc
N = 32;
amp = ones(N,1);
thetaDeg = deg2rad(zeros(N,1));
w = amp .* exp(1j*thetaDeg);
%w = ones(N,1);
W = fft(w,N);
figure,plot((W/N),'o');grid on;ylabel('FFT(w)')
figure,spectrogram(w);


% 
% 
% w(1:2:end) = 0;
% [xCoorW,lag] = xcorr(w,w)
% figure,plot(lag,xCoorW)



Fs = 100;           % Sampling frequency
t = -0.5:1/Fs:0.5;  % Time vector 
L = length(t);      % Signal length

X = 1/(4*sqrt(2*pi*0.01))*(exp(-t.^2/(2*0.01)));
% Plot the pulse in the time domain.
figure
plot(t,X)
title('Gaussian Pulse in Time Domain')
xlabel('Time (t)')
ylabel('X(t)')
n = 2^nextpow2(L);
% Convert the Gaussian pulse to the frequency domain.

Y = fft(X,n);
% Define the frequency domain and plot the unique frequencies.

f = Fs*(0:(n/2))/n;
P = abs(Y/n);
figure
plot(f,P(1:n/2+1)) 
title('Gaussian Pulse in Frequency Domain')
xlabel('Frequency (f)')
ylabel('|P(f)|')