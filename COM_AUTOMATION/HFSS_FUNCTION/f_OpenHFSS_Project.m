function [oAnsoftApp oDesktop oProject oDesign oEditor] = f_OpenHFSS_Project(fileName)
oAnsoftApp = actxserver('AnsoftHfss.HfssScriptInterface');
oDesktop   = oAnsoftApp.GetAppDesktop();
oDesktop.RestoreWindow
invoke(oDesktop,'OpenProject',fileName);
oProject   = oDesktop.GetActiveProject();
% oProject.InsertDesign( 'HFSS', 'HFSSDesign1', 'DrivenModal', '');
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
end

