clc;clear; clear global; clear variables;
close all;
addAllMyPath_130_192_36_244
epsilonR = 1.00059;  		             % Relative Permitivity
muR      = 1;		 	                 % Relative Permeability
%Rho     = 30.e-5;	                     % Resistance in Ohm mm
Rho      = 0;	                         % Resistance in Ohm mm
Clight   = 299.7925/sqrt(epsilonR*muR);  % Velocity of Light in mm/ns
VfreqSpecAdapt = [85 104];
radius = 1.31;
modesTable = [ ...
    1 1 % TE,TM
    0 1 % TM,TM
    2 1 % TE,TM
    ];

radVec = [1.31];
figure;
for rInd = 1:numel(radVec)
    radius = radVec(rInd);
    fprintf('\nRadius: %0.3f[mm]',radius);
    for ind = 1: size(modesTable,1)
        m = modesTable(ind,1);
        n = modesTable(ind,2);
        [fc_TM(ind) kt_TM(ind) lamC_TM(ind) fc_TE(ind) kt_TE(ind) lamC_TE(ind) ] = f_CircularWaveguide(radius,m,n);
        fprintf(1,'\nTM(%d,%d): f_c: %7.3f, TE(%d,%d): f_c: %7.3f',m,n,fc_TM(ind),m,n,fc_TE(ind));
    end
    fprintf('\n');
    %-- PLOT
    subplot(numel(radVec),1,rInd);
    for ind = 1: size(modesTable,1)
        m = modesTable(ind,1);
        n = modesTable(ind,2);
        figure(1);
        plot(fc_TM(ind),0,'X',fc_TE(ind),0,'o','LineWidth',1.5);
        xlabel('Freq[GHz]');ylabel(['R:' num2str(radius) '[mm]'],'Color',[0 0 0])
        text(fc_TM(ind),-0.3,['$TM_{' num2str(m) ' , ' num2str(n) '}$'],'interpreter','latex','FontSize',8);
        text(fc_TE(ind),0.3,['$TE_{' num2str(m) ' , ' num2str(n) '}$'],'interpreter','latex','FontSize',8);
        set(gca,'YTickLabe','','YColor',[1 1 1]);
        hold on
        f_SetMarkerAt(VfreqSpecAdapt,'--r',2);
        set(gca,'xlim',[52 205])
    end
end
% set(gcf,'Units','Normalized','Position',[0 0 1 1]);
radInd = 1;
f      = linspace(fc_TM(radInd),5*fc_TM(radInd),120);
lambda = Clight./f;
k      = 2 * pi ./ lambda;
kz     = sqrt( k.^2 - kt_TM(radInd)^2);
lambdaG_By_lambda = sqrt(1./(1-(fc_TM(radInd)./f).^2));
figure;
plot(f./fc_TM(radInd),(kz./k),'-','LineWidth',3);hold on;plot(f./fc_TM(radInd),lambdaG_By_lambda,':','LineWidth',3)
ylim([0 2])
xlabel('f/f_c [GHz]','FontSize',12);title('Dispersion Curve','FontSize',12);
hLegend = legend('k_z/k','\lambda_g/\lambda');set(hLegend,'FontSize',12)
% ylabel('$\frac{k_z}{k}$','interpreter','latex','FontSize',22);
