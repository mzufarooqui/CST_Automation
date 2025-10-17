function f_ChangeImpedanceMult(oProject,impMult)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('BoundarySetup');
oModule.ChangeImpedanceMult(num2str(impMult));
end