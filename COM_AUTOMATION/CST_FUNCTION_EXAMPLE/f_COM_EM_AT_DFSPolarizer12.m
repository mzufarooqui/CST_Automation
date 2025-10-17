function f_COM_EM_AT_DFSPolarizer12(oMWS,NfreqAdapt,NfreqAnal,R,blendRad,fMax,fMin,hCap_1,hCap_2,hCap_3,hInd_1,hInd_2,hInd_3,lCav,lInput,lOutput,lStub,numModesIn,numModesOut,wCap_1,wCap_2,wCap_3,wInd_1,wInd_2,wInd_3)
namelengthmax=100;
%-- use template: Coupler (Waveguide)
f_use_template_Coupler_Waveguide_N1(oMWS);

%-- new component: Polarizer
f_new_component_Polarizer_N2(oMWS);

%-- activate global coordinates
f_activate_global_coordinates_N3(oMWS);

%-- define cylinder: Polarizer:inCircWg
f_define_cylinder_Polarizer_inCircWg_N4(oMWS,R,lInput);

%-- define cylinder: Polarizer:stub01
f_define_cylinder_Polarizer_stub01_N5(oMWS,R,lInput,lStub);

%-- define brick: Polarizer:part01
f_define_brick_Polarizer_part01_N6(oMWS,R,hInd_1,lInput,lStub,wInd_1);

%-- define brick: Polarizer:part02
f_define_brick_Polarizer_part02_N7(oMWS,R,hCap_1,lInput,lStub,wCap_1);

%-- boolean add shapes: Polarizer:stub01:Polarizer:part01
f_boolean_add_shapes_Polarizer_stub01_Polarizer_part01_N8(oMWS);

%-- boolean add shapes: Polarizer:stub01:Polarizer:part02
f_boolean_add_shapes_Polarizer_stub01_Polarizer_part02_N9(oMWS);

%-- define cylinder: Polarizer:cavityWg1
f_define_cylinder_Polarizer_cavityWg1_N10(oMWS,R,lCav,lInput,lStub);

%-- define cylinder: Polarizer:stub02
f_define_cylinder_Polarizer_stub02_N11(oMWS,R,lCav,lInput,lStub);

%-- define brick: Polarizer:part01
f_define_brick_Polarizer_part01_N12(oMWS,R,hInd_2,lCav,lInput,lStub,wInd_2);

%-- define brick: Polarizer:part02
f_define_brick_Polarizer_part02_N13(oMWS,R,hCap_2,lCav,lInput,lStub,wCap_2);

%-- boolean add shapes: Polarizer:stub02:Polarizer:part01
f_boolean_add_shapes_Polarizer_stub02_Polarizer_part01_N14(oMWS);

%-- boolean add shapes: Polarizer:stub02:Polarizer:part02
f_boolean_add_shapes_Polarizer_stub02_Polarizer_part02_N15(oMWS);

%-- define cylinder: Polarizer:cavityWg2
f_define_cylinder_Polarizer_cavityWg2_N16(oMWS,R,lCav,lInput,lStub);

%-- define cylinder: Polarizer:stub03
f_define_cylinder_Polarizer_stub03_N17(oMWS,R,lCav,lInput,lStub);

%-- define brick: Polarizer:part01
f_define_brick_Polarizer_part01_N18(oMWS,R,hInd_3,lCav,lInput,lStub,wInd_3);

%-- define brick: Polarizer:part02
f_define_brick_Polarizer_part02_N19(oMWS,R,hCap_3,lCav,lInput,lStub,wCap_3);

%-- boolean add shapes: Polarizer:stub03:Polarizer:part01
f_boolean_add_shapes_Polarizer_stub03_Polarizer_part01_N20(oMWS);

%-- boolean add shapes: Polarizer:stub03:Polarizer:part02
f_boolean_add_shapes_Polarizer_stub03_Polarizer_part02_N21(oMWS);

%-- define cylinder: Polarizer:outWg
f_define_cylinder_Polarizer_outWg_N22(oMWS,R,lCav,lInput,lOutput,lStub);

%-- rename component: Polarizer:inCircWg to: Polarizer:innerPart
f_rename_component_Polarizer_inCircWg_to_Polarizer_inne_N23(oMWS);

%-- boolean add shapes: Polarizer:innerPart:Polarizer:stub01
f_boolean_add_shapes_Polarizer_innerPart_Polarizer_stub_N24(oMWS);

%-- boolean add shapes: Polarizer:innerPart:Polarizer:cavityWg1
f_boolean_add_shapes_Polarizer_innerPart_Polarizer_cavi_N25(oMWS);

%-- boolean add shapes: Polarizer:innerPart:Polarizer:stub02
f_boolean_add_shapes_Polarizer_innerPart_Polarizer_stub_N26(oMWS);

%-- boolean add shapes: Polarizer:innerPart:Polarizer:cavityWg2
f_boolean_add_shapes_Polarizer_innerPart_Polarizer_cavi_N27(oMWS);

%-- boolean add shapes: Polarizer:innerPart:Polarizer:stub03
f_boolean_add_shapes_Polarizer_innerPart_Polarizer_stub_N28(oMWS);

%-- boolean add shapes: Polarizer:innerPart:Polarizer:outWg
f_boolean_add_shapes_Polarizer_innerPart_Polarizer_outW_N29(oMWS);

%-- pick edge
f_pick_edge_N30(oMWS);

%-- pick edge
f_pick_edge_N31(oMWS);

%-- pick edge
f_pick_edge_N32(oMWS);

%-- pick edge
f_pick_edge_N33(oMWS);

%-- pick edge
f_pick_edge_N34(oMWS);

%-- pick edge
f_pick_edge_N35(oMWS);

%-- pick edge
f_pick_edge_N36(oMWS);

%-- pick edge
f_pick_edge_N37(oMWS);

%-- pick edge
f_pick_edge_N38(oMWS);

%-- pick edge
f_pick_edge_N39(oMWS);

%-- pick edge
f_pick_edge_N40(oMWS);

%-- pick edge
f_pick_edge_N41(oMWS);

%-- pick edge
f_pick_edge_N42(oMWS);

%-- pick edge
f_pick_edge_N43(oMWS);

%-- pick edge
f_pick_edge_N44(oMWS);

%-- pick edge
f_pick_edge_N45(oMWS);

%-- pick edge
f_pick_edge_N46(oMWS);

%-- pick edge
f_pick_edge_N47(oMWS);

%-- pick edge
f_pick_edge_N48(oMWS);

%-- pick edge
f_pick_edge_N49(oMWS);

%-- pick edge
f_pick_edge_N50(oMWS);

%-- pick edge
f_pick_edge_N51(oMWS);

%-- pick edge
f_pick_edge_N52(oMWS);

%-- pick edge
f_pick_edge_N53(oMWS);

%-- blend edges of: Polarizer:innerPart
f_blend_edges_of_Polarizer_innerPart_N54(oMWS,R,blendRad);

%-- pick face
f_pick_face_N55(oMWS);

%-- define port: 1
f_define_port_1_N56(oMWS);

%-- clear picks
f_clear_picks_N57(oMWS);

%-- pick face
f_pick_face_N58(oMWS);

%-- define port: 2
f_define_port_2_N59(oMWS);

%-- clear picks
f_clear_picks_N60(oMWS);

%-- Solver
f_Solver_N61(oMWS);

%-- define automesh parameters
f_define_automesh_parameters_N62(oMWS);

%-- set mesh properties
f_set_mesh_properties_N63(oMWS);

%-- define MeshAdaption3D
f_define_MeshAdaption3D_N64(oMWS);

%-- define frequency domain solver parameters
f_define_frequency_domain_solver_parameters_N65(oMWS);

%-- define boundaries symm
f_define_boundaries_symm_N66(oMWS);

%-- change solver type
f_change_solver_type_N67(oMWS);

%-- clear picks
f_clear_picks_N68(oMWS);

%-- set mesh properties (for backward compatibility)
f_set_mesh_properties_for_backward_compatibility_N69(oMWS);

%-- define frequency domain solver parameters
f_define_frequency_domain_solver_parameters_N70(oMWS,NfreqAdapt,NfreqAnal);

%-- modify port: 1
f_modify_port_1_N71(oMWS,numModesIn);

%-- modify port: 2
f_modify_port_2_N72(oMWS,numModesOut);

%-- define frequency range
f_define_frequency_range_N73(oMWS,fMax,fMin);

end
%--------------------------------------------
% FUNCTION:- use template: Coupler (Waveguide)
%--------------------------------------------
function status = f_use_template_Coupler_Waveguide_N1(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\n'' Template for Waveguide Coupler',content);
content = sprintf('%s\n'' ==============================',content);
content = sprintf('%s\n'' (CSTxMWSxONLY)',content);
content = sprintf('%s\n'' set units to mm, ghz',content);
content = sprintf('%s\nWith Units ',content);
content = sprintf('%s\n     .Geometry "mm" ',content);
content = sprintf('%s\n     .Frequency "ghz" ',content);
content = sprintf('%s\n     .Time "ns" ',content);
content = sprintf('%s\nEnd With ',content);
content = sprintf('%s\n'' set background material to pec',content);
content = sprintf('%s\nWith Background ',content);
content = sprintf('%s\n     .Type "pec" ',content);
content = sprintf('%s\n     .XminSpace "0.0" ',content);
content = sprintf('%s\n     .XmaxSpace "0.0" ',content);
content = sprintf('%s\n     .YminSpace "0.0" ',content);
content = sprintf('%s\n     .YmaxSpace "0.0" ',content);
content = sprintf('%s\n     .ZminSpace "0.0" ',content);
content = sprintf('%s\n     .ZmaxSpace "0.0" ',content);
content = sprintf('%s\nEnd With ',content);
content = sprintf('%s\n'' set boundary conditions to electric',content);
content = sprintf('%s\nWith Boundary',content);
content = sprintf('%s\n     .Xmin "electric" ',content);
content = sprintf('%s\n     .Xmax "electric" ',content);
content = sprintf('%s\n     .Ymin "electric" ',content);
content = sprintf('%s\n     .Ymax "electric" ',content);
content = sprintf('%s\n     .Zmin "electric" ',content);
content = sprintf('%s\n     .Zmax "electric" ',content);
content = sprintf('%s\n     .Xsymmetry "none" ',content);
content = sprintf('%s\n     .Ysymmetry "none" ',content);
content = sprintf('%s\n     .Zsymmetry "none" ',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nMesh.MinimumCurvatureRefinement "150"',content);
status = oMWS.invoke('AddToHistory','use template: Coupler (Waveguide)',content);
end
%--------------------------------------------
% FUNCTION:- new component: Polarizer
%--------------------------------------------
function status = f_new_component_Polarizer_N2(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nComponent.New "Polarizer"',content);
status = oMWS.invoke('AddToHistory','new component: Polarizer',content);
end
%--------------------------------------------
% FUNCTION:- activate global coordinates
%--------------------------------------------
function status = f_activate_global_coordinates_N3(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWCS.ActivateWCS "global"',content);
status = oMWS.invoke('AddToHistory','activate global coordinates',content);
end
%--------------------------------------------
% FUNCTION:- define cylinder: Polarizer:inCircWg
%--------------------------------------------
function status = f_define_cylinder_Polarizer_inCircWg_N4(oMWS,R,lInput)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Cylinder',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "inCircWg"',content);
content = sprintf('%s\n	.Component "Polarizer"',content);
content = sprintf('%s\n	.Material "Vacuum"',content);
content = sprintf('%s\n	.Axis "z"',content);
content = sprintf('%s\n	.Outerradius "R"',content);
content = sprintf('%s\n	.Innerradius "0"',content);
content = sprintf('%s\n	.Xcenter "0"',content);
content = sprintf('%s\n	.Ycenter "0"',content);
content = sprintf('%s\n	.Zcenter "0"',content);
content = sprintf('%s\n	.Zrange "0", "lInput"',content);
content = sprintf('%s\n	.Segments "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define cylinder: Polarizer:inCircWg',content);
end
%--------------------------------------------
% FUNCTION:- define cylinder: Polarizer:stub01
%--------------------------------------------
function status = f_define_cylinder_Polarizer_stub01_N5(oMWS,R,lInput,lStub)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Cylinder',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "stub01"',content);
content = sprintf('%s\n	.Component "Polarizer"',content);
content = sprintf('%s\n	.Material "Vacuum"',content);
content = sprintf('%s\n	.Axis "z"',content);
content = sprintf('%s\n	.Outerradius "R"',content);
content = sprintf('%s\n	.Innerradius "0"',content);
content = sprintf('%s\n	.Xcenter "0"',content);
content = sprintf('%s\n	.Ycenter "0"',content);
content = sprintf('%s\n	.Zcenter "0"',content);
content = sprintf('%s\n	.Zrange "lInput", "lInput+lStub"',content);
content = sprintf('%s\n	.Segments "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define cylinder: Polarizer:stub01',content);
end
%--------------------------------------------
% FUNCTION:- define brick: Polarizer:part01
%--------------------------------------------
function status = f_define_brick_Polarizer_part01_N6(oMWS,R,hInd_1,lInput,lStub,wInd_1)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Brick',content);
content = sprintf('%s\n.Reset',content);
content = sprintf('%s\n.Name "part01"',content);
content = sprintf('%s\n.Component "Polarizer"',content);
content = sprintf('%s\n.Material "Vacuum"',content);
content = sprintf('%s\n.Xrange "-wInd_1/2", "wInd_1/2"',content);
content = sprintf('%s\n.Yrange "-(R+hInd_1)", "(R+hInd_1)"',content);
content = sprintf('%s\n.Zrange "lInput", "lInput+lStub"',content);
content = sprintf('%s\n.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define brick: Polarizer:part01',content);
end
%--------------------------------------------
% FUNCTION:- define brick: Polarizer:part02
%--------------------------------------------
function status = f_define_brick_Polarizer_part02_N7(oMWS,R,hCap_1,lInput,lStub,wCap_1)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Brick',content);
content = sprintf('%s\n.Reset',content);
content = sprintf('%s\n.Name "part02"',content);
content = sprintf('%s\n.Component "Polarizer"',content);
content = sprintf('%s\n.Material "Vacuum"',content);
content = sprintf('%s\n.Xrange "-(R+hCap_1)", "(R+hCap_1)"',content);
content = sprintf('%s\n.Yrange "-wCap_1/2", "wCap_1/2"',content);
content = sprintf('%s\n.Zrange "lInput", "lInput+lStub"',content);
content = sprintf('%s\n.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define brick: Polarizer:part02',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: Polarizer:stub01:Polarizer:part01
%--------------------------------------------
function status = f_boolean_add_shapes_Polarizer_stub01_Polarizer_part01_N8(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "Polarizer:stub01", "Polarizer:part01"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: Polarizer:stub01:Polarizer:part01',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: Polarizer:stub01:Polarizer:part02
%--------------------------------------------
function status = f_boolean_add_shapes_Polarizer_stub01_Polarizer_part02_N9(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "Polarizer:stub01", "Polarizer:part02"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: Polarizer:stub01:Polarizer:part02',content);
end
%--------------------------------------------
% FUNCTION:- define cylinder: Polarizer:cavityWg1
%--------------------------------------------
function status = f_define_cylinder_Polarizer_cavityWg1_N10(oMWS,R,lCav,lInput,lStub)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Cylinder',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "cavityWg1"',content);
content = sprintf('%s\n	.Component "Polarizer"',content);
content = sprintf('%s\n	.Material "Vacuum"',content);
content = sprintf('%s\n	.Axis "z"',content);
content = sprintf('%s\n	.Outerradius "R"',content);
content = sprintf('%s\n	.Innerradius "0"',content);
content = sprintf('%s\n	.Xcenter "0"',content);
content = sprintf('%s\n	.Ycenter "0"',content);
content = sprintf('%s\n	.Zcenter "0"',content);
content = sprintf('%s\n	.Zrange "lInput+lStub", "lInput+lStub+lCav"',content);
content = sprintf('%s\n	.Segments "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define cylinder: Polarizer:cavityWg1',content);
end
%--------------------------------------------
% FUNCTION:- define cylinder: Polarizer:stub02
%--------------------------------------------
function status = f_define_cylinder_Polarizer_stub02_N11(oMWS,R,lCav,lInput,lStub)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Cylinder',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "stub02"',content);
content = sprintf('%s\n	.Component "Polarizer"',content);
content = sprintf('%s\n	.Material "Vacuum"',content);
content = sprintf('%s\n	.Axis "z"',content);
content = sprintf('%s\n	.Outerradius "R"',content);
content = sprintf('%s\n	.Innerradius "0"',content);
content = sprintf('%s\n	.Xcenter "0"',content);
content = sprintf('%s\n	.Ycenter "0"',content);
content = sprintf('%s\n	.Zcenter "0"',content);
content = sprintf('%s\n	.Zrange "lInput+lStub+lCav", "lInput+lStub+lCav+lStub"',content);
content = sprintf('%s\n	.Segments "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define cylinder: Polarizer:stub02',content);
end
%--------------------------------------------
% FUNCTION:- define brick: Polarizer:part01
%--------------------------------------------
function status = f_define_brick_Polarizer_part01_N12(oMWS,R,hInd_2,lCav,lInput,lStub,wInd_2)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Brick',content);
content = sprintf('%s\n.Reset',content);
content = sprintf('%s\n.Name "part01"',content);
content = sprintf('%s\n.Component "Polarizer"',content);
content = sprintf('%s\n.Material "Vacuum"',content);
content = sprintf('%s\n.Xrange "-wInd_2/2", "wInd_2/2"',content);
content = sprintf('%s\n.Yrange "-(R+hInd_2)", "(R+hInd_2)"',content);
content = sprintf('%s\n.Zrange "lInput+lStub+lCav", "lInput+lStub+lCav+lStub"',content);
content = sprintf('%s\n.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define brick: Polarizer:part01',content);
end
%--------------------------------------------
% FUNCTION:- define brick: Polarizer:part02
%--------------------------------------------
function status = f_define_brick_Polarizer_part02_N13(oMWS,R,hCap_2,lCav,lInput,lStub,wCap_2)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Brick',content);
content = sprintf('%s\n.Reset',content);
content = sprintf('%s\n.Name "part02"',content);
content = sprintf('%s\n.Component "Polarizer"',content);
content = sprintf('%s\n.Material "Vacuum"',content);
content = sprintf('%s\n.Xrange "-(R+hCap_2)", "(R+hCap_2)"',content);
content = sprintf('%s\n.Yrange "-wCap_2/2", "wCap_2/2"',content);
content = sprintf('%s\n.Zrange "lInput+lStub+lCav", "lInput+lStub+lCav+lStub"',content);
content = sprintf('%s\n.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define brick: Polarizer:part02',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: Polarizer:stub02:Polarizer:part01
%--------------------------------------------
function status = f_boolean_add_shapes_Polarizer_stub02_Polarizer_part01_N14(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "Polarizer:stub02", "Polarizer:part01"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: Polarizer:stub02:Polarizer:part01',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: Polarizer:stub02:Polarizer:part02
%--------------------------------------------
function status = f_boolean_add_shapes_Polarizer_stub02_Polarizer_part02_N15(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "Polarizer:stub02", "Polarizer:part02"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: Polarizer:stub02:Polarizer:part02',content);
end
%--------------------------------------------
% FUNCTION:- define cylinder: Polarizer:cavityWg2
%--------------------------------------------
function status = f_define_cylinder_Polarizer_cavityWg2_N16(oMWS,R,lCav,lInput,lStub)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Cylinder',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "cavityWg2"',content);
content = sprintf('%s\n	.Component "Polarizer"',content);
content = sprintf('%s\n	.Material "Vacuum"',content);
content = sprintf('%s\n	.Axis "z"',content);
content = sprintf('%s\n	.Outerradius "R"',content);
content = sprintf('%s\n	.Innerradius "0"',content);
content = sprintf('%s\n	.Xcenter "0"',content);
content = sprintf('%s\n	.Ycenter "0"',content);
content = sprintf('%s\n	.Zcenter "0"',content);
content = sprintf('%s\n	.Zrange "lInput+lStub+lCav+lStub", "lInput+lStub+lCav+lStub+lCav"',content);
content = sprintf('%s\n	.Segments "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define cylinder: Polarizer:cavityWg2',content);
end
%--------------------------------------------
% FUNCTION:- define cylinder: Polarizer:stub03
%--------------------------------------------
function status = f_define_cylinder_Polarizer_stub03_N17(oMWS,R,lCav,lInput,lStub)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Cylinder',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "stub03"',content);
content = sprintf('%s\n	.Component "Polarizer"',content);
content = sprintf('%s\n	.Material "Vacuum"',content);
content = sprintf('%s\n	.Axis "z"',content);
content = sprintf('%s\n	.Outerradius "R"',content);
content = sprintf('%s\n	.Innerradius "0"',content);
content = sprintf('%s\n	.Xcenter "0"',content);
content = sprintf('%s\n	.Ycenter "0"',content);
content = sprintf('%s\n	.Zcenter "0"',content);
content = sprintf('%s\n	.Zrange "lInput+lStub+lCav+lStub+lCav", "lInput+lStub+lCav+lStub+lCav+lStub"',content);
content = sprintf('%s\n	.Segments "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define cylinder: Polarizer:stub03',content);
end
%--------------------------------------------
% FUNCTION:- define brick: Polarizer:part01
%--------------------------------------------
function status = f_define_brick_Polarizer_part01_N18(oMWS,R,hInd_3,lCav,lInput,lStub,wInd_3)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Brick',content);
content = sprintf('%s\n.Reset',content);
content = sprintf('%s\n.Name "part01"',content);
content = sprintf('%s\n.Component "Polarizer"',content);
content = sprintf('%s\n.Material "Vacuum"',content);
content = sprintf('%s\n.Xrange "-wInd_3/2", "wInd_3/2"',content);
content = sprintf('%s\n.Yrange "-(R+hInd_3)", "(R+hInd_3)"',content);
content = sprintf('%s\n.Zrange "lInput+lStub+lCav+lStub+lCav", "lInput+lStub+lCav+lStub+lCav+lStub"',content);
content = sprintf('%s\n.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define brick: Polarizer:part01',content);
end
%--------------------------------------------
% FUNCTION:- define brick: Polarizer:part02
%--------------------------------------------
function status = f_define_brick_Polarizer_part02_N19(oMWS,R,hCap_3,lCav,lInput,lStub,wCap_3)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Brick',content);
content = sprintf('%s\n.Reset',content);
content = sprintf('%s\n.Name "part02"',content);
content = sprintf('%s\n.Component "Polarizer"',content);
content = sprintf('%s\n.Material "Vacuum"',content);
content = sprintf('%s\n.Xrange "-(R+hCap_3)", "(R+hCap_3)"',content);
content = sprintf('%s\n.Yrange "-wCap_3/2", "wCap_3/2"',content);
content = sprintf('%s\n.Zrange "lInput+lStub+lCav+lStub+lCav", "lInput+lStub+lCav+lStub+lCav+lStub"',content);
content = sprintf('%s\n.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define brick: Polarizer:part02',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: Polarizer:stub03:Polarizer:part01
%--------------------------------------------
function status = f_boolean_add_shapes_Polarizer_stub03_Polarizer_part01_N20(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "Polarizer:stub03", "Polarizer:part01"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: Polarizer:stub03:Polarizer:part01',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: Polarizer:stub03:Polarizer:part02
%--------------------------------------------
function status = f_boolean_add_shapes_Polarizer_stub03_Polarizer_part02_N21(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "Polarizer:stub03", "Polarizer:part02"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: Polarizer:stub03:Polarizer:part02',content);
end
%--------------------------------------------
% FUNCTION:- define cylinder: Polarizer:outWg
%--------------------------------------------
function status = f_define_cylinder_Polarizer_outWg_N22(oMWS,R,lCav,lInput,lOutput,lStub)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Cylinder',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "outWg"',content);
content = sprintf('%s\n	.Component "Polarizer"',content);
content = sprintf('%s\n	.Material "Vacuum"',content);
content = sprintf('%s\n	.Axis "z"',content);
content = sprintf('%s\n	.Outerradius "R"',content);
content = sprintf('%s\n	.Innerradius "0"',content);
content = sprintf('%s\n	.Xcenter "0"',content);
content = sprintf('%s\n	.Ycenter "0"',content);
content = sprintf('%s\n	.Zcenter "0"',content);
content = sprintf('%s\n	.Zrange "lInput+2*lCav+3*lStub", "lInput+2*lCav+3*lStub+lOutput"',content);
content = sprintf('%s\n	.Segments "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define cylinder: Polarizer:outWg',content);
end
%--------------------------------------------
% FUNCTION:- rename component: Polarizer:inCircWg to: Polarizer:innerPart
%--------------------------------------------
function status = f_rename_component_Polarizer_inCircWg_to_Polarizer_inne_N23(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nSolid.Rename "Polarizer:inCircWg", "innerPart"',content);
status = oMWS.invoke('AddToHistory','rename component: Polarizer:inCircWg to: Polarizer:innerPart',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: Polarizer:innerPart:Polarizer:stub01
%--------------------------------------------
function status = f_boolean_add_shapes_Polarizer_innerPart_Polarizer_stub_N24(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "Polarizer:innerPart", "Polarizer:stub01"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: Polarizer:innerPart:Polarizer:stub01',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: Polarizer:innerPart:Polarizer:cavityWg1
%--------------------------------------------
function status = f_boolean_add_shapes_Polarizer_innerPart_Polarizer_cavi_N25(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "Polarizer:innerPart", "Polarizer:cavityWg1"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: Polarizer:innerPart:Polarizer:cavityWg1',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: Polarizer:innerPart:Polarizer:stub02
%--------------------------------------------
function status = f_boolean_add_shapes_Polarizer_innerPart_Polarizer_stub_N26(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "Polarizer:innerPart", "Polarizer:stub02"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: Polarizer:innerPart:Polarizer:stub02',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: Polarizer:innerPart:Polarizer:cavityWg2
%--------------------------------------------
function status = f_boolean_add_shapes_Polarizer_innerPart_Polarizer_cavi_N27(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "Polarizer:innerPart", "Polarizer:cavityWg2"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: Polarizer:innerPart:Polarizer:cavityWg2',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: Polarizer:innerPart:Polarizer:stub03
%--------------------------------------------
function status = f_boolean_add_shapes_Polarizer_innerPart_Polarizer_stub_N28(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "Polarizer:innerPart", "Polarizer:stub03"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: Polarizer:innerPart:Polarizer:stub03',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: Polarizer:innerPart:Polarizer:outWg
%--------------------------------------------
function status = f_boolean_add_shapes_Polarizer_innerPart_Polarizer_outW_N29(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "Polarizer:innerPart", "Polarizer:outWg"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: Polarizer:innerPart:Polarizer:outWg',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N30(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "12", "3"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N31(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "14", "4"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N32(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "26", "12"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N33(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "24", "11"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N34(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "11", "6"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N35(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "13", "5"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N36(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "23", "14"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N37(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "25", "13"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N38(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "61", "40"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N39(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "63", "39"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N40(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "75", "47"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N41(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "76", "46"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N42(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "62", "37"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N43(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "64", "38"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N44(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "73", "48"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N45(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "74", "45"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N46(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "112", "71"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N47(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "114", "72"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N48(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "124", "79"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N49(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "126", "80"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N50(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "111", "74"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N51(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "113", "73"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N52(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "123", "82"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- pick edge
%--------------------------------------------
function status = f_pick_edge_N53(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickEdgeFromId "Polarizer:innerPart", "125", "81"',content);
status = oMWS.invoke('AddToHistory','pick edge',content);
end
%--------------------------------------------
% FUNCTION:- blend edges of: Polarizer:innerPart
%--------------------------------------------
function status = f_blend_edges_of_Polarizer_innerPart_N54(oMWS,R,blendRad)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nSolid.BlendEdge "blendRad"',content);
status = oMWS.invoke('AddToHistory','blend edges of: Polarizer:innerPart',content);
end
%--------------------------------------------
% FUNCTION:- pick face
%--------------------------------------------
function status = f_pick_face_N55(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickFaceFromId "Polarizer:innerPart", "88"',content);
status = oMWS.invoke('AddToHistory','pick face',content);
end
%--------------------------------------------
% FUNCTION:- define port: 1
%--------------------------------------------
function status = f_define_port_1_N56(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Port',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.PortNumber "1"',content);
content = sprintf('%s\n	.Label ""',content);
content = sprintf('%s\n	.NumberOfModes "3"',content);
content = sprintf('%s\n	.AdjustPolarization "False"',content);
content = sprintf('%s\n	.PolarizationAngle "0.0"',content);
content = sprintf('%s\n	.ReferencePlaneDistance "0"',content);
content = sprintf('%s\n	.TextSize "50"',content);
content = sprintf('%s\n	.Coordinates "Picks"',content);
content = sprintf('%s\n	.Orientation "positive"',content);
content = sprintf('%s\n	.PortOnBound "False"',content);
content = sprintf('%s\n	.ClipPickedPortToBound "False"',content);
content = sprintf('%s\n	.Xrange "0", "0"',content);
content = sprintf('%s\n	.Yrange "0", "0"',content);
content = sprintf('%s\n	.Zrange "0", "0"',content);
content = sprintf('%s\n	.XrangeAdd "0", "0"',content);
content = sprintf('%s\n	.YrangeAdd "0", "0"',content);
content = sprintf('%s\n	.ZrangeAdd "0", "0"',content);
content = sprintf('%s\n	.SingleEnded "False"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define port: 1',content);
end
%--------------------------------------------
% FUNCTION:- clear picks
%--------------------------------------------
function status = f_clear_picks_N57(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.ClearAllPicks',content);
status = oMWS.invoke('AddToHistory','clear picks',content);
end
%--------------------------------------------
% FUNCTION:- pick face
%--------------------------------------------
function status = f_pick_face_N58(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.PickFaceFromId "Polarizer:innerPart", "3"',content);
status = oMWS.invoke('AddToHistory','pick face',content);
end
%--------------------------------------------
% FUNCTION:- define port: 2
%--------------------------------------------
function status = f_define_port_2_N59(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Port',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.PortNumber "2"',content);
content = sprintf('%s\n	.Label ""',content);
content = sprintf('%s\n	.NumberOfModes "3"',content);
content = sprintf('%s\n	.AdjustPolarization "False"',content);
content = sprintf('%s\n	.PolarizationAngle "0.0"',content);
content = sprintf('%s\n	.ReferencePlaneDistance "0"',content);
content = sprintf('%s\n	.TextSize "50"',content);
content = sprintf('%s\n	.Coordinates "Picks"',content);
content = sprintf('%s\n	.Orientation "positive"',content);
content = sprintf('%s\n	.PortOnBound "False"',content);
content = sprintf('%s\n	.ClipPickedPortToBound "False"',content);
content = sprintf('%s\n	.Xrange "0", "0"',content);
content = sprintf('%s\n	.Yrange "0", "0"',content);
content = sprintf('%s\n	.Zrange "0", "0"',content);
content = sprintf('%s\n	.XrangeAdd "0", "0"',content);
content = sprintf('%s\n	.YrangeAdd "0", "0"',content);
content = sprintf('%s\n	.ZrangeAdd "0", "0"',content);
content = sprintf('%s\n	.SingleEnded "False"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define port: 2',content);
end
%--------------------------------------------
% FUNCTION:- clear picks
%--------------------------------------------
function status = f_clear_picks_N60(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.ClearAllPicks',content);
status = oMWS.invoke('AddToHistory','clear picks',content);
end
%--------------------------------------------
% FUNCTION:- Solver
%--------------------------------------------
function status = f_Solver_N61(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Solver',content);
content = sprintf('%s\n	.FrequencyRange "75", "110"',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','Solver',content);
end
%--------------------------------------------
% FUNCTION:- define automesh parameters
%--------------------------------------------
function status = f_define_automesh_parameters_N62(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith MeshSettings',content);
content = sprintf('%s\n	.SetMeshType "Tet"',content);
content = sprintf('%s\n	.Set "Version", 0',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith Mesh',content);
content = sprintf('%s\n	.AutomeshStraightLines "True"',content);
content = sprintf('%s\n	.AutomeshEllipticalLines "True"',content);
content = sprintf('%s\n	.AutomeshRefinePecAlongAxesOnly "False"',content);
content = sprintf('%s\n	.AutomeshAtEllipseBounds "True", "10"',content);
content = sprintf('%s\n	.AutomeshAtWireEndPoints "True"',content);
content = sprintf('%s\n	.AutomeshAtProbePoints "True"',content);
content = sprintf('%s\n	.SetAutomeshRefineDielectricsType "Generalized"',content);
content = sprintf('%s\n	.MergeThinPECLayerFixpoints "False"',content);
content = sprintf('%s\n	.EquilibrateMesh "False"',content);
content = sprintf('%s\n	.EquilibrateMeshRatio "1.19"',content);
content = sprintf('%s\n	.UseCellAspectRatio "False"',content);
content = sprintf('%s\n	.CellAspectRatio "50.0"',content);
content = sprintf('%s\n	.UsePecEdgeModel "True"',content);
content = sprintf('%s\n	.MeshType "Tetrahedral"',content);
content = sprintf('%s\n	.AutoMeshLimitShapeFaces "True"',content);
content = sprintf('%s\n	.AutoMeshNumberOfShapeFaces "1000"',content);
content = sprintf('%s\n	.PointAccEnhancement "0"',content);
content = sprintf('%s\n	.SurfaceOptimization "True"',content);
content = sprintf('%s\n	.SurfaceSmoothing "3"',content);
content = sprintf('%s\n	.MinimumCurvatureRefinement "300"',content);
content = sprintf('%s\n	.CurvatureRefinementFactor "0.04"',content);
content = sprintf('%s\n	.AnisotropicCurvatureRefinement "False"',content);
content = sprintf('%s\n	.SmallFeatureSize "0.0"',content);
content = sprintf('%s\n	.SurfaceTolerance "0.0"',content);
content = sprintf('%s\n	.SurfaceToleranceType "Relative"',content);
content = sprintf('%s\n	.NormalTolerance "22.5"',content);
content = sprintf('%s\n	.AnisotropicCurvatureRefinementFSM "False"',content);
content = sprintf('%s\n	.SurfaceMeshEnrichment "0"',content);
content = sprintf('%s\n	.DensityTransitionsFSM "0.5"',content);
content = sprintf('%s\n	.VolumeOptimization "True"',content);
content = sprintf('%s\n	.VolumeSmoothing "True"',content);
content = sprintf('%s\n	.VolumeMeshMethod "Delaunay"',content);
content = sprintf('%s\n	.SurfaceMeshMethod "General"',content);
content = sprintf('%s\n	.SurfaceMeshGeometryAccuracy "1.0e-6"',content);
content = sprintf('%s\n	.DelaunayOptimizationLevel "2"',content);
content = sprintf('%s\n	.DelaunayPropagationFactor "1.050000"',content);
content = sprintf('%s\n	.DensityTransitions "0.5"',content);
content = sprintf('%s\n	.MeshAllRegions "False"',content);
content = sprintf('%s\n	.ConvertGeometryDataAfterMeshing "True"',content);
content = sprintf('%s\n	.AutomeshFixpointsForBackground "True"',content);
content = sprintf('%s\n	.PBAType "Fast PBA"',content);
content = sprintf('%s\n	.AutomaticPBAType "True"',content);
content = sprintf('%s\n	.DetectSmallSolidPEC "False"',content);
content = sprintf('%s\n	.ConsiderSpaceForLowerMeshLimit "True"',content);
content = sprintf('%s\n	.RatioLimitGovernsLocalRefinement "False"',content);
content = sprintf('%s\n	.GapDetection "False"',content);
content = sprintf('%s\n	.FPBAGapTolerance "1e-3"',content);
content = sprintf('%s\n	.SetMaxParallelMesherThreads "Hex", "8"',content);
content = sprintf('%s\n	.SetParallelMesherMode "Hex", "Maximum"',content);
content = sprintf('%s\n	.AutomeshRefineThermalMaterials "False"',content);
content = sprintf('%s\n	.SetThermalRefinementConductivityReference "1e-3"',content);
content = sprintf('%s\n	.SetThermalRefinementHeatCapacityReference "1e-3"',content);
content = sprintf('%s\n	.SetParallelMesherMode "Tet", "maximum"',content);
content = sprintf('%s\n	.SetMaxParallelMesherThreads "Tet", "1"',content);
content = sprintf('%s\n	.ConnectivityCheck "False"',content);
content = sprintf('%s\n	.SelfIntersectingCheck "True"',content);
content = sprintf('%s\n	.FPBAAccuracyEnhancement "default"',content);
content = sprintf('%s\n	.FastPBAAccuracy "3"',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith Solver',content);
content = sprintf('%s\n	.UseSplitComponents "True"',content);
content = sprintf('%s\n	.PBAFillLimit "99"',content);
content = sprintf('%s\n	.EnableSubgridding "False"',content);
content = sprintf('%s\n	.AlwaysExcludePec "False"',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith MeshSettings',content);
content = sprintf('%s\n	.SetMeshType "Tet"',content);
content = sprintf('%s\n	.Set "CurvatureOrder", "3"',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith MeshSettings',content);
content = sprintf('%s\n	.SetMeshType "Unstr"',content);
content = sprintf('%s\n	.Set "UseDC", "0"',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define automesh parameters',content);
end
%--------------------------------------------
% FUNCTION:- set mesh properties
%--------------------------------------------
function status = f_set_mesh_properties_N63(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Mesh',content);
content = sprintf('%s\n	.PBAType "PBA"',content);
content = sprintf('%s\n	.StepsPerWavelengthTet "8"',content);
content = sprintf('%s\n	.MinimumStepNumberTet "8"',content);
content = sprintf('%s\n	.MeshType "Tetrahedral"',content);
content = sprintf('%s\n	.MeshAllRegions "False"',content);
content = sprintf('%s\n	.MaterialRefinementTet "True"',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set mesh properties',content);
end
%--------------------------------------------
% FUNCTION:- define MeshAdaption3D
%--------------------------------------------
function status = f_define_MeshAdaption3D_N64(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith MeshAdaption3D',content);
content = sprintf('%s\n	.SetType "HighFrequencyTet"',content);
content = sprintf('%s\n	.MinPasses "3"',content);
content = sprintf('%s\n	.MaxPasses "3"',content);
content = sprintf('%s\n	.MaxDeltaS "1e-14"',content);
content = sprintf('%s\n	.MeshIncrement "3"',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define MeshAdaption3D',content);
end
%--------------------------------------------
% FUNCTION:- define frequency domain solver parameters
%--------------------------------------------
function status = f_define_frequency_domain_solver_parameters_N65(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nMesh.SetCreator "High Frequency"',content);
content = sprintf('%s\nWith FDSolver',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Method "Tetrahedral Mesh"',content);
content = sprintf('%s\n	.OrderTet "Second"',content);
content = sprintf('%s\n	.OrderHFMOR "1"',content);
content = sprintf('%s\n	.OrderSrf "First"',content);
content = sprintf('%s\n	.Stimulation "List", "List"',content);
content = sprintf('%s\n	.ResetExcitationList',content);
content = sprintf('%s\n	.AddToExcitationList "1", "1"',content);
content = sprintf('%s\n	.AutoNormImpedance "False"',content);
content = sprintf('%s\n	.NormingImpedance "50"',content);
content = sprintf('%s\n	.ModesOnly "False"',content);
content = sprintf('%s\n	.ConsiderPortLossesTet "True"',content);
content = sprintf('%s\n	.SetShieldAllPorts "False"',content);
content = sprintf('%s\n	.AccuracyHex "1e-6"',content);
content = sprintf('%s\n	.AccuracyTet "1e-06"',content);
content = sprintf('%s\n	.AccuracySrf "1e-3"',content);
content = sprintf('%s\n	.LimitIterations "False"',content);
content = sprintf('%s\n	.MaxIterations "0"',content);
content = sprintf('%s\n	.CalculateExcitationsInParallel "True"',content);
content = sprintf('%s\n	.StoreAllResults "False"',content);
content = sprintf('%s\n	.StoreResultsInCache "False"',content);
content = sprintf('%s\n	.UseHelmholtzEquation "True"',content);
content = sprintf('%s\n	.LowFrequencyStabilization "True"',content);
content = sprintf('%s\n	.Type "Auto"',content);
content = sprintf('%s\n	.MeshAdaptionHex "True"',content);
content = sprintf('%s\n	.MeshAdaptionTet "True"',content);
content = sprintf('%s\n	.AcceleratedRestart "True"',content);
content = sprintf('%s\n	.HexMORSettings "", "1001"',content);
content = sprintf('%s\n	.NewIterativeSolver "True"',content);
content = sprintf('%s\n	.TDCompatibleMaterials "False"',content);
content = sprintf('%s\n	.ExtrudeOpenBC "False"',content);
content = sprintf('%s\n	.SetOpenBCTypeHex "Default"',content);
content = sprintf('%s\n	.SetOpenBCTypeTet "Default"',content);
content = sprintf('%s\n	.AddMonitorSamples "True"',content);
content = sprintf('%s\n	.SParameterSweep "False"',content);
content = sprintf('%s\n	.CalcStatBField "False"',content);
content = sprintf('%s\n	.UseDoublePrecision "False"',content);
content = sprintf('%s\n	.UseDoublePrecision_ML "True"',content);
content = sprintf('%s\n	.MixedOrderSrf "False"',content);
content = sprintf('%s\n	.MixedOrderTet "False"',content);
content = sprintf('%s\n	.PreconditionerAccuracyIntEq "0.15"',content);
content = sprintf('%s\n	.MLFMMAccuracy "Default"',content);
content = sprintf('%s\n	.MinMLFMMBoxSize "0.20"',content);
content = sprintf('%s\n	.UseCFIEForCPECIntEq "true"',content);
content = sprintf('%s\n	.UseFastRCSSweepIntEq "true"',content);
content = sprintf('%s\n	.UseSensitivityAnalysis "False"',content);
content = sprintf('%s\n	.SetRCSSweepProperties "0.0", "0.0", "0","0.0", "0.0", "0", "0"',content);
content = sprintf('%s\n	.SweepErrorThreshold "True", "0.01"',content);
content = sprintf('%s\n	.SweepErrorChecks "2"',content);
content = sprintf('%s\n	.SweepMinimumSamples "3"',content);
content = sprintf('%s\n	.SweepConsiderAll "True"',content);
content = sprintf('%s\n	.SweepConsiderReset',content);
content = sprintf('%s\n	.InterpolationSamples "1001"',content);
content = sprintf('%s\n	.SweepWeightEvanescent "1.0"',content);
content = sprintf('%s\n	.AddSampleInterval "75", "110", "11", "Equidistant", "False"',content);
content = sprintf('%s\n	.AddSampleInterval "104", "104", "3", "Equidistant", "True"',content);
content = sprintf('%s\n	.MPIParallelization "False"',content);
content = sprintf('%s\n	.UseDistributedComputing "False"',content);
content = sprintf('%s\n	.NetworkComputingStrategy "RunRemote"',content);
content = sprintf('%s\n	.NetworkComputingJobCount "3"',content);
content = sprintf('%s\n	.LimitCPUs "True"',content);
content = sprintf('%s\n	.MaxCPUs "32"',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith IESolver',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.UseFastFrequencySweep "False"',content);
content = sprintf('%s\n	.UseIEGroundPlane "False"',content);
content = sprintf('%s\n	.PreconditionerType "Auto"',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith IESolver',content);
content = sprintf('%s\n	.SetFMMFFCalcStopLevel "0"',content);
content = sprintf('%s\n	.SetFMMFFCalcNumInterpPoints "6"',content);
content = sprintf('%s\n	.UseFMMFarfieldCalc "True"',content);
content = sprintf('%s\n	.SetCFIEAlpha "0.500000"',content);
content = sprintf('%s\n	.LowFrequencyStabilization "False"',content);
content = sprintf('%s\n	.LowFrequencyStabilizationML "True"',content);
content = sprintf('%s\n	.Multilayer "False"',content);
content = sprintf('%s\n	.SetiMoMACC_I "0.0001"',content);
content = sprintf('%s\n	.SetiMoMACC_M "0.0001"',content);
content = sprintf('%s\n	.DeembedExternalPorts "True"',content);
content = sprintf('%s\n	.SetOpenBC_XY "True"',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define frequency domain solver parameters',content);
end
%--------------------------------------------
% FUNCTION:- define boundaries symm
%--------------------------------------------
function status = f_define_boundaries_symm_N66(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nWith Boundary',content);
content = sprintf('%s\n	.Xsymmetry "magnetic"',content);
content = sprintf('%s\n	.Ysymmetry "electric"',content);
content = sprintf('%s\n	.Zsymmetry "none"',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define boundaries symm',content);
end
%--------------------------------------------
% FUNCTION:- change solver type
%--------------------------------------------
function status = f_change_solver_type_N67(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nChangeSolverType "HF Frequency Domain"',content);
status = oMWS.invoke('AddToHistory','change solver type',content);
end
%--------------------------------------------
% FUNCTION:- clear picks
%--------------------------------------------
function status = f_clear_picks_N68(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.6|23.0.0|20140115[/VERSION]',content);
content = sprintf('%s\nPick.ClearAllPicks',content);
status = oMWS.invoke('AddToHistory','clear picks',content);
end
%--------------------------------------------
% FUNCTION:- set mesh properties (for backward compatibility)
%--------------------------------------------
function status = f_set_mesh_properties_for_backward_compatibility_N69(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2014.3|23.0.0|20140703[/VERSION]',content);
content = sprintf('%s\nWith MeshSettings',content);
content = sprintf('%s\n     .SetMeshType "Hex"',content);
content = sprintf('%s\n     .Set "Version", 0%',content);
content = sprintf('%s\n     .SetMeshType "Srf"',content);
content = sprintf('%s\n     .Set "Version", 0%',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith MeshSettings ',content);
content = sprintf('%s\n    .SetMeshType "Tet"',content);
content = sprintf('%s\n    .Set "UseSurfaceMesh3DGradation", False',content);
content = sprintf('%s\nEnd With ',content);
status = oMWS.invoke('AddToHistory','set mesh properties (for backward compatibility)',content);
end
%--------------------------------------------
% FUNCTION:- define frequency domain solver parameters
%--------------------------------------------
function status = f_define_frequency_domain_solver_parameters_N70(oMWS,NfreqAdapt,NfreqAnal)
content = [];
content = sprintf('%s\n''[VERSION]2014.3|23.0.0|20140703[/VERSION]',content);
content = sprintf('%s\nMesh.SetCreator "High Frequency" ',content);
content = sprintf('%s\nWith FDSolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .SetMethod "Tetrahedral", "Discrete samples only" ',content);
content = sprintf('%s\n     .OrderTet "Second" ',content);
content = sprintf('%s\n     .OrderSrf "First" ',content);
content = sprintf('%s\n     .Stimulation "List", "List" ',content);
content = sprintf('%s\n     .ResetExcitationList ',content);
content = sprintf('%s\n     .AddToExcitationList "1", "1" ',content);
content = sprintf('%s\n     .AutoNormImpedance "False" ',content);
content = sprintf('%s\n     .NormingImpedance "50" ',content);
content = sprintf('%s\n     .ModesOnly "False" ',content);
content = sprintf('%s\n     .ConsiderPortLossesTet "True" ',content);
content = sprintf('%s\n     .SetShieldAllPorts "False" ',content);
content = sprintf('%s\n     .AccuracyHex "1e-6" ',content);
content = sprintf('%s\n     .AccuracyTet "1e-06" ',content);
content = sprintf('%s\n     .AccuracySrf "1e-3" ',content);
content = sprintf('%s\n     .LimitIterations "False" ',content);
content = sprintf('%s\n     .MaxIterations "0" ',content);
content = sprintf('%s\n     .SetCalculateExcitationsInParallel "True", "False", "" ',content);
content = sprintf('%s\n     .StoreAllResults "False" ',content);
content = sprintf('%s\n     .StoreResultsInCache "False" ',content);
content = sprintf('%s\n     .UseHelmholtzEquation "True" ',content);
content = sprintf('%s\n     .LowFrequencyStabilization "True" ',content);
content = sprintf('%s\n     .Type "Auto" ',content);
content = sprintf('%s\n     .MeshAdaptionHex "True" ',content);
content = sprintf('%s\n     .MeshAdaptionTet "True" ',content);
content = sprintf('%s\n     .AcceleratedRestart "True" ',content);
content = sprintf('%s\n     .FreqDistAdaptMode "Distributed" ',content);
content = sprintf('%s\n     .NewIterativeSolver "True" ',content);
content = sprintf('%s\n     .TDCompatibleMaterials "False" ',content);
content = sprintf('%s\n     .ExtrudeOpenBC "False" ',content);
content = sprintf('%s\n     .SetOpenBCTypeHex "Default" ',content);
content = sprintf('%s\n     .SetOpenBCTypeTet "Default" ',content);
content = sprintf('%s\n     .AddMonitorSamples "True" ',content);
content = sprintf('%s\n     .CalcStatBField "False" ',content);
content = sprintf('%s\n     .CalcPowerLoss "True" ',content);
content = sprintf('%s\n     .CalcPowerLossPerComponent "False" ',content);
content = sprintf('%s\n     .StoreSolutionCoefficients "True" ',content);
content = sprintf('%s\n     .UseDoublePrecision "False" ',content);
content = sprintf('%s\n     .UseDoublePrecision_ML "True" ',content);
content = sprintf('%s\n     .MixedOrderSrf "False" ',content);
content = sprintf('%s\n     .MixedOrderTet "False" ',content);
content = sprintf('%s\n     .PreconditionerAccuracyIntEq "0.15" ',content);
content = sprintf('%s\n     .MLFMMAccuracy "Default" ',content);
content = sprintf('%s\n     .MinMLFMMBoxSize "0.20" ',content);
content = sprintf('%s\n     .UseCFIEForCPECIntEq "true" ',content);
content = sprintf('%s\n     .UseFastRCSSweepIntEq "true" ',content);
content = sprintf('%s\n     .UseSensitivityAnalysis "False" ',content);
content = sprintf('%s\n     .SweepErrorThreshold "True", "0.01" ',content);
content = sprintf('%s\n     .SweepErrorChecks "2" ',content);
content = sprintf('%s\n     .SweepMinimumSamples "3" ',content);
content = sprintf('%s\n     .SweepConsiderAll "True" ',content);
content = sprintf('%s\n     .SweepConsiderReset ',content);
content = sprintf('%s\n     .SetNumberOfResultDataSamples "1001" ',content);
content = sprintf('%s\n     .SweepWeightEvanescent "1.0" ',content);
content = sprintf('%s\n     .AccuracyROM "1e-4" ',content);
content = sprintf('%s\n     .AddSampleInterval "104", "104", "NfreqAdapt", "Equidistant", "True" ',content);
content = sprintf('%s\n     .AddSampleInterval "75", "110", "NfreqAnal", "Equidistant", "False" ',content);
content = sprintf('%s\n     .MPIParallelization "False"',content);
content = sprintf('%s\n     .UseDistributedComputing "False"',content);
content = sprintf('%s\n     .NetworkComputingStrategy "RunRemote"',content);
content = sprintf('%s\n     .NetworkComputingJobCount "3"',content);
content = sprintf('%s\n     .LimitCPUs "True"',content);
content = sprintf('%s\n     .MaxCPUs "32"',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith IESolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .UseFastFrequencySweep "True" ',content);
content = sprintf('%s\n     .UseIEGroundPlane "False" ',content);
content = sprintf('%s\n     .PreconditionerType "Auto" ',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith IESolver',content);
content = sprintf('%s\n     .SetFMMFFCalcStopLevel "0" ',content);
content = sprintf('%s\n     .SetFMMFFCalcNumInterpPoints "6" ',content);
content = sprintf('%s\n     .UseFMMFarfieldCalc "True" ',content);
content = sprintf('%s\n     .SetCFIEAlpha "0.500000" ',content);
content = sprintf('%s\n     .LowFrequencyStabilization "False" ',content);
content = sprintf('%s\n     .LowFrequencyStabilizationML "True" ',content);
content = sprintf('%s\n     .Multilayer "False" ',content);
content = sprintf('%s\n     .SetiMoMACC_I "0.0001" ',content);
content = sprintf('%s\n     .SetiMoMACC_M "0.0001" ',content);
content = sprintf('%s\n     .DeembedExternalPorts "True" ',content);
content = sprintf('%s\n     .SetOpenBC_XY "True" ',content);
content = sprintf('%s\n     .OldRCSSweepDefintion "True" ',content);
content = sprintf('%s\n     .SetAccuracySetting "Custom" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define frequency domain solver parameters',content);
end
%--------------------------------------------
% FUNCTION:- modify port: 1
%--------------------------------------------
function status = f_modify_port_1_N71(oMWS,numModesIn)
content = [];
content = sprintf('%s\n''[VERSION]2014.3|23.0.0|20140703[/VERSION]',content);
content = sprintf('%s\nWith Port ',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .LoadContentForModify "1" ',content);
content = sprintf('%s\n     .Label "" ',content);
content = sprintf('%s\n     .NumberOfModes "numModesIn" ',content);
content = sprintf('%s\n     .AdjustPolarization "False" ',content);
content = sprintf('%s\n     .PolarizationAngle "0.0" ',content);
content = sprintf('%s\n     .ReferencePlaneDistance "0" ',content);
content = sprintf('%s\n     .TextSize "50" ',content);
content = sprintf('%s\n     .Coordinates "Picks" ',content);
content = sprintf('%s\n     .Orientation "positive" ',content);
content = sprintf('%s\n     .PortOnBound "False" ',content);
content = sprintf('%s\n     .ClipPickedPortToBound "False" ',content);
content = sprintf('%s\n     .Xrange "-1.31", "1.31" ',content);
content = sprintf('%s\n     .Yrange "-1.31", "1.31" ',content);
content = sprintf('%s\n     .Zrange "0", "0" ',content);
content = sprintf('%s\n     .XrangeAdd "0", "0" ',content);
content = sprintf('%s\n     .YrangeAdd "0", "0" ',content);
content = sprintf('%s\n     .ZrangeAdd "0.0", "0.0" ',content);
content = sprintf('%s\n     .SingleEnded "False" ',content);
content = sprintf('%s\n     .Shield "none" ',content);
content = sprintf('%s\n     .Modify ',content);
content = sprintf('%s\nEnd With ',content);
status = oMWS.invoke('AddToHistory','modify port: 1',content);
end
%--------------------------------------------
% FUNCTION:- modify port: 2
%--------------------------------------------
function status = f_modify_port_2_N72(oMWS,numModesOut)
content = [];
content = sprintf('%s\n''[VERSION]2014.3|23.0.0|20140703[/VERSION]',content);
content = sprintf('%s\nWith Port ',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .LoadContentForModify "2" ',content);
content = sprintf('%s\n     .Label "" ',content);
content = sprintf('%s\n     .NumberOfModes "numModesOut" ',content);
content = sprintf('%s\n     .AdjustPolarization "False" ',content);
content = sprintf('%s\n     .PolarizationAngle "0.0" ',content);
content = sprintf('%s\n     .ReferencePlaneDistance "0" ',content);
content = sprintf('%s\n     .TextSize "50" ',content);
content = sprintf('%s\n     .Coordinates "Picks" ',content);
content = sprintf('%s\n     .Orientation "positive" ',content);
content = sprintf('%s\n     .PortOnBound "False" ',content);
content = sprintf('%s\n     .ClipPickedPortToBound "False" ',content);
content = sprintf('%s\n     .Xrange "-1.31", "1.31" ',content);
content = sprintf('%s\n     .Yrange "-1.31", "1.31" ',content);
content = sprintf('%s\n     .Zrange "25", "25" ',content);
content = sprintf('%s\n     .XrangeAdd "0", "0" ',content);
content = sprintf('%s\n     .YrangeAdd "0", "0" ',content);
content = sprintf('%s\n     .ZrangeAdd "0.0", "0.0" ',content);
content = sprintf('%s\n     .SingleEnded "False" ',content);
content = sprintf('%s\n     .Shield "none" ',content);
content = sprintf('%s\n     .Modify ',content);
content = sprintf('%s\nEnd With ',content);
status = oMWS.invoke('AddToHistory','modify port: 2',content);
end
%--------------------------------------------
% FUNCTION:- define frequency range
%--------------------------------------------
function status = f_define_frequency_range_N73(oMWS,fMax,fMin)
content = [];
content = sprintf('%s\n''[VERSION]2014.3|23.0.0|20140703[/VERSION]',content);
content = sprintf('%s\nSolver.FrequencyRange "fMin", "fMax" ',content);
content = sprintf('%s\n',content);
status = oMWS.invoke('AddToHistory','define frequency range',content);
end
