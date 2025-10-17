function f_DrawLines(xPt,yPt,color,numSamples)
hold on;
%-- Draw 4 Boundary
plot([xPt(1) xPt(1)],yPt,'Color',color)
plot([xPt(2) xPt(2)],yPt,'Color',color)
plot(xPt,[yPt(1) yPt(1)],'Color',color)
plot(xPt,[yPt(2) yPt(2)],'Color',color)

xHatch = linspace(xPt(1),xPt(2),numSamples);
yHatch = linspace(yPt(1),yPt(2),numSamples);
%-- Draw slopy lines
for ind = 2:numel(xHatch)
    plot([xHatch(ind) xHatch(1)],[yHatch(1) yHatch(ind)],'Color',color);
    plot([xHatch(end) xHatch(ind)],[yHatch(ind) yHatch(end)],'Color',color);
end
hold off
end