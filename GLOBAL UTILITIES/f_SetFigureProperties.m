function f_SetFigureProperties(fontSize,lineWidth)
% fontSize = 12;
hFigs = sort(findobj('Type','figure'));
for indFig = 1:length(hFigs)
    set(0, 'currentfigure', hFigs(indFig));
    set(gca,'FontSize',fontSize);
    h = findobj(gca, 'Type','line');
    set(h, 'LineWidth', lineWidth)%;, 'MarkerSize', 10);    
    all_axis = findall(gcf, 'Type', 'Axes');
    set(all_axis,'FontSize',fontSize, 'XGrid', 'on', 'YGrid', 'on');    
    all_text = findall(gcf, 'Type', 'Text');
    set(all_text, 'FontSize',fontSize);
end