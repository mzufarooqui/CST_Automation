function f_CloseCST_DS_Project(oDS)
%-- Close Project
invoke(oDS,'Quit');
release(oDS);
end