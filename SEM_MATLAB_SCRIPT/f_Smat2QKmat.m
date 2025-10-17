function[H_QQ,H_QU,H_UQ,H_UU,K_QI,K_QV,K_UI,K_UV]=f_Smat2QKmat(sxx,sxy,syx,syy)


H_QQ = 0.5 *( (abs(sxx)).^2 + (abs(syy)).^2 - (abs(sxy)).^2 - (abs(syx)).^2 );
H_QU =   real(syx .* conj(syy)) - real(sxx .* conj(sxy));
H_UQ =  -imag(sxx .* conj(syx)) + imag(sxy .* conj(syy));
H_UU =   imag(sxy .* conj(syx)) + imag(sxx .* conj(syy));

K_QI =  0.5*( (abs(sxx)).^2 - (abs(syx)).^2 + (abs(sxy)).^2 - (abs(syy)).^2 );
K_QV =  imag(sxx .* conj(sxy)) - imag(syx .* conj(syy));
K_UI = -imag(sxx .* conj(syx)) - imag(sxy .* conj(syy)) ;
K_UV =  real(sxx .* conj(syy)) - real(sxy .* conj(syx));

return
