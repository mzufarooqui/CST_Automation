function f_DeleteWaveguidePort(oProject,portNum)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('BoundarySetup');
oModule.DeleteBoundaries({num2str(portNum)});
end