function f_AnalyzeAll_HFSS(oProject)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oDesign.AnalyzeAll;
end