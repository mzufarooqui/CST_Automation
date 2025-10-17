close all;clear all;clc;
latexFileName = 'fig-dfsPolMeasRes.tex';
figSizeVar = '\matlabFigWidth';
fileNameWithCaption = {
's11IndPolMeasSim', 'Computed and measured magnitude of the reflection coefficient for inductive polarization ($\sInd$) of the manufactured W-band waveguide \ac{dfs} polarizer prototype A and prototype B. The vertical dash lines identify the operative band [$85$,$104$]\unit{GHz}' 
's11CapPolMeasSim', 'Computed and measured magnitude of the reflection coefficient for capacitive polarization ($\sCap$) of the manufactured W-band waveguide \ac{dfs} polarizer prototype A and prototype B. The vertical dash lines identify the operative band [$85$,$104$]\unit{GHz}'
'xprMeasSim', 'Computed and measured \acf{xpr} level of the manufactured W-band waveguide \ac{dfs} polarizer prototype A and prototype B. The vertical dash lines identify the operative band [$85$,$104$]\unit{GHz}'
'xptMeasSim', 'Computed and measured \acf{xpt} level of the manufactured W-band waveguide \ac{dfs} polarizer prototype A and prototype B. The vertical dash lines identify the operative band [$85$,$104$]\unit{GHz}'
's11IndPolPhaseMeasSim', 'Computed and measured phase of the reflection coefficient for inductive polarization ($\sInd$) of the manufactured W-band waveguide \ac{dfs} polarizer prototype A and prototype B. The vertical dash lines identify the operative band [$85$,$104$]\unit{GHz}'
's11CapPolPhaseMeasSim', 'Computed and measured phase of the reflection coefficient for capacitive polarization ($\sCap$) of the manufactured W-band waveguide \ac{dfs} polarizer prototype A and prototype B. The vertical dash lines identify the operative band [$85$,$104$]\unit{GHz}'
'diffPhaseMeasSim', 'Computed and measured differential phase shift($\Phi$) in W-Band between the transmission coefficient for the principle polarizations of the manufactured W-band waveguide \ac{dfs} polarizer prototype A and prototype B. The vertical dash lines identify the operative band [$85$,$104$]\unit{GHz}'
'diffPhaseZoomMeasSim', 'Computed and measured differential phase shift($\Phi$) in operative band between the transmission coefficient for the principle polarizations of the manufactured W-band waveguide \ac{dfs} polarizer prototype A and prototype B. The vertical dash lines identify the operative band [$85$,$104$]\unit{GHz}'
'relErrorMeasSim', 'Computed and measured differential phase shift relative error ($\epsilon_{\Delta\Phi}$) of the manufactured W-band waveguide \ac{dfs} polarizer prototype A and prototype B. The vertical dash lines identify the operative band [$85$,$104$]\unit{GHz}'
'kuv-MeasSim', 'Computed and measured effect on U channel due to \acl{cp} differential intensity ($K\smm{UV}$) of the manufactured W-band waveguide \ac{dfs} polarizer prototype A and prototype B. The vertical dash lines identify the operative band [$85$,$104$]\unit{GHz}'
's21IndPolMeasSim', 'Computed and measured magnitude of the transmission coefficient for inductive polarization ($\sTrInd$) of the manufactured W-band waveguide \ac{dfs} polarizer prototype A and prototype B. The vertical dash lines identify the operative band [$85$,$104$]\unit{GHz}'
's21CapPolMeasSim', 'Computed and measured magnitude of the transmission coefficient for capacitive polarization ($\sTrCap$) of the manufactured W-band waveguide \ac{dfs} polarizer prototype A and prototype B. The vertical dash lines identify the operative band [$85$,$104$]\unit{GHz}'
'hqq-MeasSim', 'Computed and measured $H\smm{QQ}$ of the manufactured W-band waveguide \ac{dfs} polarizer prototype A and prototype B. The vertical dash lines identify the operative band [$85$,$104$]\unit{GHz}'
'huu-MeasSim', 'Computed and measured $H\smm{UU}$ of the manufactured W-band waveguide \ac{dfs} polarizer prototype A and prototype B. The vertical dash lines identify the operative band [$85$,$104$]\unit{GHz}'
'kqi-MeasSim', 'Computed and measured effect on Q channel due to total intensity ($K\smm{QI}$) of the manufactured W-band waveguide \ac{dfs} polarizer prototype A and prototype B. The vertical dash lines identify the operative band [$85$,$104$]\unit{GHz}'
};

f_GenerateLatexFileForFigures(latexFileName,fileNameWithCaption,figSizeVar);
fprintf(1,'\n\n Finished :) \n');
