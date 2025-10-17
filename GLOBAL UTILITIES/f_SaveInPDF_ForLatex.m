function f_SaveInPDF_ForLatex(fileNameList)
%-- Save all figure in EPS2 and then remove extra white space around the plot and save as pdf format
fullGsPath  = 'C:\Program Files (x86)\GPLGS\gswin32c.exe';
orientation = 0;
hFigs = sort(findobj('Type','figure'));
for figInd = 1:numel(hFigs)
    epsFileName = [ pwd '/' fileNameList{figInd} '.eps'];
    pdfFileName = [ pwd '/' fileNameList{figInd} '.pdf'];
    if (exist(epsFileName, 'file') == 2)
        delete(epsFileName);
    end
    if (exist(pdfFileName, 'file') == 2)
        delete(pdfFileName);
    end
    print(hFigs(figInd), '-depsc2', '-r300',epsFileName);
    [result,msg] = eps2pdf([ pwd '/' fileNameList{figInd} '.eps'],fullGsPath,orientation);
end
end