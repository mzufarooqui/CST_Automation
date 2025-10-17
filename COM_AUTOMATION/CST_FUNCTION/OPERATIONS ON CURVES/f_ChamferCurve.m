function status = f_ChamferCurve(oMWS,name,width,curve,curveItem1,curveItem2,edgeId1,edgeId2,vertexId1,vertexId2)
%% DEFINE CHAMFER CURVE
%
%% FIELD DEFINATION
%  name 
%          Sets the name of the new chamfer item.
%  width 
%         Specify a valid expression for the width of the chamfer.
%  curve 
%         Specifies the curve the new created chamfer item object will belong to. 
%  curveItem1 
%         Selects a specified curve item which has to belong to the same curve object as curve item No.2.
%  curveItem2 
%          Selects a specified curve item which has to belong to the same curve object as curve item No.1.
%  edgeId1 
%         Defines a specified edge of a curve item by its identity number.
%  edgeId2 
%          Defines a specified edge of a curve item by its identity number.
%  vertexId1 
%         Defines a specified vertex of a curve item by its identity number.
%  vertexId2 
%         Defines a specified vertex of a curve item by its identity number.
%% EXAMPLE:
%  status = f_ChamferCurve(oMWS,name,width,curve,curveItem1,curveItem2,edgeId1,edgeId2,vertexId1,vertexId2);
%  status = f_ChamferCurve(oMWS,'chamfer1',4,'curve1','rectangle1','rectangle1',2,3,3,3);
%% MATLAB SCRIPT
historyStr = [];
historyStr = sprintf('With ChamferCurve');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,name);
historyStr = sprintf('%s\n\t.Width "%s"',historyStr,num2str(width));
historyStr = sprintf('%s\n\t.Curve "%s"',historyStr,curve);
historyStr = sprintf('%s\n\t.CurveItem1 "%s"',historyStr,curveItem1);
historyStr = sprintf('%s\n\t.CurveItem2 "%s"',historyStr,curveItem2);
historyStr = sprintf('%s\n\t.EdgeId1 "%s"',historyStr,num2str(edgeId1));
historyStr = sprintf('%s\n\t.EdgeId2 "%s"',historyStr,num2str(edgeId2));
historyStr = sprintf('%s\n\t.VertexId1 "%s"',historyStr,num2str(vertexId1));
historyStr = sprintf('%s\n\t.VertexId2 "%s"',historyStr,num2str(vertexId2));
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define curve chamfer: ' curve ':' name ' on: ' curveItem1 ',' curveItem1];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end