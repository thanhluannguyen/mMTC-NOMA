% -------------------------------------------------------------------------
% Cumulative Distribution Function of the Normalized Received Power
%   Observed at the Type-I MTCD DI_2 -> DI_M
% -------------------------------------------------------------------------
function out = cCDF_X_t(rho_t,g_0,PL_I2I,Omega_t,tt,x)
    cCDF_X0_t = (1-rho_t(tt-1)) * exp(-x/(g_0*PL_I2I(tt)));
    cCDF_X1_t = 0;
    for tau = 1:(tt-2)
        barXi = prod(Omega_t((tau+1):(tt-1)).*PL_I2I((tau+1):(tt-1)));
        inputVal = x./( g_0*PL_I2I(tt)*barXi );
        result = meijerGtol([],[],[ones(1,tt-tau-1),0],[],inputVal);
%         WSCPfoxH(tt-tau,0,0,tt-tau,[],[ones(tt-tau-1,1) ones(tt-tau-1,1); 0 1],inputVal);
%         if (isnan(result)) || (result < 0) || (abs(result) == Inf)
%             result = meijerGtol([],[],[ones(1,tt-tau-1),0],[],inputVal);
%         end
        cCDF_X1_t= cCDF_X1_t + (1-rho_t(tau))*prod(rho_t( (tau+1):(tt-1)))* result;
    end
    out = (cCDF_X0_t+cCDF_X1_t);
end