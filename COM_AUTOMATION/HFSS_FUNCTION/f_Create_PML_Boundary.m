function f_Create_PML_Boundary(oProject,oEditor)
%--AirBox
f_CreateBox_Param_HFSS(oProject,'AirBox','-xSubs/2-lambda0/2','-ySubs/2-lambda0/2','0mm-lambda0/2','xSubs+lambda0','ySubs+lambda0','tSubs+lambda0','vacuum',0.8);
%-- Create Boundary material
f_AddMaterial_For_RadBox_HFSS(oProject);
%-- Create FaceCS1
partID = oEditor.GetObjectIDByName('AirBox');
faceID_FCS1 = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'AirBox', 'XPosition:=', '-xSubs/2-lambda0/2', 'YPosition:=', 'ySubs/2+lambda0/2', 'ZPosition:=', 'lambda0/2'});
f_AssignRadiation_OnFace_HFSS(oProject,faceID_FCS1,'PML_radiation1');
entityID1 = 27;
entityID2 = 32;
f_CreateFaceCS_HFSS(oProject,'FaceCS1',faceID_FCS1,partID,entityID1,entityID2,'X');
%-- Create FaceCS2
faceID_FCS2 = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'AirBox', 'XPosition:=', 'xSubs/2+lambda0/2', 'YPosition:=', '-ySubs/2-lambda0/2+2mm', 'ZPosition:=', 'lambda0/2'});
f_AssignRadiation_OnFace_HFSS(oProject,faceID_FCS2,'PML_radiation2');
entityID1 = 25;
entityID2 = 30;
f_CreateFaceCS_HFSS(oProject,'FaceCS2',faceID_FCS2,partID,entityID1,entityID2,'X');
%-- Create FaceCS3
faceID_FCS3 = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'AirBox', 'XPosition:=', '-xSubs/2-lambda0/2+2mm', 'YPosition:=', '-ySubs/2-lambda0/2', 'ZPosition:=', 'lambda0/2'});
f_AssignRadiation_OnFace_HFSS(oProject,faceID_FCS3,'PML_radiation3');
entityID1 = 28;
entityID2 = 31;
f_CreateFaceCS_HFSS(oProject,'FaceCS3',faceID_FCS3,partID,entityID1,entityID2,'X');
%-- Create FaceCS4
faceID_FCS4 = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'AirBox', 'XPosition:=', 'xSubs/2+lambda0/2-2mm', 'YPosition:=', 'ySubs/2+lambda0/2', 'ZPosition:=', 'lambda0/2'});
f_AssignRadiation_OnFace_HFSS(oProject,faceID_FCS4,'PML_radiation4');
entityID1 = 26;
entityID2 = 29;
f_CreateFaceCS_HFSS(oProject,'FaceCS4',faceID_FCS4,partID,entityID1,entityID2,'X');
%-- Create FaceCS5
faceID_FCS5 = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'AirBox', 'XPosition:=', 'xSubs/2+lambda0/2-2mm', 'YPosition:=', 'ySubs/2+lambda0/2-2mm', 'ZPosition:=', '-lambda0/2'});
f_AssignRadiation_OnFace_HFSS(oProject,faceID_FCS5,'PML_radiation5');
entityID1 = 29;
entityID2 = 30;
f_CreateFaceCS_HFSS(oProject,'FaceCS5',faceID_FCS5,partID,entityID1,entityID2,'X');
%-- Create FaceCS6
faceID_FCS6 = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'AirBox', 'XPosition:=', '0mm', 'YPosition:=', '0mm', 'ZPosition:=', 'tSubs+lambda0/2'});
f_AssignRadiation_OnFace_HFSS(oProject,faceID_FCS6,'PML_radiation6');
entityID1 = 25;
entityID2 = 26;
f_CreateFaceCS_HFSS(oProject,'FaceCS6',faceID_FCS6,partID,entityID1,entityID2,'X');
%-- Create FaceCS7
faceID_FCS7 = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'AirBox', 'XPosition:=', '-xSubs/2-lambda0/2', 'YPosition:=', '0mm', 'ZPosition:=', '0mm'});
entityID1 = 31;
entityID2 = 28;
f_CreateFaceCS_HFSS(oProject,'FaceCS7',faceID_FCS7,partID,entityID1,entityID2,'X');
%-- Create FaceCS8
faceID_FCS8 = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'AirBox', 'XPosition:=', '0mm', 'YPosition:=', '-ySubs/2-lambda0/2', 'ZPosition:=', '0mm'});
entityID1 = 30;
entityID2 = 25;
f_CreateFaceCS_HFSS(oProject,'FaceCS8',faceID_FCS8,partID,entityID1,entityID2,'X');
%-- Create FaceCS9
faceID_FCS9 = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'AirBox', 'XPosition:=', '-xSubs/2-lambda0/2', 'YPosition:=', '0mm', 'ZPosition:=', '0mm'});
entityID1 = 32;
entityID2 = 31;
f_CreateFaceCS_HFSS(oProject,'FaceCS9',faceID_FCS9,partID,entityID1,entityID2,'X');

f_SetWCS(oProject,'Global');
% PML_AirBox_1
f_SweepFacesAlongNormal(oProject,'AirBox',faceID_FCS1,'lambda0/2');
f_RenamePart_HFSS(oProject,'AirBox_SweepFaceAlongNormal1','PML_AirBox_1')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_1','PMLGroup1_Z_1')
f_ChangePropertyParam(oProject,'PML_AirBox_1','Orientation','FaceCS1')
% PML_AirBox_2
f_SweepFacesAlongNormal(oProject,'AirBox',faceID_FCS2,'lambda0/2');
f_RenamePart_HFSS(oProject,'AirBox_SweepFaceAlongNormal1','PML_AirBox_2')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_2','PMLGroup1_Z_1')
f_ChangePropertyParam(oProject,'PML_AirBox_2','Orientation','FaceCS2')
% PML_AirBox_3
f_SweepFacesAlongNormal(oProject,'AirBox',faceID_FCS3,'lambda0/2');
f_RenamePart_HFSS(oProject,'AirBox_SweepFaceAlongNormal1','PML_AirBox_3')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_3','PMLGroup1_Z_1')
f_ChangePropertyParam(oProject,'PML_AirBox_3','Orientation','FaceCS3')
% PML_AirBox_4
f_SweepFacesAlongNormal(oProject,'AirBox',faceID_FCS4,'lambda0/2');
f_RenamePart_HFSS(oProject,'AirBox_SweepFaceAlongNormal1','PML_AirBox_4')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_4','PMLGroup1_Z_1')
f_ChangePropertyParam(oProject,'PML_AirBox_4','Orientation','FaceCS4')
% PML_AirBox_5
f_SweepFacesAlongNormal(oProject,'AirBox',faceID_FCS5,'lambda0/2');
f_RenamePart_HFSS(oProject,'AirBox_SweepFaceAlongNormal1','PML_AirBox_5')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_5','PMLGroup1_Z_1')
f_ChangePropertyParam(oProject,'PML_AirBox_5','Orientation','FaceCS5')
% PML_AirBox_6
f_SweepFacesAlongNormal(oProject,'AirBox',faceID_FCS6,'lambda0/2');
f_RenamePart_HFSS(oProject,'AirBox_SweepFaceAlongNormal1','PML_AirBox_6')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_6','PMLGroup1_Z_1')
f_ChangePropertyParam(oProject,'PML_AirBox_6','Orientation','FaceCS6')
% PML_AirBox_7
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_1', 'XPosition:=', '-xSubs/2-lambda0/2-lambda0/4', 'YPosition:=', '-ySubs/2-lambda0/2', 'ZPosition:=', '0mm'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_1',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_1_SweepFaceAlongNormal1','PML_AirBox_7')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_7','PMLGroup1_YZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_7','Orientation','FaceCS9')
f_ChangePropertyParam(oProject,'PML_AirBox_7','Transparent',0.9)
% PML_AirBox_8
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_1', 'XPosition:=', '-xSubs/2-lambda0/2-lambda0/4', 'YPosition:=', 'ySubs/2+lambda0/2', 'ZPosition:=', '0mm'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_1',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_1_SweepFaceAlongNormal1','PML_AirBox_8')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_8','PMLGroup1_YZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_8','Orientation','FaceCS1')
% PML_AirBox_9
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_1', 'XPosition:=', '-xSubs/2-lambda0/2-lambda0/4', 'YPosition:=', '0mm', 'ZPosition:=', '-lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_1',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_1_SweepFaceAlongNormal1','PML_AirBox_9')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_9','PMLGroup1_XZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_9','Orientation','FaceCS7')
% PML_AirBox_10
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_1', 'XPosition:=', '-xSubs/2-lambda0/2-lambda0/4', 'YPosition:=', '0mm', 'ZPosition:=', 'tSubs+lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_1',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_1_SweepFaceAlongNormal1','PML_AirBox_10')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_10','PMLGroup1_XZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_10','Orientation','FaceCS1')
% PML_AirBox_11
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_2', 'XPosition:=', 'xSubs/2+lambda0/2+lambda0/4', 'YPosition:=', '-ySubs/2-lambda0/2', 'ZPosition:=', '0mm'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_2',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_2_SweepFaceAlongNormal1','PML_AirBox_11')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_11','PMLGroup1_YZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_11','Orientation','FaceCS2')
% PML_AirBox_12
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_2', 'XPosition:=', 'xSubs/2+lambda0/2+lambda0/4', 'YPosition:=', 'ySubs/2+lambda0/2', 'ZPosition:=', '0mm'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_2',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_2_SweepFaceAlongNormal1','PML_AirBox_12')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_12','PMLGroup1_YZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_12','Orientation','FaceCS4')
% PML_AirBox_13
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_2', 'XPosition:=', 'xSubs/2+lambda0/2+lambda0/4', 'YPosition:=', '0', 'ZPosition:=', '-lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_2',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_2_SweepFaceAlongNormal1','PML_AirBox_13')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_13','PMLGroup1_YZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_13','Orientation','FaceCS5')
% PML_AirBox_14
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_2', 'XPosition:=', 'xSubs/2+lambda0/2+lambda0/4', 'YPosition:=', '0', 'ZPosition:=', 'tSubs+lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_2',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_2_SweepFaceAlongNormal1','PML_AirBox_14')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_14','PMLGroup1_XZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_14','Orientation','FaceCS2')
% PML_AirBox_15
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_3', 'XPosition:=', '0mm', 'YPosition:=', '-ySubs/2-lambda0/2-lambda0/4', 'ZPosition:=', '-lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_3',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_3_SweepFaceAlongNormal1','PML_AirBox_15')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_15','PMLGroup1_XZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_15','Orientation','FaceCS8')
% PML_AirBox_16
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_3', 'XPosition:=', '0mm', 'YPosition:=', '-ySubs/2-lambda0/2-lambda0/4', 'ZPosition:=', 'tSubs+lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_3',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_3_SweepFaceAlongNormal1','PML_AirBox_16')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_16','PMLGroup1_XZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_16','Orientation','FaceCS3')
% PML_AirBox_17
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_4', 'XPosition:=', '0mm', 'YPosition:=', 'ySubs/2+lambda0/2+lambda0/4', 'ZPosition:=', '-lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_4',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_4_SweepFaceAlongNormal1','PML_AirBox_17')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_17','PMLGroup1_XZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_17','Orientation','FaceCS5')
% PML_AirBox_18
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_4', 'XPosition:=', '0mm', 'YPosition:=', 'ySubs/2+lambda0/2+lambda0/4', 'ZPosition:=', 'tSubs+lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_4',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_4_SweepFaceAlongNormal1','PML_AirBox_18')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_18','PMLGroup1_XZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_18','Orientation','FaceCS4')
% PML_AirBox_19
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_7', 'XPosition:=', '-xSubs/2-lambda0/2-lambda0/4', 'YPosition:=', '-ySubs/2-lambda0/2-lambda0/4', 'ZPosition:=', '-lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_7',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_7_SweepFaceAlongNormal1','PML_AirBox_19')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_19','PMLGroup1_XYZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_19','Orientation','FaceCS7')
% PML_AirBox_20
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_7', 'XPosition:=', '-xSubs/2-lambda0/2-lambda0/4', 'YPosition:=', '-ySubs/2-lambda0/2-lambda0/4', 'ZPosition:=', 'tSubs+lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_7',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_7_SweepFaceAlongNormal1','PML_AirBox_20')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_20','PMLGroup1_XYZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_20','Orientation','FaceCS3')
% PML_AirBox_21
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_8', 'XPosition:=', '-xSubs/2-lambda0/2-lambda0/4', 'YPosition:=', 'ySubs/2+lambda0/2+lambda0/4', 'ZPosition:=', '-lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_8',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_8_SweepFaceAlongNormal1','PML_AirBox_21')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_21','PMLGroup1_XYZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_21','Orientation','FaceCS9')
% PML_AirBox_22
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_8', 'XPosition:=', '-xSubs/2-lambda0/2-lambda0/4', 'YPosition:=', 'ySubs/2+lambda0/2+lambda0/4', 'ZPosition:=', 'tSubs+lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_8',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_8_SweepFaceAlongNormal1','PML_AirBox_22')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_22','PMLGroup1_XYZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_22','Orientation','FaceCS1')
% PML_AirBox_23
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_11', 'XPosition:=', 'xSubs/2+lambda0/2+lambda0/4', 'YPosition:=', '-ySubs/2-lambda0/2-lambda0/4', 'ZPosition:=', '-lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_11',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_11_SweepFaceAlongNormal1','PML_AirBox_23')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_23','PMLGroup1_XYZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_23','Orientation','FaceCS8')
% PML_AirBox_24
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_11', 'XPosition:=', 'xSubs/2+lambda0/2+lambda0/4', 'YPosition:=', '-ySubs/2-lambda0/2-lambda0/4', 'ZPosition:=', 'tSubs+lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_11',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_11_SweepFaceAlongNormal1','PML_AirBox_24')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_24','PMLGroup1_XYZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_24','Orientation','FaceCS2')
% PML_AirBox_25
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_12', 'XPosition:=', 'xSubs/2+lambda0/2+lambda0/4', 'YPosition:=', 'ySubs/2+lambda0/2+lambda0/4', 'ZPosition:=', '-lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_12',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_12_SweepFaceAlongNormal1','PML_AirBox_25')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_25','PMLGroup1_XYZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_25','Orientation','FaceCS5')
% PML_AirBox_26
faceID = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' 'PML_AirBox_12', 'XPosition:=', 'xSubs/2+lambda0/2+lambda0/4', 'YPosition:=', 'ySubs/2+lambda0/2+lambda0/4', 'ZPosition:=', 'tSubs+lambda0/2'});
f_SweepFacesAlongNormal(oProject,'PML_AirBox_12',faceID,'lambda0/2');
f_RenamePart_HFSS(oProject,'PML_AirBox_12_SweepFaceAlongNormal1','PML_AirBox_26')
f_AssignMaterial_HFSS(oProject,'PML_AirBox_26','PMLGroup1_XYZ_1')
f_ChangePropertyParam(oProject,'PML_AirBox_26','Orientation','FaceCS4')
%-- Virtual radiation box
f_CreateBox_Param_HFSS(oProject,'VirtualRadiation','-xSubs/2-lambda0/2+5mm','-ySubs/2-lambda0/2+5mm','0mm-lambda0/2+5mm','xSubs+lambda0-10mm','ySubs+lambda0-10mm','tSubs+lambda0-10mm','vacuum',0.8);
end

