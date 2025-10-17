function [totSolverTime totSimulationTime tolMeshCell totMemConsume totMatCalcTime totSolSetupTime totSolverLoopTime totSolPosTime totGPU_MemUsage] = f_ReadCST_Model_Log_File(fileName,PrintVal)
gpuMemCnt     = [];
matCalTimCnt  = [];
solSetTimCnt  = [];
solLoopTimCnt = [];
solPosTimCnt  = [];
totSolverTime = [];
fid = fopen(fileName,'r');
tLine = fgets(fid);
% cnt = 1;
while ischar(tLine)
    tLine = fgets(fid);
    %-- Solver Time
    if findstr(tLine,'Total solver time (all cycles):')
        endInd = findstr(tLine,':');
        end2Ind  = findstr(tLine,'(');
        if numel(end2Ind) == 2
            temp = tLine(endInd+1:end2Ind(2)-1);
        else
            temp = tLine(endInd+1:end);
        end
        temp(temp == 's') = [];
        totSolverTime = str2num(temp);
    elseif findstr(tLine,'Total solver time:')
        temp = sscanf(tLine,'  Total solver time:                	%ld  	s  ( = %d h, %d m, %d s )',inf);
        totSolverTime = temp(1);
    end
    %-- Simulation Time
    if findstr(tLine,'Total simulation time:');
        temp = sscanf(tLine,'  Total simulation time:            	%ld  	s  ( = %d h, %d m, %d s )',inf);
        totSimulationTime = temp(1);
    end
    %-- Number of mesh cell
    if findstr(tLine,'Number of mesh cells:')
        temp = sscanf(tLine,'  Number of mesh cells:             	%ld',inf);
        tolMeshCell = temp;
    end
    %-- Memory
    if findstr(tLine,'Solver run total')
        temp = tLine(length('Solver run total')+1+3:end);
        totMemConsume = str2num(temp);
    end
    %-- Solver loop time:
    if findstr(tLine,'Solver loop time:');
        solLoopTimCnt = f_IncrementCounter(solLoopTimCnt);
        temp = tLine(length('Solver loop time:')+1+3:end);
        temp(temp == 's') = [];
        totSolverLoopTime(solLoopTimCnt) = str2num(temp);
    end
    %-- Matrix calculation time:
    if findstr(tLine,'Matrix calculation time:');
        matCalTimCnt = f_IncrementCounter(matCalTimCnt);
        temp = tLine(length('Matrix calculation time:')+1+3:end);
        temp(temp == 's') = [];
        totMatCalcTime(matCalTimCnt) = str2num(temp);
    end
    %-- Solver setup time:
    if findstr(tLine,'Solver setup time:');
        solSetTimCnt = f_IncrementCounter(solSetTimCnt);
        temp = tLine(length('Solver setup time:')+1+3:end);
        temp(temp == 's') = [];
        totSolSetupTime(solSetTimCnt) = str2num(temp);
    end
    %-- Solver post processing time:
    if findstr(tLine,'Solver post processing time:');
        solPosTimCnt = f_IncrementCounter(solPosTimCnt);
        temp = tLine(length('Solver post processing time:')+1+3:end);
        temp(temp == 's') = [];
        totSolPosTime(solPosTimCnt) = str2num(temp);
    end
    %-- GPU memory usage:
    if findstr(tLine,'GPU memory usage:')
        gpuMemCnt = f_IncrementCounter(gpuMemCnt);
        temp = tLine(length('GPU memory usage:')+1+6:end);
        temp = temp(findstr(temp,'approx.')+length('approx.'):end);
        temp(temp == '%') = [];
        temp(temp == ' ') = [];
        totGPU_MemUsage(gpuMemCnt) = str2num(temp);
    end
end
fclose(fid);
if isempty(gpuMemCnt)
    totGPU_MemUsage = NaN;
end
if PrintVal
    fprintf(1,'\nTotal Solver Time: %d',totSolverTime);
    fprintf(1,'\nTotal Simulation Time: %d',totSimulationTime);
    fprintf(1,'\nTotal Mesh cell: %d',tolMeshCell);
    fprintf(1,'\nSolver loop time:');
    for ind = 1:size(totSolverLoopTime,2)
        fprintf(1,' %d ',totSolverLoopTime(ind));
    end
    fprintf(1,'\nPeak Physical memory used (kB): %ld',totMemConsume(1));
    fprintf(1,'\nPeak Virtual memory used (kB): %ld',totMemConsume(2));
    fprintf(1,'\nFree At begin physical memory (kB): %ld',totMemConsume(3));
    fprintf(1,'\nFree Minimum physical memory (kB): %ld',totMemConsume(4));
    fprintf(1,'\n');
end
end
%----------------------------------------------------------------------
% FUNCTION:
%----------------------------------------------------------------------
function x = f_IncrementCounter(x)
if isempty(x)
    x = 1;
else
    x = x + 1;
end
end