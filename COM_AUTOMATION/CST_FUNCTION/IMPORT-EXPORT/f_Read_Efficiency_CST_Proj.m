function [efficiency,VFreqRadEff] = f_Read_Efficiency_CST_Proj(effPath)
res = importdata(effPath);
VFreqRadEff = res.data(:,1);
efficiency  = res.data(:,2);
end
