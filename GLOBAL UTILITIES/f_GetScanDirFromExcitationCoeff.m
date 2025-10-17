function scanAngleDeg = f_GetScanDirFromExcitationCoeff(excitCoeffDeg,freq,spacing,theta0Deg,SEL_OPT)
epsilonR = 1.00059;
muR = 1;
Clight = 299.7925/sqrt(epsilonR*muR);
lambda = Clight/freq;
K0     = 2*pi/lambda;

if isempty(theta0Deg) % for theta direction i.e. along X-Axis
    scanAngleDeg = rad2deg(asin( deg2rad(excitCoeffDeg)/(K0.*spacing)));
else
    dx = spacing(1);
    dy = spacing(2);
    alpha        = atan(dy/dx);
    R            = sqrt(dx^2+dy^2);
    switch SEL_OPT
        case 'THETA_THEN_PHI'
            scanAngleDeg = rad2deg( alpha + acos( deg2rad(excitCoeffDeg) / (R * K0 * sin(deg2rad(theta0Deg)))) );
        case 'PHI_THEN_THETA'
            scanAngleDeg = rad2deg(asin( deg2rad(excitCoeffDeg) / (K0 * R * cos( deg2rad(theta0Deg) - alpha ) ) ));
    end
end