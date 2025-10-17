function f_CST_HistoryList_To_Matlab_Script(LIB_PATH,cstProjectPath,cstProjectName)
%-- Open CST-MWS
oCST_Studio = f_OpenCST_StudioSuit();
%-- Open Existing MWS Project
oMWS = f_OpenCST_MWS_Project(oCST_Studio,[cstProjectPath cstProjectName]);
%-- Get project info
model3DPath = f_GetProjectInfo(oMWS,'Model3D');

scriptName       = ['Main_COM_EM_AT_' strtok(cstProjectName,'.') '.m'];
fModel3D         = fopen([model3DPath 'Model.mod'],'rt+');
funcDefFileName  = [tempdir 'funcDef.m'];
funcCallFileName = [tempdir 'funcCall.m'];
fFuncDef         = fopen(funcDefFileName,'w');
fFuncCall        = fopen(funcCallFileName,'w');
numParam         = f_GetNumberOfParameters(oMWS);
paramList        = f_GetAllParameters(oMWS);
strLine          = fgetl(fModel3D);
pickInd          = 1;
funcInd          = 1;
totParamListInd  = 1;
while ischar(strLine)
    strLine = fgetl(fModel3D);
    if strfind(strLine,'@')
        % if the function is hide, then don't add it. skip this function
        if strcmp(strLine(1:2),'''''')
            continue;
        end
        historyHeader = strLine(4:end);
        % Write functin header in funcDef.m file
        validHistoryHeader = f_GetValidHeader(historyHeader);
        % Avoid more than one function having the same name
        validHistoryHeader = sprintf('%s_N%d',validHistoryHeader,funcInd);
        funcInd = funcInd + 1;
        strLine = fgetl(fModel3D);
        [fModel3D strLine] = f_SkipEmptyLines(fModel3D,strLine);
        compFuncInd = 1;
        compFunc = [];
        % Search next @ and till than wirte it on funcDef.m
        while strLine ~= '@'
            if strfind(strLine,'''')
                strLine = strrep(strLine,'''','''''');
            end
            %-- Write function content to the file
            compFunc{compFuncInd,1} = sprintf('%s',strLine);
            compFuncInd = compFuncInd + 1;
            fidPos = ftell(fModel3D); % get current position of the pointer
            strLine = fgetl(fModel3D);
            if ~ischar(strLine);
                break;
            end
            [fModel3D strLine] = f_SkipEmptyLines(fModel3D,strLine);
        end
        % Find the cst parameter in the history list function defination
        funcInParamList = f_GetInHistListFuncInParamList(compFunc,paramList);
        for paramListInd = 1:size(funcInParamList,1)
            ComFuncInParamList{totParamListInd,1} = funcInParamList{paramListInd,1};
            totParamListInd = totParamListInd + 1;
        end
        funcInParamListStr = [];
        for funcInParamListStrInd = 1:size(funcInParamList,1)
            funcInParamListStr = sprintf('%s,%s',funcInParamListStr,funcInParamList{funcInParamListStrInd,1});
        end
        funcCallStr = sprintf('f_%s(oMWS%s)',validHistoryHeader,funcInParamListStr);
        funcName    = sprintf('function status = %s',funcCallStr);
        % write function defination in funcDef.m file
        fFuncDef = f_WriteFuncCommentsBlock(fFuncDef,historyHeader);
        fprintf(fFuncDef,'%s\n',funcName);
        fprintf(fFuncDef,'content = [];\n');
        for writeLineInd = 1:size(compFunc,1)
            compFunc{writeLineInd,1} = strrep(compFunc{writeLineInd,1},'\','\\');
            fprintf(fFuncDef,'content = sprintf(''%%s\\n%s'',content);\n',compFunc{writeLineInd,1});
        end
        fprintf(fFuncDef,'status = oMWS.invoke(''AddToHistory'',''%s'',content);',historyHeader);
        fprintf(fFuncDef,'\nend\n');
        % rewind the file pointer just one line back
        fseek(fModel3D, fidPos+2, 'bof');
        % Call the created function
        fprintf(fFuncCall,'%%-- %s\n',historyHeader);
        fprintf(fFuncCall,'%s;\n\n',funcCallStr);
    end
    
end
ComFuncInParamListUniq = unique(ComFuncInParamList);
fclose('all');
%-- Merge all files
fFuncDef  = fopen(funcDefFileName,'r');
fFuncCall = fopen(funcCallFileName,'r');
%-- Merge funcDef.m and funcCall.m togather
fCOMEMAT_FuncName = ['f_COM_EM_AT_' strtok(cstProjectName,'.')];
fCOMEMAT = fopen([ fCOMEMAT_FuncName '.m'],'wt');

fprintf(fCOMEMAT,'function %s(oMWS,%s)\n',fCOMEMAT_FuncName,strjoin(ComFuncInParamListUniq',','));
fprintf(fCOMEMAT,'namelengthmax=100;\n');
% Copy from funcCall.m
readLine = fgetl(fFuncCall);
while ischar(readLine)
    fprintf(fCOMEMAT,'%s\n',readLine);
    readLine = fgetl(fFuncCall);
end
fprintf(fCOMEMAT,'end\n');
% Copy from funcDef.m
readLine = fgetl(fFuncDef);
while ischar(readLine)
    fprintf(fCOMEMAT,'%s\n',readLine);
    readLine = fgetl(fFuncDef);
end
%-- Close all handles
fclose('all');


% Write Main Script
fMain = fopen(scriptName,'w');
fprintf(fMain,'close all;clear;clc\n');
fprintf(fMain,'LIB_PATH = ''%s'';\n',LIB_PATH);
fprintf(fMain,'addpath(genpath(LIB_PATH));\n');
fprintf(fMain,'cstProjectPath = ''%s'';\n',cstProjectPath);
fprintf(fMain,'cstProjectName = ''%s'';\n',cstProjectName);

%-- Save the parameter list in the main script
for iParamList = 1:size(paramList,1)
    maxLenList(iParamList)    = length(paramList{iParamList,1});
    maxLenValList(iParamList) = length(paramList{iParamList,2});
end
maxLen     = max(maxLenList);
maxLenVal  = max(maxLenValList);
for iParamList = 1:size(paramList,1)
    fprintf(fMain,'%s',paramList{iParamList,1});
    %Leave empty space
    for iSpace = 1:maxLen-length(paramList{iParamList,1})
        fprintf(fMain,' ');
    end
    fprintf(fMain,' = %s;',paramList{iParamList,2});
    if ~isempty(paramList{iParamList,3})
        %Leave empty space
        for iSpace = 1:maxLenVal-length(paramList{iParamList,2})
            fprintf(fMain,' ');
        end
        fprintf(fMain,'%% %s',paramList{iParamList,3});
    end
    fprintf(fMain,'\n');
end
fprintf(fMain,'%%-- Open CST-STUDIO-SUITE\n');
fprintf(fMain,'oCST_Studio = f_OpenCST_StudioSuit();\n');
fprintf(fMain,'%%-- Open New MWS Project\n');
fprintf(fMain,'oMWS = f_CreateCST_MWS_Project(oCST_Studio);\n');
fprintf(fMain,'%%-- Store all parameter in CST\n');
paramName = paramList(:,1);
fStorParamFuncDefName = sprintf('f_StoreParameters_%s(oMWS,%s)',strtok(cstProjectName,'.'),strjoin(paramName',','));
fprintf(fMain,'%s;\n',fStorParamFuncDefName);
fprintf(fMain,'%%-- CST history list in MATLAB script\n');
%-- Call COM_EM_AT function
fCOMEMAT_InParamListStr = [];
for fCOMEMAT_InParamListStrInd = 1:size(ComFuncInParamListUniq,1)
    fCOMEMAT_InParamListStr{fCOMEMAT_InParamListStrInd,1} = sprintf('''%s''',ComFuncInParamListUniq{fCOMEMAT_InParamListStrInd,1});
end
% fprintf(fMain,'warning(''off'');\n');
fprintf(fMain,'%s(oMWS,%s);\n',fCOMEMAT_FuncName,strjoin(fCOMEMAT_InParamListStr',','));
% fprintf(fMain,'warning(''on'');\n');
fprintf(fMain,'%%-- Run TD solver\n');
fprintf(fMain,'%%status = f_StartSolver(oMWS);\n');
fprintf(fMain,'%%-- Run FD solver\n');
fprintf(fMain,'%%status = f_StartFD_Solver(oMWS);\n');
fprintf(fMain,'%%-- Run Optimizer\n');
fprintf(fMain,'%%status = f_OptimizerStart(oMWS);\n');
fclose(fMain);

%-- Store Parameters
fStorParamFuncFileName = ['f_StoreParameters_' strtok(cstProjectName,'.') '.m'];
fStorParamFunc = fopen(fStorParamFuncFileName,'wt');
fprintf(fStorParamFunc,'function %s\n',fStorParamFuncDefName);
for paLiSaInd = 1:size(paramName,1)
    fprintf(fStorParamFunc,'f_StoreParameterWithDescription(oMWS,''%s'',%s,''%s'');\n',paramList{paLiSaInd,1},paramList{paLiSaInd,1},paramList{paLiSaInd,3});
end
fprintf(fStorParamFunc,'end\n');
fclose(fStorParamFunc);
end
%------------------------------------------------
% FUNCTION:
%------------------------------------------------
function validHistoryHeader = f_GetValidHeader(historyHeader)
% You can use also this function
% N = matlab.lang.makeValidName(S)
validHistoryHeader = historyHeader;
validHistoryHeader(validHistoryHeader == '>') = '_';
validHistoryHeader(validHistoryHeader == '\') = '_';
validHistoryHeader(validHistoryHeader == ' ') = '_';
validHistoryHeader(validHistoryHeader == ':') = '_';
validHistoryHeader(validHistoryHeader == ')') = '_';
validHistoryHeader(validHistoryHeader == '(') = '_';
validHistoryHeader(validHistoryHeader == '/') = '_';
validHistoryHeader = strrep(validHistoryHeader, '__', '_');
if validHistoryHeader(end) == '_'
    validHistoryHeader(end) = [];
end
if length(validHistoryHeader)+10 > namelengthmax
    validHistoryHeader = validHistoryHeader(1:namelengthmax-10);
end
end
%------------------------------------------------
% FUNCTION:
%------------------------------------------------
function [fModel3D strLine] = f_SkipEmptyLines(fModel3D,strLine)
while isempty(strLine)
    strLine = fgetl(fModel3D);
    if ~ischar(strLine);
        break;
    end
end
end
%------------------------------------------------
% FUNCTION:
%------------------------------------------------
function fFuncDef = f_WriteFuncCommentsBlock(fFuncDef,historyHeader)
fprintf(fFuncDef,'%%--------------------------------------------\n');
fprintf(fFuncDef,'%% FUNCTION:- %s\n',historyHeader);
fprintf(fFuncDef,'%%--------------------------------------------\n');
end
%------------------------------------------------
% FUNCTION:
%------------------------------------------------
function [funcInParamList] = f_GetInHistListFuncInParamList(compFunc,paramList)
% Find the cst parameter in the history list function defination
% Delete all the comments line
compFunc = f_DeleteCommentsFromFunc(compFunc);
% Delete line which contain no parameter
compFunc = f_DeleteLineWithNoParam(compFunc);
funcInParamList = [];
paramMatchInd = 1;
numParam = size(paramList,1);
for paramInd = 1:numParam
    parameter = paramList{paramInd,1};
    for funcLineInd = 1:size(compFunc,1)
        funcLine = compFunc{funcLineInd,1};
        matchInd = strfind(funcLine,parameter);
        quoteInd = strfind(funcLine,'"');
        if ~isempty(matchInd)
            if ~isempty(quoteInd)
                if matchInd > quoteInd(1)
                    funcInParamList{paramMatchInd,1} = parameter;
                    paramMatchInd = paramMatchInd + 1;
                end
            else
                funcInParamList{paramMatchInd,1} = parameter;
                paramMatchInd = paramMatchInd + 1;
            end
            break;
        end
    end
end
end
%------------------------------------------------------------------------------
% FUNCTION:
%------------------------------------------------------------------------------
function compFuncOut = f_DeleteCommentsFromFunc(compFunc)
compFuncOut = [];
lineInd = 1;
for commentInd = 1:size(compFunc,1)
    matchInd = strfind(compFunc{commentInd,1},'''');
    if isempty(matchInd)
        compFuncOut{lineInd,1} = compFunc{commentInd,1};
        lineInd = lineInd + 1;
    end
end
end
%------------------------------------------------------------------------------
% FUNCTION:
%------------------------------------------------------------------------------
function compFuncOut = f_DeleteLineWithNoParam(compFunc)
compFuncOut = [];
lineInd = 1;
for commentInd = 1:size(compFunc,1)
    matchInd = strfind(compFunc{commentInd,1},'"');
    if ~isempty(matchInd)
        compFuncOut{lineInd,1} = compFunc{commentInd,1};
        lineInd = lineInd + 1;
    end
end
end