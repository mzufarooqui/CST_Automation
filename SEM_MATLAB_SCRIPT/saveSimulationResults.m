function saveSimulationResults( ...
    x0,...
    LowerB,...
    UpperB,...
    Vfreq ,...
    s11Vpol,...
    s21Vpol,...
    s11Hpol,...
    s21Hpol,...
    CrossCoRatio,...
    VfreqSpec,...
    wgR,...
    wgAS1,...
    wgS1,...
    wgAS2,...
    wgS2,...
    wgAS3,...
    wgS3,...
    Lsk,...
    Lk,...
    lIN1,...
    lIN2...
    )

polarizer.dirPath.resultsDirName = 'RESULTS';


dataTimeStr     = dataTimeString();
figExtension    = 'png';
figVisibleState = 'off';
SAVE_FIGURE     = 1;
SAVE_DATA       = 0;
Isol          = ( s11Vpol - s11Hpol ) / sqrt(2);
parentDirName = [ cd '\' polarizer.dirPath.resultsDirName ];
% resultDirName = dataTimeStr;
% [dirStatus,message,messageid] = mkdir( parentDirName , resultDirName );
% 
% if dirStatus == 0
%     errordlg( message , 'Error');
%  return;
% end

% docFileName     = [ cd '\' polarizer.dirPath.resultsDirName '\' resultDirName '\SimResults'  '_' dataTimeStr '.doc'];
docFileName     = [ cd '\' polarizer.dirPath.resultsDirName '\SimResults_shaped02.doc'];
imageNameList = {'All Parameters','S11Vpol','S21Vpol','S11Hpol','S21Hpol','CrossCoRatio','Isolation','Phase'};

%-------------------------------------------------------------------------
line0Str = sprintf('DATE & TIME : %s \n' , datestr(now) );

str1 = sprintf('x0  = [ ');
str2 = sprintf('%.3f ', x0 );
str3 = sprintf('];\n');
line1Str = [ str1 str2 str3 ];

str1 = sprintf('LB  = [ ');
str2 = sprintf('%.3f ', LowerB );
str3 = sprintf('];\n');
line2Str = [ str1 str2 str3 ];

str1 = sprintf('UB  = [ ');
str2 = sprintf('%.3f ', UpperB );
str3 = sprintf('];\n');
line3Str = [ str1 str2 str3 ];

line4Str  = sprintf('wgR = %.3f \n'  , (round(wgR*1000)/1000)  );

str1 = sprintf('wgAS1  = [ ');
str2 = sprintf('%.3f ', wgAS1 );
str3 = sprintf('];\n');
line5Str = [ str1 str2 str3 ];

str1 = sprintf('wgS1  = [ ');
str2 = sprintf('%.3f ', wgS1 );
str3 = sprintf('];\n');
line6Str = [ str1 str2 str3 ];

str1 = sprintf('wgAS2  = [ ');
str2 = sprintf('%.3f ', wgAS2 );
str3 = sprintf('];\n');
line7Str = [ str1 str2 str3 ];

str1 = sprintf('wgS2  = [ ');
str2 = sprintf('%.3f ', wgS2 );
str3 = sprintf('];\n');
line8Str = [ str1 str2 str3 ];

str1 = sprintf('wgAS3  = [ ');
str2 = sprintf('%.3f ', wgAS3 );
str3 = sprintf('];\n');
line9Str = [ str1 str2 str3 ];

str1 = sprintf('wgS3  = [ ');
str2 = sprintf('%.3f ', wgS3 );
str3 = sprintf('];\n');
line10Str = [ str1 str2 str3 ];

str1 = sprintf('Lsk  = [ ');
str2 = sprintf('%.3f ', Lsk );
str3 = sprintf('];\n');
line11Str = [ str1 str2 str3 ];

str1 = sprintf('Lk  = [ ');
str2 = sprintf('%.3f ', Lk );
str3 = sprintf('];\n');
line12Str = [ str1 str2 str3 ];

str1 = sprintf('lIN1  = [ ');
str2 = sprintf('%.3f ', lIN1 );
str3 = sprintf('];\n');
line13Str = [ str1 str2 str3 ];

str1 = sprintf('lIN2  = [ ');
str2 = sprintf('%.3f ', lIN2 );
str3 = sprintf('];\n');
line14Str = [ str1 str2 str3 ];


lineStr = [     line0Str ...    
                line1Str ...
                line2Str ...
                line3Str ...
                line4Str ...
                line5Str ...
                line6Str ...
                line7Str ...
                line8Str ...
                line9Str ...
                line10Str ...
                line11Str ...
                line12Str ...
                line13Str ...
                line14Str ...
        ];

clipboard('copy', lineStr);
save2word(docFileName,[],SAVE_DATA);
%-------------------------------------------------------------------------
hfig = figure('Name','All Parameters','NumberTitle','off','Visible',figVisibleState);
hAxis = plot(...
              Vfreq,20*log10(abs(s11Vpol)),'r-',...
              Vfreq,20*log10(abs(s21Vpol)),'b-',...
              Vfreq,20*log10(abs(s11Hpol)),'m-',...
              Vfreq,20*log10(abs(s21Hpol)),'c-',...
              Vfreq,20*log10(abs(CrossCoRatio)),'k-',...
              Vfreq,20*log10(abs(Isol)),'g-'...
     );
% set(hAxis,'LineWidth',1.5,'MarkerSize',8);
% set(gca,'FontSize',12); 
axis tight
xlabel('Freq[GHz]');ylabel('[dB]');
f_markFreq(VfreqSpec,'r');
legend1Handle =legend('S11Vpol','S21Vpol','S11Hpol','S21Hpol','CrossCoRatio','Isolation');set(legend1Handle, 'Box', 'off','Location','Best');
grid on;

fileName = [ polarizer.dirPath.resultsDirName '\' imageNameList{1} '_' dataTimeStr '.' figExtension];
saveas(gcf,fileName);
save2word(docFileName,gcf,SAVE_FIGURE);
delete(hfig);
%-------------------------------------------------------------------------