function status = f_Delete_All_Results(oMWS)
% _Deletes all results of the actual project.._
status = invoke(oMWS,'DeleteResults');
%status = invoke(oMWS,'ClearGlobalDataValues');
%status = invoke(oMWS,'DeleteGlobalDataValue');
end






