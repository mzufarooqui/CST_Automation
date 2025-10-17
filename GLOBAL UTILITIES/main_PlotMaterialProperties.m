% close all;clear all;clc;
SAVE_IN_PPT = 0;

fileName = 'E:\CNR\G Virone\Vivaldi\Vivaldi WS\Vivaldi_3_1\CompPostPros_Different_Model\mL=30,INOX_07-ss-p\Materials\Concrete (one year old).txt';
[freq_p_dataList eps_p_dataList freq_pp_dataList eps_pp_dataList freq_p_fit eps_p_fit freq_pp_fit eps_pp_fit] = f_ReadCST_MaterialProperties(fileName);
figure,
plot(freq_p_dataList,eps_p_dataList,'b-o');hold on;
plot(freq_pp_dataList,eps_pp_dataList,'r-o');hold on;grid on;
plot(freq_p_fit,eps_p_fit,'k');hold on;
plot(freq_pp_fit,eps_pp_fit,'g');hold on;grid on;
xlabel('frequency [GHz]');
legend('Eps^''(Data List)','Eps''''(Data List)','Eps^''(Fit)','Eps''''(Fit)','Location','Best');
title({'Concrete (one year old)','Electric Dispersion: 1st Order Model(Fit)'})

fileName = 'E:\CNR\G Virone\Vivaldi\Vivaldi WS\Vivaldi_3_1\CompPostPros_Different_Model\mL=30,INOX_07-ss-p\Materials\Teflon (PTFE) (lossy).txt';
[freq_p_dataList eps_p_dataList freq_pp_dataList eps_pp_dataList freq_p_fit eps_p_fit freq_pp_fit eps_pp_fit] = f_ReadCST_MaterialProperties(fileName);
figure,
% plot(freq_p_dataList,eps_p_dataList,'b-o');hold on;
% plot(freq_pp_dataList,eps_pp_dataList,'r-o');hold on;grid on;
plot(freq_p_fit,eps_p_fit,'k','LineWidth',2);hold on;
plot(freq_pp_fit,eps_pp_fit,'g','LineWidth',2);hold on;grid on;
xlabel('frequency [GHz]');
%legend('Eps^''(Data List)','Eps''''(Data List)','Eps^''(Fit)','Eps''''(Fit)','Location','Best');
legend('Eps^''(Fit)','Eps''''(Fit)','Location','Best');
title({'Teflon (PTFE) (lossy)','Nth Order Model, N = 1'})


fileName = 'E:\CNR\G Virone\Vivaldi\Vivaldi WS\Vivaldi_3_1\Vivaldi_3_1_Soil_One_Port_DP\Vivaldi3p1_connessa_sald_tile_With_Soil_Sim\concrete-tile, soil, DP1\Materials\soilC.txt';
[freq_p_dataList eps_p_dataList freq_pp_dataList eps_pp_dataList freq_p_fit eps_p_fit freq_pp_fit eps_pp_fit] = f_ReadCST_MaterialProperties(fileName);
figure,
plot(freq_p_dataList,eps_p_dataList,'b-o');hold on;
plot(freq_pp_dataList,eps_pp_dataList,'r-o');hold on;grid on;
plot(freq_p_fit,eps_p_fit,'k');hold on;
plot(freq_pp_fit,eps_pp_fit,'g');hold on;grid on;
xlabel('frequency [GHz]');
legend('Eps^''(Data List)','Eps''''(Data List)','Eps^''(Fit)','Eps''''(Fit)','Location','Best');
title({'SoilC','Electric Dispersion: Nth Order Model, N=3(Fit)'})

if SAVE_IN_PPT
    f_SetFigureProperties(fontSize,lineWidth)
    hFigs = sort(findobj('Type','figure'));
    for indFig = 1:length(hFigs)
        set(0, 'currentfigure', hFigs(indFig));
        f_SavePPT(pptFileName);
    end
end
SAVE_IN_PDF = 1;
if SAVE_IN_PDF
    hFigs = sort(findobj('Type','figure'));
    for indFig = 1:length(hFigs)
        set(hFigs(indFig),'Units','Inches');
        pos = get(hFigs(indFig),'Position');
        set(hFigs(indFig),'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        print(hFigs(indFig),['VivaldiCom-' num2str(indFig+5) ],'-dpdf','-r0')
    end
end