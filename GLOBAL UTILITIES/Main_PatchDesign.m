close all;clear all;clc
f0             = 10;                                                        % frequency in GHz
epsR           = 2.14;                                                      % permitivity of substrate
tSubs          = 80*0.0254;                                                 % substrate thickness in mm
tanDelta       = 0.0006;                                                    % tan delta of the substrate
c0             = 300;                                                       % velocity of light in mm/nsec
lambda0        = c0/f0;
W_Patch        = c0/(2*f0) * sqrt( 2/(epsR+1) );
epsR_Eff       = (epsR+1)/2+(epsR-1)/2*(1+12*tSubs/W_Patch)^(-1/2);        
L_Patch_Eff    = c0/(2*f0*sqrt(epsR_Eff));
delta_L_Patch  = 0.412*tSubs * ((epsR_Eff+0.3)*(W_Patch/tSubs+0.264)) / ((epsR_Eff-0.258)*(W_Patch/tSubs+0.8));
L_Patch        = L_Patch_Eff - 2*delta_L_Patch;
L_Gnd          = 6*tSubs+L_Patch;
W_Gnd          = 6*tSubs+W_Patch;
fprintf(1,'\n----------INPUT PARAMETER----------');
fprintf(1,'\n Frequency           : %.3fGHz',f0);
fprintf(1,'\n Epsilon R           : %.3f',epsR);
fprintf(1,'\n lambda0             : %.3fmm',lambda0);
fprintf(1,'\n Substrate thickness : %.3fmm',tSubs);
fprintf(1,'\n----------OUTPUT PARAMETER----------');
fprintf(1,'\n Patch Width         : %.3fmm',W_Patch);
fprintf(1,'\n Patch Length        : %.3fmm',L_Patch);
fprintf(1,'\n Gnd Width           : %.3fmm',W_Gnd);
fprintf(1,'\n Gnd Length          : %.3fmm',L_Gnd);
fprintf(1,'\n-----------------------------------');
fprintf(1,'\n');

%-- For Aperture Coupled Patch Antenna
lambdaG = lambda0/sqrt(epsR);
N       = 10;
xSlot   = lambdaG/(2*(N+1)); % if ySlot = N*xSlot, Given that: 2 * xSlot + 2 * ySlot = lambdaG
ySlot   = N*xSlot;
fprintf(1,'\n----------FOR ACPA IF X-SLOT=N * Y-SLOT----------');
fprintf(1,'\n x slot          = %.1f * y slot',N);
fprintf(1,'\n x slot          : %.3fmm',xSlot);
fprintf(1,'\n y slot          : %.3fmm',ySlot);
fprintf(1,'\n-----------------------------------');
fprintf(1,'\n');
