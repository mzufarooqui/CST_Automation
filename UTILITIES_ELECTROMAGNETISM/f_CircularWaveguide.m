function [fc_TM kt_TM lamC_TM fc_TE kt_TE lamC_TE ] = f_CircularWaveguide(radius,m,n)
% m: Expand bessel function around m
% n: nth zero of the bessel function
load chiPrimValue
load chiValue
epsilonR = 1.00059;  		             % Relative Permitivity
muR      = 1;		 	                 % Relative Permeability
%Rho     = 30.e-5;	                     % Resistance in Ohm mm
Rho      = 0;	                         % Resistance in Ohm mm
Clight   = 299.7925/sqrt(epsilonR*muR);  % Velocity of Light in mm/ns
%-- Cutoff wave number
kt_TM = chiValue(m+1,n) / radius;
kt_TE = chiPrimValue(m+1,n) / radius;
%-- Cutoff wavelength
lamC_TM = 2 * pi * radius / chiValue(m+1,n);
lamC_TE = 2 * pi * radius / chiPrimValue(m+1,n);
%-- Cutoff Frequency
fc_TM   = kt_TM / ( 2 * pi ) * Clight;
fc_TE   = kt_TE / ( 2 * pi ) * Clight;
end