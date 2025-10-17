function f_SavePDF(pdfFileName)
matlabVersion = version;
if strcmp(matlabVersion,'8.6.0.267246 (R2015b)')
    hFigs = sort(findobj('Type','figure'),2);            
    totFigNum = size(findobj('Type','figure'),1);
    for indFig = 1:totFigNum
        figure(indFig)
        hFigure = gcf;
        set(hFigure.Number,'Units','Inches');
        pos = get(hFigure.Number,'Position');
        set(hFigure.Number,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        print(hFigure.Number,['Q_Band_OMT_' num2str(indFig) ],'-dpdf','-r0')
    end
    dos(['"C:\Program Files\gs\gs9.16\bin\gswin64c.exe" -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=' pdfFileName '.pdf ' sprintf('Q_Band_OMT_%d.pdf ',[1:totFigNum])]);
    dos(['del ' sprintf('Q_Band_OMT_%d.pdf ',[1:totFigNum])]);
else
    hFigs = sort(findobj('Type','figure'),2);
    for indFig = 1:length(hFigs)
        set(hFigs(indFig),'Units','Inches');
        pos = get(hFigs(indFig),'Position');
        set(hFigs(indFig),'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        print(hFigs(indFig),['Q_Band_OMT_' num2str(indFig) ],'-dpdf','-r0')
    end
    dos(['"C:\Program Files\gs\gs9.16\bin\gswin64c.exe" -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=' pdfFileName '.pdf -dBATCH ' sprintf('Q_Band_OMT_%d.pdf ',[1:length(hFigs)])]);
    dos(['del ' sprintf('Q_Band_OMT_%d.pdf ',[1:length(hFigs)])]);
end
end