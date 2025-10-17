function TurnStil2803_A
clc;clear; clear global; clear variables; close all;
global allPaths
global tempFolderPath
currPath = pwd;
dirList = dir;
if ~strcmp(dirList(4).name,'CST PROJECT'),cd .. ,end
allPaths   = genpath(cd);
addpath(allPaths);
% tempFolderPath = 'C:\Users\Farooqui\Desktop\savehere';

projectName = 'TurnStil2803_Map.cst';
oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_SaveAsCST_MWS_Project(oMWS,projectName);

Lcirc=56;
Lin=10;
Lrect=10;
fmax=7;
fmin=5.4;
wgAr=8;
wgAs=30;
wgBs=14;
wgHr=8.5;
wgRc=26.6;
wgR=wgRc;
f_CreateModel(oMWS,Lcirc,Lin,Lrect,fmax,fmin,wgAr,wgAs,wgBs,wgHr,wgRc,wgR);
vLcc=linspace(20,40,31);
vwgAs=linspace(26,32,30);

[mLcc,mwgAs]=meshgrid(vLcc,vwgAs);
for r=1:size(mLcc,1)

    for c=1:size(mLcc,2)
        try
            disp([r size(mLcc,1) c size(mLcc,2)] )
            Lcc=mLcc(r,c);
            wgAs=mwgAs(r,c);
            Lcirc=wgAs+Lcc;
            %-- Store parameter
            f_StoreParameter(oMWS,'Lcirc',Lcirc);
            f_StoreParameter(oMWS,'wgAs',wgAs);
            f_UpdateModel(oMWS);
            %-- RUN FD SOLVER
            f_StartFD_Solver(oMWS);
            %-- GET S PARAMETER
            [Vfreq,s11] = f_GetS_Parameter(oMWS,'BY_ITERATION',1,1,1,1);
            mS11dB(r,c)=max(db(s11));
            saveResutlsParam(max(db(s11)),wgAs,Lcc);
            save TurnstileMap_2803
        catch ME
            fprintf('\n---------------------- In Catch Block ---------------------');
            pause(1000)
            oMWS = f_RestartCSTStudio(oMWS,oCST_Studio);
            f_CreateModel(oMWS,Lcirc,Lin,Lrect,fmax,fmin,wgAr,wgAs,wgBs,wgHr,wgRc,wgR);
        end
    end
end
end
function f_CreateModel(oMWS,Lcirc,Lin,Lrect,fmax,fmin,wgAr,wgAs,wgBs,wgHr,wgRc,wgR)
f_StoreParameter(oMWS,'Lcirc',Lcirc);
f_StoreParameter(oMWS,'Lin',Lin);
f_StoreParameter(oMWS,'Lrect',Lrect);
f_StoreParameter(oMWS,'fmax',fmax);
f_StoreParameter(oMWS,'fmin',fmin);
f_StoreParameter(oMWS,'wgAr',wgAr);
f_StoreParameter(oMWS,'wgAs',wgAs);
f_StoreParameter(oMWS,'wgBs',wgBs);
f_StoreParameter(oMWS,'wgHr',wgHr);
f_StoreParameter(oMWS,'wgRc',wgRc);
f_StoreParameter(oMWS,'wgR',wgR);
f_UpdateModel(oMWS);
f_AddMacroInHistory(oMWS,'TurnStile_2803.mcs.bas')
end

function oMWS = f_RestartCSTStudio(oMWS,oCST_Studio)
% f_SaveCST_MWS_Project(oMWS);
f_CloseCST_MWS_Project(oMWS);
f_CloseCST_StudioSuit(oCST_Studio);
oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
end
function saveResutlsParam(maxdbS11,wgAs,Lcc)
fid = fopen('TurnstileMap_2803','w');
fprintf(fid,' %0.3f ',[maxdbS11,wgAs,Lcc]);
fprintf(fid,'\n');
fclose(fid);
end