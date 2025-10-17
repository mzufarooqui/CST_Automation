function excitCoeffDeg = f_GetExcitationCoeffFromScanDir(scanAngleDeg,freq,spacing)
epsilonR = 1.00059;
muR = 1;			
Clight = 299.7925/sqrt(epsilonR*muR); 
lambda = Clight/freq;
K0     = 2*pi/lambda;
excitCoeffDeg = rad2deg( K0 * spacing * sin(deg2rad(scanAngleDeg)));
end