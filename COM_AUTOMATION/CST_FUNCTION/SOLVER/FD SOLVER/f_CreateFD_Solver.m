function status = f_CreateFD_Solver(oMWS,oFD_Solver)
%% DEFINE FREQUENCY DOMAIN SOLVER
% # oFD_Solver.bAddToHistory    = 'True';
% # oFD_Solver.accuracyTet      = 1e-6;
% # oFD_Solver.stimulation      = {'All' 'All'};
% # oFD_Solver.stimulationList  = {'p1','1,2';'p2','2,4';'p3','1,4';'p4','3,2';}; AVAILABLE ONLY WHEN stimulation = {'List' 'List'};
% # oFD_Solver.frequencySamples = ;
% # oFD_Solver.method           = 'Tetrahedral Mesh';
% # oFD_Solver.type             = 'Auto';
% # oFD_Solver.addSampleInterval  = {minFreq maxFreq numSample 'Equidistant' 'False'};
% # oFD_Solver.bSParameterSweep = 'False';
%
%% FIELD DEFINATION
%  accuracyTet ( double value )
%          Specifies the desired accuracy for the tetrahedral frequency domain solver in terms of the relative residual norm of the linear equation system solver. The accuracy value may be chosen from the range 1e-3 down to 1e-12, where 1e-12 correspond to the highest accuracy level.
%  stimulation ( enum / int port, enum / int mode )
%         Selects the source type to be used for excitation, such as port and mode for waveguide ports.
%             The parameter port and mode may have one of the following values:
%             * 'All':  All ports and modes will be excited, one at a time. This eventually excludes Floquet ports for unit cell calculations.
%             * 'All+Floquet':  All ports and modes will be excited, one at a time. This includes Floquet ports for unit cell calculations.
%             * 'Plane Wave':   A plane wave will be excited. mode needs to be set to '1'.
%             * 'List':         A list of excitations is specified. port and mode then need to be set to 'List'.
%             * int port/mode:  The port and mode number to be used for excitation.
%  method ( enum{'Hexahedral Mesh', 'Tetrahedral Mesh', 'Hexahedral Mesh (MOR)', 'Hexahedral Mesh (MOR Fields)', 'Surface Mesh'} key )
%         Allows to change the method used in the frequency domain solver to calculated S-parameters and fields. The type of mesh will be changed to 'Hexahedral Mesh', 'Tetrahedral Mesh' or 'Surface Mesh'. The 'Hexahedral Mesh (MOR)' method can be used for broadband loss-free (weakly dielectric losses) S-parameter calculations. The 'Hexahedral Mesh (MOR Fields)' method can be used for broadband loss-free S-parameter calculations and monitor definitions. Use 'Surface Mesh' to activate the integral equation solver. Confer the frequency domain and integral equation solver overview in the online manual for details.
%  type ( enum{'Auto', 'Iterative', 'Direct'} key )
%         Chooses the linear equation system solver type to be used. For the integral equation solver  'IterativeMoM' is available.
%  addMonitorSamples ( bool flag )
%          If this method is activated (flag = True), a solver run is performed for all monitor frequencies defined, independently of the number of other (non-monitor) frequency samples, which are specified using the FrequencySamples and AddSampleInterval methods. Please note that the total number of samples will be increased automatically in order to take into account the monitor definitions, if necessary. Otherwise (flag = False), monitors will not be calculated.
%  frequencySamples ( int nFSamples )
%         Specifies the (maximum) number of frequency samples that should be calculated in a S-parameter frequency sweep. The samples are placed adaptively in the current global frequency interval. The method AddSampleInterval allows to specify the sampling strategy more precisely.
%  meshAdaptionHex ( bool flag )
%          Activate the broadband, expert-system based adaptive mesh refinement for the hexahedral frequency domain solver.
%  meshAdaptionTet ( bool flag )
%         Activate the adaptive mesh refinement for the tetrahedral frequency domain solver. The adaptation frequency samples are defined by using the AddSampleInterval method with adaptation set to True.
%  useHelmholtzEquation ( bool flag )
%         If activated the Helmholtz equation is used when running the frequency domain solver with hexahedral mesh. This might lead to a faster convergence of the solver, especially for low frequency problems.
%  addSampleInterval ( double min, double max,  int samples, enum {"Automatic", "Equidistant"} key, bool adaptation)
%         Specifies a customized frequency interval (min to max) as well as the corresponding number of frequency samples (samples) for which calculations will be performed. Depending on the key value, the samples will either be placed adaptively or equidistantly into the interval. A single frequency point is defined by setting lower and upper frequency limit to the same value, or by omitting either the lower or the upper frequency. Since min and max may be values as well as strings, this is done by passing an empty string "" as an argument. For equidistant and automatic sampling, if min = "" or max = "" this will be replaced by the corresponding global frequency limit. The adaptation indicates whether or not the frequency samples should be used for the sequential adaptive tetrahedral mesh refinement.
%  orderTet
%         Select here the order of the general purpose tetrahedral frequency domain solver, with the choice between low memory or highly accurate results for a given number of mesh cells. Higher order also allows to achieve accurate results with less mesh cells and eventually less memory consumption than lower order, if the structure contains electrically large voids rather than many geometric details.
%         If the method MixedOrderTet is called with flag = True, then OrderTet determines the maximum solver order to be used.
%         The parameter sOrder may have one of the following values:
%               'First'  Calculation is done with first order accuracy providing solutions with low memory effort. Especially well suited for structures with many electrically small details.
%               'Second' Calculation is done with second order accuracy providing highly accurate results. Well suited for most applications, and therefore the default.
%               'Third'  Calculation is done with third order accuracy providing highest accuracy. Allows to reduce the number of mesh steps per wavelength for structures with large voids, or to even further improve the accuracy for a given mesh resolution.
%% EXAMPLE:

%% MATLAB SCRIPT
historyStr = [];
%-- IF THE ANY FIELD DOESN'T EXIST IT WILL BE SET TO ITS DEFAULT VALUE
historyStr = sprintf('Mesh.SetCreator "High Frequency"');

historyStr = sprintf('%s\n\nWith FDSolver',                       historyStr);
historyStr = sprintf('%s\n\t.Reset',                              historyStr);
if isfield(oFD_Solver,'method'),                                  historyStr = sprintf('%s\n\t.Method "%s"',                        historyStr,num2str(oFD_Solver.type));                           else historyStr = sprintf('%s\n\t.Method "Tetrahedral Mesh"',                   historyStr );end
if isfield(oFD_Solver,'orderTet'),                                historyStr = sprintf('%s\n\t.OrderTet "%s"',                      historyStr,num2str(oFD_Solver.orderTet));                       else historyStr = sprintf('%s\n\t.OrderTet "Second"',                           historyStr);end;
if isfield(oFD_Solver,'orderHFMOR'),                              historyStr = sprintf('%s\n\t.OrderHFMOR "%s"',                    historyStr,num2str(oFD_Solver.orderHFMOR));                     else historyStr = sprintf('%s\n\t.OrderHFMOR "1"',                              historyStr);end;
if isfield(oFD_Solver,'orderSrf'),                                historyStr = sprintf('%s\n\t.OrderSrf "%s"',                      historyStr,oFD_Solver.orderSrf);                                else historyStr = sprintf('%s\n\t.OrderSrf "First"',                            historyStr);end;

if isfield(oFD_Solver,'stimulation'),                             historyStr = sprintf('%s\n\t.Stimulation "%s", "%s"',             historyStr,oFD_Solver.stimulation{1},oFD_Solver.stimulation{2});else historyStr = sprintf('%s\n\t.Stimulation "All", "All"',                    historyStr );end
historyStr = sprintf('%s\n\t.ResetExcitationList',                historyStr);
%-- STIMULATION BY LIST
if isfield(oFD_Solver,'stimulationList')
%     historyStr = sprintf('%s\n\t.ResetExcitationList',   historyStr);
    listLen = size(oFD_Solver.stimulationList,1);
    for portInd = 1:listLen
        %         oFD_Solver.object.invoke('AddToExcitationList',strtok(oFD_Solver.stimulationList{portInd,1},'p'),[strrep(oFD_Solver.stimulationList{portInd,2},',',';')]);
        historyStr = sprintf('%s\n\t.AddToExcitationList "%s", "%s"',   historyStr,num2str(strtok(oFD_Solver.stimulationList{portInd,1},'p')),[strrep(oFD_Solver.stimulationList{portInd,2},',',';')]);
    end
end
if isfield(oFD_Solver,'bAutoNormImpedance'),                      historyStr = sprintf('%s\n\t.AutoNormImpedance "%s"',             historyStr,oFD_Solver.bAutoNormImpedance);                      else historyStr = sprintf('%s\n\t.AutoNormImpedance "False"',                   historyStr);end;
if isfield(oFD_Solver,'normingImpedance'),                        historyStr = sprintf('%s\n\t.NormingImpedance "%s"',              historyStr,oFD_Solver.normingImpedance);                        else historyStr = sprintf('%s\n\t.NormingImpedance "50"',                       historyStr);end;
if isfield(oFD_Solver,'bModesOnly'),                              historyStr = sprintf('%s\n\t.ModesOnly "%s"',                     historyStr,oFD_Solver.bModesOnly);                              else historyStr = sprintf('%s\n\t.ModesOnly "False"',                           historyStr);end;
if isfield(oFD_Solver,'bConsiderPortLossesTet'),                  historyStr = sprintf('%s\n\t.ConsiderPortLossesTet "%s"',         historyStr,oFD_Solver.bConsiderPortLossesTet);                  else historyStr = sprintf('%s\n\t.ConsiderPortLossesTet "True"',                historyStr);end;
if isfield(oFD_Solver,'bSetShieldAllPorts'),                      historyStr = sprintf('%s\n\t.SetShieldAllPorts "%s"',             historyStr,oFD_Solver.bSetShieldAllPorts);                      else historyStr = sprintf('%s\n\t.SetShieldAllPorts "False"',                   historyStr);end;
if isfield(oFD_Solver,'accuracyHex'),                             historyStr = sprintf('%s\n\t.AccuracyHex "%s"',                   historyStr,num2str(oFD_Solver.accuracyHex));                    else historyStr = sprintf('%s\n\t.AccuracyHex "1e-6"',                          historyStr);end;
if isfield(oFD_Solver,'accuracyTet'),                             historyStr = sprintf('%s\n\t.AccuracyTet "%s"',                   historyStr,num2str(oFD_Solver.accuracyTet));                    else historyStr = sprintf('%s\n\t.AccuracyTet "1e-4"',                          historyStr );end
% if isfield(oFD_Solver,'frequencySamples'),                      historyStr = sprintf('%s\n\t.FrequencySamples "%s"',              historyStr,num2str(oFD_Solver.frequencySamples));               else historyStr = sprintf('%s\n\t.FrequencySamples "20"',                       historyStr );end
if isfield(oFD_Solver,'accuracySrf'),                             historyStr = sprintf('%s\n\t.AccuracySrf "%s"',                   historyStr,num2str(oFD_Solver.accuracySrf));                    else historyStr = sprintf('%s\n\t.AccuracySrf "1e-3"',                          historyStr);end;
if isfield(oFD_Solver,'bLimitIterations'),                        historyStr = sprintf('%s\n\t.LimitIterations "%s"',               historyStr,oFD_Solver.bLimitIterations);                        else historyStr = sprintf('%s\n\t.LimitIterations "False"',                     historyStr);end;
if isfield(oFD_Solver,'maxIterations'),                           historyStr = sprintf('%s\n\t.MaxIterations "%s"',                 historyStr,num2str(maxIterations));                             else historyStr = sprintf('%s\n\t.MaxIterations "0"',                           historyStr);end;
if isfield(oFD_Solver,'bCalculateExcitationsInParallel'),         historyStr = sprintf('%s\n\t.CalculateExcitationsInParallel "%s"',historyStr,oFD_Solver.bCalculateExcitationsInParallel);         else historyStr = sprintf('%s\n\t.CalculateExcitationsInParallel "True"',       historyStr);end;
if isfield(oFD_Solver,'bStoreAllResults'),                        historyStr = sprintf('%s\n\t.bStoreAllResults "%s"',              historyStr,oFD_Solver.bStoreAllResults);                        else historyStr = sprintf('%s\n\t.StoreAllResults "False"',                     historyStr);end;
if isfield(oFD_Solver,'bStoreResultsInCache'),                    historyStr = sprintf('%s\n\t.bStoreResultsInCache "%s"',          historyStr,oFD_Solver.bStoreResultsInCache);                    else historyStr = sprintf('%s\n\t.StoreResultsInCache "False"',                 historyStr);end;
if isfield(oFD_Solver,'bUseHelmholtzEquation'),                   historyStr = sprintf('%s\n\t.UseHelmholtzEquation "%s"',          historyStr,oFD_Solver.bUseHelmholtzEquation);                   else historyStr = sprintf('%s\n\t.UseHelmholtzEquation "True"',                 historyStr);end;
if isfield(oFD_Solver,'bLowFrequencyStabilization'),              historyStr = sprintf('%s\n\t.LowFrequencyStabilization "%s"',     historyStr,oFD_Solver.bLowFrequencyStabilization);              else historyStr = sprintf('%s\n\t.LowFrequencyStabilization "True"',            historyStr);end;
if isfield(oFD_Solver,'type'),                                    historyStr = sprintf('%s\n\t.Type "%s"',                          historyStr,num2str(oFD_Solver.maxDeltaS));                      else historyStr = sprintf('%s\n\t.Type "Auto"',                                 historyStr );end
historyStr = sprintf('%s\n\t.MeshAdaptionHex "True"',   historyStr);
historyStr = sprintf('%s\n\t.MeshAdaptionTet "True"',   historyStr);
if isfield(oFD_Solver,'bAcceleratedRestart'),                     historyStr = sprintf('%s\n\t.AcceleratedRestart "%s"',            historyStr,oFD_Solver.bAcceleratedRestart);                     else historyStr = sprintf('%s\n\t.AcceleratedRestart "True"',                   historyStr);end;
if isfield(oFD_Solver,'hexMORSettings'),                          historyStr = sprintf('%s\n\t.HexMORSettings "", "1001"',          historyStr,num2str(oFD_Solver.hexMORSettings));                 else historyStr = sprintf('%s\n\t.HexMORSettings "", "1001"',                   historyStr);end;
if isfield(oFD_Solver,'bNewIterativeSolver'),                     historyStr = sprintf('%s\n\t.NewIterativeSolver "True"',          historyStr,oFD_Solver.bNewIterativeSolver);                     else historyStr = sprintf('%s\n\t.NewIterativeSolver "True"',                   historyStr);end;
if isfield(oFD_Solver,'bTDCompatibleMaterials'),                  historyStr = sprintf('%s\n\t.TDCompatibleMaterials "False"',      historyStr,oFD_Solver.bTDCompatibleMaterials);                  else historyStr = sprintf('%s\n\t.TDCompatibleMaterials "False"',               historyStr);end;
if isfield(oFD_Solver,'bExtrudeOpenBC'),                          historyStr = sprintf('%s\n\t.ExtrudeOpenBC "False"',              historyStr,oFD_Solver.bExtrudeOpenBC);                          else historyStr = sprintf('%s\n\t.ExtrudeOpenBC "False"',                       historyStr);end;
if isfield(oFD_Solver,'setOpenBCTypeHex'),                        historyStr = sprintf('%s\n\t.SetOpenBCTypeHex "%s"',              historyStr,oFD_Solver.setOpenBCTypeHex);                        else historyStr = sprintf('%s\n\t.SetOpenBCTypeHex "Default"',                  historyStr);end;
if isfield(oFD_Solver,'setOpenBCTypeTet'),                        historyStr = sprintf('%s\n\t.SetOpenBCTypeTet "%s"',              historyStr,oFD_Solver.setOpenBCTypeTet);                        else historyStr = sprintf('%s\n\t.SetOpenBCTypeTet "Default"',                  historyStr);end;
historyStr = sprintf('%s\n\t.AddMonitorSamples "True"', historyStr);
if isfield(oFD_Solver,'bSParameterSweep'),                        historyStr = sprintf('%s\n\t.SParameterSweep "%s"',               historyStr,num2str(oFD_Solver.bSParameterSweep));               else historyStr = sprintf('%s\n\t.SParameterSweep "True"',                      historyStr );end
if isfield(oFD_Solver,'bCalcStatBField'),                         historyStr = sprintf('%s\n\t.CalcStatBField "False"',             historyStr,oFD_Solver.bCalcStatBField);                         else historyStr = sprintf('%s\n\t.CalcStatBField "False"',                      historyStr);end;
if isfield(oFD_Solver,'bUseDoublePrecision'),                     historyStr = sprintf('%s\n\t.UseDoublePrecision "False"',         historyStr,oFD_Solver.bUseDoublePrecision);                     else historyStr = sprintf('%s\n\t.UseDoublePrecision "False"',                  historyStr);end;
if isfield(oFD_Solver,'bUseDoublePrecision_ML'),                  historyStr = sprintf('%s\n\t.UseDoublePrecision_ML "True"',       historyStr,oFD_Solver.bUseDoublePrecision_ML);                  else historyStr = sprintf('%s\n\t.UseDoublePrecision_ML "True"',                historyStr);end;
if isfield(oFD_Solver,'bMixedOrderSrf'),                          historyStr = sprintf('%s\n\t.MixedOrderSrf "False"',              historyStr,oFD_Solver.bMixedOrderSrf);                          else historyStr = sprintf('%s\n\t.MixedOrderSrf "False"',                       historyStr);end;
if isfield(oFD_Solver,'bMixedOrderTet'),                          historyStr = sprintf('%s\n\t.MixedOrderTet "False"',              historyStr,oFD_Solver.bMixedOrderTet);                          else historyStr = sprintf('%s\n\t.MixedOrderTet "False"',                       historyStr);end;
if isfield(oFD_Solver,'preconditionerAccuracyIntEq'),             historyStr = sprintf('%s\n\t.PreconditionerAccuracyIntEq "%s"',   historyStr,num2str(oFD_Solver.preconditionerAccuracyIntEq));    else historyStr = sprintf('%s\n\t.PreconditionerAccuracyIntEq "0.15"',          historyStr);end;
if isfield(oFD_Solver,'mLFMMAccuracy'),                           historyStr = sprintf('%s\n\t.MLFMMAccuracy "%s"',                 historyStr,oFD_Solver.mLFMMAccuracy);                           else historyStr = sprintf('%s\n\t.MLFMMAccuracy "Default"',                     historyStr);end;
if isfield(oFD_Solver,'minMLFMMBoxSize'),                         historyStr = sprintf('%s\n\t.MinMLFMMBoxSize "%s"',               historyStr,num2str(oFD_Solver.minMLFMMBoxSize));                else historyStr = sprintf('%s\n\t.MinMLFMMBoxSize "0.20"',                      historyStr);end;
if isfield(oFD_Solver,'bUseCFIEForCPECIntEq'),                    historyStr = sprintf('%s\n\t.UseCFIEForCPECIntEq "true"',         historyStr,oFD_Solver.bUseCFIEForCPECIntEq);                    else historyStr = sprintf('%s\n\t.UseCFIEForCPECIntEq "true"',                  historyStr);end;
if isfield(oFD_Solver,'bUseFastRCSSweepIntEq'),                   historyStr = sprintf('%s\n\t.UseFastRCSSweepIntEq "true"',        historyStr,oFD_Solver.bUseFastRCSSweepIntEq);                   else historyStr = sprintf('%s\n\t.UseFastRCSSweepIntEq "true"',                 historyStr);end;
if isfield(oFD_Solver,'bUseSensitivityAnalysis'),                 historyStr = sprintf('%s\n\t.UseSensitivityAnalysis "False"',     historyStr,oFD_Solver.bUseSensitivityAnalysis);                 else historyStr = sprintf('%s\n\t.UseSensitivityAnalysis "False"',              historyStr);end;
if isfield(oFD_Solver,'setRCSSweepProperties'),                   historyStr = sprintf('%s\n\t.SetRCSSweepProperties "%s", "%s", "%s","%s", "%s", "%s", "%s"',historyStr,num2str(oFD_Solver.setRCSSweepProperties(1),num2str(oFD_Solver.setRCSSweepProperties(2),num2str(oFD_Solver.setRCSSweepProperties(3),num2str(oFD_Solver.setRCSSweepProperties(4),num2str(oFD_Solver.setRCSSweepProperties(5),num2str(oFD_Solver.setRCSSweepProperties(6),num2str(oFD_Solver.setRCSSweepProperties(7))))))))); else    historyStr = sprintf('%s\n\t.SetRCSSweepProperties "0.0", "0.0", "0","0.0", "0.0", "0", "0"',historyStr);end
if isfield(oFD_Solver,'sweepErrorThreshold'),                     historyStr = sprintf('%s\n\t.SweepErrorThreshold "%s", "%s"',     historyStr,oFD_Solver.sweepErrorThreshold{1,1}(1,:),num2str(oFD_Solver.sweepErrorThreshold{1,2}(1,1))); else   historyStr = sprintf('%s\n\t.SweepErrorThreshold "True", "0.01"',historyStr);end;
if isfield(oFD_Solver,'sweepErrorChecks'),                        historyStr = sprintf('%s\n\t.SweepErrorChecks "2"',               historyStr,num2str(oFD_Solver.sweepErrorChecks));               else historyStr = sprintf('%s\n\t.SweepErrorChecks "2"',                        historyStr);end;
if isfield(oFD_Solver,'sweepMinimumSamples'),                     historyStr = sprintf('%s\n\t.SweepMinimumSamples "%s"',           historyStr,num2str(oFD_Solver.sweepMinimumSamples));            else historyStr = sprintf('%s\n\t.SweepMinimumSamples "3"',                     historyStr);end;
if isfield(oFD_Solver,'bSweepConsiderAll'),                       historyStr = sprintf('%s\n\t.SweepConsiderAll "%s"',              historyStr,oFD_Solver.bSweepConsiderAll);                       else historyStr = sprintf('%s\n\t.SweepConsiderAll "True"',                     historyStr);end;
historyStr = sprintf('%s\n\t.SweepConsiderReset',                 historyStr);
if isfield(oFD_Solver,'interpolationSamples'),                    historyStr = sprintf('%s\n\t.InterpolationSamples "%s"',          historyStr,num2str(oFD_Solver.interpolationSamples));           else historyStr = sprintf('%s\n\t.InterpolationSamples "1001"',                 historyStr);end;
if isfield(oFD_Solver,'sweepWeightEvanescent'),                   historyStr = sprintf('%s\n\t.SweepWeightEvanescent "%s"',         historyStr,num2str(oFD_Solver.sweepWeightEvanescent));          else historyStr = sprintf('%s\n\t.SweepWeightEvanescent "1.0"',                 historyStr);end;
%-- FREQUENCY INTERVAL
if isfield(oFD_Solver,'addSampleInterval')
%     historyStr = sprintf('%s\n\t.AddMonitorSamples "True"', historyStr);
%     historyStr = sprintf('%s\n\t.MeshAdaptionHex "True"',   historyStr);
%     historyStr = sprintf('%s\n\t.MeshAdaptionTet "True"',   historyStr);
    listLen = size(oFD_Solver.addSampleInterval,1);
    for portInd = 1:listLen
        temp    = oFD_Solver.addSampleInterval{portInd,1};
        if ( length(temp) == 1 )
            stFreq    = num2str(oFD_Solver.addSampleInterval{portInd,1}(1,1));
            endFreq   = num2str(oFD_Solver.addSampleInterval{portInd,2}(1,1));
            numSample = num2str(oFD_Solver.addSampleInterval{portInd,3}(1,1));
            distBetweenPoints = [ oFD_Solver.addSampleInterval{portInd,4}(1,:) ];
            adaption  = [ oFD_Solver.addSampleInterval{portInd,5}(1,:) ];
        elseif ( length(temp) == 2 )
            stFreq    = num2str(oFD_Solver.addSampleInterval{portInd,1}(1,1));
            endFreq   = num2str(oFD_Solver.addSampleInterval{portInd,1}(1,2));
            numSample = num2str(oFD_Solver.addSampleInterval{portInd,2}(1,1));
            distBetweenPoints = [ oFD_Solver.addSampleInterval{portInd,3}(1,:) ];
            adaption  = [ oFD_Solver.addSampleInterval{portInd,4}(1,:) ];
        end
        historyStr = sprintf('%s\n\t.AddSampleInterval "%s", "%s", "%s", "%s", "%s"',   historyStr,num2str(stFreq),num2str(endFreq),num2str(numSample),distBetweenPoints,adaption);
    end
end

if isfield(oFD_Solver,'bMPIParallelization'),                     historyStr = sprintf('%s\n\t.MPIParallelization "%s"',            historyStr,oFD_Solver.bMPIParallelization);                     else historyStr = sprintf('%s\n\t.MPIParallelization "False"',                 historyStr);end;
if isfield(oFD_Solver,'bUseDistributedComputing'),                historyStr = sprintf('%s\n\t.UseDistributedComputing "%s"',       historyStr,oFD_Solver.bUseDistributedComputing);                else historyStr = sprintf('%s\n\t.UseDistributedComputing "False"',            historyStr);end;
if isfield(oFD_Solver,'networkComputingStrategy'),                historyStr = sprintf('%s\n\t.NetworkComputingStrategy "%s"',      historyStr,oFD_Solver.networkComputingStrategy);                else historyStr = sprintf('%s\n\t.NetworkComputingStrategy "RunRemote"',       historyStr);end;
if isfield(oFD_Solver,'networkComputingJobCount'),                historyStr = sprintf('%s\n\t.NetworkComputingJobCount "%s"',      historyStr,num2str(oFD_Solver.networkComputingJobCount));       else  historyStr = sprintf('%s\n\t.NetworkComputingJobCount "3"',              historyStr);end;
if isfield(oFD_Solver,'bLimitCPUs'),                              historyStr = sprintf('%s\n\t.LimitCPUs "%s"',                     historyStr,oFD_Solver.bLimitCPUs);                              else historyStr = sprintf('%s\n\t.LimitCPUs "True"',                           historyStr);end;
if isfield(oFD_Solver,'maxCPUs'),                                 historyStr = sprintf('%s\n\t.MaxCPUs "%s"',                       historyStr,num2str(oFD_Solver.maxCPUs));                        else historyStr = sprintf('%s\n\t.MaxCPUs "32"',                               historyStr);end;
historyStr = sprintf('%s\nEnd With',                              historyStr);

historyStr = sprintf('%s\n\nWith IESolver',                       historyStr);
historyStr = sprintf('%s\n\t.Reset',                              historyStr);
historyStr = sprintf('%s\n\t.UseFastFrequencySweep "False"',      historyStr);
historyStr = sprintf('%s\n\t.UseIEGroundPlane "False"',           historyStr);
historyStr = sprintf('%s\n\t.PreconditionerType "Auto"',          historyStr);
historyStr = sprintf('%s\nEnd With',                              historyStr);

historyStr = sprintf('%s\n\nWith IESolver',                       historyStr);
historyStr = sprintf('%s\n\t.SetFMMFFCalcStopLevel "0"',          historyStr);
historyStr = sprintf('%s\n\t.SetFMMFFCalcNumInterpPoints "6"',    historyStr);
historyStr = sprintf('%s\n\t.UseFMMFarfieldCalc "True"',          historyStr);
historyStr = sprintf('%s\n\t.SetCFIEAlpha "0.500000"',            historyStr);
historyStr = sprintf('%s\n\t.LowFrequencyStabilization "False"',  historyStr);

historyStr = sprintf('%s\n\t.LowFrequencyStabilizationML "True"', historyStr);
historyStr = sprintf('%s\n\t.Multilayer "False"',                 historyStr);
historyStr = sprintf('%s\n\t.SetiMoMACC_I "0.0001"',              historyStr);
historyStr = sprintf('%s\n\t.SetiMoMACC_M "0.0001"',              historyStr);
historyStr = sprintf('%s\n\t.DeembedExternalPorts "True"',        historyStr);
historyStr = sprintf('%s\n\t.SetOpenBC_XY "True"',                historyStr);
historyStr = sprintf('%s\nEnd With',                              historyStr);

historyHeader = [ 'define frequency domain solver parameters' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end