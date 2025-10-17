function status = f_GPU_Acceleration(oMWS,oSolver)
% oSolver.acc.bUseParallelization                  = 'True';
% oSolver.acc.maximumNumberOfThreads               = 48;
% oSolver.acc.bUseDistributedComputing             = 'False';
% oSolver.acc.maxNumberOfDistributedComputingPorts = 2;
% oSolver.acc.bDistributeMatrixCalculation         = 'False';
% oSolver.acc.bMPIParallelization                  = 'False';
% oSolver.acc.bHardwareAcceleration                = 'True';
% oSolver.acc.maximumNumberOfGPUs                  = 2;
%      
oSolver.acc.bUseDistributedComputingForParameters     = 'False';
oSolver.acc.maxNumberOfDistributedComputingParameters = 2; 
oSolver.acc.bUseDistributedComputingMemorySetting     = 'False';
oSolver.acc.minDistributedComputingMemoryLimit        = 0;      
     
historyStr = [];
historyStr = sprintf('With Solver');
if isfield(oSolver.acc,'bUseParallelization'),                  historyStr = sprintf('%s\n\t.UseParallelization "%s"',                  historyStr,oSolver.acc.bUseParallelization );                           else historyStr = sprintf('%s\n\t.UseParallelization "True"',historyStr );end
if isfield(oSolver.acc,'maximumNumberOfThreads'),               historyStr = sprintf('%s\n\t.MaximumNumberOfThreads "%s"',              historyStr,num2str(oSolver.acc.maximumNumberOfThreads));                else historyStr = sprintf('%s\n\t.MaximumNumberOfThreads "48"',historyStr);end
if isfield(oSolver.acc,'bUseDistributedComputing'),             historyStr = sprintf('%s\n\t.UseDistributedComputing "%s"',             historyStr,oSolver.acc.bUseDistributedComputing);                       else historyStr = sprintf('%s\n\t.UseDistributedComputing "False"',historyStr);end
if isfield(oSolver.acc,'maxNumberOfDistributedComputingPorts'), historyStr = sprintf('%s\n\t.MaxNumberOfDistributedComputingPorts "%s"',historyStr,num2str(oSolver.acc.maxNumberOfDistributedComputingPorts));  else historyStr = sprintf('%s\n\t.MaxNumberOfDistributedComputingPorts "2"',historyStr);end
if isfield(oSolver.acc,'bDistributeMatrixCalculation'),         historyStr = sprintf('%s\n\t.DistributeMatrixCalculation "%s"',         historyStr,oSolver.acc.bDistributeMatrixCalculation);                   else historyStr = sprintf('%s\n\t.DistributeMatrixCalculation "False"',historyStr);end
if isfield(oSolver.acc,'bMPIParallelization'),                  historyStr = sprintf('%s\n\t.MPIParallelization "%s"',                  historyStr,oSolver.acc.bMPIParallelization);                            else historyStr = sprintf('%s\n\t.MPIParallelization "False"',historyStr);end
if isfield(oSolver.acc,'bHardwareAcceleration'),                historyStr = sprintf('%s\n\t.HardwareAcceleration "%s"',                historyStr,oSolver.acc.bHardwareAcceleration);                          else historyStr = sprintf('%s\n\t.HardwareAcceleration "True"',historyStr);end
if isfield(oSolver.acc,'maximumNumberOfGPUs'),                  historyStr = sprintf('%s\n\t.MaximumNumberOfGPUs "%s"',                 historyStr,num2str(oSolver.acc.maximumNumberOfGPUs));                   else historyStr = sprintf('%s\n\t.MaximumNumberOfGPUs "2"',historyStr);end
historyStr = sprintf('%s\nEnd With',historyStr);

historyStr = sprintf('%s\nUseDistributedComputingForParameters "%s"',     historyStr,oSolver.acc.bUseDistributedComputingForParameters);
historyStr = sprintf('%s\nMaxNumberOfDistributedComputingParameters "%s"',historyStr,num2str(oSolver.acc.maxNumberOfDistributedComputingParameters));
historyStr = sprintf('%s\nUseDistributedComputingMemorySetting "%s"',     historyStr,oSolver.acc.bUseDistributedComputingMemorySetting); 
historyStr = sprintf('%s\nMinDistributedComputingMemoryLimit "%s"',       historyStr,num2str(oSolver.acc.minDistributedComputingMemoryLimit)); 

historyHeader = [ 'define time domain solver acceleration' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);