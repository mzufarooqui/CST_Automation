function simPoint = f_CreateLookupTableForAntenna(parameterRange,activateGridAnalysis)

if activateGridAnalysis==1
    numParam = size(parameterRange,2);
    
    %-- Create an statement like this  param3 = linspace(9,11,3)
    for paramInd = 1:numParam
        evalInst = [ 'param' num2str(paramInd) ' = linspace(' num2str(parameterRange(1,paramInd)) ',' num2str(parameterRange(2,paramInd)) ',' num2str(parameterRange(3,paramInd)) ');' ];
        eval(evalInst);
    end
    
    %-- Create an statement like this: param1,param2,param3 and
    %-- Create an statement like this: param1Grid,param2Grid,param3Grid
    %-- Create an statement like this: param1Grid(:),param2Grid(:),param3Grid(:)
    ndGridInStr  = [];
    ndGridOutStr = [];
    ndGridOutColStr = [];
    for paramInd = 1:numParam
        ndGridInStr     = sprintf('%s,param%d',ndGridInStr,paramInd);
        ndGridOutStr    = sprintf('%s,param%dGrid',ndGridOutStr,paramInd);
        ndGridOutColStr = sprintf('%s,param%dGrid(:)',ndGridOutColStr,paramInd);
    end
    ndGridInStr(1)     = [];
    ndGridOutStr(1)    = [];
    ndGridOutColStr(1) = [];
    %-- Create an statement like this [param1Grid,param2Grid,param3Grid] = ndgrid(param1,param2,param3)
    evalInst = [ '[' ndGridOutStr '] = ndgrid(' ndGridInStr ');' ];
    eval(evalInst);
    
    %-- Create an statement like this: simPoint =  [param1(:),param2(:),param3(:)]
    evalInst = [ 'simPoint =  [' ndGridOutColStr '];' ];
    eval(evalInst);
else
    simPoint=parameterRange;
end

% function simPoint = f_CreateLookupTableForAntenna(varargin)
% numParam = length(varargin);
% 
% %-- Create an statement like this  param3 = linspace(9,11,3)
% for paramInd = 1:numParam
%     evalInst = [ 'param' num2str(paramInd) ' = cell2mat(varargin(' num2str(paramInd),'))'];
%     eval(evalInst);
% end
% 
% %-- Create an statement like this: param1,param2,param3 and
% %-- Create an statement like this: param1Grid,param2Grid,param3Grid
% %-- Create an statement like this: param1Grid(:),param2Grid(:),param3Grid(:)
% ndGridInStr  = [];
% ndGridOutStr = [];
% ndGridOutColStr = [];
% for paramInd = 1:numParam
%     ndGridInStr     = sprintf('%s,param%d',ndGridInStr,paramInd);
%     ndGridOutStr    = sprintf('%s,param%dGrid',ndGridOutStr,paramInd);
%     ndGridOutColStr = sprintf('%s,param%dGrid(:)',ndGridOutColStr,paramInd);
% end
% ndGridInStr(1)     = [];
% ndGridOutStr(1)    = [];
% ndGridOutColStr(1) = [];
% %-- Create an statement like this [param1Grid,param2Grid,param3Grid] = ndgrid(param1,param2,param3)
% evalInst = [ '[' ndGridOutStr '] = ndgrid(' ndGridInStr ');' ];
% eval(evalInst);
% 
% %-- Create an statement like this: simPoint =  [param1(:),param2(:),param3(:)]
% evalInst = [ 'simPoint =  [' ndGridOutColStr '];' ];
% eval(evalInst);
% end
