function [s11_dB s22_dB freq s11 s12 s21 s22] = f_ReadVNA_MeasFile(fileName)
sParam = sparameters(fileName);
s11    = squeeze(sParam.Parameters(1,1,:));
s12    = squeeze(sParam.Parameters(1,2,:));
s21    = squeeze(sParam.Parameters(2,1,:));
s22    = squeeze(sParam.Parameters(2,2,:));
freq   = sParam.Frequencies;
s11_dB = 20*log10(abs(s11));
s22_dB = 20*log10(abs(s22));
end