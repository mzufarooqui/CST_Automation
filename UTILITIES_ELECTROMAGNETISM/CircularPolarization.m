close all;clear all;clc;
polarization = 'RHCP'; % Options 1 - 'RHCP', 2 - 'LHCP'
T    = 2*pi;
w    = 2 * pi /T;
t    = linspace(0,2*T,101);

figure;
for ind = 1:length(t)
    pause(0.10);cla,    
    Ex =  1/sqrt(2) * cos( w * t(ind) );
    if strcmp(polarization,'RHCP')
        Ey =  1/sqrt(2) * sin( w * t(ind) );
    elseif strcmp(polarization,'LHCP')
        Ey =  -1/sqrt(2) * sin( w * t(ind) );
    end
    r = norm([Ex Ey]);
    plot(r*cos(w*t),r*sin(w*t),'k','LineWidth',1.5)
    hold on
    plot([0 Ex],[0 Ey],'b');
    axis equal
end




