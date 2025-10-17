function f_PlotSEMRes(VfreqSpecAnal,OptimizationOption,x,varargin)
SAVE_FIGURES = 0;
global s11Vpol s21Vpol s22Vpol s11Hpol s21Hpol s22Hpol CrossCoRatio Isol axialRatio
global SimmetryOption numOfStub
global Vfreq
global OPT_LEN
I             = find( Vfreq >= VfreqSpecAnal(1) & Vfreq <= VfreqSpecAnal(end));
maxCostFunc   = 0;
if nargin > 3
    FS11Vpol      = varargin{:,1};
    FS11Hpol      = varargin{:,2};
    FIsol         = varargin{:,3};
    FCrossCoRatio = varargin{:,4};
    maxCostFunc   = varargin{:,5};
end
if OptimizationOption == 1
    subplot(2,3,[1 4]),cla
    plot(...
        Vfreq,db(s11Vpol),'r-',...
        Vfreq,db(s11Hpol),'m-',...
        Vfreq,db(CrossCoRatio),'k-',...
        Vfreq,db(Isol),'g-'...
        );grid on;
    
    xlabel('f [GHz]');ylabel('[shapedWg01] magnitude [dB]');axis tight;
    %      ylim([-40 -30]);     %     xlim([39 49]);
    legend('s11Vpol','s11Hpol','CrossCoRatio','Isol','Location','Best');
    f_SetMarkerAt(VfreqSpecAnal,'--r',2);
    
    subplot(2,3,2),cla
    plot(Vfreq,db(s21Vpol),'b-',...
        Vfreq,db(s21Hpol),'c-');grid on;
    xlabel('f [GHz]');ylabel('[shapedWg01] magnitude [dB]');axis tight;
    %     xlim([39 49]);ylim([-50 -25]);
    legend('s21Vpol','s21Hpol','Location','Best');
    f_SetMarkerAt(VfreqSpecAnal,'--r',2);
    
    
    subplot(2,3,3),cla
    plot( Vfreq(I),FS11Vpol,'r-',...
        Vfreq(I),FS11Hpol,'m-',...
        Vfreq(I),FCrossCoRatio,'.k',...
        Vfreq(I),FIsol,'g-');grid on;
    xlabel('f [GHz]');ylabel('Cost Function');axis tight;
    legend('FS11Vpol','FS11Hpol','FCrossCoRatio','FIsol','Location','Best');
    f_SetMarkerAt(VfreqSpecAnal,'--r',2);
    
    
    subplot(2,3,5),cla
    plot(Vfreq,angle(s21Vpol./s21Hpol)*180/pi,'b-');grid on
    xlabel('f [GHz]');ylabel('phase [deg]');axis tight;
    f_SetMarkerAt(VfreqSpecAnal,'--r',2);
    axis([Vfreq(1) Vfreq(end) -Inf Inf])
    
    subplot(2,3,6),cla
    plot(Vfreq,db(axialRatio),'b-');grid on
    xlabel('f [GHz]');ylabel('Axial Ratio [dB]');axis tight;
    f_SetMarkerAt(VfreqSpecAnal,'--r',2);
    axis([Vfreq(1) Vfreq(end) -Inf Inf])
    drawnow
    left = 0.13; bottom = 0.93; width = 0.50; height = 0.02;
    displayStr = sprintf(' x = [ ');
    displayStr = [ displayStr sprintf(' %0.3f ',x) sprintf(']; maxCostFunc: %0.3f ',maxCostFunc)];
    hTextBox = uicontrol(gcf,'Style','edit','Units','Normalized','FontUnits','Normalized','String',displayStr,'Position',[left bottom width height],'Background',[1 1 1]);
else
    subplot(2,3,[ 2 3]),cla
    plot(...
        Vfreq,db(s11Vpol),'r-',...
        Vfreq,db(s11Hpol),'m-',...
        Vfreq,db(CrossCoRatio),'k-',...
        Vfreq,db(Isol),'g-'...
        );grid on;
    
    xlabel('f [GHz]');ylabel('[shapedWg01] magnitude [dB]');axis tight;
    %      ylim([-40 -30]);     %     xlim([39 49]);
    legend('s11Vpol','s11Hpol','CrossCoRatio','Isol','Location','Best');
    f_SetMarkerAt(VfreqSpecAnal,'--r',2);
    
    subplot(2,3,1),cla
    plot(Vfreq,db(s21Vpol),'b-',...
        Vfreq,db(s21Hpol),'c-');grid on;
    xlabel('f [GHz]');ylabel('[shapedWg01] magnitude [dB]');axis tight;
    %     xlim([39 49]);ylim([-50 -25]);
    legend('s21Vpol','s21Hpol','Location','Best');
    f_SetMarkerAt(VfreqSpecAnal,'--r',2);
    
    
    %     subplot(2,3,3),cla
    %     plot( Vfreq(I),FS11Vpol,'r-',...
    %         Vfreq(I),FS11Hpol,'m-',...
    %         Vfreq(I),FCrossCoRatio,'.k',...
    %         Vfreq(I),FIsol,'g-');grid on;
    %     xlabel('f [GHz]');ylabel('Cost Function');axis tight;
    %     legend('FS11Vpol','FS11Hpol','FCrossCoRatio','FIsol','Location','Best');
    %     f_SetMarkerAt(VfreqSpecAnal,'--r',2);
    
    
    subplot(2,3,[5 6]),cla
    plot(Vfreq,angle(s21Vpol./s21Hpol)*180/pi,'b-');grid on
    xlabel('f [GHz]');ylabel('phase [deg]');axis tight;
    f_SetMarkerAt(VfreqSpecAnal,'--r',2);
    axis([Vfreq(1) Vfreq(end) -Inf Inf])
    
    subplot(2,3,4),cla
    plot(Vfreq,db(axialRatio),'b-');grid on
    xlabel('f [GHz]');ylabel('Axial Ratio [dB]');axis tight;
    f_SetMarkerAt(VfreqSpecAnal,'--r',2);
    axis([Vfreq(1) Vfreq(end) -Inf Inf])
    drawnow
    
    if 0
        subplot(1,3,1)
        plot(...
            Vfreq,db(s11Vpol),'r-',...
            Vfreq,db(s11Hpol),'m-',...
            Vfreq,db(CrossCoRatio),'k-',...
            Vfreq,db(Isol),'g-'...
            );grid on;
        
        xlabel('f [GHz]');ylabel('[shapedWg01] magnitude [dB]');axis tight;
        %      ylim([-40 -30]);     %     xlim([39 49]);
        legend('s11Vpol','s11Hpol','CrossCoRatio','Isol','Location','Best');
        f_SetMarkerAt(VfreqSpecAnal,'--r',2);
        
        subplot(1,3,2)
        plot(Vfreq,db(s21Vpol),'b-',...
            Vfreq,db(s21Hpol),'c-');grid on;
        xlabel('f [GHz]');ylabel('[shapedWg01] magnitude [dB]');axis tight;
        %     xlim([39 49]);ylim([-50 -25]);
        legend('s21Vpol','s21Hpol','Location','Best');
        f_SetMarkerAt(VfreqSpecAnal,'--r',2);
        
        subplot(1,3,3)
        plot(Vfreq,angle(s21Vpol./s21Hpol)*180/pi,'b-');grid on
        xlabel('f [GHz]');ylabel('phase [deg]');axis tight;
        f_SetMarkerAt(VfreqSpecAnal,'--r',2);
        axis([Vfreq(1) Vfreq(end) -Inf Inf])
        drawnow
    end
    
    fileName = [pwd '\AnalysisRes_OptLen_' num2str(OPT_LEN) '_SymOpt_' num2str(SimmetryOption) '_NumStub_' num2str(numOfStub) '_' dataTimeString() ];
    hEdit = findobj(gcf,'Style','edit');
    set(hEdit,'Visible','off')
    set(gcf,'ToolBar','figure')
    if SAVE_FIGURES
        saveas(gcf,fileName,'fig')
        saveas(gcf,fileName,'png')
        saveas(gcf,fileName,'pdf')
    end
end

drawnow


end