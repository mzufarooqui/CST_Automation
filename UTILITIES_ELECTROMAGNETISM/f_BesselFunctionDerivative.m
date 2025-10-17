function besselFuncDerivVal = f_BesselFunctionDerivative(m,n)
% it compute the bessel function from 0 to range i.e. 100
% m: Expand bessel function around m
% n: nth zero of the bessel function

format long
%-- J'_0(x) = ( J_-1(x) - J_+1(x) )/2
hFunc = @(x)(( besselj(m-1,x) - besselj(m+1,x) )/2);
x0 = [0 1] * pi;
rootCnt = 0;
nIter   = 1;
exitflag = 1;
while rootCnt < n
    while exitflag ~=1
        [temp,fval,exitflag]= fzero(hFunc,x0);
        if exitflag == -6
            x0(end) = x0(end)+pi;
        end
    end
    %     temp    = fzero(hFunc,x0);
    if temp ~= 0
        rootCnt = rootCnt + 1;
        zeroFound(rootCnt) = temp;
    end
    x0 = x0 + pi;
    nIter = nIter + 1;
end
besselFuncDerivVal = zeroFound(n);




% [x,fval,exitflag] = fzero(...) returns a value exitflag that describes the exit condition of fzero:
% 1 : Function converged to a solution x.
% -1: Algorithm was terminated by the output function.
% -3: NaN or Inf function value was encountered during search for an interval containing a sign change.
% -4: Complex function value was encountered during search for an interval containing a sign change.
% -5: fzero might have converged to a singular point.
% -6: fzero can not detect a change in sign of the function.

