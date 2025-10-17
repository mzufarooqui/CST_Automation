function f_PlotPolarizerScatMat(scatMat,VfreqSpecAnal)



s11Vpol      = scatMat.s11Vpol;
s21Vpol      = scatMat.s21Vpol;
s11Hpol      = scatMat.s11Hpol;
s21Hpol      = scatMat.s21Hpol;
freq         = scatMat.Vfreq;
CrossCoRatio = scatMat.CrossCoRatio;  
Isol         = scatMat.Isol;          
axialRatio   = ( 1 + CrossCoRatio ) ./ ( 1 - CrossCoRatio );

figure;
set(gcf,'Units','Normalized','Position',[0 0 1 1]);
subplot(2,3,[ 2 3])
plot(...
    freq,db(s11Vpol),'r-',...
    freq,db(s11Hpol),'m-',...
    freq,db(CrossCoRatio),'k-',...
    freq,db(Isol),'g-'...
    );grid on;

xlabel('f [GHz]');ylabel('[shapedWg01] magnitude [dB]');
legend('s11Vpol','s11Hpol','CrossCoRatio','Isol','Location','Best');hold on;
f_SetMarkerAt(VfreqSpecAnal,'--r',2);

subplot(2,3,1)
plot(freq,db(s21Vpol),'b-',...
    freq,db(s21Hpol),'c-');grid on;
xlabel('f [GHz]');ylabel('[shapedWg01] magnitude [dB]');axis tight;
legend('s21Vpol','s21Hpol','Location','Best');hold on;
f_SetMarkerAt(VfreqSpecAnal,'--r',2);

subplot(2,3,[5 6])
plot(freq,angle(s21Vpol./s21Hpol)*180/pi,'b-');grid on
xlabel('f [GHz]');ylabel('phase [deg]');axis tight;hold on;
f_SetMarkerAt(VfreqSpecAnal,'--r',2);
axis([freq(1) freq(end) -Inf Inf])

subplot(2,3,4)
plot(freq,db(axialRatio),'b-');grid on
xlabel('f [GHz]');ylabel('Axial Ratio [dB]');axis tight;hold on;
f_SetMarkerAt(VfreqSpecAnal,'--r',2);
% axis([freq(1) freq(end) -Inf Inf])
drawnow




end