function f_SetCutPlane(oMWS,oPlot)
%% DEFINE CUTPLANE
%% FIELD DEFINATION
% AbovePlaneMode 'hide', 'wireframe', 'transparent','solid'
%     Sets the view above the cutplane.
% DefinePlane( string nx, string ny, string nz, string px, string py, string pz )
%     Defines the cutplane by the normal direction and point on the plane.
% CutPlaneNormal ('x', 'y', 'z')
%     Defines the normal direction of the cutplane.
% CutPlaneRatio ( double ratio )
%     Defines where the cutplane will be located. A value of 0.0 for Ratio will position the cut plane
%     at the lowest dimension of the structure in direction of CutPlaneNormal. A value of 1.0 will
%     move the plane to the highest dimension.
% ShowCutplane ( bool switch )
%     A cutplane can be defined to look inside a structure. This cutplane divides the structure into
%     two parts, while only one of them will be plotted. The cutplane can be defined by the methods
%         CutPlaneNormal and CutPlaneRatio.
% RotationAngle ( double angle )
%       Sets the angle of rotation.
% Rotate ( string direction )
%     Rotates the plot in the main view. This method has no effect if 2D-Values are plotted.
%     direction can have one of the following values:
%     'left':Rotates the figure to the left
%     'right':Rotates the figure to the right
%     'up':Rotates the figure upward
%     'down':Rotates the figure downward
%     'clockwise':Rotates the figure clockwise
%     'counterclockwise':Rotates the figure counterclockwise
%% EXAMPLE:
% oPlot.abovePlaneMode = 'hide';
% oPlot.bShowCutplane  = true;
% oPlot.cutPlaneRatio  = 0.5;
% oPlot.cutPlaneNormal = 'x';
% f_SetCutPlane(oMWS,oPlot);
%% MATLAB SCRIPT
plotObj = oMWS.invoke('Plot');
if isfield(oPlot,'definePlane'), plotObj.invoke('DefinePlane',num2str(oPlot.definePlane.nx),num2str(oPlot.definePlane.ny),num2str(oPlot.definePlane.nz),num2str(oPlot.definePlane.px),num2str(oPlot.definePlane.py),num2str(oPlot.definePlane.pz));  end
if isfield(oPlot,'zbovePlaneMode'), plotObj.invoke('AbovePlaneMode',oPlot.abovePlaneMode);  end
if isfield(oPlot,'bShowCutplane'),  plotObj.invoke('ShowCutplane',oPlot.bShowCutplane);     end
if isfield(oPlot,'cutPlaneRatio'),  plotObj.invoke('CutPlaneRatio',oPlot.cutPlaneRatio);    end
if isfield(oPlot,'cutPlaneNormal'), plotObj.invoke('CutPlaneNormal',oPlot.cutPlaneNormal);  end
if isfield(oPlot,'rotate'),         plotObj.invoke('Rotate',oPlot.rotate);                  end
if isfield(oPlot,'rotationAngle'),  plotObj.invoke('RotationAngle',oPlot.rotationAngle);    end
plotObj.invoke('Update');
end