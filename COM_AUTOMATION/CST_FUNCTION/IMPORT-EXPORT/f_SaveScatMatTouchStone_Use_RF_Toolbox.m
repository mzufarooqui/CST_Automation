function sParamObj = f_SaveScatMatTouchStone_Use_RF_Toolbox(oMWS,varargin)
% There are two ways two call this function
% 1 - [scatMat,freq] = f_SaveScatMatTouchStone(oMWS)
%       In this way it will give the all scattering matrix
% 2 - f_SaveScatMatTouchStone(oMWS,[ pwd '/fileName' ])
%       In this way it will give nothing but save the sacattering matrix in the idicated directory

if nargin > 1
    dirStrWithFileName = varargin{1};
    exportTCH.fileName       = dirStrWithFileName;
else
    dirStr = tempdir;
    saveFileName = ['scatMat'];
    exportTCH.fileName       = [ dirStr saveFileName ];
    delete([ exportTCH.fileName '.*']); % Delete all the old scaMat.* File :)
end
exportTCH.frequencyRange = 'Full';
exportTCH.bRenormalize   = 'False';
exportTCH.bUseARResults  = 'False';
exportTCH.setNSamples    = 0;
f_ExportTOUCH(oMWS,exportTCH);
if nargin > 1
    dirInfo = (dir([ exportTCH.fileName '.*']));
    [path,name,ext] = fileparts(dirInfo(1).name);
    fileNameWithExt = [exportTCH.fileName ext];    
    sParamObj = sparameters(fileNameWithExt);
%     disp(S)
%     rfplot(S)    
else
    dirInfo = (dir([ exportTCH.fileName '.*']));
    importTCH.fileName = [ tempdir dirInfo(1).name ];
%     sParamObj = f_read_sNp_CST(importTCH.fileName);
    sParamObj = sparameters(importTCH.fileName);
end

end