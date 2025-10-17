close all;clear all;clc;
% complex number is a representation of a time harmonic signal
% f(t): time harmonic signal
% F   : complex number
% F --> f(t): f(t) = Re( F exp(1j w t) )
% f(t) --> F: F    = f(0) - 1j f(pi/2 w) = f1 - 1j f2
a = 1/sqrt(2);
b = 1/sqrt(2);
F    = a + 1j * b;
freq = 20; % 2 Hz
w    = 2 * pi * freq;
T    = 2 * pi/w;
t    = linspace(0,2*T,101);
f_t  = real( F .* exp(1j * w * t) );
figure;
hold on
% view([8 38])
for ind = 1:length(f_t)
    Ex1 = f_t(ind) * cos(w*t(ind));
    Ey1 = f_t(ind) * sin(w*t(ind));
    
    Ex = 1/sqrt(2) * cos(w*t(ind));
    Ey = 1/sqrt(2) * sin(w*t(ind));
    Ex-Ex1
    Ey-Ey1
    
%     Ex=1/sqrt(2)*cos(w*t(ind));
%     Ey=-1/sqrt(2)*sin(w*t(ind));
%     Ex=1/sqrt(2)*cos(w*t(ind));
%     Ey=1/sqrt(2)*sin(w*t(ind));

%    Ex=cos(w*t(ind));
%     Ey=0;
%     Ex=0;
%     Ey=sin(w*t(ind));
%     plot([0 Ex],[0 Ey]); grid on;
%   plot3(t(ind),[Ex],[Ey],'b.'); grid on;
    plot([0 Ex],[0 Ey],'b');

    xlim([-1 1]);
    ylim([-1 1]);
%     axis equal
    pause(0.25);cla,
end

% xlabel('t'); ylabel('f(t)');
