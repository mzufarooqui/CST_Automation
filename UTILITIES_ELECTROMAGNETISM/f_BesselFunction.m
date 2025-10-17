function besselFunc = f_BesselFunction(m,n)
% it compute the bessel function from 0 to range i.e. 100
% m: Expand bessel function around m
% n: nth zero of the bessel function

format long
besselRange = 1000;
x = [0:0.001:besselRange];
%-- J_0(x)
h_besselj = @(x)besselj(m,x);
besselFunc = fzero(h_besselj,[(n-1) n]*pi);
end


