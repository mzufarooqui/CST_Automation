function status = f_RotateProfile(oMWS,component,name,material,mode,startAngle,angle,height,radiusRatio,nSteps,origin,rVector,zVector,pointList)
% Example
%status = f_RotateProfile(oMWS,'component1','solid1','Vacuum','Pointlist',45,275,0.0,1.0,0,[0 0 0],[0 1 0],[1 0 0],[0 4;4 4;4 2;0 2])
%some flag are set to default
bSplitClosedEdges             = 'True';
bSegmentedProfile             = 'False';
bSimplifySolid                = 'True';
bUseAdvancedSegmentedRotation = 'True';
historyStr = [];
historyStr = sprintf('With Rotate');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,name);
historyStr = sprintf('%s\n\t.Component "%s"',historyStr,component);
historyStr = sprintf('%s\n\t.Material "%s"',historyStr,material);
historyStr = sprintf('%s\n\t.Mode "%s"',historyStr,mode);
historyStr = sprintf('%s\n\t.StartAngle "%s"',historyStr,num2str(startAngle));
historyStr = sprintf('%s\n\t.Angle "%s"',historyStr,num2str(angle));
historyStr = sprintf('%s\n\t.Height "%s"',historyStr,num2str(height));
historyStr = sprintf('%s\n\t.RadiusRatio "%s"',historyStr,num2str(radiusRatio));
historyStr = sprintf('%s\n\t.NSteps "%s"',historyStr,num2str(nSteps));
historyStr = sprintf('%s\n\t.SplitClosedEdges "%s"',historyStr,bSplitClosedEdges);
historyStr = sprintf('%s\n\t.SegmentedProfile "%s"',historyStr,bSegmentedProfile);
historyStr = sprintf('%s\n\t.SimplifySolid "%s"',historyStr,bSimplifySolid);
historyStr = sprintf('%s\n\t.UseAdvancedSegmentedRotation "%s"',historyStr,bUseAdvancedSegmentedRotation);
historyStr = sprintf('%s\n\t.Origin "%s", "%s", "%s"',historyStr,num2str(origin(1)),num2str(origin(2)),num2str(origin(3)));
historyStr = sprintf('%s\n\t.Rvector "%s", "%s", "%s"',historyStr,num2str(rVector(1)),num2str(rVector(2)),num2str(rVector(3)));
historyStr = sprintf('%s\n\t.Zvector "%s", "%s", "%s"',historyStr,num2str(zVector(1)),num2str(zVector(2)),num2str(zVector(3)));
historyStr = sprintf('%s\n\t.Point "%s", "%s"',historyStr,pointList{1,1},pointList{1,2});
for ind = 2:size(pointList,1)
    historyStr = sprintf('%s\n\t.LineTo "%s", "%s"',historyStr,pointList{ind,1},pointList{ind,2});
end
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define rotate: ' component ':' name ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end