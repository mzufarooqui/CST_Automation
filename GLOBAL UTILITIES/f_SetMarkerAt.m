function f_SetMarkerAt(limits,col,linWid)
L_LB = limits(1);
L_UB = limits(2);
hold on;h1 = plot([L_LB L_LB],ylim,col,'linewidth',linWid);
hold on;h2 = plot([L_UB L_UB],ylim,col,'linewidth',linWid);
set(get(get(h1,'Annotation'),'LegendInformation'),'IconDisplayStyle','off'); % Exclude line from legend
set(get(get(h2,'Annotation'),'LegendInformation'),'IconDisplayStyle','off'); % Exclude line from legend
end

