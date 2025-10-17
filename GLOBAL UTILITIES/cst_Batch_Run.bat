echo off
set fileName=Vivaldi3.1_Soil_Two_Port_P1_Symm.cst Vivaldi3.1_Soil_Two_Port_P2_Symm.cst
set CST_PATH="C:\Program Files (x86)\CST STUDIO SUITE 2014\CST DESIGN ENVIRONMENT.exe"
set PROJ_PATH="%cd%"
FOR %%i IN (%fileName%) DO %CST_PATH% -m -r %PROJ_PATH%\%%i