%-------------------------------------------------------
% FUNCTION:
%-------------------------------------------------------
function [ paramList numParam ] = f_GetAllParametersFromModel_par_File(fileName)
rowCnt = 1;
numRows = f_CountNumberOfLines(fileName);
fModelPar = fopen(fileName,'rt+');
for rowInd = 1:(numRows-1)/2
    tline = fgetl(fModelPar);
    [ varName varValue ] = f_GetVarNameAndValue(tline);
    paramList{rowInd,1} = varName;
    paramList{rowInd,2} = varValue;
end
numParam = size(paramList,1);
fclose(fModelPar);

strParamInd = 1;
numParamInd = 1;
for indParam = 1:numParam
    varVal = str2num(paramList{indParam,2});
    if isempty(varVal)
        strParamList(strParamInd,:) = paramList(indParam,:);
        strParamInd = strParamInd + 1;
    else
        numParamList(numParamInd,:) = paramList(indParam,:);
        numParamInd = numParamInd + 1;
    end
end
paramList = [ numParamList; strParamList ];
numParamListSize = size(numParamList,1);
indOuter = numParamListSize+1;
while indOuter <= size(paramList,1)
    currPtr = indOuter;
    currVar = paramList{currPtr,2};
    % Seprate the variable
    depVarList = f_GetDepVarListInsideVar(currVar);
    % Check whether currVar is dependent or not
    VAR_FOUND = f_IsDependent(paramList,depVarList,currPtr);
    if ~all(VAR_FOUND)
        % move current element to the last element
        paramList = f_MoveTheElemToEnd(paramList,currPtr);
    else
        indOuter = indOuter+1;
    end
end
end
%-------------------------------------------------------
% FUNCTION:
%-------------------------------------------------------
function VAR_FOUND = f_IsDependent(paramList,depVarList,currPtr)
for depVarInd = 1:size(depVarList,2)
    for searchSpaceInd = 1:currPtr-1
        if strcmp(depVarList{depVarInd},paramList{searchSpaceInd,1})
            VAR_FOUND(depVarInd) = true;
            break;
        else
            VAR_FOUND(depVarInd) = false;
        end
    end
end
end
%-------------------------------------------------------
% FUNCTION:
%-------------------------------------------------------
function paramList = f_MoveTheElemToEnd(paramList,currPtr)
temp = paramList(currPtr,:);
paramList(currPtr:end-1,:) = paramList(currPtr+1:end,:);
paramList(end,:) = temp(1,:);
end
%-------------------------------------------------------
% FUNCTION:
%-------------------------------------------------------
function depVarList = f_GetDepVarListInsideVar(currVar)
currVar(currVar == ')') = [];
currVar(currVar == '(') = [];
sFirstInd = 1;
varCnt = 1;
for ind = 1:length(currVar)
    if  ( currVar(ind) == '+' | currVar(ind) == '-' | currVar(ind) == '*' | currVar(ind) == '/' )
        if ( ~isempty(str2num(currVar(sFirstInd:ind-1))) | ind == 1 )
            sFirstInd = ind+1;
            continue;
        else
            depVarList{varCnt} = currVar(sFirstInd:ind-1);
            varCnt    = varCnt + 1;
            sFirstInd = ind+1;
        end
    end
end
if isempty(str2num(currVar(sFirstInd:ind)))
    depVarList{varCnt} = currVar(sFirstInd:ind);
end
end
%-------------------------------------------------------
% FUNCTION:
%-------------------------------------------------------
function [ varName varValue ] = f_GetVarNameAndValue(tline)
cTline = textscan(tline,'%s');
varName  = cell2mat(cTline{1}(1));
varValue = cell2mat(cTline{1}(2));
end
%-------------------------------------------------------
% FUNCTION:
%-------------------------------------------------------
function rowCnt = f_CountNumberOfLines(fileName)
fModelPar = fopen(fileName,'rt+');
rowCnt = 1;
tline = fgetl(fModelPar);
while ischar(tline)
    rowCnt = rowCnt + 1;
    tline = fgetl(fModelPar);
end
fclose(fModelPar);
end