close all;clear all;clc
addpath(genpath('E:\CNR\Oscar Peverini\CST\FAROOQUI_TOOLS'));
oCST_Studio = f_OpenCST_StudioSuit();
oMWS = f_OpenCST_MWS_Project(oCST_Studio,[pwd '\CST_PROJECT\CircWg2RctWgTr_PerTrasferimento_2014.cst']);
%--
f_PickCenterpointFromId(oMWS,'CircWg2RctWgTr','ParteInterna',209);
%--
f_PickCirclecenterFromId(oMWS,'CircWg2RctWgTr','ParteInterna',338);
% f_PickCenterpointFromId(oMWS,componentName,solidName,faceId)
if 0
%--
vertexIdFromPoint = f_GetVertexIdFromPoint(oMWS,'CircWg2RctWgTr','ParteInterna',12.644047,2.845,6);
%--
f_PickFaceFromId(oMWS,'CircWg2RctWgTr','ParteInterna',67);
pickedFaceAreaFromIndex = f_GetPickedFaceAreaFromIndex (oMWS,1);
%--
f_PickFaceFromId(oMWS,'CircWg2RctWgTr','ParteInterna',67);
pickedFaceFromIndex = f_GetPickedFaceFromIndex (oMWS,1,67);
%--
pickedEdgeFromIndex = f_GetPickedEdgeFromIndex(oMWS,index,edgeid,vertexid);
%--
%f_GetPickpointCoordinates


% function vertexIdFromPoint = f_GetVertexIdFromPoint(oMWS,componentName,solidName,x,y,z)
% % Returns the edge id at a given point for one shape.
% oPick = oMWS.invoke('Pick');
% vertexIdFromPoint = oPick.invoke('GetVertexIdFromPoint',[componentName ':' solidName],x,y,z);
end