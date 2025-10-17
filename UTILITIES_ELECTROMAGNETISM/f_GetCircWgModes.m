function [Ex_Sin Ey_Sin Hx_Sin Hy_Sin Ex_Cos Ey_Cos Hx_Cos Hy_Cos] = f_GetCircWgModes(modeType,m,n,phi,rho,f,a)
load chiPrimValue
load chiValue
velLight   = 300;  % Velocity of Light in mm/ns
eps_m      = 1 * ( m == 0 ) + 2 * ( m > 0 );
eps_n      = 1 * ( n == 0 ) + 2 * ( n > 0 );
%-- Chi, Chi', Jm and Jm'
chi_m_n   = chiValue(m+1,n);
chiPr_m_n = chiPrimValue(m+1,n);
J         = @(m,in)( besselj( m , in ) );
J_Prime   = @(m,in)( (J( m-1 , in ) - J( m+1 , in ))/2  );

switch modeType
    case 'TE'
        %-- For TE Modes
        k0 = 2 * pi * f / velLight;
        kt_TE = chiPr_m_n / a;
        kz_TE = sqrt( k0^2 - kt_TE^2 );
        fc_TE = kt_TE / ( 2 * pi) * velLight;
        
        psi_m_n_Cos  =   sqrt( eps_m / pi ) * ( chiPr_m_n /(sqrt(chiPr_m_n)^2 - m^2))            * J(m,chiPr_m_n*rho/a) / ( a * J(m,chiPr_m_n) )       .* cos( m * phi );
        psi_m_n_Sin  =   sqrt( eps_m / pi ) * ( chiPr_m_n /(sqrt(chiPr_m_n)^2 - m^2))            * J(m,chiPr_m_n*rho/a) / ( a * J(m,chiPr_m_n) )       .* sin( m * phi );
        
        
        
        eRho_TE_Cos  =    sqrt( eps_m / pi ) * ( J(m,chiPr_m_n*rho/a) /(sqrt(chiPr_m_n)^2 - m^2)) * m ./ ( rho * J(m,chiPr_m_n) )                      .* sin( m * phi );
        eRho_TE_Sin  =  - sqrt( eps_m / pi ) * ( J(m,chiPr_m_n*rho/a) /(sqrt(chiPr_m_n)^2 - m^2)) * m ./ ( rho * J(m,chiPr_m_n) )                      .* cos( m * phi );
        
        ePhi_TE_Cos  =   sqrt( eps_m / pi ) * ( chiPr_m_n /(sqrt(chiPr_m_n)^2 - m^2))            * J_Prime(m,chiPr_m_n*rho/a) / ( a * J(m,chiPr_m_n) ) .* cos( m * phi );
        ePhi_TE_Sin  =   sqrt( eps_m / pi ) * ( chiPr_m_n /(sqrt(chiPr_m_n)^2 - m^2))            * J_Prime(m,chiPr_m_n*rho/a) / ( a * J(m,chiPr_m_n) ) .* sin( m * phi );
        
        hRho_TE_Cos  = - sqrt( eps_m / pi ) * chiPr_m_n/(sqrt((chiPr_m_n)^2-m^2)) * J_Prime(m,chiPr_m_n*rho/a)./(a*J(m,chiPr_m_n)) .* cos( m * phi );
        hRho_TE_Sin  = - sqrt( eps_m / pi ) * chiPr_m_n/(sqrt((chiPr_m_n)^2-m^2)) * J_Prime(m,chiPr_m_n*rho/a)./(a*J(m,chiPr_m_n)) .* sin( m * phi );        
        
        
        hPhi_TE_Cos  =    sqrt( eps_m / pi ) * m/(sqrt((chiPr_m_n)^2-m^2))        * J(m,chiPr_m_n*rho/a)./(rho*J(m,chiPr_m_n))    .* sin( m * phi );
        hPhi_TE_Sin  =  - sqrt( eps_m / pi ) * m/(sqrt((chiPr_m_n)^2-m^2))        * J(m,chiPr_m_n*rho/a)./(rho*J(m,chiPr_m_n))    .* cos( m * phi );
        
        %-- Transformation from Cylindrical to Cartesian
        Ex_TE_Sin = eRho_TE_Sin .* cos(phi) - ePhi_TE_Sin .* sin(phi);
        Ey_TE_Sin = eRho_TE_Sin .* sin(phi) + ePhi_TE_Sin .* cos(phi);
        Hx_TE_Sin = hRho_TE_Sin .* cos(phi) - hPhi_TE_Sin .* sin(phi);
        Hy_TE_Sin = hRho_TE_Sin .* sin(phi) + hPhi_TE_Sin .* cos(phi);
        
        Ex_TE_Cos = eRho_TE_Cos .* cos(phi) - ePhi_TE_Cos .* sin(phi);
        Ey_TE_Cos = eRho_TE_Cos .* sin(phi) + ePhi_TE_Cos .* cos(phi);
        Hx_TE_Cos = hRho_TE_Cos .* cos(phi) - hPhi_TE_Cos .* sin(phi);
        Hy_TE_Cos = hRho_TE_Cos .* sin(phi) + hPhi_TE_Cos .* cos(phi);
        %-- Field should be zero outside the circular waveguide
        Ex_TE_Sin(rho>a) = NaN;
        Ey_TE_Sin(rho>a) = NaN;
        Hx_TE_Sin(rho>a) = NaN;
        Hy_TE_Sin(rho>a) = NaN;
        
        Ex_TE_Cos(rho>a) = NaN;
        Ey_TE_Cos(rho>a) = NaN;
        Hx_TE_Cos(rho>a) = NaN;
        Hy_TE_Cos(rho>a) = NaN;
        
        Ex_Sin = Ex_TE_Sin;
        Ey_Sin = Ey_TE_Sin;
        Hx_Sin = Hx_TE_Sin;
        Hy_Sin = Hy_TE_Sin;
        
        Ex_Cos = Ex_TE_Cos;
        Ey_Cos = Ey_TE_Cos;
        Hx_Cos = Hx_TE_Cos;
        Hy_Cos = Hy_TE_Cos;
    case 'TM'
        %-- For TM Modes
        kt_TM = chi_m_n / a;
        fc_TM = kt_TM / ( 2 * pi) * velLight;
        
        phi_m_n_Cos  =   sqrt( eps_m / pi ) * ( J(m,chi_m_n*rho/a) /(a*J(m+1,chi_m_n)) )                      .* cos( m * phi );
        phi_m_n_Sin  =   sqrt( eps_m / pi ) * ( J(m,chi_m_n*rho/a) /(a*J(m+1,chi_m_n)) )                      .* sin( m * phi );
        
        eRho_TM_Cos  = - sqrt( eps_m / pi ) * ( J_Prime(m,chi_m_n*rho/a) /(a*J(m+1,chi_m_n)))                 .* cos( m * phi );
        eRho_TM_Sin  = - sqrt( eps_m / pi ) * ( J_Prime(m,chi_m_n*rho/a) /(a*J(m+1,chi_m_n)))                 .* sin( m * phi );
        
        ePhi_TM_Cos  =   sqrt( eps_m / pi ) * ( m / chi_m_n) * J(m,chi_m_n*rho/a) ./ ( rho * J(m+1,chi_m_n) ) .* sin( m * phi );
        ePhi_TM_Sin  = - sqrt( eps_m / pi ) * ( m / chi_m_n) * J(m,chi_m_n*rho/a) ./ ( rho * J(m+1,chi_m_n) ) .* cos( m * phi );
        
        hRho_TM_Cos  = - sqrt( eps_m / pi ) * ( J(m,chi_m_n*rho/a) ./(rho*J(m+1,chi_m_n)))                     .* sin( m * phi );
        hRho_TM_Sin  =   sqrt( eps_m / pi ) * ( J(m,chi_m_n*rho/a) ./(rho*J(m+1,chi_m_n)))                     .* cos( m * phi );
        
        hPhi_TM_Cos  = - sqrt( eps_m / pi ) * J_Prime(m,chi_m_n*rho/a) ./ ( a * J(m+1,chi_m_n) )               .* cos( m * phi );
        hPhi_TM_Sin  = - sqrt( eps_m / pi ) * J_Prime(m,chi_m_n*rho/a) ./ ( a * J(m+1,chi_m_n) )               .* sin( m * phi );
        %-- Transformation from Cylindrical to Cartesian
        Ex_TM_Sin = eRho_TM_Sin .* cos(phi) - ePhi_TM_Sin .* sin(phi);
        Ey_TM_Sin = eRho_TM_Sin .* sin(phi) + ePhi_TM_Sin .* cos(phi);
        Hx_TM_Sin = hRho_TM_Sin .* cos(phi) - hPhi_TM_Sin .* sin(phi);
        Hy_TM_Sin = hRho_TM_Sin .* sin(phi) + hPhi_TM_Sin .* cos(phi);
        
        Ex_TM_Cos = eRho_TM_Cos .* cos(phi) - ePhi_TM_Cos .* sin(phi);
        Ey_TM_Cos = eRho_TM_Cos .* sin(phi) + ePhi_TM_Cos .* cos(phi);
        Hx_TM_Cos = hRho_TM_Cos .* cos(phi) - hPhi_TM_Cos .* sin(phi);
        Hy_TM_Cos = hRho_TM_Cos .* sin(phi) + hPhi_TM_Cos .* cos(phi);
        %-- Field should be zero outside the circular waveguide
        Ex_TM_Sin(rho>a) = NaN;
        Ey_TM_Sin(rho>a) = NaN;
        Hx_TM_Sin(rho>a) = NaN;
        Hy_TM_Sin(rho>a) = NaN;
        
        Ex_TM_Cos(rho>a) = NaN;
        Ey_TM_Cos(rho>a) = NaN;
        Hx_TM_Cos(rho>a) = NaN;
        Hy_TM_Cos(rho>a) = NaN;
        
        Ex_Sin = Ex_TM_Sin;
        Ey_Sin = Ey_TM_Sin;
        Hx_Sin = Hx_TM_Sin;
        Hy_Sin = Hy_TM_Sin;
        
        Ex_Cos = Ex_TM_Cos;
        Ey_Cos = Ey_TM_Cos;
        Hx_Cos = Hx_TM_Cos;
        Hy_Cos = Hy_TM_Cos;
end
end