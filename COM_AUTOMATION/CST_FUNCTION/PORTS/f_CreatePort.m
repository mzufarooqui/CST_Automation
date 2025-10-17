function status = f_CreatePort(oMWS,oPort)
%% DEFINE WAVEGUIDE PORT
% # oPort.bAddToHistory           = 'True';
% # oPort.portNumber              = 1;
% # oPort.numberOfModes           = 1;
% # oPort.coordinates             = 'Picks';
% # oPort.orientation             = 'positive';
% # oPort.bAdjustPolarization     = 'False';
% # oPort.polarizationAngle       = 0.0;
% # oPort.bPortOnBound            = 'True';
% # oPort.bClipPickedPortToBound  = 'False';
% # oPort.bSingleEnded            = 'False';
% # oPort.referencePlaneDistance  = 0.0;
% # oPort.textSize                = 50.0;
% # oPort.portLabel               = '1';
% # oPort.bPortImpedanceAndCalibration = 'True'
% # oPort.lineNumber = 1;
% # oPort.xStart     = 10;
% # oPort.yStart     = 0;
% # oPort.zStart     = 0;
% # oPort.xEnd       = 0
% # oPort.yEnd       = 0;
% # oPort.zEnd       = 0;
% # oPort.bDirReverse = 'False'
%
%% FIELD DEFINATION
%
%  oPort.numberOfModes ( int modenumber )
%       Sets the number of modes for the waveguide port.
%  oPort.coordinates ( enum {'Free', 'Full', 'Picks'} key )
%       This method determines how the transversal expansion of a waveguide port is defined.
%             * key can have one of  the following values:
%             * Free:  The transversal plane of the port is defined by the free input of the dimensions (Xrange, Yrange, Zrange).
%             * Full:  The full plane of the calculation domain will work as the waveguide port.
%             * Picks: The transversal plane of the port is defined by selected pickpoints.
%  oPort.orientation ( enum key )
%         This method defines the orientation, i.e. the direction of excitation, of the waveguide port. 'xmin' means that the port is located at the lower x-boundary of the calculation domain and feeds the structure in positive x-direction. This excitation direction is also valid for internal ports, determined by the PortOnBound method.
%  oPort.bAdjustPolarization ( bool flag )
%         Switch that decides if the polarization of the electric field should be adjusted or not. This method works together with the PolarizationAngle method.
%         Note: Only works if two or more degenerated modes exists.
%               oPort.adjustPolarization.polarizationAngle ( double angle )
%                       If you have activated the AdjustPolarization switch, here the polarization angle can be defined.
%  oPort.bPortOnBound ( bool flag )
%         This method decides if the port is located on the boundaries of the calculation domain (flag = True) or could be located inside the calculation domain due to its normal position definition (Xrange, Yrange or Zrange method) (flag = False). This method is not relevant for picked ports, since here the location is determined by the picked face.
%  oPort.bClipPickedPortToBound ( bool flag )
%         In case of a picked port this method decides if the port  plane should be located  on the boundaries of the calculation domain (flag = True) or should be defined correspondent to the pick information (flag = False). In general this method should not be used, since the intention is to locate the port due to its pick information.
%  oPort.bSingleEnded (  bool flag )
%         This method offers the possibility to automatically recalculate the scattering parameters as a post processing step due to previously defined single-ended multipin ports. Consequently during setup of the multipin definition a separate mode set has to be created for each of the inner conductors, i.e. one (usually the outermost) conductor remains undefined representing the ground conductor.
%         Note: All ports has to be defined as single-ended type in this way, otherwise the simulation can not be started. By applying single-ended port mode calculation the solvers automatically activate renormalization to fixed impedance, however, the impedance value itself can be modified in the corresponding solver dialog box before starting the simulation.
%  oPort.referencePlaneDistance ( double dist )
%         Sets the distance to the reference plane. The S-Parameters will then be calculated (phase deembedded) related to this reference plane. A negative distance corresponds to a reference plane inside the structure, a  positive distance to an outside located plane.
%  oPort.label ( string  label )
%         Sets the label of the waveguide port.
%  oPort.bPortImpedanceAndCalibration (  bool flag )
%         This switch activates the enhanced impedance and calibration evaluation for the port, based on the definition of corresponding reference lines. The lines are defined with help of the AddLineByPoint, AddLineByFace or AddLineByBoundary method and assigned to the mode with the AddModeLine method.
%             oPort.portImpedanceAndCalibration.addModeLineByPoint ( int linenumber, double xstart, double ystart, double zstart, double xend, double yend, double zend, bool reverse )
%                     Adds a new line with a given linenumber to the port mode description. xstart / ystart / zstart defines the start point  and xend / yend / zend the end point. Afterwards the defined line can be used as an impedance, calibration or polarization reference with help of the AddModeLine method. The reverse flag toggles the start and end point.
%             oPort.portImpedanceAndCalibration.addModeLineByFace ( int linenumber, double xstart, double ystart, double zstart, solidname name, int face_id , bool reverse )
%                     Adds a new line with a given linenumber to the port mode description. xstart / ystart / zstart defines the start point. The end point is determined by the nearest point on the face face_id of the solid name. The face needs to be a planar face on the port plane . Afterwards the defined line can be used as an impedance, calibration or polarization reference with help of the AddModeLine method. The reverse flag toggles the start and end point.
%             oPort.portImpedanceAndCalibration.addModeLineByBoundary ( int linenumber, double xstart, double ystart, double zstart, enum {"Umin", "Umax", "Vmin", "Vmax"} position, bool reverse )
%                     Adds a new line with a given linenumber to the port mode description. xstart / ystart / zstart defines the start point. The end point is determined by the port boundary at position. The line will be perpendicular on the port boundary. Afterwards the defined line can be used as an impedance, calibration or polarization reference with help of the AddModeLine method. The reverse flag toggles the start and end point.
%
%% EXAMPLE:
%  f_PickFaceFromId(oMWS,'component1','brick2',1);
%  f_AlignWCSWithSelectedFace(oMWS);
%  f_PickFaceFromId(oMWS,'component1','brick2',1);
%  oPort.portNumber    = 1;
%  oPort.numberOfModes = 5;
%  oPort.coordinates   = 'Picks';
%  oPort.portLabel     = '1';
%  oPort.textSize      = 50.0;
%  oPort.orientation   = 'positive';
%  f_CreatePort(oMWS,oPort);
%  f_ClearAllPicks(oMWS);
%
% *calibration lines can be added by adding the line by points*
%
%  oPort.bPortImpedanceAndCalibration = 'True'
%  oPort.addModeLineByPoint ={lineNumber, modeNumber, {xStart, yStart, zStart}, {xEnd, yEnd, zEnd}, bDirReverse, impedanceLineNumber, calibrationLineNumber,polarizationLineNumber};
%  oPort.addModeLineByPoint = {1,1,{-2,-1,0},{2,1,1},'False',1,1,1;
%                             10,11,{-20,-10,100},{20,10,10},'False',10,10,10};
%
% *calibration lines can be added by adding the line with boundary*
%
% oPort.bPortImpedanceAndCalibration = 'True';
% oPort.addModeLineByBoundary = {1,1,{0,0,0},{'Umax'},'False',1,1,1;
%                                2,2,{0,0,0},{'Vmax'},'False',2,2,2};                                
%% MATLAB SCRIPT

historyStr = [];
historyStr = sprintf('With Port');
historyStr = sprintf('%s\n\t.Reset',                historyStr);
if isfield(oPort,'portNumber'),                     historyStr = sprintf('%s\n\t.PortNumber "%s"',            historyStr,num2str(oPort.portNumber));                          else historyStr = sprintf('%s\n\t.PortNumber "1"',                        historyStr); end
if isfield(oPort,'portLabel'),                      historyStr = sprintf('%s\n\t.Label "%s"',                 historyStr,oPort.portLabel);                                    else historyStr = sprintf('%s\n\t.Label ""',                              historyStr); end
if isfield(oPort,'numberOfModes'),                  historyStr = sprintf('%s\n\t.NumberOfModes "%s"',         historyStr,num2str(oPort.numberOfModes));                       else historyStr = sprintf('%s\n\t.NumberOfModes "1"',                     historyStr); end
if isfield(oPort,'bAdjustPolarization'),            historyStr = sprintf('%s\n\t.AdjustPolarization "%s"',    historyStr,lower(oPort.bAdjustPolarization));                   else historyStr = sprintf('%s\n\t.AdjustPolarization "False"',            historyStr); end
if isfield(oPort,'polarizationAngle'),              historyStr = sprintf('%s\n\t.PolarizationAngle "%s"',     historyStr,num2str(oPort.polarizationAngle));                   else historyStr = sprintf('%s\n\t.PolarizationAngle "0.0"',               historyStr); end
if isfield(oPort,'referencePlaneDistance'),         historyStr = sprintf('%s\n\t.ReferencePlaneDistance "%s"',historyStr,num2str(oPort.referencePlaneDistance));              else historyStr = sprintf('%s\n\t.ReferencePlaneDistance "0"',            historyStr); end
if isfield(oPort,'textSize'),                       historyStr = sprintf('%s\n\t.TextSize "%s"',              historyStr,num2str(oPort.textSize));                            else historyStr = sprintf('%s\n\t.TextSize "50"',                         historyStr); end
if isfield(oPort,'coordinates'),                    historyStr = sprintf('%s\n\t.Coordinates "%s"',           historyStr,oPort.coordinates);                                  else historyStr = sprintf('%s\n\t.Coordinates "Free"',                    historyStr); end
if isfield(oPort,'orientation'),                    historyStr = sprintf('%s\n\t.Orientation "%s"',           historyStr,oPort.orientation);                                  else historyStr = sprintf('%s\n\t.Orientation "zmin"',                    historyStr); end
if isfield(oPort,'bPortOnBound'),                   historyStr = sprintf('%s\n\t.PortOnBound "%s"',           historyStr,lower(oPort.bPortOnBound));                          else historyStr = sprintf('%s\n\t.PortOnBound "False"',                   historyStr); end
if isfield(oPort,'bClipPickedPortToBound'),         historyStr = sprintf('%s\n\t.ClipPickedPortToBound "%s"', historyStr,lower(oPort.bClipPickedPortToBound));                else historyStr = sprintf('%s\n\t.ClipPickedPortToBound "False"',         historyStr); end
if isfield(oPort,'xRange'),                         historyStr = sprintf('%s\n\t.Xrange "%s","%s"',           historyStr,num2str(xRange(1)),num2str(xRange(2)));              else historyStr = sprintf('%s\n\t.Xrange "0", "0"',                       historyStr); end
if isfield(oPort,'yRange'),                         historyStr = sprintf('%s\n\t.Yrange "%s","%s"',           historyStr,num2str(yRange(1)),num2str(yRange(2)));              else historyStr = sprintf('%s\n\t.Yrange "0", "0"',                       historyStr); end
if isfield(oPort,'zRange'),                         historyStr = sprintf('%s\n\t.Zrange "%s","%s"',           historyStr,num2str(zRange(1)),num2str(zRange(2)));              else historyStr = sprintf('%s\n\t.Zrange "0", "0"',                       historyStr); end
if isfield(oPort,'xRangeAdd'),                      historyStr = sprintf('%s\n\t.XrangeAdd "%s","%s"',        historyStr,num2str(xRangeAdd(1)),num2str(xRangeAdd(2)));        else historyStr = sprintf('%s\n\t.XrangeAdd "0", "0"',                    historyStr); end
if isfield(oPort,'yRangeAdd'),                      historyStr = sprintf('%s\n\t.YrangeAdd "%s","%s"',        historyStr,num2str(yRangeAdd(1)),num2str(yRangeAdd(2)));        else historyStr = sprintf('%s\n\t.YrangeAdd "0", "0"',                    historyStr); end
if isfield(oPort,'zRangeAdd'),                      historyStr = sprintf('%s\n\t.ZrangeAdd "%s","%s"',        historyStr,num2str(zRangeAdd(1)),num2str(zRangeAdd(2)));        else historyStr = sprintf('%s\n\t.ZrangeAdd "0", "0"',                    historyStr); end
if isfield(oPort,'bSingleEnded'),                   historyStr = sprintf('%s\n\t.SingleEnded "%s"',           historyStr,lower(oPort.bSingleEnded));                          else historyStr = sprintf('%s\n\t.SingleEnded "False"',                   historyStr); end
if isfield(oPort,'bPortImpedanceAndCalibration')
    if strcmp(lower(oPort.bPortImpedanceAndCalibration),'true')
        %-- Add line by start and End point
        if isfield(oPort,'addModeLineByPoint')
            for ind = 1:size(oPort.addModeLineByPoint,1)
                oPort.lineNumber             = oPort.addModeLineByPoint{ind,1}(1,1);
                oPort.modeNumber             = oPort.addModeLineByPoint{ind,2}(1,1);
                oPort.xStart                 = oPort.addModeLineByPoint{ind,3}{1,1};
                oPort.yStart                 = oPort.addModeLineByPoint{ind,3}{1,2};
                oPort.zStart                 = oPort.addModeLineByPoint{ind,3}{1,3};
                oPort.xEnd                   = oPort.addModeLineByPoint{ind,4}{1,1};
                oPort.yEnd                   = oPort.addModeLineByPoint{ind,4}{1,2};
                oPort.zEnd                   = oPort.addModeLineByPoint{ind,4}{1,3};
                oPort.bDirReverse            = oPort.addModeLineByPoint{ind,5};
                oPort.impedanceLineNumber    = oPort.addModeLineByPoint{ind,6}(1,1);
                oPort.calibrationLineNumber  = oPort.addModeLineByPoint{ind,7}(1,1);
                oPort.polarizationLineNumber = oPort.addModeLineByPoint{ind,8}(1,1);
                
                historyStr = sprintf('%s\n\t.AddModeLineByPoint "%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s" ',historyStr,num2str(oPort.lineNumber),num2str(oPort.xStart),num2str(oPort.yStart),num2str(oPort.zStart),num2str(oPort.xEnd),num2str(oPort.yEnd),num2str(oPort.zEnd),oPort.bDirReverse);
                historyStr = sprintf('%s\n\t.AddModeLine "%s", "%s", "%s", "%s" ',historyStr,num2str(oPort.modeNumber),num2str(oPort.impedanceLineNumber),num2str(oPort.calibrationLineNumber),num2str(oPort.polarizationLineNumber));
                
            end
        end
        %-- Add line by line and boundary
        if isfield(oPort,'addModeLineByBoundary')
            for ind = 1:size(oPort.addModeLineByBoundary,1)
                oPort.lineNumber             = oPort.addModeLineByBoundary{ind,1}(1,1);
                oPort.modeNumber             = oPort.addModeLineByBoundary{ind,2}(1,1);
                oPort.xStart                 = oPort.addModeLineByBoundary{ind,3}{1,1};
                oPort.yStart                 = oPort.addModeLineByBoundary{ind,3}{1,2};
                oPort.zStart                 = oPort.addModeLineByBoundary{ind,3}{1,3};
                oPort.axisBoundary           = oPort.addModeLineByBoundary{ind,4}{1,1};
                oPort.bDirReverse            = oPort.addModeLineByBoundary{ind,5};
                oPort.impedanceLineNumber    = oPort.addModeLineByBoundary{ind,6}(1,1);
                oPort.calibrationLineNumber  = oPort.addModeLineByBoundary{ind,7}(1,1);
                oPort.polarizationLineNumber = oPort.addModeLineByBoundary{ind,8}(1,1);
                
                historyStr = sprintf('%s\n\t.AddModeLineByBoundary "%s", "%s", "%s", "%s", "%s", "%s" ',historyStr,num2str(oPort.lineNumber),num2str(oPort.xStart),num2str(oPort.yStart),num2str(oPort.zStart),num2str(oPort.axisBoundary),oPort.bDirReverse);
                historyStr = sprintf('%s\n\t.AddModeLine "%s", "%s", "%s", "%s" ',historyStr,num2str(oPort.modeNumber),num2str(oPort.impedanceLineNumber),num2str(oPort.calibrationLineNumber),num2str(oPort.polarizationLineNumber));
                
            end
        end
        historyStr = sprintf('%s\n\t.PortImpedanceAndCalibration "%s"',        historyStr,oPort.bPortImpedanceAndCalibration);
    end
end
% oPort.portImpedanceAndCalibration.addModeLineByFace
% oPort.portImpedanceAndCalibration.addModeLineByBoundary
% if isfield(oPort,'bPortImpedanceAndCalibration'),             historyStr = sprintf('%s\n.PortImpedanceAndCalibration "%s"',historyStr,lower(bPortImpedanceAndCalibration));end
% if isfield(portImpedanceAndCalibration,'addModeLineByPoint'), historyStr = sprintf('%s\n.AddModeLineByPoint "%s"',historyStr,lower(bPortImpedanceAndCalibration));end
%  ( int linenumber, double xstart, double ystart, double zstart, double xend, double yend, double zend, bool reverse )

historyStr = sprintf('%s\n\t.Create',         historyStr);
historyStr = sprintf('%s\nEnd With',        historyStr);
historyHeader = [ 'define port: ' num2str(oPort.portNumber) ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end