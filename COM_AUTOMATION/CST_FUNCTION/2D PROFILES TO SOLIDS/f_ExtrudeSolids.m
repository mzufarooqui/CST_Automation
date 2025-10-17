function status = f_ExtrudeSolids(oMWS,component,solid,material,height,twist,taper,mode,pointList,origin,Uvector,Vvector)
%% DEFINE EXTRUDE SOLID
%
%% DEFINATION
%  name
%          Sets the name of the extrude Object
%  component
%          Sets the component for the new Solid. The component must already exist.
%  material
%          Sets the material for the new Solid. The material must already exist
%  mode
%          Mode may have,
%            1 - 'Pointlist': A profile defined by points is to be extruded,
%            2 - 'Picks'    : A picked face is to be extruded
%  height
%          Defines the height of the extruded solid.
%  twist
%          Twists the solid around the direction of extrusion. The parameter tw defines the angle in degree of how much the solid will be twisted.
%  taper
%          Defines a value of how much the to be extruded face is enlarged during extrusion.
%  origin
%          Defines the location of the origin.
%  Uvector
%          These settings define the plane on which the profile will be defined. u, v, w are related on the current working coordinate system.
%  Vvector
%          These settings define the plane on which the profile will be defined. u, v, w are related on the current working coordinate system.
%% EXAMPLE:
%  MODE: PICK
%  status = f_ExtrudeSolids(oMWS,component,solid,material,height,twist,taper,mode,pointList,origin,Uvector,Vvector)
%  status = f_ExtrudeSolids(oMWS,'component1','solid2','Vacuum',4,3,1,'Picks')
%
%  MODE: POINT LIST
%  a =  2; 
%  b = -2;
%  f_StoreDoubleParameter(oMWS,'a',a);
%  f_StoreDoubleParameter(oMWS,'b',b);
%  pointList = ['0'  'a';'a' '0';'0' 'b';'b' '0';'0'  'a'];
%  status = f_ExtrudeSolids(oMWS,component,solid,material,height,twist,taper,mode,pointList,origin,Uvector,Vvector)
%  status = f_ExtrudeSolids(oMWS,'component1','solid1','Vacuum',4,3,1,'Pointlist',pointList,[0 0 0],[1 0 0],[0 1 0])
%% MATLAB SCRIPT
%-- Some variable set by default.
% mode                     = 'Picks'; % Mode may have, 1- 'pointlist': A profile defined by points is to be extruded, 2-'picks': A picked face is to be extruded
bUsePicksForHeight         = 'False'; % Use a previously picked point for the height of the extrusion.
bDeleteBaseFaceSolid       = 'False'; % Deletes the face used for the extrusion.
bClearPickedFace           = 'True';  % Cleares the picked face after the extrude command.

historyStr = [];
historyStr = sprintf('With Extrude');
historyStr = sprintf('%s\n\t.Reset',                        historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',                    historyStr,solid);
historyStr = sprintf('%s\n\t.Component "%s"',               historyStr,component);
historyStr = sprintf('%s\n\t.Material "%s"',                historyStr,material);
historyStr = sprintf('%s\n\t.Mode "%s"',                    historyStr,mode);
historyStr = sprintf('%s\n\t.Height "%s"',                  historyStr,num2str(height));
historyStr = sprintf('%s\n\t.Twist "%s"',                   historyStr,num2str(twist));
historyStr = sprintf('%s\n\t.Taper "%s"',                   historyStr,num2str(taper));
historyStr = sprintf('%s\n\t.UsePicksForHeight "%s"',       historyStr,bUsePicksForHeight);
historyStr = sprintf('%s\n\t.DeleteBaseFaceSolid "%s"',     historyStr,bDeleteBaseFaceSolid);
historyStr = sprintf('%s\n\t.ClearPickedFace "%s"',         historyStr,bClearPickedFace);
%-- If mode == 'Pointlist'
if strcmp(mode,'Pointlist')
    historyStr = sprintf('%s\n\t.Origin "%s", "%s", "%s"',  historyStr,num2str(origin(1)), num2str(origin(2)), num2str(origin(3)));
    historyStr = sprintf('%s\n\t.Uvector "%s", "%s", "%s"', historyStr,num2str(Uvector(1)),num2str(Uvector(2)),num2str(Uvector(3)));
    historyStr = sprintf('%s\n\t.Vvector "%s", "%s", "%s"', historyStr,num2str(Vvector(1)),num2str(Vvector(2)),num2str(Vvector(3)));
    if iscell(pointList)
        historyStr = sprintf('%s\n\t.Point "%s", "%s"',     historyStr,pointList{1,1},pointList{1,2});
        for numOfPoints = 2:size(pointList,1)
            historyStr = sprintf('%s\n\t.LineTo "%s", "%s"',historyStr,pointList{numOfPoints,1},pointList{numOfPoints,2});
        end
    else
        historyStr = sprintf('%s\n\t.Point "%s", "%s"',     historyStr,num2str(pointList(1,1)),num2str(pointList(1,2)));
        for numOfPoints = 1:size(pointList,1)-1
            historyStr = sprintf('%s\n\t.LineTo "%s", "%s"',    historyStr,num2str(pointList(numOfPoints,1)),num2str(pointList(numOfPoints,2)));
        end
    end
% elseif strcmp(mode,'Picks')
end
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define extrude: ' component ':' solid ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end