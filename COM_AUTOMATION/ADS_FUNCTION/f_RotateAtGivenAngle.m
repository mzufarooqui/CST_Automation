function pRot = f_RotateAtGivenAngle(p,angDeg)
DEBUG = 0;
[theta1,rho1] = cart2pol(p(1),p(2));
zComplexRot   = rho1 * exp(1j*(theta1+angDeg*pi/180));
pRot(1) = real(zComplexRot);
pRot(2) = imag(zComplexRot);
if DEBUG
    fprintf(1,'\n Before Rotation:Cart:(x:%.3f,y:%.3f), Polar:(r:%.3f,theta:%.3f)',p(1),p(2),rho1,theta1*180/pi);
    fprintf(1,'\n After Rotation:Cart:(x:%.3f,y:%.3f), Polar:(r:%.3f,theta:%.3f)',pRot(1),pRot(2),abs(zComplexRot),angle(zComplexRot)*180/pi);
    fprintf(1,'\n');
end

end