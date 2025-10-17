function [H_QQ,H_QU,H_UQ,H_UU,K_QI,K_QV,K_UI,K_UV] = f_Smat2QKmatNoCrossCoupling(sxx,sxy,syx,syy)


H_QQ = 0.5 *( (abs(sxx)).^2 + (abs(syy)).^2 );
H_QU =   0;
H_UQ =  0;
H_UU =   imag( sxx .* conj(syy) );

K_QI =  0.5*( (abs(sxx)).^2 - (abs(syy)).^2 );
K_QV =  imag(sxx .* conj(sxy)) - imag(syx .* conj(syy));
K_UI = 0;
K_UV =  real(sxx .* conj(syy) );
end
