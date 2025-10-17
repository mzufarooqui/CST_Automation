function f_COM_EM_AT_CircWg2RctWgTr_PerTrasferimento_2014(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgH3,delta_wgR,lIN1,lIN2,lIN3,wgA1,wgA2,wgA3,wgA4,wgB1,wgB2,wgB3,wgB4,wgD1,wgD2,wgD3,wgH1,wgH2,wgH3,wgR,wgR1,wgS1)
namelengthmax=100;
%-- use template: Filter (Waveguide)
f_use_template_Filter_Waveguide_N1(oMWS);

%-- define cylinder: CircWg2RctWgTr:CIRCWG_01
f_define_cylinder_CircWg2RctWgTr_CIRCWG_01_N2(oMWS,lIN1,wgR);

%-- define cylinder: CircWg2RctWgTr:CIRCWG_02
f_define_cylinder_CircWg2RctWgTr_CIRCWG_02_N3(oMWS,delta_wgR,lIN1,wgB1,wgR);

%-- define cylinder: CircWg2RctWgTr:CIRCWG_03
f_define_cylinder_CircWg2RctWgTr_CIRCWG_03_N4(oMWS,lIN1,lIN2,wgB1,wgR);

%-- boolean add shapes: CircWg2RctWgTr:CIRCWG_01:CircWg2RctWgTr:CIRCWG_02
f_boolean_add_shapes_CircWg2RctWgTr_CIRCWG_01_CircWg2Rc_N5(oMWS);

%-- boolean add shapes: CircWg2RctWgTr:CIRCWG_01:CircWg2RctWgTr:CIRCWG_03
f_boolean_add_shapes_CircWg2RctWgTr_CIRCWG_01_CircWg2Rc_N6(oMWS);

%-- rename component: CircWg2RctWgTr:CIRCWG_01 to: CircWg2RctWgTr:CIRCWG
f_rename_component_CircWg2RctWgTr_CIRCWG_01_to_CircWg2R_N7(oMWS);

%-- define brick: CircWg2RctWgTr:RECTWG_01
f_define_brick_CircWg2RctWgTr_RECTWG_01_N8(oMWS,Lwk2,lIN1,wgB1,wgR,wgA1);

%-- define brick: CircWg2RctWgTr:RECTWG_02
f_define_brick_CircWg2RctWgTr_RECTWG_02_N9(oMWS,Lwk2,Lwk3,lIN1,wgB1,wgR,wgB2,wgA2);

%-- define brick: CircWg2RctWgTr:RECTWG_03
f_define_brick_CircWg2RctWgTr_RECTWG_03_N10(oMWS,Lwk2,Lwk3,Lwk4,lIN1,wgB1,wgR,wgB3,wgA3);

%-- define brick: CircWg2RctWgTr:RECTWG_04
f_define_brick_CircWg2RctWgTr_RECTWG_04_N11(oMWS,Lwk2,Lwk3,Lwk4,lIN1,lIN3,wgA4,wgB1,wgB4,wgR);

%-- boolean add shapes: CircWg2RctWgTr:RECTWG_01:CircWg2RctWgTr:RECTWG_02
f_boolean_add_shapes_CircWg2RctWgTr_RECTWG_01_CircWg2Rc_N12(oMWS);

%-- boolean add shapes: CircWg2RctWgTr:RECTWG_01:CircWg2RctWgTr:RECTWG_03
f_boolean_add_shapes_CircWg2RctWgTr_RECTWG_01_CircWg2Rc_N13(oMWS);

%-- boolean add shapes: CircWg2RctWgTr:RECTWG_01:CircWg2RctWgTr:RECTWG_04
f_boolean_add_shapes_CircWg2RctWgTr_RECTWG_01_CircWg2Rc_N14(oMWS);

%-- rename component: CircWg2RctWgTr:RECTWG_01 to: CircWg2RctWgTr:RECTWG
f_rename_component_CircWg2RctWgTr_RECTWG_01_to_CircWg2R_N15(oMWS);

%-- transform: rotate CircWg2RctWgTr:RECTWG
f_transform_rotate_CircWg2RctWgTr_RECTWG_N16(oMWS);

%-- boolean add shapes: CircWg2RctWgTr:RECTWG:CircWg2RctWgTr:RECTWG_1
f_boolean_add_shapes_CircWg2RctWgTr_RECTWG_CircWg2RctWg_N17(oMWS);

%-- transform: rotate CircWg2RctWgTr:RECTWG
f_transform_rotate_CircWg2RctWgTr_RECTWG_N18(oMWS);

%-- boolean add shapes: CircWg2RctWgTr:RECTWG:CircWg2RctWgTr:RECTWG_1
f_boolean_add_shapes_CircWg2RctWgTr_RECTWG_CircWg2RctWg_N19(oMWS);

%-- define brick: CircWg2RctWgTr:RIDGE_01
f_define_brick_CircWg2RctWgTr_RIDGE_01_N20(oMWS,Lwk1,Lwk2,lIN1,wgD1,wgR,wgH1);

%-- define brick: CircWg2RctWgTr:RIDGE_02
f_define_brick_CircWg2RctWgTr_RIDGE_02_N21(oMWS,Lwk2,Lwk3,lIN1,wgB1,wgR,wgB2,wgD2,wgH2);

%-- boolean add shapes: CircWg2RctWgTr:RIDGE_01:CircWg2RctWgTr:RIDGE_02
f_boolean_add_shapes_CircWg2RctWgTr_RIDGE_01_CircWg2Rct_N22(oMWS);

%-- define brick: CircWg2RctWgTr:RIDGE_03
f_define_brick_CircWg2RctWgTr_RIDGE_03_N23(oMWS,Lwk2,Lwk3,Lwk4,lIN1,wgB1,wgR,wgB3,wgD3,wgH3);

%-- boolean add shapes: CircWg2RctWgTr:RIDGE_01:CircWg2RctWgTr:RIDGE_03
f_boolean_add_shapes_CircWg2RctWgTr_RIDGE_01_CircWg2Rct_N24(oMWS);

%-- rename component: CircWg2RctWgTr:RIDGE_01 to: CircWg2RctWgTr:RIDGE
f_rename_component_CircWg2RctWgTr_RIDGE_01_to_CircWg2Rc_N25(oMWS);

%-- transform: rotate CircWg2RctWgTr:RIDGE
f_transform_rotate_CircWg2RctWgTr_RIDGE_N26(oMWS);

%-- boolean add shapes: CircWg2RctWgTr:RIDGE:CircWg2RctWgTr:RIDGE_1
f_boolean_add_shapes_CircWg2RctWgTr_RIDGE_CircWg2RctWgT_N27(oMWS);

%-- transform: rotate CircWg2RctWgTr:RIDGE
f_transform_rotate_CircWg2RctWgTr_RIDGE_N28(oMWS);

%-- boolean add shapes: CircWg2RctWgTr:RIDGE:CircWg2RctWgTr:RIDGE_1
f_boolean_add_shapes_CircWg2RctWgTr_RIDGE_CircWg2RctWgT_N29(oMWS);

%-- boolean add shapes: CircWg2RctWgTr:CIRCWG:CircWg2RctWgTr:RECTWG
f_boolean_add_shapes_CircWg2RctWgTr_CIRCWG_CircWg2RctWg_N30(oMWS);

%-- boolean subtract shapes: CircWg2RctWgTr:CIRCWG:CircWg2RctWgTr:RIDGE
f_boolean_subtract_shapes_CircWg2RctWgTr_CIRCWG_CircWg2_N31(oMWS);

%-- rename component: CircWg2RctWgTr:CIRCWG to: CircWg2RctWgTr:ParteInterna
f_rename_component_CircWg2RctWgTr_CIRCWG_to_CircWg2RctW_N32(oMWS);

%-- define cylinder: CircWg2RctWgTr:CIRCWG_01
f_define_cylinder_CircWg2RctWgTr_CIRCWG_01_N33(oMWS,LwkR1,lIN1,wgB1,wgR);

%-- boolean subtract shapes: CircWg2RctWgTr:ParteInterna:CircWg2RctWgTr:CIRCWG_01
f_boolean_subtract_shapes_CircWg2RctWgTr_ParteInterna_C_N34(oMWS);

%-- define cylinder: CircWg2RctWgTr:CIRCWG_01
f_define_cylinder_CircWg2RctWgTr_CIRCWG_01_N35(oMWS,LwkR1,lIN1,wgB1,wgR,wgR1);

%-- boolean add shapes: CircWg2RctWgTr:ParteInterna:CircWg2RctWgTr:CIRCWG_01
f_boolean_add_shapes_CircWg2RctWgTr_ParteInterna_CircWg_N36(oMWS);

%-- define MeshAdaption3D
f_define_MeshAdaption3D_N37(oMWS);

%-- activate global coordinates
f_activate_global_coordinates_N38(oMWS);

%-- define port: 1
f_define_port_1_N39(oMWS,wgR);

%-- define port: 2
f_define_port_2_N40(oMWS,lIN1,lIN2,wgB1,wgR);

%-- define port: 3
f_define_port_3_N41(oMWS,Lwk2,Lwk3,Lwk4,lIN1,lIN3,wgA4,wgB1,wgB4,wgR);

%-- define port: 4
f_define_port_4_N42(oMWS,Lwk2,Lwk3,Lwk4,lIN1,lIN3,wgA4,wgB1,wgB4,wgR);

%-- define boundaries symm
f_define_boundaries_symm_N43(oMWS);

%-- Solver
f_Solver_N44(oMWS);

%-- activate global coordinates
f_activate_global_coordinates_N45(oMWS);

%-- define automesh parameters
f_define_automesh_parameters_N46(oMWS);

%-- set mesh properties
f_set_mesh_properties_N47(oMWS);

%-- define frequency domain solver parameters
f_define_frequency_domain_solver_parameters_N48(oMWS);

%-- define MeshAdaption3D
f_define_MeshAdaption3D_N49(oMWS);

%-- set mesh properties
f_set_mesh_properties_N50(oMWS);

%-- switch working plane
f_switch_working_plane_N51(oMWS);

%-- change solver type
f_change_solver_type_N52(oMWS);

%-- set 3d mesh adaptation properties
f_set_3d_mesh_adaptation_properties_N53(oMWS);

%-- define frequency domain solver parameters
f_define_frequency_domain_solver_parameters_N54(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N55(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgH2,delta_wgH3,wgH3);

%-- set optimizer settings
f_set_optimizer_settings_N56(oMWS);

%-- define frequency domain solver parameters
f_define_frequency_domain_solver_parameters_N57(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N58(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgH2,delta_wgH3,wgH3);

%-- set optimizer settings
f_set_optimizer_settings_N59(oMWS);

%-- add optimizer goals: 1DC Primary Result / 0
f_add_optimizer_goals_1DC_Primary_Result__0_N60(oMWS);

%-- add optimizer goals: 1DC Primary Result / 1
f_add_optimizer_goals_1DC_Primary_Result__1_N61(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N62(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgH2,delta_wgH3,wgH3);

%-- set optimizer settings
f_set_optimizer_settings_N63(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N64(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgH2,delta_wgH3,wgH3);

%-- set optimizer settings
f_set_optimizer_settings_N65(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N66(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N67(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N68(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgH2,delta_wgH3,wgH3);

%-- set optimizer settings
f_set_optimizer_settings_N69(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N70(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgH2,delta_wgH3,wgH3);

%-- set optimizer settings
f_set_optimizer_settings_N71(oMWS);

%-- set optimizer goals 1DC Primary Result / 0
f_set_optimizer_goals_1DC_Primary_Result__0_N72(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N73(oMWS);

%-- set optimizer goals 1DC Primary Result / 0
f_set_optimizer_goals_1DC_Primary_Result__0_N74(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N75(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N76(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N77(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N78(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N79(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N80(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N81(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N82(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N83(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N84(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N85(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N86(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N87(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N88(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N89(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N90(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N91(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N92(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N93(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N94(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N95(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N96(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N97(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N98(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N99(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N100(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N101(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N102(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N103(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N104(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N105(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N106(oMWS);

%-- set optimizer goals 1DC Primary Result / 0
f_set_optimizer_goals_1DC_Primary_Result__0_N107(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N108(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N109(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N110(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N111(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N112(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N113(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N114(oMWS);

%-- set optimizer goals 1DC Primary Result / 0
f_set_optimizer_goals_1DC_Primary_Result__0_N115(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N116(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N117(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N118(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N119(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N120(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N121(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N122(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N123(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N124(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N125(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N126(oMWS);

%-- set mesh properties
f_set_mesh_properties_N127(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N128(oMWS);

%-- set mesh properties
f_set_mesh_properties_N129(oMWS);

%-- set 3d mesh adaptation properties
f_set_3d_mesh_adaptation_properties_N130(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N131(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N132(oMWS);

%-- define frequency domain solver parameters
f_define_frequency_domain_solver_parameters_N133(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N134(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N135(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N136(oMWS);

%-- set mesh properties
f_set_mesh_properties_N137(oMWS);

%-- set 3d mesh adaptation properties
f_set_3d_mesh_adaptation_properties_N138(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N139(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N140(oMWS);

%-- set optimizer goals 1DC Primary Result / 0
f_set_optimizer_goals_1DC_Primary_Result__0_N141(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N142(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N143(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N144(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N145(oMWS);

%-- set mesh properties
f_set_mesh_properties_N146(oMWS);

%-- set 3d mesh adaptation properties
f_set_3d_mesh_adaptation_properties_N147(oMWS);

%-- set mesh properties
f_set_mesh_properties_N148(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N149(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N150(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N151(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N152(oMWS);

%-- set mesh properties
f_set_mesh_properties_N153(oMWS);

%-- define frequency domain solver parameters
f_define_frequency_domain_solver_parameters_N154(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N155(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N156(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N157(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N158(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N159(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N160(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N161(oMWS);

%-- define frequency domain solver parameters
f_define_frequency_domain_solver_parameters_N162(oMWS);

%-- set 3d mesh adaptation properties
f_set_3d_mesh_adaptation_properties_N163(oMWS);

%-- define frequency domain solver parameters
f_define_frequency_domain_solver_parameters_N164(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N165(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N166(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N167(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N168(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N169(oMWS);

%-- set 3d mesh adaptation properties
f_set_3d_mesh_adaptation_properties_N170(oMWS);

%-- set mesh properties
f_set_mesh_properties_N171(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N172(oMWS);

%-- define frequency domain solver parameters
f_define_frequency_domain_solver_parameters_N173(oMWS);

%-- modify port: 1
f_modify_port_1_N174(oMWS,wgR);

%-- modify port: 2
f_modify_port_2_N175(oMWS,lIN1,lIN2,wgB1,wgR);

%-- set optimizer settings
f_set_optimizer_settings_N176(oMWS);

%-- delete all optimizer goals
f_delete_all_optimizer_goals_N177(oMWS);

%-- add optimizer goals: 1DC Primary Result / 0
f_add_optimizer_goals_1DC_Primary_Result__0_N178(oMWS);

%-- add optimizer goals: 1DC Primary Result / 1
f_add_optimizer_goals_1DC_Primary_Result__1_N179(oMWS);

%-- add optimizer goals: 1DC Primary Result / 2
f_add_optimizer_goals_1DC_Primary_Result__2_N180(oMWS);

%-- add optimizer goals: 1DC Primary Result / 3
f_add_optimizer_goals_1DC_Primary_Result__3_N181(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N182(oMWS);

%-- define frequency domain solver parameters
f_define_frequency_domain_solver_parameters_N183(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N184(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N185(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N186(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N187(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N188(oMWS);

%-- set optimizer parameters
f_set_optimizer_parameters_N189(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2);

%-- set optimizer settings
f_set_optimizer_settings_N190(oMWS);

%-- set optimizer goals 1DC Primary Result / 1
f_set_optimizer_goals_1DC_Primary_Result__1_N191(oMWS);

%-- set optimizer settings
f_set_optimizer_settings_N192(oMWS);

%-- set mesh properties (for backward compatibility)
f_set_mesh_properties_for_backward_compatibility_N193(oMWS);

end
%--------------------------------------------
% FUNCTION:- use template: Filter (Waveguide)
%--------------------------------------------
function status = f_use_template_Filter_Waveguide_N1(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\n'' Template for Waveguide Filter',content);
content = sprintf('%s\n'' =============================',content);
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
content = sprintf('%s\n'' increase maximum number of pulses to simulation (resonant structure)',content);
content = sprintf('%s\n'' use Online AR Filter',content);
content = sprintf('%s\nWith Solver ',content);
content = sprintf('%s\n     .NumberOfPulseWidths "50" ',content);
content = sprintf('%s\n     .UseArfilter "True"',content);
content = sprintf('%s\nEnd With ',content);
content = sprintf('%s\n'' optimize mesh for filter structures',content);
content = sprintf('%s\nWith Mesh ',content);
content = sprintf('%s\n     .RatioLimit "20" ',content);
content = sprintf('%s\n     .AutomeshRefineAtPecLines "True", "6"',content);
content = sprintf('%s\nEnd With ',content);
content = sprintf('%s\nMeshSettings.SetMeshType "HexTLM" ',content);
content = sprintf('%s\nWith MeshSettings ',content);
content = sprintf('%s\n     .Set "RatioLimitGeometry", "20" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','use template: Filter (Waveguide)',content);
end
%--------------------------------------------
% FUNCTION:- define cylinder: CircWg2RctWgTr:CIRCWG_01
%--------------------------------------------
function status = f_define_cylinder_CircWg2RctWgTr_CIRCWG_01_N2(oMWS,lIN1,wgR)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Cylinder',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "CIRCWG_01"',content);
content = sprintf('%s\n	.Component "CircWg2RctWgTr"',content);
content = sprintf('%s\n	.Material "Vacuum"',content);
content = sprintf('%s\n	.Axis "Z"',content);
content = sprintf('%s\n	.Outerradius "wgR"',content);
content = sprintf('%s\n	.Innerradius "0"',content);
content = sprintf('%s\n	.Xcenter "0"',content);
content = sprintf('%s\n	.Ycenter "0"',content);
content = sprintf('%s\n	.Zcenter "0"',content);
content = sprintf('%s\n	.Zrange "0", "lIN1"',content);
content = sprintf('%s\n	.Segments "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define cylinder: CircWg2RctWgTr:CIRCWG_01',content);
end
%--------------------------------------------
% FUNCTION:- define cylinder: CircWg2RctWgTr:CIRCWG_02
%--------------------------------------------
function status = f_define_cylinder_CircWg2RctWgTr_CIRCWG_02_N3(oMWS,delta_wgR,lIN1,wgB1,wgR)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Cylinder',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "CIRCWG_02"',content);
content = sprintf('%s\n	.Component "CircWg2RctWgTr"',content);
content = sprintf('%s\n	.Material "Vacuum"',content);
content = sprintf('%s\n	.Axis "Z"',content);
content = sprintf('%s\n	.Outerradius "wgR+delta_wgR"',content);
content = sprintf('%s\n	.Innerradius "0"',content);
content = sprintf('%s\n	.Xcenter "0"',content);
content = sprintf('%s\n	.Ycenter "0"',content);
content = sprintf('%s\n	.Zcenter "0"',content);
content = sprintf('%s\n	.Zrange "lIN1", "lIN1+wgB1"',content);
content = sprintf('%s\n	.Segments "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define cylinder: CircWg2RctWgTr:CIRCWG_02',content);
end
%--------------------------------------------
% FUNCTION:- define cylinder: CircWg2RctWgTr:CIRCWG_03
%--------------------------------------------
function status = f_define_cylinder_CircWg2RctWgTr_CIRCWG_03_N4(oMWS,lIN1,lIN2,wgB1,wgR)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Cylinder',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "CIRCWG_03"',content);
content = sprintf('%s\n	.Component "CircWg2RctWgTr"',content);
content = sprintf('%s\n	.Material "Vacuum"',content);
content = sprintf('%s\n	.Axis "Z"',content);
content = sprintf('%s\n	.Outerradius "wgR"',content);
content = sprintf('%s\n	.Innerradius "0"',content);
content = sprintf('%s\n	.Xcenter "0"',content);
content = sprintf('%s\n	.Ycenter "0"',content);
content = sprintf('%s\n	.Zcenter "0"',content);
content = sprintf('%s\n	.Zrange "lIN1+wgB1", "lIN1+wgB1+lIN2"',content);
content = sprintf('%s\n	.Segments "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define cylinder: CircWg2RctWgTr:CIRCWG_03',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: CircWg2RctWgTr:CIRCWG_01:CircWg2RctWgTr:CIRCWG_02
%--------------------------------------------
function status = f_boolean_add_shapes_CircWg2RctWgTr_CIRCWG_01_CircWg2Rc_N5(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "CircWg2RctWgTr:CIRCWG_01", "CircWg2RctWgTr:CIRCWG_02"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: CircWg2RctWgTr:CIRCWG_01:CircWg2RctWgTr:CIRCWG_02',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: CircWg2RctWgTr:CIRCWG_01:CircWg2RctWgTr:CIRCWG_03
%--------------------------------------------
function status = f_boolean_add_shapes_CircWg2RctWgTr_CIRCWG_01_CircWg2Rc_N6(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "CircWg2RctWgTr:CIRCWG_01", "CircWg2RctWgTr:CIRCWG_03"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: CircWg2RctWgTr:CIRCWG_01:CircWg2RctWgTr:CIRCWG_03',content);
end
%--------------------------------------------
% FUNCTION:- rename component: CircWg2RctWgTr:CIRCWG_01 to: CircWg2RctWgTr:CIRCWG
%--------------------------------------------
function status = f_rename_component_CircWg2RctWgTr_CIRCWG_01_to_CircWg2R_N7(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nSolid.Rename "CircWg2RctWgTr:CIRCWG_01", "CIRCWG"',content);
status = oMWS.invoke('AddToHistory','rename component: CircWg2RctWgTr:CIRCWG_01 to: CircWg2RctWgTr:CIRCWG',content);
end
%--------------------------------------------
% FUNCTION:- define brick: CircWg2RctWgTr:RECTWG_01
%--------------------------------------------
function status = f_define_brick_CircWg2RctWgTr_RECTWG_01_N8(oMWS,Lwk2,lIN1,wgB1,wgR,wgA1)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Brick',content);
content = sprintf('%s\n.Reset',content);
content = sprintf('%s\n.Name "RECTWG_01"',content);
content = sprintf('%s\n.Component "CircWg2RctWgTr"',content);
content = sprintf('%s\n.Material "Vacuum"',content);
content = sprintf('%s\n.Xrange "-wgA1/2", "wgA1/2"',content);
content = sprintf('%s\n.Yrange "0", "(wgR+Lwk2)"',content);
content = sprintf('%s\n.Zrange "lIN1", "lIN1+wgB1"',content);
content = sprintf('%s\n.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define brick: CircWg2RctWgTr:RECTWG_01',content);
end
%--------------------------------------------
% FUNCTION:- define brick: CircWg2RctWgTr:RECTWG_02
%--------------------------------------------
function status = f_define_brick_CircWg2RctWgTr_RECTWG_02_N9(oMWS,Lwk2,Lwk3,lIN1,wgB1,wgR,wgB2,wgA2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Brick',content);
content = sprintf('%s\n.Reset',content);
content = sprintf('%s\n.Name "RECTWG_02"',content);
content = sprintf('%s\n.Component "CircWg2RctWgTr"',content);
content = sprintf('%s\n.Material "Vacuum"',content);
content = sprintf('%s\n.Xrange "-wgA2/2", "wgA2/2"',content);
content = sprintf('%s\n.Yrange "(wgR+Lwk2)", "(wgR+Lwk2+Lwk3)"',content);
content = sprintf('%s\n.Zrange "lIN1+wgB1-wgB2", "lIN1+wgB1"',content);
content = sprintf('%s\n.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define brick: CircWg2RctWgTr:RECTWG_02',content);
end
%--------------------------------------------
% FUNCTION:- define brick: CircWg2RctWgTr:RECTWG_03
%--------------------------------------------
function status = f_define_brick_CircWg2RctWgTr_RECTWG_03_N10(oMWS,Lwk2,Lwk3,Lwk4,lIN1,wgB1,wgR,wgB3,wgA3)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Brick',content);
content = sprintf('%s\n.Reset',content);
content = sprintf('%s\n.Name "RECTWG_03"',content);
content = sprintf('%s\n.Component "CircWg2RctWgTr"',content);
content = sprintf('%s\n.Material "Vacuum"',content);
content = sprintf('%s\n.Xrange "-wgA3/2", "wgA3/2"',content);
content = sprintf('%s\n.Yrange "(wgR+Lwk2+Lwk3)", "(wgR+Lwk2+Lwk3+Lwk4)"',content);
content = sprintf('%s\n.Zrange "lIN1+wgB1-wgB3", "lIN1+wgB1"',content);
content = sprintf('%s\n.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define brick: CircWg2RctWgTr:RECTWG_03',content);
end
%--------------------------------------------
% FUNCTION:- define brick: CircWg2RctWgTr:RECTWG_04
%--------------------------------------------
function status = f_define_brick_CircWg2RctWgTr_RECTWG_04_N11(oMWS,Lwk2,Lwk3,Lwk4,lIN1,lIN3,wgA4,wgB1,wgB4,wgR)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Brick',content);
content = sprintf('%s\n.Reset',content);
content = sprintf('%s\n.Name "RECTWG_04"',content);
content = sprintf('%s\n.Component "CircWg2RctWgTr"',content);
content = sprintf('%s\n.Material "Vacuum"',content);
content = sprintf('%s\n.Xrange "-wgA4/2", "wgA4/2"',content);
content = sprintf('%s\n.Yrange "(wgR+Lwk2+Lwk3+Lwk4)", "(wgR+Lwk2+Lwk3+Lwk4+lIN3)"',content);
content = sprintf('%s\n.Zrange "lIN1+wgB1-wgB4", "lIN1+wgB1"',content);
content = sprintf('%s\n.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define brick: CircWg2RctWgTr:RECTWG_04',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: CircWg2RctWgTr:RECTWG_01:CircWg2RctWgTr:RECTWG_02
%--------------------------------------------
function status = f_boolean_add_shapes_CircWg2RctWgTr_RECTWG_01_CircWg2Rc_N12(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "CircWg2RctWgTr:RECTWG_01", "CircWg2RctWgTr:RECTWG_02"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: CircWg2RctWgTr:RECTWG_01:CircWg2RctWgTr:RECTWG_02',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: CircWg2RctWgTr:RECTWG_01:CircWg2RctWgTr:RECTWG_03
%--------------------------------------------
function status = f_boolean_add_shapes_CircWg2RctWgTr_RECTWG_01_CircWg2Rc_N13(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "CircWg2RctWgTr:RECTWG_01", "CircWg2RctWgTr:RECTWG_03"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: CircWg2RctWgTr:RECTWG_01:CircWg2RctWgTr:RECTWG_03',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: CircWg2RctWgTr:RECTWG_01:CircWg2RctWgTr:RECTWG_04
%--------------------------------------------
function status = f_boolean_add_shapes_CircWg2RctWgTr_RECTWG_01_CircWg2Rc_N14(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "CircWg2RctWgTr:RECTWG_01", "CircWg2RctWgTr:RECTWG_04"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: CircWg2RctWgTr:RECTWG_01:CircWg2RctWgTr:RECTWG_04',content);
end
%--------------------------------------------
% FUNCTION:- rename component: CircWg2RctWgTr:RECTWG_01 to: CircWg2RctWgTr:RECTWG
%--------------------------------------------
function status = f_rename_component_CircWg2RctWgTr_RECTWG_01_to_CircWg2R_N15(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nSolid.Rename "CircWg2RctWgTr:RECTWG_01", "RECTWG"',content);
status = oMWS.invoke('AddToHistory','rename component: CircWg2RctWgTr:RECTWG_01 to: CircWg2RctWgTr:RECTWG',content);
end
%--------------------------------------------
% FUNCTION:- transform: rotate CircWg2RctWgTr:RECTWG
%--------------------------------------------
function status = f_transform_rotate_CircWg2RctWgTr_RECTWG_N16(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Transform',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "CircWg2RctWgTr:RECTWG"',content);
content = sprintf('%s\n	.Angle "0", "0", "180"',content);
content = sprintf('%s\n	.Origin "Free"',content);
content = sprintf('%s\n	.Center "0", "0", "0"',content);
content = sprintf('%s\n	.UsePickedPoints "False"',content);
content = sprintf('%s\n	.InvertPickedPoints "False"',content);
content = sprintf('%s\n	.MultipleObjects "True"',content);
content = sprintf('%s\n	.GroupObjects "False"',content);
content = sprintf('%s\n	.Repetitions "1"',content);
content = sprintf('%s\n	.MultipleSelection "False"',content);
content = sprintf('%s\n	.Destination ""',content);
content = sprintf('%s\n	.Material ""',content);
content = sprintf('%s\n	.Transform "Shape", "Rotate"',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','transform: rotate CircWg2RctWgTr:RECTWG',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: CircWg2RctWgTr:RECTWG:CircWg2RctWgTr:RECTWG_1
%--------------------------------------------
function status = f_boolean_add_shapes_CircWg2RctWgTr_RECTWG_CircWg2RctWg_N17(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "CircWg2RctWgTr:RECTWG", "CircWg2RctWgTr:RECTWG_1"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: CircWg2RctWgTr:RECTWG:CircWg2RctWgTr:RECTWG_1',content);
end
%--------------------------------------------
% FUNCTION:- transform: rotate CircWg2RctWgTr:RECTWG
%--------------------------------------------
function status = f_transform_rotate_CircWg2RctWgTr_RECTWG_N18(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Transform',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "CircWg2RctWgTr:RECTWG"',content);
content = sprintf('%s\n	.Angle "0", "0", "90"',content);
content = sprintf('%s\n	.Origin "Free"',content);
content = sprintf('%s\n	.Center "0", "0", "0"',content);
content = sprintf('%s\n	.UsePickedPoints "False"',content);
content = sprintf('%s\n	.InvertPickedPoints "False"',content);
content = sprintf('%s\n	.MultipleObjects "True"',content);
content = sprintf('%s\n	.GroupObjects "False"',content);
content = sprintf('%s\n	.Repetitions "1"',content);
content = sprintf('%s\n	.MultipleSelection "False"',content);
content = sprintf('%s\n	.Destination ""',content);
content = sprintf('%s\n	.Material ""',content);
content = sprintf('%s\n	.Transform "Shape", "Rotate"',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','transform: rotate CircWg2RctWgTr:RECTWG',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: CircWg2RctWgTr:RECTWG:CircWg2RctWgTr:RECTWG_1
%--------------------------------------------
function status = f_boolean_add_shapes_CircWg2RctWgTr_RECTWG_CircWg2RctWg_N19(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "CircWg2RctWgTr:RECTWG", "CircWg2RctWgTr:RECTWG_1"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: CircWg2RctWgTr:RECTWG:CircWg2RctWgTr:RECTWG_1',content);
end
%--------------------------------------------
% FUNCTION:- define brick: CircWg2RctWgTr:RIDGE_01
%--------------------------------------------
function status = f_define_brick_CircWg2RctWgTr_RIDGE_01_N20(oMWS,Lwk1,Lwk2,lIN1,wgD1,wgR,wgH1)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Brick',content);
content = sprintf('%s\n.Reset',content);
content = sprintf('%s\n.Name "RIDGE_01"',content);
content = sprintf('%s\n.Component "CircWg2RctWgTr"',content);
content = sprintf('%s\n.Material "PEC"',content);
content = sprintf('%s\n.Xrange "-wgD1/2", "wgD1/2"',content);
content = sprintf('%s\n.Yrange "(wgR-Lwk1)", "(wgR+Lwk2)"',content);
content = sprintf('%s\n.Zrange "lIN1", "lIN1+wgH1"',content);
content = sprintf('%s\n.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define brick: CircWg2RctWgTr:RIDGE_01',content);
end
%--------------------------------------------
% FUNCTION:- define brick: CircWg2RctWgTr:RIDGE_02
%--------------------------------------------
function status = f_define_brick_CircWg2RctWgTr_RIDGE_02_N21(oMWS,Lwk2,Lwk3,lIN1,wgB1,wgR,wgB2,wgD2,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Brick',content);
content = sprintf('%s\n.Reset',content);
content = sprintf('%s\n.Name "RIDGE_02"',content);
content = sprintf('%s\n.Component "CircWg2RctWgTr"',content);
content = sprintf('%s\n.Material "PEC"',content);
content = sprintf('%s\n.Xrange "-wgD2/2", "wgD2/2"',content);
content = sprintf('%s\n.Yrange "(wgR+Lwk2)", "(wgR+Lwk2+Lwk3)"',content);
content = sprintf('%s\n.Zrange "lIN1+wgB1-wgB2+wgH2", "lIN1+wgB1-wgB2"',content);
content = sprintf('%s\n.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define brick: CircWg2RctWgTr:RIDGE_02',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: CircWg2RctWgTr:RIDGE_01:CircWg2RctWgTr:RIDGE_02
%--------------------------------------------
function status = f_boolean_add_shapes_CircWg2RctWgTr_RIDGE_01_CircWg2Rct_N22(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "CircWg2RctWgTr:RIDGE_01", "CircWg2RctWgTr:RIDGE_02"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: CircWg2RctWgTr:RIDGE_01:CircWg2RctWgTr:RIDGE_02',content);
end
%--------------------------------------------
% FUNCTION:- define brick: CircWg2RctWgTr:RIDGE_03
%--------------------------------------------
function status = f_define_brick_CircWg2RctWgTr_RIDGE_03_N23(oMWS,Lwk2,Lwk3,Lwk4,lIN1,wgB1,wgR,wgB3,wgD3,wgH3)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Brick',content);
content = sprintf('%s\n.Reset',content);
content = sprintf('%s\n.Name "RIDGE_03"',content);
content = sprintf('%s\n.Component "CircWg2RctWgTr"',content);
content = sprintf('%s\n.Material "PEC"',content);
content = sprintf('%s\n.Xrange "-wgD3/2", "wgD3/2"',content);
content = sprintf('%s\n.Yrange "(wgR+Lwk2+Lwk3)", "(wgR+Lwk2+Lwk3+Lwk4)"',content);
content = sprintf('%s\n.Zrange "lIN1+wgB1-wgB3+wgH3", "lIN1+wgB1-wgB3"',content);
content = sprintf('%s\n.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define brick: CircWg2RctWgTr:RIDGE_03',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: CircWg2RctWgTr:RIDGE_01:CircWg2RctWgTr:RIDGE_03
%--------------------------------------------
function status = f_boolean_add_shapes_CircWg2RctWgTr_RIDGE_01_CircWg2Rct_N24(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "CircWg2RctWgTr:RIDGE_01", "CircWg2RctWgTr:RIDGE_03"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: CircWg2RctWgTr:RIDGE_01:CircWg2RctWgTr:RIDGE_03',content);
end
%--------------------------------------------
% FUNCTION:- rename component: CircWg2RctWgTr:RIDGE_01 to: CircWg2RctWgTr:RIDGE
%--------------------------------------------
function status = f_rename_component_CircWg2RctWgTr_RIDGE_01_to_CircWg2Rc_N25(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nSolid.Rename "CircWg2RctWgTr:RIDGE_01", "RIDGE"',content);
status = oMWS.invoke('AddToHistory','rename component: CircWg2RctWgTr:RIDGE_01 to: CircWg2RctWgTr:RIDGE',content);
end
%--------------------------------------------
% FUNCTION:- transform: rotate CircWg2RctWgTr:RIDGE
%--------------------------------------------
function status = f_transform_rotate_CircWg2RctWgTr_RIDGE_N26(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Transform',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "CircWg2RctWgTr:RIDGE"',content);
content = sprintf('%s\n	.Angle "0", "0", "180"',content);
content = sprintf('%s\n	.Origin "Free"',content);
content = sprintf('%s\n	.Center "0", "0", "0"',content);
content = sprintf('%s\n	.UsePickedPoints "False"',content);
content = sprintf('%s\n	.InvertPickedPoints "False"',content);
content = sprintf('%s\n	.MultipleObjects "True"',content);
content = sprintf('%s\n	.GroupObjects "False"',content);
content = sprintf('%s\n	.Repetitions "1"',content);
content = sprintf('%s\n	.MultipleSelection "False"',content);
content = sprintf('%s\n	.Destination ""',content);
content = sprintf('%s\n	.Material ""',content);
content = sprintf('%s\n	.Transform "Shape", "Rotate"',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','transform: rotate CircWg2RctWgTr:RIDGE',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: CircWg2RctWgTr:RIDGE:CircWg2RctWgTr:RIDGE_1
%--------------------------------------------
function status = f_boolean_add_shapes_CircWg2RctWgTr_RIDGE_CircWg2RctWgT_N27(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "CircWg2RctWgTr:RIDGE", "CircWg2RctWgTr:RIDGE_1"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: CircWg2RctWgTr:RIDGE:CircWg2RctWgTr:RIDGE_1',content);
end
%--------------------------------------------
% FUNCTION:- transform: rotate CircWg2RctWgTr:RIDGE
%--------------------------------------------
function status = f_transform_rotate_CircWg2RctWgTr_RIDGE_N28(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Transform',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "CircWg2RctWgTr:RIDGE"',content);
content = sprintf('%s\n	.Angle "0", "0", "90"',content);
content = sprintf('%s\n	.Origin "Free"',content);
content = sprintf('%s\n	.Center "0", "0", "0"',content);
content = sprintf('%s\n	.UsePickedPoints "False"',content);
content = sprintf('%s\n	.InvertPickedPoints "False"',content);
content = sprintf('%s\n	.MultipleObjects "True"',content);
content = sprintf('%s\n	.GroupObjects "False"',content);
content = sprintf('%s\n	.Repetitions "1"',content);
content = sprintf('%s\n	.MultipleSelection "False"',content);
content = sprintf('%s\n	.Destination ""',content);
content = sprintf('%s\n	.Material ""',content);
content = sprintf('%s\n	.Transform "Shape", "Rotate"',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','transform: rotate CircWg2RctWgTr:RIDGE',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: CircWg2RctWgTr:RIDGE:CircWg2RctWgTr:RIDGE_1
%--------------------------------------------
function status = f_boolean_add_shapes_CircWg2RctWgTr_RIDGE_CircWg2RctWgT_N29(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "CircWg2RctWgTr:RIDGE", "CircWg2RctWgTr:RIDGE_1"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: CircWg2RctWgTr:RIDGE:CircWg2RctWgTr:RIDGE_1',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: CircWg2RctWgTr:CIRCWG:CircWg2RctWgTr:RECTWG
%--------------------------------------------
function status = f_boolean_add_shapes_CircWg2RctWgTr_CIRCWG_CircWg2RctWg_N30(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "CircWg2RctWgTr:CIRCWG", "CircWg2RctWgTr:RECTWG"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: CircWg2RctWgTr:CIRCWG:CircWg2RctWgTr:RECTWG',content);
end
%--------------------------------------------
% FUNCTION:- boolean subtract shapes: CircWg2RctWgTr:CIRCWG:CircWg2RctWgTr:RIDGE
%--------------------------------------------
function status = f_boolean_subtract_shapes_CircWg2RctWgTr_CIRCWG_CircWg2_N31(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Subtract "CircWg2RctWgTr:CIRCWG", "CircWg2RctWgTr:RIDGE"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean subtract shapes: CircWg2RctWgTr:CIRCWG:CircWg2RctWgTr:RIDGE',content);
end
%--------------------------------------------
% FUNCTION:- rename component: CircWg2RctWgTr:CIRCWG to: CircWg2RctWgTr:ParteInterna
%--------------------------------------------
function status = f_rename_component_CircWg2RctWgTr_CIRCWG_to_CircWg2RctW_N32(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nSolid.Rename "CircWg2RctWgTr:CIRCWG", "ParteInterna"',content);
status = oMWS.invoke('AddToHistory','rename component: CircWg2RctWgTr:CIRCWG to: CircWg2RctWgTr:ParteInterna',content);
end
%--------------------------------------------
% FUNCTION:- define cylinder: CircWg2RctWgTr:CIRCWG_01
%--------------------------------------------
function status = f_define_cylinder_CircWg2RctWgTr_CIRCWG_01_N33(oMWS,LwkR1,lIN1,wgB1,wgR)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Cylinder',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "CIRCWG_01"',content);
content = sprintf('%s\n	.Component "CircWg2RctWgTr"',content);
content = sprintf('%s\n	.Material "Vacuum"',content);
content = sprintf('%s\n	.Axis "Z"',content);
content = sprintf('%s\n	.Outerradius "wgR"',content);
content = sprintf('%s\n	.Innerradius "0"',content);
content = sprintf('%s\n	.Xcenter "0"',content);
content = sprintf('%s\n	.Ycenter "0"',content);
content = sprintf('%s\n	.Zcenter "0"',content);
content = sprintf('%s\n	.Zrange "lIN1+wgB1", "lIN1+wgB1+LwkR1"',content);
content = sprintf('%s\n	.Segments "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define cylinder: CircWg2RctWgTr:CIRCWG_01',content);
end
%--------------------------------------------
% FUNCTION:- boolean subtract shapes: CircWg2RctWgTr:ParteInterna:CircWg2RctWgTr:CIRCWG_01
%--------------------------------------------
function status = f_boolean_subtract_shapes_CircWg2RctWgTr_ParteInterna_C_N34(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Subtract "CircWg2RctWgTr:ParteInterna", "CircWg2RctWgTr:CIRCWG_01"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean subtract shapes: CircWg2RctWgTr:ParteInterna:CircWg2RctWgTr:CIRCWG_01',content);
end
%--------------------------------------------
% FUNCTION:- define cylinder: CircWg2RctWgTr:CIRCWG_01
%--------------------------------------------
function status = f_define_cylinder_CircWg2RctWgTr_CIRCWG_01_N35(oMWS,LwkR1,lIN1,wgB1,wgR,wgR1)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Cylinder',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Name "CIRCWG_01"',content);
content = sprintf('%s\n	.Component "CircWg2RctWgTr"',content);
content = sprintf('%s\n	.Material "Vacuum"',content);
content = sprintf('%s\n	.Axis "Z"',content);
content = sprintf('%s\n	.Outerradius "wgR1"',content);
content = sprintf('%s\n	.Innerradius "0"',content);
content = sprintf('%s\n	.Xcenter "0"',content);
content = sprintf('%s\n	.Ycenter "0"',content);
content = sprintf('%s\n	.Zcenter "0"',content);
content = sprintf('%s\n	.Zrange "lIN1+wgB1", "lIN1+wgB1+LwkR1"',content);
content = sprintf('%s\n	.Segments "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define cylinder: CircWg2RctWgTr:CIRCWG_01',content);
end
%--------------------------------------------
% FUNCTION:- boolean add shapes: CircWg2RctWgTr:ParteInterna:CircWg2RctWgTr:CIRCWG_01
%--------------------------------------------
function status = f_boolean_add_shapes_CircWg2RctWgTr_ParteInterna_CircWg_N36(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solid',content);
content = sprintf('%s\n	.Version 9',content);
content = sprintf('%s\n	.Add "CircWg2RctWgTr:ParteInterna", "CircWg2RctWgTr:CIRCWG_01"',content);
content = sprintf('%s\n	.Version 1',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','boolean add shapes: CircWg2RctWgTr:ParteInterna:CircWg2RctWgTr:CIRCWG_01',content);
end
%--------------------------------------------
% FUNCTION:- define MeshAdaption3D
%--------------------------------------------
function status = f_define_MeshAdaption3D_N37(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshAdaption3D',content);
content = sprintf('%s\n	.SetType "HighFrequencyTet"',content);
content = sprintf('%s\n	.MinPasses "3"',content);
content = sprintf('%s\n	.MaxPasses "3"',content);
content = sprintf('%s\n	.MaxDeltaS "1e-14"',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define MeshAdaption3D',content);
end
%--------------------------------------------
% FUNCTION:- activate global coordinates
%--------------------------------------------
function status = f_activate_global_coordinates_N38(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWCS.ActivateWCS "global"',content);
status = oMWS.invoke('AddToHistory','activate global coordinates',content);
end
%--------------------------------------------
% FUNCTION:- define port: 1
%--------------------------------------------
function status = f_define_port_1_N39(oMWS,wgR)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Port',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.PortNumber "1"',content);
content = sprintf('%s\n	.Label ""',content);
content = sprintf('%s\n	.NumberOfModes "1"',content);
content = sprintf('%s\n	.AdjustPolarization "False"',content);
content = sprintf('%s\n	.PolarizationAngle "0.0"',content);
content = sprintf('%s\n	.ReferencePlaneDistance "0"',content);
content = sprintf('%s\n	.TextSize "50"',content);
content = sprintf('%s\n	.Coordinates "Free"',content);
content = sprintf('%s\n	.Orientation "zmin"',content);
content = sprintf('%s\n	.PortOnBound "False"',content);
content = sprintf('%s\n	.ClipPickedPortToBound "False"',content);
content = sprintf('%s\n	.SingleEnded "False"',content);
content = sprintf('%s\n	.Xrange "-wgR","wgR"',content);
content = sprintf('%s\n	.Yrange "-wgR","wgR"',content);
content = sprintf('%s\n	.Zrange "0","0"',content);
content = sprintf('%s\n	.XrangeAdd "0", "0"',content);
content = sprintf('%s\n	.YrangeAdd "0", "0"',content);
content = sprintf('%s\n	.ZrangeAdd "0", "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define port: 1',content);
end
%--------------------------------------------
% FUNCTION:- define port: 2
%--------------------------------------------
function status = f_define_port_2_N40(oMWS,lIN1,lIN2,wgB1,wgR)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Port',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.PortNumber "2"',content);
content = sprintf('%s\n	.Label ""',content);
content = sprintf('%s\n	.NumberOfModes "1"',content);
content = sprintf('%s\n	.AdjustPolarization "False"',content);
content = sprintf('%s\n	.PolarizationAngle "0.0"',content);
content = sprintf('%s\n	.ReferencePlaneDistance "0"',content);
content = sprintf('%s\n	.TextSize "50"',content);
content = sprintf('%s\n	.Coordinates "Free"',content);
content = sprintf('%s\n	.Orientation "zmax"',content);
content = sprintf('%s\n	.PortOnBound "False"',content);
content = sprintf('%s\n	.ClipPickedPortToBound "False"',content);
content = sprintf('%s\n	.SingleEnded "False"',content);
content = sprintf('%s\n	.Xrange "-wgR","wgR"',content);
content = sprintf('%s\n	.Yrange "-wgR","wgR"',content);
content = sprintf('%s\n	.Zrange "lIN1+wgB1+lIN2","lIN1+wgB1+lIN2"',content);
content = sprintf('%s\n	.XrangeAdd "0", "0"',content);
content = sprintf('%s\n	.YrangeAdd "0", "0"',content);
content = sprintf('%s\n	.ZrangeAdd "0", "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define port: 2',content);
end
%--------------------------------------------
% FUNCTION:- define port: 3
%--------------------------------------------
function status = f_define_port_3_N41(oMWS,Lwk2,Lwk3,Lwk4,lIN1,lIN3,wgA4,wgB1,wgB4,wgR)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Port',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.PortNumber "3"',content);
content = sprintf('%s\n	.Label ""',content);
content = sprintf('%s\n	.NumberOfModes "1"',content);
content = sprintf('%s\n	.AdjustPolarization "False"',content);
content = sprintf('%s\n	.PolarizationAngle "0.0"',content);
content = sprintf('%s\n	.ReferencePlaneDistance "0"',content);
content = sprintf('%s\n	.TextSize "50"',content);
content = sprintf('%s\n	.Coordinates "Free"',content);
content = sprintf('%s\n	.Orientation "ymax"',content);
content = sprintf('%s\n	.PortOnBound "False"',content);
content = sprintf('%s\n	.ClipPickedPortToBound "False"',content);
content = sprintf('%s\n	.SingleEnded "False"',content);
content = sprintf('%s\n	.Xrange "-wgA4/2","wgA4/2"',content);
content = sprintf('%s\n	.Yrange "(wgR+Lwk2+Lwk3+Lwk4+lIN3)","(wgR+Lwk2+Lwk3+Lwk4+lIN3)"',content);
content = sprintf('%s\n	.Zrange "lIN1+wgB1-wgB4","lIN1+wgB1"',content);
content = sprintf('%s\n	.XrangeAdd "0", "0"',content);
content = sprintf('%s\n	.YrangeAdd "0", "0"',content);
content = sprintf('%s\n	.ZrangeAdd "0", "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define port: 3',content);
end
%--------------------------------------------
% FUNCTION:- define port: 4
%--------------------------------------------
function status = f_define_port_4_N42(oMWS,Lwk2,Lwk3,Lwk4,lIN1,lIN3,wgA4,wgB1,wgB4,wgR)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Port',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.PortNumber "4"',content);
content = sprintf('%s\n	.Label ""',content);
content = sprintf('%s\n	.NumberOfModes "1"',content);
content = sprintf('%s\n	.AdjustPolarization "False"',content);
content = sprintf('%s\n	.PolarizationAngle "0.0"',content);
content = sprintf('%s\n	.ReferencePlaneDistance "0"',content);
content = sprintf('%s\n	.TextSize "50"',content);
content = sprintf('%s\n	.Coordinates "Free"',content);
content = sprintf('%s\n	.Orientation "xmax"',content);
content = sprintf('%s\n	.PortOnBound "False"',content);
content = sprintf('%s\n	.ClipPickedPortToBound "False"',content);
content = sprintf('%s\n	.SingleEnded "False"',content);
content = sprintf('%s\n	.Xrange "(wgR+Lwk2+Lwk3+Lwk4+lIN3)","(wgR+Lwk2+Lwk3+Lwk4+lIN3)"',content);
content = sprintf('%s\n	.Yrange "-wgA4/2","wgA4/2"',content);
content = sprintf('%s\n	.Zrange "lIN1+wgB1-wgB4","lIN1+wgB1"',content);
content = sprintf('%s\n	.XrangeAdd "0", "0"',content);
content = sprintf('%s\n	.YrangeAdd "0", "0"',content);
content = sprintf('%s\n	.ZrangeAdd "0", "0"',content);
content = sprintf('%s\n	.Create',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define port: 4',content);
end
%--------------------------------------------
% FUNCTION:- define boundaries symm
%--------------------------------------------
function status = f_define_boundaries_symm_N43(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Boundary',content);
content = sprintf('%s\n	.Xsymmetry "magnetic"',content);
content = sprintf('%s\n	.Ysymmetry "electric"',content);
content = sprintf('%s\n	.Zsymmetry "none"',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define boundaries symm',content);
end
%--------------------------------------------
% FUNCTION:- Solver
%--------------------------------------------
function status = f_Solver_N44(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Solver',content);
content = sprintf('%s\n	.FrequencyRange "33", "50"',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','Solver',content);
end
%--------------------------------------------
% FUNCTION:- activate global coordinates
%--------------------------------------------
function status = f_activate_global_coordinates_N45(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWCS.ActivateWCS "global"',content);
status = oMWS.invoke('AddToHistory','activate global coordinates',content);
end
%--------------------------------------------
% FUNCTION:- define automesh parameters
%--------------------------------------------
function status = f_define_automesh_parameters_N46(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
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
content = sprintf('%s\n	.MinimumCurvatureRefinement "100"',content);
content = sprintf('%s\n	.CurvatureRefinementFactor "0.03"',content);
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
function status = f_set_mesh_properties_N47(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Mesh',content);
content = sprintf('%s\n	.PBAType "PBA"',content);
content = sprintf('%s\n	.StepsPerWavelengthTet "8"',content);
content = sprintf('%s\n	.MinimumStepNumberTet "10"',content);
content = sprintf('%s\n	.MeshType "Tetrahedral"',content);
content = sprintf('%s\n	.MeshAllRegions "False"',content);
content = sprintf('%s\n	.MaterialRefinementTet "True"',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set mesh properties',content);
end
%--------------------------------------------
% FUNCTION:- define frequency domain solver parameters
%--------------------------------------------
function status = f_define_frequency_domain_solver_parameters_N48(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nMesh.SetCreator "High Frequency"',content);
content = sprintf('%s\nWith FDSolver',content);
content = sprintf('%s\n	.Reset',content);
content = sprintf('%s\n	.Method "Tetrahedral Mesh"',content);
content = sprintf('%s\n	.OrderTet "Second"',content);
content = sprintf('%s\n	.OrderHFMOR "1"',content);
content = sprintf('%s\n	.OrderSrf "First"',content);
content = sprintf('%s\n	.Stimulation "List", "List"',content);
content = sprintf('%s\n	.ResetExcitationList',content);
content = sprintf('%s\n	.AddToExcitationList "1", "1;"',content);
content = sprintf('%s\n	.AutoNormImpedance "False"',content);
content = sprintf('%s\n	.NormingImpedance "50"',content);
content = sprintf('%s\n	.ModesOnly "False"',content);
content = sprintf('%s\n	.ConsiderPortLossesTet "True"',content);
content = sprintf('%s\n	.SetShieldAllPorts "False"',content);
content = sprintf('%s\n	.AccuracyHex "1e-6"',content);
content = sprintf('%s\n	.AccuracyTet "0.0001"',content);
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
content = sprintf('%s\n	.AddSampleInterval "33", "50", "21", "Equidistant", "False"',content);
content = sprintf('%s\n	.AddSampleInterval "33", "50", "2", "Equidistant", "True"',content);
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
% FUNCTION:- define MeshAdaption3D
%--------------------------------------------
function status = f_define_MeshAdaption3D_N49(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshAdaption3D',content);
content = sprintf('%s\n	.SetType "HighFrequencyTet"',content);
content = sprintf('%s\n	.MinPasses "3"',content);
content = sprintf('%s\n	.MaxPasses "3"',content);
content = sprintf('%s\n	.MaxDeltaS "1e-14"',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define MeshAdaption3D',content);
end
%--------------------------------------------
% FUNCTION:- set mesh properties
%--------------------------------------------
function status = f_set_mesh_properties_N50(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshSettings',content);
content = sprintf('%s\n     .SetMeshType "Tet" ',content);
content = sprintf('%s\n     .Set "Version", 0%',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith Mesh ',content);
content = sprintf('%s\n     .StepsPerWavelengthTet "4" ',content);
content = sprintf('%s\n     .MinimumStepNumberTet "10" ',content);
content = sprintf('%s\n     .MeshType "Tetrahedral" ',content);
content = sprintf('%s\n     .MeshAllRegions "False" ',content);
content = sprintf('%s\n     .MaterialRefinementTet "True" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set mesh properties',content);
end
%--------------------------------------------
% FUNCTION:- switch working plane
%--------------------------------------------
function status = f_switch_working_plane_N51(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nPlot.DrawWorkplane "false"',content);
status = oMWS.invoke('AddToHistory','switch working plane',content);
end
%--------------------------------------------
% FUNCTION:- change solver type
%--------------------------------------------
function status = f_change_solver_type_N52(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nChangeSolverType "HF Frequency Domain"',content);
status = oMWS.invoke('AddToHistory','change solver type',content);
end
%--------------------------------------------
% FUNCTION:- set 3d mesh adaptation properties
%--------------------------------------------
function status = f_set_3d_mesh_adaptation_properties_N53(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshAdaption3D',content);
content = sprintf('%s\n    .SetType "HighFrequencyTet" ',content);
content = sprintf('%s\n    .SetAdaptionStrategy "ExpertSystem" ',content);
content = sprintf('%s\n    .MinPasses "3" ',content);
content = sprintf('%s\n    .MaxPasses "3" ',content);
content = sprintf('%s\n    .ClearStopCriteria ',content);
content = sprintf('%s\n    .MaxDeltaS "1e-14" ',content);
content = sprintf('%s\n    .NumberOfDeltaSChecks "2" ',content);
content = sprintf('%s\n    .EnableInnerSParameterAdaptation "True" ',content);
content = sprintf('%s\n    .PropagationConstantAccuracy "0.005" ',content);
content = sprintf('%s\n    .NumberOfPropConstChecks "2" ',content);
content = sprintf('%s\n    .EnablePortPropagationConstantAdaptation "True" ',content);
content = sprintf('%s\n    .Add0DResultStopCriterion "", "0.004", "1", "False" ',content);
content = sprintf('%s\n    .AddSParameterStopCriterion "True", "", "", "0.02", "1", "False" ',content);
content = sprintf('%s\n    .MinimumAcceptedCellGrowth "0.5" ',content);
content = sprintf('%s\n    .RefThetaFactor "30" ',content);
content = sprintf('%s\n    .SetMinimumMeshCellGrowth "5" ',content);
content = sprintf('%s\n    .ErrorEstimatorType "Automatic" ',content);
content = sprintf('%s\n    .RefinementType "Automatic" ',content);
content = sprintf('%s\n    .SnapToGeometry "True" ',content);
content = sprintf('%s\n    .ImproveBadElementQuality "True" ',content);
content = sprintf('%s\n    .SubsequentChecksOnlyOnce "False" ',content);
content = sprintf('%s\n    .WavelengthBasedRefinement "True" ',content);
content = sprintf('%s\n    .EnableLinearGrowthLimitation "True" ',content);
content = sprintf('%s\n    .SetLinearGrowthLimitation "30" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set 3d mesh adaptation properties',content);
end
%--------------------------------------------
% FUNCTION:- define frequency domain solver parameters
%--------------------------------------------
function status = f_define_frequency_domain_solver_parameters_N54(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nMesh.SetCreator "High Frequency" ',content);
content = sprintf('%s\nWith FDSolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .Method "Tetrahedral Mesh" ',content);
content = sprintf('%s\n     .OrderTet "Second" ',content);
content = sprintf('%s\n     .OrderHFMOR "1" ',content);
content = sprintf('%s\n     .OrderSrf "First" ',content);
content = sprintf('%s\n     .Stimulation "List", "List" ',content);
content = sprintf('%s\n     .ResetExcitationList ',content);
content = sprintf('%s\n     .AddToExcitationList "1", "1;" ',content);
content = sprintf('%s\n     .AutoNormImpedance "False" ',content);
content = sprintf('%s\n     .NormingImpedance "50" ',content);
content = sprintf('%s\n     .ModesOnly "False" ',content);
content = sprintf('%s\n     .ConsiderPortLossesTet "True" ',content);
content = sprintf('%s\n     .SetShieldAllPorts "False" ',content);
content = sprintf('%s\n     .AccuracyHex "1e-6" ',content);
content = sprintf('%s\n     .AccuracyTet "0.0001" ',content);
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
content = sprintf('%s\n     .HexMORSettings "", "1001" ',content);
content = sprintf('%s\n     .NewIterativeSolver "True" ',content);
content = sprintf('%s\n     .TDCompatibleMaterials "False" ',content);
content = sprintf('%s\n     .ExtrudeOpenBC "False" ',content);
content = sprintf('%s\n     .SetOpenBCTypeHex "Default" ',content);
content = sprintf('%s\n     .SetOpenBCTypeTet "Default" ',content);
content = sprintf('%s\n     .AddMonitorSamples "True" ',content);
content = sprintf('%s\n     .SParameterSweep "False" ',content);
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
content = sprintf('%s\n     .InterpolationSamples "1001" ',content);
content = sprintf('%s\n     .SweepWeightEvanescent "1.0" ',content);
content = sprintf('%s\n     .AddSampleInterval "33", "50", "1", "Equidistant", "True" ',content);
content = sprintf('%s\n     .AddSampleInterval "33", "50", "18", "Equidistant", "False" ',content);
content = sprintf('%s\n     .MPIParallelization "False"',content);
content = sprintf('%s\n     .UseDistributedComputing "False"',content);
content = sprintf('%s\n     .NetworkComputingStrategy "RunRemote"',content);
content = sprintf('%s\n     .NetworkComputingJobCount "3"',content);
content = sprintf('%s\n     .LimitCPUs "True"',content);
content = sprintf('%s\n     .MaxCPUs "32"',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith IESolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .UseFastFrequencySweep "False" ',content);
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
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define frequency domain solver parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N55(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgH2,delta_wgH3,wgH3)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.386" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3474" ',content);
content = sprintf('%s\n  .SetParameterMax "0.4246" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.097" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9873" ',content);
content = sprintf('%s\n  .SetParameterMax "1.2067" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.1" ',content);
content = sprintf('%s\n  .SetParameterMin "2.79" ',content);
content = sprintf('%s\n  .SetParameterMax "3.41" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.614" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.6754" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.5526" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.49" ',content);
content = sprintf('%s\n  .SetParameterMin "0.441" ',content);
content = sprintf('%s\n  .SetParameterMax "0.539" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.439" ',content);
content = sprintf('%s\n  .SetParameterMin "2.1951" ',content);
content = sprintf('%s\n  .SetParameterMax "2.6829" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.603" ',content);
content = sprintf('%s\n  .SetParameterMin "1.4427" ',content);
content = sprintf('%s\n  .SetParameterMax "1.7633" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.562" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5058" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6182" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.429" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.4719" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.3861" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N56(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0.0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0.0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0.0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- define frequency domain solver parameters
%--------------------------------------------
function status = f_define_frequency_domain_solver_parameters_N57(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nMesh.SetCreator "High Frequency" ',content);
content = sprintf('%s\nWith FDSolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .Method "Tetrahedral Mesh" ',content);
content = sprintf('%s\n     .OrderTet "Second" ',content);
content = sprintf('%s\n     .OrderHFMOR "1" ',content);
content = sprintf('%s\n     .OrderSrf "First" ',content);
content = sprintf('%s\n     .Stimulation "List", "List" ',content);
content = sprintf('%s\n     .ResetExcitationList ',content);
content = sprintf('%s\n     .AddToExcitationList "1", "1;" ',content);
content = sprintf('%s\n     .AutoNormImpedance "False" ',content);
content = sprintf('%s\n     .NormingImpedance "50" ',content);
content = sprintf('%s\n     .ModesOnly "False" ',content);
content = sprintf('%s\n     .ConsiderPortLossesTet "True" ',content);
content = sprintf('%s\n     .SetShieldAllPorts "False" ',content);
content = sprintf('%s\n     .AccuracyHex "1e-6" ',content);
content = sprintf('%s\n     .AccuracyTet "0.0001" ',content);
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
content = sprintf('%s\n     .HexMORSettings "", "1001" ',content);
content = sprintf('%s\n     .NewIterativeSolver "True" ',content);
content = sprintf('%s\n     .TDCompatibleMaterials "False" ',content);
content = sprintf('%s\n     .ExtrudeOpenBC "False" ',content);
content = sprintf('%s\n     .SetOpenBCTypeHex "Default" ',content);
content = sprintf('%s\n     .SetOpenBCTypeTet "Default" ',content);
content = sprintf('%s\n     .AddMonitorSamples "True" ',content);
content = sprintf('%s\n     .SParameterSweep "False" ',content);
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
content = sprintf('%s\n     .InterpolationSamples "1001" ',content);
content = sprintf('%s\n     .SweepWeightEvanescent "1.0" ',content);
content = sprintf('%s\n     .AddSampleInterval "33", "50", "1", "Single", "True" ',content);
content = sprintf('%s\n     .AddSampleInterval "33", "50", "18", "Equidistant", "False" ',content);
content = sprintf('%s\n     .MPIParallelization "False"',content);
content = sprintf('%s\n     .UseDistributedComputing "False"',content);
content = sprintf('%s\n     .NetworkComputingStrategy "RunRemote"',content);
content = sprintf('%s\n     .NetworkComputingJobCount "3"',content);
content = sprintf('%s\n     .LimitCPUs "True"',content);
content = sprintf('%s\n     .MaxCPUs "32"',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith IESolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .UseFastFrequencySweep "False" ',content);
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
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define frequency domain solver parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N58(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgH2,delta_wgH3,wgH3)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.386" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3474" ',content);
content = sprintf('%s\n  .SetParameterMax "0.4246" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1.1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9873" ',content);
content = sprintf('%s\n  .SetParameterMax "1.2067" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.1" ',content);
content = sprintf('%s\n  .SetParameterMin "2.79" ',content);
content = sprintf('%s\n  .SetParameterMax "3.41" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.614" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.6754" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.5526" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.49" ',content);
content = sprintf('%s\n  .SetParameterMin "0.441" ',content);
content = sprintf('%s\n  .SetParameterMax "0.539" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.439" ',content);
content = sprintf('%s\n  .SetParameterMin "2.1951" ',content);
content = sprintf('%s\n  .SetParameterMax "2.6829" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.603" ',content);
content = sprintf('%s\n  .SetParameterMin "1.4427" ',content);
content = sprintf('%s\n  .SetParameterMax "1.7633" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.562" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5058" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6182" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.429" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.4719" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.3861" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N59(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- add optimizer goals: 1DC Primary Result / 0
%--------------------------------------------
function status = f_add_optimizer_goals_1DC_Primary_Result__0_N60(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .AddGoal "1DC Primary Result" ',content);
content = sprintf('%s\n  .SetGoalOperator "<" ',content);
content = sprintf('%s\n  .SetGoalTarget "-37" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "1.0" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S1,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','add optimizer goals: 1DC Primary Result / 0',content);
end
%--------------------------------------------
% FUNCTION:- add optimizer goals: 1DC Primary Result / 1
%--------------------------------------------
function status = f_add_optimizer_goals_1DC_Primary_Result__1_N61(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .AddGoal "1DC Primary Result" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-20" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "3" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','add optimizer goals: 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N62(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgH2,delta_wgH3,wgH3)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.386" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3474" ',content);
content = sprintf('%s\n  .SetParameterMax "0.4246" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.35" ',content);
content = sprintf('%s\n  .SetParameterMin "3.015" ',content);
content = sprintf('%s\n  .SetParameterMax "3.685" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1.1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9873" ',content);
content = sprintf('%s\n  .SetParameterMax "1.2067" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.1" ',content);
content = sprintf('%s\n  .SetParameterMin "2.79" ',content);
content = sprintf('%s\n  .SetParameterMax "3.41" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.614" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.6754" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.5526" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.49" ',content);
content = sprintf('%s\n  .SetParameterMin "0.441" ',content);
content = sprintf('%s\n  .SetParameterMax "0.539" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.439" ',content);
content = sprintf('%s\n  .SetParameterMin "2.1951" ',content);
content = sprintf('%s\n  .SetParameterMax "2.6829" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.603" ',content);
content = sprintf('%s\n  .SetParameterMin "1.4427" ',content);
content = sprintf('%s\n  .SetParameterMax "1.7633" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.562" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5058" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6182" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.429" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.4719" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.3861" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N63(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N64(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgH2,delta_wgH3,wgH3)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.386" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3474" ',content);
content = sprintf('%s\n  .SetParameterMax "0.4246" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.35" ',content);
content = sprintf('%s\n  .SetParameterMin "3.015" ',content);
content = sprintf('%s\n  .SetParameterMax "3.685" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1.1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9873" ',content);
content = sprintf('%s\n  .SetParameterMax "1.2067" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.1" ',content);
content = sprintf('%s\n  .SetParameterMin "2.79" ',content);
content = sprintf('%s\n  .SetParameterMax "3.41" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.614" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.6754" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.5526" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.49" ',content);
content = sprintf('%s\n  .SetParameterMin "0.441" ',content);
content = sprintf('%s\n  .SetParameterMax "0.539" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.439" ',content);
content = sprintf('%s\n  .SetParameterMin "2.1951" ',content);
content = sprintf('%s\n  .SetParameterMax "2.6829" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.603" ',content);
content = sprintf('%s\n  .SetParameterMin "1.4427" ',content);
content = sprintf('%s\n  .SetParameterMax "1.7633" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.562" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5058" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6182" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.429" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.4719" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.3861" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N65(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N66(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-19.5" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "3" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N67(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N68(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgH2,delta_wgH3,wgH3)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "20" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.34753285490542" ',content);
content = sprintf('%s\n  .SetParameterMin "0.278" ',content);
content = sprintf('%s\n  .SetParameterMax "0.417" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4889790620079" ',content);
content = sprintf('%s\n  .SetParameterMin "2.791" ',content);
content = sprintf('%s\n  .SetParameterMax "4.187" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1.1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9873" ',content);
content = sprintf('%s\n  .SetParameterMax "1.2067" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.1" ',content);
content = sprintf('%s\n  .SetParameterMin "2.79" ',content);
content = sprintf('%s\n  .SetParameterMax "3.41" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.55434202985508" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.6652" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.4435" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.53737939228018" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4299" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6449" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.3490629168567" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8793" ',content);
content = sprintf('%s\n  .SetParameterMax "2.8189" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.4494796284866" ',content);
content = sprintf('%s\n  .SetParameterMin "1.1596" ',content);
content = sprintf('%s\n  .SetParameterMax "1.7394" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.59099910188168" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4728" ',content);
content = sprintf('%s\n  .SetParameterMax "0.7092" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.39689387312334" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.4763" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.3175" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N69(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N70(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgH2,delta_wgH3,wgH3)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "20" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.34753285490542" ',content);
content = sprintf('%s\n  .SetParameterMin "0.278" ',content);
content = sprintf('%s\n  .SetParameterMax "0.417" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4889790620079" ',content);
content = sprintf('%s\n  .SetParameterMin "2.791" ',content);
content = sprintf('%s\n  .SetParameterMax "4.187" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1.1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9873" ',content);
content = sprintf('%s\n  .SetParameterMax "1.2067" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.1" ',content);
content = sprintf('%s\n  .SetParameterMin "2.79" ',content);
content = sprintf('%s\n  .SetParameterMax "3.41" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.55434202985508" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.6652" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.4435" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.53737939228018" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4299" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6449" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.3490629168567" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8793" ',content);
content = sprintf('%s\n  .SetParameterMax "2.8189" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.4494796284866" ',content);
content = sprintf('%s\n  .SetParameterMin "1.1596" ',content);
content = sprintf('%s\n  .SetParameterMax "1.7394" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.59099910188168" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4728" ',content);
content = sprintf('%s\n  .SetParameterMax "0.7092" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.39689387312334" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.4763" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.3175" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N71(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 0
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__0_N72(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "0", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "<" ',content);
content = sprintf('%s\n  .SetGoalTarget "-37" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "2" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S1,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 0',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N73(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 0
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__0_N74(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "0", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "<" ',content);
content = sprintf('%s\n  .SetGoalTarget "-38" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "2" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S1,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 0',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N75(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "20" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.34414235937048" ',content);
content = sprintf('%s\n  .SetParameterMin "0.2753" ',content);
content = sprintf('%s\n  .SetParameterMax "0.413" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.490081030229" ',content);
content = sprintf('%s\n  .SetParameterMin "2.792" ',content);
content = sprintf('%s\n  .SetParameterMax "4.188" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1.1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9873" ',content);
content = sprintf('%s\n  .SetParameterMax "1.2067" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.1" ',content);
content = sprintf('%s\n  .SetParameterMin "2.79" ',content);
content = sprintf('%s\n  .SetParameterMax "3.41" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.53349817468351" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4268" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6402" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.3682537342805" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8946" ',content);
content = sprintf('%s\n  .SetParameterMax "2.8419" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.4553489427093" ',content);
content = sprintf('%s\n  .SetParameterMin "1.1643" ',content);
content = sprintf('%s\n  .SetParameterMax "1.7464" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.59191786347568" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4735" ',content);
content = sprintf('%s\n  .SetParameterMax "0.7103" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.39472352496438" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.4737" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.3158" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N76(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N77(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "20" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.34578208882937" ',content);
content = sprintf('%s\n  .SetParameterMin "0.2753" ',content);
content = sprintf('%s\n  .SetParameterMax "0.413" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4881576496632" ',content);
content = sprintf('%s\n  .SetParameterMin "2.792" ',content);
content = sprintf('%s\n  .SetParameterMax "4.188" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.1" ',content);
content = sprintf('%s\n  .SetParameterMin "1.1" ',content);
content = sprintf('%s\n  .SetParameterMax "1.2067" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.1" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1" ',content);
content = sprintf('%s\n  .SetParameterMax "3.41" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.53144014287505" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4268" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6402" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.3646705790025" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8946" ',content);
content = sprintf('%s\n  .SetParameterMax "2.8419" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.4523881225619" ',content);
content = sprintf('%s\n  .SetParameterMin "1.1643" ',content);
content = sprintf('%s\n  .SetParameterMax "1.7464" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.58981919985805" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4735" ',content);
content = sprintf('%s\n  .SetParameterMax "0.7103" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.39622835830733" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.4737" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.3158" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N78(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N79(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.39622835830733" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.43585" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.35661" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.58981919985805" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5308" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6488" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.4523881225619" ',content);
content = sprintf('%s\n  .SetParameterMin "1.3071" ',content);
content = sprintf('%s\n  .SetParameterMax "1.5976" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.3646705790025" ',content);
content = sprintf('%s\n  .SetParameterMin "2.1282" ',content);
content = sprintf('%s\n  .SetParameterMax "2.6011" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.53144014287505" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4783" ',content);
content = sprintf('%s\n  .SetParameterMax "0.5846" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.2" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1" ',content);
content = sprintf('%s\n  .SetParameterMax "3.52" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.0" ',content);
content = sprintf('%s\n  .SetParameterMax "1.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4881576496632" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1393" ',content);
content = sprintf('%s\n  .SetParameterMax "3.837" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.34578208882937" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3112" ',content);
content = sprintf('%s\n  .SetParameterMax "0.38036" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N80(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N81(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.39622835830733" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.43585" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.35661" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.58981919985805" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5308" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6488" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.4523881225619" ',content);
content = sprintf('%s\n  .SetParameterMin "1.3071" ',content);
content = sprintf('%s\n  .SetParameterMax "1.5976" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.3646705790025" ',content);
content = sprintf('%s\n  .SetParameterMin "2.1282" ',content);
content = sprintf('%s\n  .SetParameterMax "2.6011" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.53144014287505" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4783" ',content);
content = sprintf('%s\n  .SetParameterMax "0.5846" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.2" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1" ',content);
content = sprintf('%s\n  .SetParameterMax "3.52" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.1" ',content);
content = sprintf('%s\n  .SetParameterMin "1.0" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4881576496632" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1393" ',content);
content = sprintf('%s\n  .SetParameterMax "3.837" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.34578208882937" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3112" ',content);
content = sprintf('%s\n  .SetParameterMax "0.38036" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N82(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N83(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.38649454717317" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.42514" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.34785" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.59418615859029" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5348" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6536" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.5016037170038" ',content);
content = sprintf('%s\n  .SetParameterMin "1.3514" ',content);
content = sprintf('%s\n  .SetParameterMax "1.6518" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.3505648088652" ',content);
content = sprintf('%s\n  .SetParameterMin "2.1155" ',content);
content = sprintf('%s\n  .SetParameterMax "2.5856" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.51070947971563" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4596" ',content);
content = sprintf('%s\n  .SetParameterMax "0.5618" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.1" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.1000127215426" ',content);
content = sprintf('%s\n  .SetParameterMin "2.79" ',content);
content = sprintf('%s\n  .SetParameterMax "3.41" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.0682291587997" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9614" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1751" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4901498809949" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1411" ',content);
content = sprintf('%s\n  .SetParameterMax "3.8392" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.335372149524" ',content);
content = sprintf('%s\n  .SetParameterMin "0.30183" ',content);
content = sprintf('%s\n  .SetParameterMax "0.36891" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N84(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N85(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.38649454717317" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.42514" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.34785" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.59418615859029" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5348" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6536" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.5016037170038" ',content);
content = sprintf('%s\n  .SetParameterMin "1.3514" ',content);
content = sprintf('%s\n  .SetParameterMax "1.6518" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.3505648088652" ',content);
content = sprintf('%s\n  .SetParameterMin "2.1155" ',content);
content = sprintf('%s\n  .SetParameterMax "2.5856" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.51070947971563" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4596" ',content);
content = sprintf('%s\n  .SetParameterMax "0.5618" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.1" ',content);
content = sprintf('%s\n  .SetParameterMin "0" ',content);
content = sprintf('%s\n  .SetParameterMax "0.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.1000127215426" ',content);
content = sprintf('%s\n  .SetParameterMin "2.79" ',content);
content = sprintf('%s\n  .SetParameterMax "3.41" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.0682291587997" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9614" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1751" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4901498809949" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1411" ',content);
content = sprintf('%s\n  .SetParameterMax "3.8392" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.335372149524" ',content);
content = sprintf('%s\n  .SetParameterMin "0.30183" ',content);
content = sprintf('%s\n  .SetParameterMax "0.36891" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N86(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N87(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.36942799414134" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.42514" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.34785" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.61619044777308" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5348" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6536" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.4949522188551" ',content);
content = sprintf('%s\n  .SetParameterMin "1.3514" ',content);
content = sprintf('%s\n  .SetParameterMax "1.6518" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.2793661827416" ',content);
content = sprintf('%s\n  .SetParameterMin "2.1155" ',content);
content = sprintf('%s\n  .SetParameterMax "2.5856" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.47102750926916" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4596" ',content);
content = sprintf('%s\n  .SetParameterMax "0.5618" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.030124634841413" ',content);
content = sprintf('%s\n  .SetParameterMin "0" ',content);
content = sprintf('%s\n  .SetParameterMax "0.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.7906896042424" ',content);
content = sprintf('%s\n  .SetParameterMin "2.79" ',content);
content = sprintf('%s\n  .SetParameterMax "3.41" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.97037930492018" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9614" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1751" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4863254700163" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1411" ',content);
content = sprintf('%s\n  .SetParameterMax "3.8392" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.34391560374979" ',content);
content = sprintf('%s\n  .SetParameterMin "0.30183" ',content);
content = sprintf('%s\n  .SetParameterMax "0.36891" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N88(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N89(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-19.5" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "5" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N90(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N91(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-19.5" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "7" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N92(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N93(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.36167422986269" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.39784" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.32551" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.60850061512921" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5477" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6694" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.5146396171878" ',content);
content = sprintf('%s\n  .SetParameterMin "1.3632" ',content);
content = sprintf('%s\n  .SetParameterMax "1.6661" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.2123743920191" ',content);
content = sprintf('%s\n  .SetParameterMin "1.9911" ',content);
content = sprintf('%s\n  .SetParameterMax "2.4336" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.46529443889233" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41876" ',content);
content = sprintf('%s\n  .SetParameterMax "0.51182" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.00039464475742847" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.95" ',content);
content = sprintf('%s\n  .SetParameterMin "0.855" ',content);
content = sprintf('%s\n  .SetParameterMax "1.045" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4709241554837" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1238" ',content);
content = sprintf('%s\n  .SetParameterMax "3.818" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.3450051377831" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3105" ',content);
content = sprintf('%s\n  .SetParameterMax "0.37951" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N94(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N95(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.36167422986269" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.39784" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.32551" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.60850061512921" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5477" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6694" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.5146396171878" ',content);
content = sprintf('%s\n  .SetParameterMin "1.3632" ',content);
content = sprintf('%s\n  .SetParameterMax "1.6661" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.2123743920191" ',content);
content = sprintf('%s\n  .SetParameterMin "1.9911" ',content);
content = sprintf('%s\n  .SetParameterMax "2.4336" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.46529443889233" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41876" ',content);
content = sprintf('%s\n  .SetParameterMax "0.51182" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.00039464475742847" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.95" ',content);
content = sprintf('%s\n  .SetParameterMin "0.855" ',content);
content = sprintf('%s\n  .SetParameterMax "1.045" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4709241554837" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1238" ',content);
content = sprintf('%s\n  .SetParameterMax "3.818" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.3450051377831" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3105" ',content);
content = sprintf('%s\n  .SetParameterMax "0.37951" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N96(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N97(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-19.5" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "9" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N98(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N99(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.35312034556138" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.39784" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.32551" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.59947312652668" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5477" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6694" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.5069654835189" ',content);
content = sprintf('%s\n  .SetParameterMin "1.3632" ',content);
content = sprintf('%s\n  .SetParameterMax "1.6661" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.243422476548" ',content);
content = sprintf('%s\n  .SetParameterMin "1.9911" ',content);
content = sprintf('%s\n  .SetParameterMax "2.4336" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.46766447112146" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41876" ',content);
content = sprintf('%s\n  .SetParameterMax "0.51182" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.00039467303703163" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.93803408110961" ',content);
content = sprintf('%s\n  .SetParameterMin "0.855" ',content);
content = sprintf('%s\n  .SetParameterMax "1.045" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4733717213741" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1238" ',content);
content = sprintf('%s\n  .SetParameterMax "3.818" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.33360843788957" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3105" ',content);
content = sprintf('%s\n  .SetParameterMax "0.37951" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N100(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N101(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-19.5" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "12" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N102(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N103(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-20" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "12" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N104(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N105(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.34554003276408" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.39784" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.32551" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.58317572436775" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5477" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6694" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.4873662310783" ',content);
content = sprintf('%s\n  .SetParameterMin "1.3632" ',content);
content = sprintf('%s\n  .SetParameterMax "1.6661" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.2098132435757" ',content);
content = sprintf('%s\n  .SetParameterMin "1.9911" ',content);
content = sprintf('%s\n  .SetParameterMax "2.4336" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.47290197652505" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41876" ',content);
content = sprintf('%s\n  .SetParameterMax "0.51182" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.00039692947613137" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.91495998736924" ',content);
content = sprintf('%s\n  .SetParameterMin "0.855" ',content);
content = sprintf('%s\n  .SetParameterMax "1.045" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.470410445652" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1238" ',content);
content = sprintf('%s\n  .SetParameterMax "3.818" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.3281252471961" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3105" ',content);
content = sprintf('%s\n  .SetParameterMax "0.37951" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N106(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 0
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__0_N107(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "0", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "<" ',content);
content = sprintf('%s\n  .SetGoalTarget "-40" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "2" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S1,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 0',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N108(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N109(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.33998044506845" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.37398" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.30598" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.58172498147548" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5236" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6399" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.5226387332828" ',content);
content = sprintf('%s\n  .SetParameterMin "1.3704" ',content);
content = sprintf('%s\n  .SetParameterMax "1.6749" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.3091853351774" ',content);
content = sprintf('%s\n  .SetParameterMin "2.0783" ',content);
content = sprintf('%s\n  .SetParameterMax "2.5401" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.46046999849648" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41442" ',content);
content = sprintf('%s\n  .SetParameterMax "0.50652" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.89538477847621" ',content);
content = sprintf('%s\n  .SetParameterMin "0.85" ',content);
content = sprintf('%s\n  .SetParameterMax "0.9849" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4691794023355" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1223" ',content);
content = sprintf('%s\n  .SetParameterMax "3.8161" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.32125998560233" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3" ',content);
content = sprintf('%s\n  .SetParameterMax "0.35339" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N110(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N111(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-20" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "6" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N112(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N113(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-20" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "2" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N114(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 0
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__0_N115(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "0", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "<" ',content);
content = sprintf('%s\n  .SetGoalTarget "-37" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "2" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S1,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 0',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N116(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N117(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-20" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "4" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N118(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N119(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.33998044506845" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.37398" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.30598" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.58172498147548" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5236" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6399" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.5226387332828" ',content);
content = sprintf('%s\n  .SetParameterMin "1.3704" ',content);
content = sprintf('%s\n  .SetParameterMax "1.6749" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.3091853351774" ',content);
content = sprintf('%s\n  .SetParameterMin "2.0783" ',content);
content = sprintf('%s\n  .SetParameterMax "2.5401" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.46046999849648" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41442" ',content);
content = sprintf('%s\n  .SetParameterMax "0.50652" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.89538477847621" ',content);
content = sprintf('%s\n  .SetParameterMin "0.85" ',content);
content = sprintf('%s\n  .SetParameterMax "0.9849" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4691794023355" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1223" ',content);
content = sprintf('%s\n  .SetParameterMax "3.8161" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.32125998560233" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3" ',content);
content = sprintf('%s\n  .SetParameterMax "0.35339" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N120(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N121(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-20" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "6" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N122(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N123(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.34034889772674" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.37398" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.30598" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.57548009170934" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5236" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6399" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.5197628183072" ',content);
content = sprintf('%s\n  .SetParameterMin "1.3704" ',content);
content = sprintf('%s\n  .SetParameterMax "1.6749" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.262738647079" ',content);
content = sprintf('%s\n  .SetParameterMin "2.0783" ',content);
content = sprintf('%s\n  .SetParameterMax "2.5401" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.44942377367244" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41442" ',content);
content = sprintf('%s\n  .SetParameterMax "0.50652" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.87603736245606" ',content);
content = sprintf('%s\n  .SetParameterMin "0.85" ',content);
content = sprintf('%s\n  .SetParameterMax "0.9849" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.466043817545" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1223" ',content);
content = sprintf('%s\n  .SetParameterMax "3.8161" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.31581727346785" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3" ',content);
content = sprintf('%s\n  .SetParameterMax "0.35339" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N124(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N125(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-20" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "8" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N126(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set mesh properties
%--------------------------------------------
function status = f_set_mesh_properties_N127(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshSettings',content);
content = sprintf('%s\n     .SetMeshType "Tet" ',content);
content = sprintf('%s\n     .Set "Version", 0%',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith Mesh ',content);
content = sprintf('%s\n     .StepsPerWavelengthTet "7" ',content);
content = sprintf('%s\n     .MinimumStepNumberTet "10" ',content);
content = sprintf('%s\n     .MeshType "Tetrahedral" ',content);
content = sprintf('%s\n     .MeshAllRegions "False" ',content);
content = sprintf('%s\n     .MaterialRefinementTet "True" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set mesh properties',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N128(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set mesh properties
%--------------------------------------------
function status = f_set_mesh_properties_N129(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshSettings',content);
content = sprintf('%s\n     .SetMeshType "Tet" ',content);
content = sprintf('%s\n     .Set "Version", 0%',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith Mesh ',content);
content = sprintf('%s\n     .StepsPerWavelengthTet "8" ',content);
content = sprintf('%s\n     .MinimumStepNumberTet "10" ',content);
content = sprintf('%s\n     .MeshType "Tetrahedral" ',content);
content = sprintf('%s\n     .MeshAllRegions "False" ',content);
content = sprintf('%s\n     .MaterialRefinementTet "True" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set mesh properties',content);
end
%--------------------------------------------
% FUNCTION:- set 3d mesh adaptation properties
%--------------------------------------------
function status = f_set_3d_mesh_adaptation_properties_N130(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshAdaption3D',content);
content = sprintf('%s\n    .SetType "HighFrequencyTet" ',content);
content = sprintf('%s\n    .SetAdaptionStrategy "ExpertSystem" ',content);
content = sprintf('%s\n    .MinPasses "3" ',content);
content = sprintf('%s\n    .MaxPasses "5" ',content);
content = sprintf('%s\n    .ClearStopCriteria ',content);
content = sprintf('%s\n    .MaxDeltaS "1e-14" ',content);
content = sprintf('%s\n    .NumberOfDeltaSChecks "2" ',content);
content = sprintf('%s\n    .EnableInnerSParameterAdaptation "True" ',content);
content = sprintf('%s\n    .PropagationConstantAccuracy "0.005" ',content);
content = sprintf('%s\n    .NumberOfPropConstChecks "2" ',content);
content = sprintf('%s\n    .EnablePortPropagationConstantAdaptation "True" ',content);
content = sprintf('%s\n    .Add0DResultStopCriterion "", "0.004", "1", "False" ',content);
content = sprintf('%s\n    .AddSParameterStopCriterion "True", "", "", "0.02", "1", "False" ',content);
content = sprintf('%s\n    .MinimumAcceptedCellGrowth "0.5" ',content);
content = sprintf('%s\n    .RefThetaFactor "30" ',content);
content = sprintf('%s\n    .SetMinimumMeshCellGrowth "5" ',content);
content = sprintf('%s\n    .ErrorEstimatorType "Automatic" ',content);
content = sprintf('%s\n    .RefinementType "Automatic" ',content);
content = sprintf('%s\n    .SnapToGeometry "True" ',content);
content = sprintf('%s\n    .ImproveBadElementQuality "True" ',content);
content = sprintf('%s\n    .SubsequentChecksOnlyOnce "False" ',content);
content = sprintf('%s\n    .WavelengthBasedRefinement "True" ',content);
content = sprintf('%s\n    .EnableLinearGrowthLimitation "True" ',content);
content = sprintf('%s\n    .SetLinearGrowthLimitation "30" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set 3d mesh adaptation properties',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N131(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.3489373386299" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.37398" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.30598" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.56330118765157" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5236" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6399" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.5523901891514" ',content);
content = sprintf('%s\n  .SetParameterMin "1.3704" ',content);
content = sprintf('%s\n  .SetParameterMax "1.6749" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.2314562231383" ',content);
content = sprintf('%s\n  .SetParameterMin "2.0783" ',content);
content = sprintf('%s\n  .SetParameterMax "2.5401" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.43435682365817" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41442" ',content);
content = sprintf('%s\n  .SetParameterMax "0.50652" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.8626569109099" ',content);
content = sprintf('%s\n  .SetParameterMin "0.85" ',content);
content = sprintf('%s\n  .SetParameterMax "0.9849" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4674355509139" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1223" ',content);
content = sprintf('%s\n  .SetParameterMax "3.8161" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.31132084228016" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3" ',content);
content = sprintf('%s\n  .SetParameterMax "0.35339" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N132(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- define frequency domain solver parameters
%--------------------------------------------
function status = f_define_frequency_domain_solver_parameters_N133(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nMesh.SetCreator "High Frequency" ',content);
content = sprintf('%s\nWith FDSolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .Method "Tetrahedral Mesh" ',content);
content = sprintf('%s\n     .OrderTet "Second" ',content);
content = sprintf('%s\n     .OrderHFMOR "1" ',content);
content = sprintf('%s\n     .OrderSrf "First" ',content);
content = sprintf('%s\n     .Stimulation "List", "List" ',content);
content = sprintf('%s\n     .ResetExcitationList ',content);
content = sprintf('%s\n     .AddToExcitationList "1", "1;" ',content);
content = sprintf('%s\n     .AutoNormImpedance "False" ',content);
content = sprintf('%s\n     .NormingImpedance "50" ',content);
content = sprintf('%s\n     .ModesOnly "False" ',content);
content = sprintf('%s\n     .ConsiderPortLossesTet "True" ',content);
content = sprintf('%s\n     .SetShieldAllPorts "False" ',content);
content = sprintf('%s\n     .AccuracyHex "1e-6" ',content);
content = sprintf('%s\n     .AccuracyTet "0.0001" ',content);
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
content = sprintf('%s\n     .HexMORSettings "", "1001" ',content);
content = sprintf('%s\n     .NewIterativeSolver "True" ',content);
content = sprintf('%s\n     .TDCompatibleMaterials "False" ',content);
content = sprintf('%s\n     .ExtrudeOpenBC "False" ',content);
content = sprintf('%s\n     .SetOpenBCTypeHex "Default" ',content);
content = sprintf('%s\n     .SetOpenBCTypeTet "Default" ',content);
content = sprintf('%s\n     .AddMonitorSamples "True" ',content);
content = sprintf('%s\n     .SParameterSweep "False" ',content);
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
content = sprintf('%s\n     .InterpolationSamples "1001" ',content);
content = sprintf('%s\n     .SweepWeightEvanescent "1.0" ',content);
content = sprintf('%s\n     .AddSampleInterval "33", "50", "2", "Equidistant", "True" ',content);
content = sprintf('%s\n     .AddSampleInterval "33", "50", "18", "Equidistant", "False" ',content);
content = sprintf('%s\n     .MPIParallelization "False"',content);
content = sprintf('%s\n     .UseDistributedComputing "False"',content);
content = sprintf('%s\n     .NetworkComputingStrategy "RunRemote"',content);
content = sprintf('%s\n     .NetworkComputingJobCount "3"',content);
content = sprintf('%s\n     .LimitCPUs "True"',content);
content = sprintf('%s\n     .MaxCPUs "32"',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith IESolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .UseFastFrequencySweep "False" ',content);
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
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define frequency domain solver parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N134(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N135(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "10" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.35391467689691" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.37398" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.30598" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.56295371655771" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5236" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6399" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.5874939592798" ',content);
content = sprintf('%s\n  .SetParameterMin "1.3704" ',content);
content = sprintf('%s\n  .SetParameterMax "1.6749" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.2629717231414" ',content);
content = sprintf('%s\n  .SetParameterMin "2.0783" ',content);
content = sprintf('%s\n  .SetParameterMax "2.5401" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.7" ',content);
content = sprintf('%s\n  .SetParameterMax "3.3" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.42376259698351" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41442" ',content);
content = sprintf('%s\n  .SetParameterMax "0.50652" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.85576716972946" ',content);
content = sprintf('%s\n  .SetParameterMin "0.85" ',content);
content = sprintf('%s\n  .SetParameterMax "0.9849" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4709495437819" ',content);
content = sprintf('%s\n  .SetParameterMin "3.1223" ',content);
content = sprintf('%s\n  .SetParameterMax "3.8161" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.3102776146559" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3" ',content);
content = sprintf('%s\n  .SetParameterMax "0.35339" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N136(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set mesh properties
%--------------------------------------------
function status = f_set_mesh_properties_N137(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshSettings',content);
content = sprintf('%s\n     .SetMeshType "Tet" ',content);
content = sprintf('%s\n     .Set "Version", 0%',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith Mesh ',content);
content = sprintf('%s\n     .StepsPerWavelengthTet "5" ',content);
content = sprintf('%s\n     .MinimumStepNumberTet "10" ',content);
content = sprintf('%s\n     .MeshType "Tetrahedral" ',content);
content = sprintf('%s\n     .MeshAllRegions "False" ',content);
content = sprintf('%s\n     .MaterialRefinementTet "True" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set mesh properties',content);
end
%--------------------------------------------
% FUNCTION:- set 3d mesh adaptation properties
%--------------------------------------------
function status = f_set_3d_mesh_adaptation_properties_N138(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshAdaption3D',content);
content = sprintf('%s\n    .SetType "HighFrequencyTet" ',content);
content = sprintf('%s\n    .SetAdaptionStrategy "ExpertSystem" ',content);
content = sprintf('%s\n    .MinPasses "3" ',content);
content = sprintf('%s\n    .MaxPasses "3" ',content);
content = sprintf('%s\n    .ClearStopCriteria ',content);
content = sprintf('%s\n    .MaxDeltaS "1e-14" ',content);
content = sprintf('%s\n    .NumberOfDeltaSChecks "2" ',content);
content = sprintf('%s\n    .EnableInnerSParameterAdaptation "True" ',content);
content = sprintf('%s\n    .PropagationConstantAccuracy "0.005" ',content);
content = sprintf('%s\n    .NumberOfPropConstChecks "2" ',content);
content = sprintf('%s\n    .EnablePortPropagationConstantAdaptation "True" ',content);
content = sprintf('%s\n    .Add0DResultStopCriterion "", "0.004", "1", "False" ',content);
content = sprintf('%s\n    .AddSParameterStopCriterion "True", "", "", "0.02", "1", "False" ',content);
content = sprintf('%s\n    .MinimumAcceptedCellGrowth "0.5" ',content);
content = sprintf('%s\n    .RefThetaFactor "30" ',content);
content = sprintf('%s\n    .SetMinimumMeshCellGrowth "5" ',content);
content = sprintf('%s\n    .ErrorEstimatorType "Automatic" ',content);
content = sprintf('%s\n    .RefinementType "Automatic" ',content);
content = sprintf('%s\n    .SnapToGeometry "True" ',content);
content = sprintf('%s\n    .ImproveBadElementQuality "True" ',content);
content = sprintf('%s\n    .SubsequentChecksOnlyOnce "False" ',content);
content = sprintf('%s\n    .WavelengthBasedRefinement "True" ',content);
content = sprintf('%s\n    .EnableLinearGrowthLimitation "True" ',content);
content = sprintf('%s\n    .SetLinearGrowthLimitation "30" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set 3d mesh adaptation properties',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N139(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "20" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.353" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.37398" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.30598" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.563" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5236" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6399" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1.590" ',content);
content = sprintf('%s\n  .SetParameterMin "1.3704" ',content);
content = sprintf('%s\n  .SetParameterMax "1.6749" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2.264" ',content);
content = sprintf('%s\n  .SetParameterMin "2.0783" ',content);
content = sprintf('%s\n  .SetParameterMax "2.5401" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.1" ',content);
content = sprintf('%s\n  .SetParameterMin "2.48" ',content);
content = sprintf('%s\n  .SetParameterMax "3.72" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.422" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41442" ',content);
content = sprintf('%s\n  .SetParameterMax "0.50652" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.854" ',content);
content = sprintf('%s\n  .SetParameterMin "0.85" ',content);
content = sprintf('%s\n  .SetParameterMax "0.9849" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.473" ',content);
content = sprintf('%s\n  .SetParameterMin "2.778" ',content);
content = sprintf('%s\n  .SetParameterMax "4.168" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.310" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3" ',content);
content = sprintf('%s\n  .SetParameterMax "0.35339" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N140(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 0
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__0_N141(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "0", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "<" ',content);
content = sprintf('%s\n  .SetGoalTarget "-38" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "2" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S1,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 0',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N142(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N143(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "20" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.353" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.4236" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.2824" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.563" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4504" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6756" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.590" ',content);
content = sprintf('%s\n  .SetParameterMin "1.272" ',content);
content = sprintf('%s\n  .SetParameterMax "1.908" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.264" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8112" ',content);
content = sprintf('%s\n  .SetParameterMax "2.7168" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.0395570650916" ',content);
content = sprintf('%s\n  .SetParameterMin "2.5" ',content);
content = sprintf('%s\n  .SetParameterMax "3.647" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.422" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41442" ',content);
content = sprintf('%s\n  .SetParameterMax "0.50652" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.854" ',content);
content = sprintf('%s\n  .SetParameterMin "0.85" ',content);
content = sprintf('%s\n  .SetParameterMax "1.0248" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4741780682141" ',content);
content = sprintf('%s\n  .SetParameterMin "2.779" ',content);
content = sprintf('%s\n  .SetParameterMax "4.169" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.310" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3" ',content);
content = sprintf('%s\n  .SetParameterMax "0.372" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N144(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N145(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-19.5" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "8" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set mesh properties
%--------------------------------------------
function status = f_set_mesh_properties_N146(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshSettings',content);
content = sprintf('%s\n     .SetMeshType "Tet" ',content);
content = sprintf('%s\n     .Set "Version", 0%',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith Mesh ',content);
content = sprintf('%s\n     .StepsPerWavelengthTet "6" ',content);
content = sprintf('%s\n     .MinimumStepNumberTet "10" ',content);
content = sprintf('%s\n     .MeshType "Tetrahedral" ',content);
content = sprintf('%s\n     .MeshAllRegions "False" ',content);
content = sprintf('%s\n     .MaterialRefinementTet "True" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set mesh properties',content);
end
%--------------------------------------------
% FUNCTION:- set 3d mesh adaptation properties
%--------------------------------------------
function status = f_set_3d_mesh_adaptation_properties_N147(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshAdaption3D',content);
content = sprintf('%s\n    .SetType "HighFrequencyTet" ',content);
content = sprintf('%s\n    .SetAdaptionStrategy "ExpertSystem" ',content);
content = sprintf('%s\n    .MinPasses "3" ',content);
content = sprintf('%s\n    .MaxPasses "4" ',content);
content = sprintf('%s\n    .ClearStopCriteria ',content);
content = sprintf('%s\n    .MaxDeltaS "1e-14" ',content);
content = sprintf('%s\n    .NumberOfDeltaSChecks "2" ',content);
content = sprintf('%s\n    .EnableInnerSParameterAdaptation "True" ',content);
content = sprintf('%s\n    .PropagationConstantAccuracy "0.005" ',content);
content = sprintf('%s\n    .NumberOfPropConstChecks "2" ',content);
content = sprintf('%s\n    .EnablePortPropagationConstantAdaptation "True" ',content);
content = sprintf('%s\n    .Add0DResultStopCriterion "", "0.004", "1", "False" ',content);
content = sprintf('%s\n    .AddSParameterStopCriterion "True", "", "", "0.02", "1", "False" ',content);
content = sprintf('%s\n    .MinimumAcceptedCellGrowth "0.5" ',content);
content = sprintf('%s\n    .RefThetaFactor "30" ',content);
content = sprintf('%s\n    .SetMinimumMeshCellGrowth "5" ',content);
content = sprintf('%s\n    .ErrorEstimatorType "Automatic" ',content);
content = sprintf('%s\n    .RefinementType "Automatic" ',content);
content = sprintf('%s\n    .SnapToGeometry "True" ',content);
content = sprintf('%s\n    .ImproveBadElementQuality "True" ',content);
content = sprintf('%s\n    .SubsequentChecksOnlyOnce "False" ',content);
content = sprintf('%s\n    .WavelengthBasedRefinement "True" ',content);
content = sprintf('%s\n    .EnableLinearGrowthLimitation "True" ',content);
content = sprintf('%s\n    .SetLinearGrowthLimitation "30" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set 3d mesh adaptation properties',content);
end
%--------------------------------------------
% FUNCTION:- set mesh properties
%--------------------------------------------
function status = f_set_mesh_properties_N148(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshSettings',content);
content = sprintf('%s\n     .SetMeshType "Tet" ',content);
content = sprintf('%s\n     .Set "Version", 0%',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith Mesh ',content);
content = sprintf('%s\n     .StepsPerWavelengthTet "8" ',content);
content = sprintf('%s\n     .MinimumStepNumberTet "10" ',content);
content = sprintf('%s\n     .MeshType "Tetrahedral" ',content);
content = sprintf('%s\n     .MeshAllRegions "False" ',content);
content = sprintf('%s\n     .MaterialRefinementTet "True" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set mesh properties',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N149(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N150(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-19.85" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "8" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N151(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "20" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.353" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.4236" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.2824" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.563" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4504" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6756" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.59" ',content);
content = sprintf('%s\n  .SetParameterMin "1.272" ',content);
content = sprintf('%s\n  .SetParameterMax "1.908" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.264" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8112" ',content);
content = sprintf('%s\n  .SetParameterMax "2.7168" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.4" ',content);
content = sprintf('%s\n  .SetParameterMax "3.6" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.422" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41442" ',content);
content = sprintf('%s\n  .SetParameterMax "0.50652" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.854" ',content);
content = sprintf('%s\n  .SetParameterMin "0.85" ',content);
content = sprintf('%s\n  .SetParameterMax "1.0248" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.473" ',content);
content = sprintf('%s\n  .SetParameterMin "2.778" ',content);
content = sprintf('%s\n  .SetParameterMax "4.168" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.31" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3" ',content);
content = sprintf('%s\n  .SetParameterMax "0.372" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N152(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set mesh properties
%--------------------------------------------
function status = f_set_mesh_properties_N153(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshSettings',content);
content = sprintf('%s\n     .SetMeshType "Tet" ',content);
content = sprintf('%s\n     .Set "Version", 0%',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith Mesh ',content);
content = sprintf('%s\n     .StepsPerWavelengthTet "6" ',content);
content = sprintf('%s\n     .MinimumStepNumberTet "10" ',content);
content = sprintf('%s\n     .MeshType "Tetrahedral" ',content);
content = sprintf('%s\n     .MeshAllRegions "False" ',content);
content = sprintf('%s\n     .MaterialRefinementTet "True" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set mesh properties',content);
end
%--------------------------------------------
% FUNCTION:- define frequency domain solver parameters
%--------------------------------------------
function status = f_define_frequency_domain_solver_parameters_N154(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nMesh.SetCreator "High Frequency" ',content);
content = sprintf('%s\nWith FDSolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .Method "Tetrahedral Mesh" ',content);
content = sprintf('%s\n     .OrderTet "Second" ',content);
content = sprintf('%s\n     .OrderHFMOR "1" ',content);
content = sprintf('%s\n     .OrderSrf "First" ',content);
content = sprintf('%s\n     .Stimulation "List", "List" ',content);
content = sprintf('%s\n     .ResetExcitationList ',content);
content = sprintf('%s\n     .AddToExcitationList "1", "1;" ',content);
content = sprintf('%s\n     .AutoNormImpedance "False" ',content);
content = sprintf('%s\n     .NormingImpedance "50" ',content);
content = sprintf('%s\n     .ModesOnly "False" ',content);
content = sprintf('%s\n     .ConsiderPortLossesTet "True" ',content);
content = sprintf('%s\n     .SetShieldAllPorts "False" ',content);
content = sprintf('%s\n     .AccuracyHex "1e-6" ',content);
content = sprintf('%s\n     .AccuracyTet "0.0001" ',content);
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
content = sprintf('%s\n     .HexMORSettings "", "1001" ',content);
content = sprintf('%s\n     .NewIterativeSolver "True" ',content);
content = sprintf('%s\n     .TDCompatibleMaterials "False" ',content);
content = sprintf('%s\n     .ExtrudeOpenBC "False" ',content);
content = sprintf('%s\n     .SetOpenBCTypeHex "Default" ',content);
content = sprintf('%s\n     .SetOpenBCTypeTet "Default" ',content);
content = sprintf('%s\n     .AddMonitorSamples "True" ',content);
content = sprintf('%s\n     .SParameterSweep "False" ',content);
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
content = sprintf('%s\n     .InterpolationSamples "1001" ',content);
content = sprintf('%s\n     .SweepWeightEvanescent "1.0" ',content);
content = sprintf('%s\n     .AddSampleInterval "33", "50", "1", "Single", "True" ',content);
content = sprintf('%s\n     .AddSampleInterval "33", "50", "18", "Equidistant", "False" ',content);
content = sprintf('%s\n     .MPIParallelization "False"',content);
content = sprintf('%s\n     .UseDistributedComputing "False"',content);
content = sprintf('%s\n     .NetworkComputingStrategy "RunRemote"',content);
content = sprintf('%s\n     .NetworkComputingJobCount "3"',content);
content = sprintf('%s\n     .LimitCPUs "True"',content);
content = sprintf('%s\n     .MaxCPUs "32"',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith IESolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .UseFastFrequencySweep "False" ',content);
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
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define frequency domain solver parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N155(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N156(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-19.6" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "8" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N157(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N158(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-19.7" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "8" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N159(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N160(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "20" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.329" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.4236" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.2824" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.604" ',content);
content = sprintf('%s\n  .SetParameterMin "0.4504" ',content);
content = sprintf('%s\n  .SetParameterMax "0.6756" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.480" ',content);
content = sprintf('%s\n  .SetParameterMin "1.272" ',content);
content = sprintf('%s\n  .SetParameterMax "1.908" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.190" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8112" ',content);
content = sprintf('%s\n  .SetParameterMax "2.7168" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.0" ',content);
content = sprintf('%s\n  .SetParameterMin "2.4" ',content);
content = sprintf('%s\n  .SetParameterMax "3.6" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.422" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41442" ',content);
content = sprintf('%s\n  .SetParameterMax "0.50652" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.872" ',content);
content = sprintf('%s\n  .SetParameterMin "0.85" ',content);
content = sprintf('%s\n  .SetParameterMax "1.0248" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.463" ',content);
content = sprintf('%s\n  .SetParameterMin "2.778" ',content);
content = sprintf('%s\n  .SetParameterMax "4.168" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.305" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3" ',content);
content = sprintf('%s\n  .SetParameterMax "0.372" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N161(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- define frequency domain solver parameters
%--------------------------------------------
function status = f_define_frequency_domain_solver_parameters_N162(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nMesh.SetCreator "High Frequency" ',content);
content = sprintf('%s\nWith FDSolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .Method "Tetrahedral Mesh" ',content);
content = sprintf('%s\n     .OrderTet "Second" ',content);
content = sprintf('%s\n     .OrderHFMOR "1" ',content);
content = sprintf('%s\n     .OrderSrf "First" ',content);
content = sprintf('%s\n     .Stimulation "List", "List" ',content);
content = sprintf('%s\n     .ResetExcitationList ',content);
content = sprintf('%s\n     .AddToExcitationList "1", "1;" ',content);
content = sprintf('%s\n     .AutoNormImpedance "False" ',content);
content = sprintf('%s\n     .NormingImpedance "50" ',content);
content = sprintf('%s\n     .ModesOnly "False" ',content);
content = sprintf('%s\n     .ConsiderPortLossesTet "True" ',content);
content = sprintf('%s\n     .SetShieldAllPorts "False" ',content);
content = sprintf('%s\n     .AccuracyHex "1e-6" ',content);
content = sprintf('%s\n     .AccuracyTet "0.0001" ',content);
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
content = sprintf('%s\n     .HexMORSettings "", "1001" ',content);
content = sprintf('%s\n     .NewIterativeSolver "True" ',content);
content = sprintf('%s\n     .TDCompatibleMaterials "False" ',content);
content = sprintf('%s\n     .ExtrudeOpenBC "False" ',content);
content = sprintf('%s\n     .SetOpenBCTypeHex "Default" ',content);
content = sprintf('%s\n     .SetOpenBCTypeTet "Default" ',content);
content = sprintf('%s\n     .AddMonitorSamples "True" ',content);
content = sprintf('%s\n     .SParameterSweep "False" ',content);
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
content = sprintf('%s\n     .InterpolationSamples "1001" ',content);
content = sprintf('%s\n     .SweepWeightEvanescent "1.0" ',content);
content = sprintf('%s\n     .AddSampleInterval "33", "50", "2", "Equidistant", "True" ',content);
content = sprintf('%s\n     .AddSampleInterval "33", "50", "18", "Equidistant", "False" ',content);
content = sprintf('%s\n     .MPIParallelization "False"',content);
content = sprintf('%s\n     .UseDistributedComputing "False"',content);
content = sprintf('%s\n     .NetworkComputingStrategy "RunRemote"',content);
content = sprintf('%s\n     .NetworkComputingJobCount "3"',content);
content = sprintf('%s\n     .LimitCPUs "True"',content);
content = sprintf('%s\n     .MaxCPUs "32"',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith IESolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .UseFastFrequencySweep "False" ',content);
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
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define frequency domain solver parameters',content);
end
%--------------------------------------------
% FUNCTION:- set 3d mesh adaptation properties
%--------------------------------------------
function status = f_set_3d_mesh_adaptation_properties_N163(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshAdaption3D',content);
content = sprintf('%s\n    .SetType "HighFrequencyTet" ',content);
content = sprintf('%s\n    .SetAdaptionStrategy "ExpertSystem" ',content);
content = sprintf('%s\n    .MinPasses "3" ',content);
content = sprintf('%s\n    .MaxPasses "4" ',content);
content = sprintf('%s\n    .ClearStopCriteria ',content);
content = sprintf('%s\n    .MaxDeltaS "1e-14" ',content);
content = sprintf('%s\n    .NumberOfDeltaSChecks "2" ',content);
content = sprintf('%s\n    .EnableInnerSParameterAdaptation "True" ',content);
content = sprintf('%s\n    .PropagationConstantAccuracy "0.005" ',content);
content = sprintf('%s\n    .NumberOfPropConstChecks "2" ',content);
content = sprintf('%s\n    .EnablePortPropagationConstantAdaptation "True" ',content);
content = sprintf('%s\n    .Add0DResultStopCriterion "", "0.004", "1", "False" ',content);
content = sprintf('%s\n    .AddSParameterStopCriterion "True", "", "", "0.02", "1", "False" ',content);
content = sprintf('%s\n    .MinimumAcceptedCellGrowth "0.5" ',content);
content = sprintf('%s\n    .RefThetaFactor "30" ',content);
content = sprintf('%s\n    .SetMinimumMeshCellGrowth "5" ',content);
content = sprintf('%s\n    .ErrorEstimatorType "Automatic" ',content);
content = sprintf('%s\n    .RefinementType "Automatic" ',content);
content = sprintf('%s\n    .SnapToGeometry "True" ',content);
content = sprintf('%s\n    .ImproveBadElementQuality "True" ',content);
content = sprintf('%s\n    .SubsequentChecksOnlyOnce "False" ',content);
content = sprintf('%s\n    .WavelengthBasedRefinement "True" ',content);
content = sprintf('%s\n    .EnableLinearGrowthLimitation "True" ',content);
content = sprintf('%s\n    .SetLinearGrowthLimitation "30" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set 3d mesh adaptation properties',content);
end
%--------------------------------------------
% FUNCTION:- define frequency domain solver parameters
%--------------------------------------------
function status = f_define_frequency_domain_solver_parameters_N164(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nMesh.SetCreator "High Frequency" ',content);
content = sprintf('%s\nWith FDSolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .Method "Tetrahedral Mesh" ',content);
content = sprintf('%s\n     .OrderTet "Second" ',content);
content = sprintf('%s\n     .OrderHFMOR "1" ',content);
content = sprintf('%s\n     .OrderSrf "First" ',content);
content = sprintf('%s\n     .Stimulation "List", "List" ',content);
content = sprintf('%s\n     .ResetExcitationList ',content);
content = sprintf('%s\n     .AddToExcitationList "1", "1;" ',content);
content = sprintf('%s\n     .AutoNormImpedance "False" ',content);
content = sprintf('%s\n     .NormingImpedance "50" ',content);
content = sprintf('%s\n     .ModesOnly "False" ',content);
content = sprintf('%s\n     .ConsiderPortLossesTet "True" ',content);
content = sprintf('%s\n     .SetShieldAllPorts "False" ',content);
content = sprintf('%s\n     .AccuracyHex "1e-6" ',content);
content = sprintf('%s\n     .AccuracyTet "0.0001" ',content);
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
content = sprintf('%s\n     .HexMORSettings "", "1001" ',content);
content = sprintf('%s\n     .NewIterativeSolver "True" ',content);
content = sprintf('%s\n     .TDCompatibleMaterials "False" ',content);
content = sprintf('%s\n     .ExtrudeOpenBC "False" ',content);
content = sprintf('%s\n     .SetOpenBCTypeHex "Default" ',content);
content = sprintf('%s\n     .SetOpenBCTypeTet "Default" ',content);
content = sprintf('%s\n     .AddMonitorSamples "True" ',content);
content = sprintf('%s\n     .SParameterSweep "False" ',content);
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
content = sprintf('%s\n     .InterpolationSamples "1001" ',content);
content = sprintf('%s\n     .SweepWeightEvanescent "1.0" ',content);
content = sprintf('%s\n     .AddSampleInterval "50", "50", "1", "Single", "True" ',content);
content = sprintf('%s\n     .AddSampleInterval "33", "50", "18", "Equidistant", "False" ',content);
content = sprintf('%s\n     .MPIParallelization "False"',content);
content = sprintf('%s\n     .UseDistributedComputing "False"',content);
content = sprintf('%s\n     .NetworkComputingStrategy "RunRemote"',content);
content = sprintf('%s\n     .NetworkComputingJobCount "3"',content);
content = sprintf('%s\n     .LimitCPUs "True"',content);
content = sprintf('%s\n     .MaxCPUs "32"',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith IESolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .UseFastFrequencySweep "False" ',content);
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
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define frequency domain solver parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N165(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "20" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.32057096259638" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.3847" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.2565" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.67427990535264" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5394" ',content);
content = sprintf('%s\n  .SetParameterMax "0.8091" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.4356369227591" ',content);
content = sprintf('%s\n  .SetParameterMin "1.1485" ',content);
content = sprintf('%s\n  .SetParameterMax "1.7228" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.1975414033114" ',content);
content = sprintf('%s\n  .SetParameterMin "1.758" ',content);
content = sprintf('%s\n  .SetParameterMax "2.637" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.4" ',content);
content = sprintf('%s\n  .SetParameterMax "3.6" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.422" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41442" ',content);
content = sprintf('%s\n  .SetParameterMax "0.50652" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.91127575525484" ',content);
content = sprintf('%s\n  .SetParameterMin "0.85" ',content);
content = sprintf('%s\n  .SetParameterMax "1.0935" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4655493401997" ',content);
content = sprintf('%s\n  .SetParameterMin "2.772" ',content);
content = sprintf('%s\n  .SetParameterMax "4.159" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.3123573041029" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3" ',content);
content = sprintf('%s\n  .SetParameterMax "0.3748" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N166(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N167(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-19.75" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "9" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N168(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N169(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-19.75" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "16" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3,1" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set 3d mesh adaptation properties
%--------------------------------------------
function status = f_set_3d_mesh_adaptation_properties_N170(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshAdaption3D',content);
content = sprintf('%s\n    .SetType "HighFrequencyTet" ',content);
content = sprintf('%s\n    .SetAdaptionStrategy "ExpertSystem" ',content);
content = sprintf('%s\n    .MinPasses "3" ',content);
content = sprintf('%s\n    .MaxPasses "6" ',content);
content = sprintf('%s\n    .ClearStopCriteria ',content);
content = sprintf('%s\n    .MaxDeltaS "1e-14" ',content);
content = sprintf('%s\n    .NumberOfDeltaSChecks "2" ',content);
content = sprintf('%s\n    .EnableInnerSParameterAdaptation "True" ',content);
content = sprintf('%s\n    .PropagationConstantAccuracy "0.005" ',content);
content = sprintf('%s\n    .NumberOfPropConstChecks "2" ',content);
content = sprintf('%s\n    .EnablePortPropagationConstantAdaptation "True" ',content);
content = sprintf('%s\n    .Add0DResultStopCriterion "", "0.004", "1", "False" ',content);
content = sprintf('%s\n    .AddSParameterStopCriterion "True", "", "", "0.02", "1", "False" ',content);
content = sprintf('%s\n    .MinimumAcceptedCellGrowth "0.5" ',content);
content = sprintf('%s\n    .RefThetaFactor "30" ',content);
content = sprintf('%s\n    .SetMinimumMeshCellGrowth "5" ',content);
content = sprintf('%s\n    .ErrorEstimatorType "Automatic" ',content);
content = sprintf('%s\n    .RefinementType "Automatic" ',content);
content = sprintf('%s\n    .SnapToGeometry "True" ',content);
content = sprintf('%s\n    .ImproveBadElementQuality "True" ',content);
content = sprintf('%s\n    .SubsequentChecksOnlyOnce "False" ',content);
content = sprintf('%s\n    .WavelengthBasedRefinement "True" ',content);
content = sprintf('%s\n    .EnableLinearGrowthLimitation "True" ',content);
content = sprintf('%s\n    .SetLinearGrowthLimitation "30" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set 3d mesh adaptation properties',content);
end
%--------------------------------------------
% FUNCTION:- set mesh properties
%--------------------------------------------
function status = f_set_mesh_properties_N171(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith MeshSettings',content);
content = sprintf('%s\n     .SetMeshType "Tet" ',content);
content = sprintf('%s\n     .Set "Version", 0%',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith Mesh ',content);
content = sprintf('%s\n     .StepsPerWavelengthTet "7" ',content);
content = sprintf('%s\n     .MinimumStepNumberTet "10" ',content);
content = sprintf('%s\n     .MeshType "Tetrahedral" ',content);
content = sprintf('%s\n     .MeshAllRegions "False" ',content);
content = sprintf('%s\n     .MaterialRefinementTet "True" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set mesh properties',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N172(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- define frequency domain solver parameters
%--------------------------------------------
function status = f_define_frequency_domain_solver_parameters_N173(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nMesh.SetCreator "High Frequency" ',content);
content = sprintf('%s\nWith FDSolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .Method "Tetrahedral Mesh" ',content);
content = sprintf('%s\n     .OrderTet "Second" ',content);
content = sprintf('%s\n     .OrderHFMOR "1" ',content);
content = sprintf('%s\n     .OrderSrf "First" ',content);
content = sprintf('%s\n     .Stimulation "List", "List" ',content);
content = sprintf('%s\n     .ResetExcitationList ',content);
content = sprintf('%s\n     .AddToExcitationList "2", "1" ',content);
content = sprintf('%s\n     .AutoNormImpedance "False" ',content);
content = sprintf('%s\n     .NormingImpedance "50" ',content);
content = sprintf('%s\n     .ModesOnly "False" ',content);
content = sprintf('%s\n     .ConsiderPortLossesTet "True" ',content);
content = sprintf('%s\n     .SetShieldAllPorts "False" ',content);
content = sprintf('%s\n     .AccuracyHex "1e-6" ',content);
content = sprintf('%s\n     .AccuracyTet "0.0001" ',content);
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
content = sprintf('%s\n     .HexMORSettings "", "1001" ',content);
content = sprintf('%s\n     .NewIterativeSolver "True" ',content);
content = sprintf('%s\n     .TDCompatibleMaterials "False" ',content);
content = sprintf('%s\n     .ExtrudeOpenBC "False" ',content);
content = sprintf('%s\n     .SetOpenBCTypeHex "Default" ',content);
content = sprintf('%s\n     .SetOpenBCTypeTet "Default" ',content);
content = sprintf('%s\n     .AddMonitorSamples "True" ',content);
content = sprintf('%s\n     .SParameterSweep "False" ',content);
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
content = sprintf('%s\n     .InterpolationSamples "1001" ',content);
content = sprintf('%s\n     .SweepWeightEvanescent "1.0" ',content);
content = sprintf('%s\n     .AddSampleInterval "50", "50", "1", "Single", "True" ',content);
content = sprintf('%s\n     .AddSampleInterval "33", "50", "18", "Equidistant", "False" ',content);
content = sprintf('%s\n     .MPIParallelization "False"',content);
content = sprintf('%s\n     .UseDistributedComputing "False"',content);
content = sprintf('%s\n     .NetworkComputingStrategy "RunRemote"',content);
content = sprintf('%s\n     .NetworkComputingJobCount "3"',content);
content = sprintf('%s\n     .LimitCPUs "True"',content);
content = sprintf('%s\n     .MaxCPUs "32"',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith IESolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .UseFastFrequencySweep "False" ',content);
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
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define frequency domain solver parameters',content);
end
%--------------------------------------------
% FUNCTION:- modify port: 1
%--------------------------------------------
function status = f_modify_port_1_N174(oMWS,wgR)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Port ',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .LoadContentForModify "1" ',content);
content = sprintf('%s\n     .Label "" ',content);
content = sprintf('%s\n     .NumberOfModes "2" ',content);
content = sprintf('%s\n     .AdjustPolarization "False" ',content);
content = sprintf('%s\n     .PolarizationAngle "0.0" ',content);
content = sprintf('%s\n     .ReferencePlaneDistance "0" ',content);
content = sprintf('%s\n     .TextSize "50" ',content);
content = sprintf('%s\n     .Coordinates "Free" ',content);
content = sprintf('%s\n     .Orientation "zmin" ',content);
content = sprintf('%s\n     .PortOnBound "False" ',content);
content = sprintf('%s\n     .ClipPickedPortToBound "False" ',content);
content = sprintf('%s\n     .Xrange "-wgR", "wgR" ',content);
content = sprintf('%s\n     .Yrange "-wgR", "wgR" ',content);
content = sprintf('%s\n     .Zrange "0", "0" ',content);
content = sprintf('%s\n     .XrangeAdd "0.0", "0.0" ',content);
content = sprintf('%s\n     .YrangeAdd "0.0", "0.0" ',content);
content = sprintf('%s\n     .ZrangeAdd "0.0", "0.0" ',content);
content = sprintf('%s\n     .SingleEnded "False" ',content);
content = sprintf('%s\n     .Shield "none" ',content);
content = sprintf('%s\n     .Modify ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','modify port: 1',content);
end
%--------------------------------------------
% FUNCTION:- modify port: 2
%--------------------------------------------
function status = f_modify_port_2_N175(oMWS,lIN1,lIN2,wgB1,wgR)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Port ',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .LoadContentForModify "2" ',content);
content = sprintf('%s\n     .Label "" ',content);
content = sprintf('%s\n     .NumberOfModes "2" ',content);
content = sprintf('%s\n     .AdjustPolarization "False" ',content);
content = sprintf('%s\n     .PolarizationAngle "0.0" ',content);
content = sprintf('%s\n     .ReferencePlaneDistance "0" ',content);
content = sprintf('%s\n     .TextSize "50" ',content);
content = sprintf('%s\n     .Coordinates "Free" ',content);
content = sprintf('%s\n     .Orientation "zmax" ',content);
content = sprintf('%s\n     .PortOnBound "False" ',content);
content = sprintf('%s\n     .ClipPickedPortToBound "False" ',content);
content = sprintf('%s\n     .Xrange "-wgR", "wgR" ',content);
content = sprintf('%s\n     .Yrange "-wgR", "wgR" ',content);
content = sprintf('%s\n     .Zrange "lIN1+wgB1+lIN2", "lIN1+wgB1+lIN2" ',content);
content = sprintf('%s\n     .XrangeAdd "0.0", "0.0" ',content);
content = sprintf('%s\n     .YrangeAdd "0.0", "0.0" ',content);
content = sprintf('%s\n     .ZrangeAdd "0.0", "0.0" ',content);
content = sprintf('%s\n     .SingleEnded "False" ',content);
content = sprintf('%s\n     .Shield "none" ',content);
content = sprintf('%s\n     .Modify ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','modify port: 2',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N176(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- delete all optimizer goals
%--------------------------------------------
function status = f_delete_all_optimizer_goals_N177(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nOptimizer.DeleteAllGoals',content);
status = oMWS.invoke('AddToHistory','delete all optimizer goals',content);
end
%--------------------------------------------
% FUNCTION:- add optimizer goals: 1DC Primary Result / 0
%--------------------------------------------
function status = f_add_optimizer_goals_1DC_Primary_Result__0_N178(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .AddGoal "1DC Primary Result" ',content);
content = sprintf('%s\n  .SetGoalOperator "<" ',content);
content = sprintf('%s\n  .SetGoalTarget "-36" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "1.0" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S1(1),1(1)" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','add optimizer goals: 1DC Primary Result / 0',content);
end
%--------------------------------------------
% FUNCTION:- add optimizer goals: 1DC Primary Result / 1
%--------------------------------------------
function status = f_add_optimizer_goals_1DC_Primary_Result__1_N179(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .AddGoal "1DC Primary Result" ',content);
content = sprintf('%s\n  .SetGoalOperator "<" ',content);
content = sprintf('%s\n  .SetGoalTarget "-36" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "1.0" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S2(1),2(1)" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','add optimizer goals: 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- add optimizer goals: 1DC Primary Result / 2
%--------------------------------------------
function status = f_add_optimizer_goals_1DC_Primary_Result__2_N180(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .AddGoal "1DC Primary Result" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-19.75" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "5" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3(1),1(1)" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','add optimizer goals: 1DC Primary Result / 2',content);
end
%--------------------------------------------
% FUNCTION:- add optimizer goals: 1DC Primary Result / 3
%--------------------------------------------
function status = f_add_optimizer_goals_1DC_Primary_Result__3_N181(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .AddGoal "1DC Primary Result" ',content);
content = sprintf('%s\n  .SetGoalOperator "=" ',content);
content = sprintf('%s\n  .SetGoalTarget "-19.75" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "5" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S3(1),2(1)" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','add optimizer goals: 1DC Primary Result / 3',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N182(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- define frequency domain solver parameters
%--------------------------------------------
function status = f_define_frequency_domain_solver_parameters_N183(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nMesh.SetCreator "High Frequency" ',content);
content = sprintf('%s\nWith FDSolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .Method "Tetrahedral Mesh" ',content);
content = sprintf('%s\n     .OrderTet "Second" ',content);
content = sprintf('%s\n     .OrderHFMOR "1" ',content);
content = sprintf('%s\n     .OrderSrf "First" ',content);
content = sprintf('%s\n     .Stimulation "List", "List" ',content);
content = sprintf('%s\n     .ResetExcitationList ',content);
content = sprintf('%s\n     .AddToExcitationList "1", "1" ',content);
content = sprintf('%s\n     .AddToExcitationList "2", "1" ',content);
content = sprintf('%s\n     .AutoNormImpedance "False" ',content);
content = sprintf('%s\n     .NormingImpedance "50" ',content);
content = sprintf('%s\n     .ModesOnly "False" ',content);
content = sprintf('%s\n     .ConsiderPortLossesTet "True" ',content);
content = sprintf('%s\n     .SetShieldAllPorts "False" ',content);
content = sprintf('%s\n     .AccuracyHex "1e-6" ',content);
content = sprintf('%s\n     .AccuracyTet "0.0001" ',content);
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
content = sprintf('%s\n     .HexMORSettings "", "1001" ',content);
content = sprintf('%s\n     .NewIterativeSolver "True" ',content);
content = sprintf('%s\n     .TDCompatibleMaterials "False" ',content);
content = sprintf('%s\n     .ExtrudeOpenBC "False" ',content);
content = sprintf('%s\n     .SetOpenBCTypeHex "Default" ',content);
content = sprintf('%s\n     .SetOpenBCTypeTet "Default" ',content);
content = sprintf('%s\n     .AddMonitorSamples "True" ',content);
content = sprintf('%s\n     .SParameterSweep "False" ',content);
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
content = sprintf('%s\n     .InterpolationSamples "1001" ',content);
content = sprintf('%s\n     .SweepWeightEvanescent "1.0" ',content);
content = sprintf('%s\n     .AddSampleInterval "50", "50", "1", "Single", "True" ',content);
content = sprintf('%s\n     .AddSampleInterval "33", "50", "18", "Equidistant", "False" ',content);
content = sprintf('%s\n     .MPIParallelization "False"',content);
content = sprintf('%s\n     .UseDistributedComputing "False"',content);
content = sprintf('%s\n     .NetworkComputingStrategy "RunRemote"',content);
content = sprintf('%s\n     .NetworkComputingJobCount "3"',content);
content = sprintf('%s\n     .LimitCPUs "True"',content);
content = sprintf('%s\n     .MaxCPUs "32"',content);
content = sprintf('%s\nEnd With',content);
content = sprintf('%s\nWith IESolver',content);
content = sprintf('%s\n     .Reset ',content);
content = sprintf('%s\n     .UseFastFrequencySweep "False" ',content);
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
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','define frequency domain solver parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N184(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N185(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "20" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.30807895374426" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.3847" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.2565" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.65666294596832" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5394" ',content);
content = sprintf('%s\n  .SetParameterMax "0.8091" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.4683964589834" ',content);
content = sprintf('%s\n  .SetParameterMin "1.1485" ',content);
content = sprintf('%s\n  .SetParameterMax "1.7228" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.1974623611084" ',content);
content = sprintf('%s\n  .SetParameterMin "1.758" ',content);
content = sprintf('%s\n  .SetParameterMax "2.637" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.4" ',content);
content = sprintf('%s\n  .SetParameterMax "3.6" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.422" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41442" ',content);
content = sprintf('%s\n  .SetParameterMax "0.50652" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.85817817689892" ',content);
content = sprintf('%s\n  .SetParameterMin "0.85" ',content);
content = sprintf('%s\n  .SetParameterMax "1.0935" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4615431628319" ',content);
content = sprintf('%s\n  .SetParameterMin "2.772" ',content);
content = sprintf('%s\n  .SetParameterMax "4.159" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.30652834317322" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3" ',content);
content = sprintf('%s\n  .SetParameterMax "0.3748" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N186(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N187(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "<" ',content);
content = sprintf('%s\n  .SetGoalTarget "-36" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "2" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S2(1),2(1)" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N188(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer parameters
%--------------------------------------------
function status = f_set_optimizer_parameters_N189(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgB2,wgB3,wgD2,wgD3,wgH2)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SetMinMaxAuto "20" ',content);
content = sprintf('%s\n  .SetAlwaysStartFromCurrent "True" ',content);
content = sprintf('%s\n  .ResetParameterList',content);
content = sprintf('%s\n  .SelectParameter "BendRadius", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.4" ',content);
content = sprintf('%s\n  .SetParameterMin "0.36" ',content);
content = sprintf('%s\n  .SetParameterMax "0.44" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "-0.29266155591805" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.3847" ',content);
content = sprintf('%s\n  .SetParameterMax "-0.2565" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk2", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.64891829039809" ',content);
content = sprintf('%s\n  .SetParameterMin "0.5394" ',content);
content = sprintf('%s\n  .SetParameterMax "0.8091" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk3", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "1.4345473176471" ',content);
content = sprintf('%s\n  .SetParameterMin "1.1485" ',content);
content = sprintf('%s\n  .SetParameterMax "1.7228" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "Lwk4", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "2.1605811672497" ',content);
content = sprintf('%s\n  .SetParameterMin "1.758" ',content);
content = sprintf('%s\n  .SetParameterMax "2.637" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "LwkR1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3" ',content);
content = sprintf('%s\n  .SetParameterMin "2.4" ',content);
content = sprintf('%s\n  .SetParameterMax "3.6" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgB3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0.422" ',content);
content = sprintf('%s\n  .SetParameterMin "0.41442" ',content);
content = sprintf('%s\n  .SetParameterMax "0.50652" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgD3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.2" ',content);
content = sprintf('%s\n  .SetParameterMax "0.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgH2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "-0.1" ',content);
content = sprintf('%s\n  .SetParameterMax "0.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "delta_wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "0" ',content);
content = sprintf('%s\n  .SetParameterMin "0.000355" ',content);
content = sprintf('%s\n  .SetParameterMax "0.000434" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN2", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "lIN3", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5" ',content);
content = sprintf('%s\n  .SetParameterMin "4.5" ',content);
content = sprintf('%s\n  .SetParameterMax "5.5" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgA4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "5.69" ',content);
content = sprintf('%s\n  .SetParameterMin "5.121" ',content);
content = sprintf('%s\n  .SetParameterMax "6.259" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB1", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "1" ',content);
content = sprintf('%s\n  .SetParameterMin "0.9" ',content);
content = sprintf('%s\n  .SetParameterMax "1.1" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgB4", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "2" ',content);
content = sprintf('%s\n  .SetParameterMin "1.8" ',content);
content = sprintf('%s\n  .SetParameterMax "2.2" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgD1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.85006399642212" ',content);
content = sprintf('%s\n  .SetParameterMin "0.85" ',content);
content = sprintf('%s\n  .SetParameterMax "1.0935" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR", "False" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4" ',content);
content = sprintf('%s\n  .SetParameterMin "3.06" ',content);
content = sprintf('%s\n  .SetParameterMax "3.74" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgR1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "3.4450238094629" ',content);
content = sprintf('%s\n  .SetParameterMin "2.772" ',content);
content = sprintf('%s\n  .SetParameterMax "4.159" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\n  .SelectParameter "wgS1", "True" ',content);
content = sprintf('%s\n  .SetParameterInit "0.30275726207866" ',content);
content = sprintf('%s\n  .SetParameterMin "0.3" ',content);
content = sprintf('%s\n  .SetParameterMax "0.3748" ',content);
content = sprintf('%s\n  .SetParameterAnchors "5" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer parameters',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N190(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer goals 1DC Primary Result / 1
%--------------------------------------------
function status = f_set_optimizer_goals_1DC_Primary_Result__1_N191(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer',content);
content = sprintf('%s\n  .SelectGoal "1", "True" ',content);
content = sprintf('%s\n  .SetGoalOperator "<" ',content);
content = sprintf('%s\n  .SetGoalTarget "-36" ',content);
content = sprintf('%s\n  .UseSlope "False" ',content);
content = sprintf('%s\n  .SetGoalTargetMax "0.0" ',content);
content = sprintf('%s\n  .SetGoalWeight "3" ',content);
content = sprintf('%s\n  .SetGoal1DCResultName "1D Results\\S-Parameters\\S2(1),2(1)" ',content);
content = sprintf('%s\n  .SetGoalScalarType "MagdB20" ',content);
content = sprintf('%s\n  .SetGoalRange "33", "50" ',content);
content = sprintf('%s\n  .SetGoalRangeType "total" ',content);
content = sprintf('%s\nEnd With',content);
status = oMWS.invoke('AddToHistory','set optimizer goals 1DC Primary Result / 1',content);
end
%--------------------------------------------
% FUNCTION:- set optimizer settings
%--------------------------------------------
function status = f_set_optimizer_settings_N192(oMWS)
content = [];
content = sprintf('%s\n''[VERSION]2013.5|23.0.0|20131122[/VERSION]',content);
content = sprintf('%s\nWith Optimizer ',content);
content = sprintf('%s\n  .SetOptimizerType "Trust_Region" ',content);
content = sprintf('%s\n  .SetSimulationType "Frequency Domain Solver" ',content);
content = sprintf('%s\n  .SetAccuracy "0.01" ',content);
content = sprintf('%s\n  .SetDomainAccuracy "0.0001", "Trust_Region" ',content);
content = sprintf('%s\n  .SetNumRefinements "1" ',content);
content = sprintf('%s\n  .SetGenerationSize "32", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGenerationSize "30", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxIt "30", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMaxIt "15", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetMaxEval "5000", "CMAES" ',content);
content = sprintf('%s\n  .SetUseMaxEval "True", "CMAES" ',content);
content = sprintf('%s\n  .SetSigma "0.2", "CMAES" ',content);
content = sprintf('%s\n  .SetMaxEval "250", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseMaxEval "False", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetUsePreDefPointInInitDistribution "True", "CMAES" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Particle_Swarm" ',content);
content = sprintf('%s\n  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" ',content);
content = sprintf('%s\n  .SetMutaionRate "60", "Genetic_Algorithm" ',content);
content = sprintf('%s\n  .SetMinSimplexSize "1e-6" ',content);
content = sprintf('%s\n  .SetGoalSummaryType "Sum_All_Goals" ',content);
content = sprintf('%s\n  .SetUseDataOfPreviousCalculations "False" ',content);
content = sprintf('%s\n  .SetDataStorageStrategy "None" ',content);
content = sprintf('%s\nEnd With ',content);
status = oMWS.invoke('AddToHistory','set optimizer settings',content);
end
%--------------------------------------------
% FUNCTION:- set mesh properties (for backward compatibility)
%--------------------------------------------
function status = f_set_mesh_properties_for_backward_compatibility_N193(oMWS)
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
content = sprintf('%s\n',content);
status = oMWS.invoke('AddToHistory','set mesh properties (for backward compatibility)',content);
end
