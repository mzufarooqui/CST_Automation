function f_DeleteAllFarfieldSource(oMWS)
oFarfieldSource = invoke(oMWS,'FarfieldSource');
invoke(oFarfieldSource,'DeleteAll');
end