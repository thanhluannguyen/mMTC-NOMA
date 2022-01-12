function out = OP_BTEH_MTCD_I(M,PL_I2I,r_t,PA_QoMS,CPA_QoMS,...
    rho_t,eta_t,alpha_t,g_0,lambda_t,R_M_QoMS)
 
    iota_t = exp(-pi*lambda_t.*r_t.^2); % - Null Probability Observed at DI_0 --> DI_(M-1)
    biota_t= 1 - iota_t;
    Omega_t= (M-1)*alpha_t.*eta_t./(1-alpha_t);    
    
    % Outage Probability at Type-I MTCD: (DI_1 --> DI_M)
    SP_MTCDI_TQoM = zeros(1,M);
    for tt = 1:(M-1)
        a_1 = 2^( (M-1)*R_M_QoMS )-1;
        a_2 = 2^( (M-1)*R_M_QoMS/(1-alpha_t(tt+1)) )-1;
        a_3 = a_1/( 1-(a_1+1)*(1-PA_QoMS(2)) );
        a_4 = a_2/( 1-(a_2+1)*(1-PA_QoMS(2)) );
        
        if (a_1 < PA_QoMS(2)/CPA_QoMS(1))
            SP_MTCDI_TQoM(tt+1) = SP_MTCDI_TQoM(tt+1)...
                + (1-rho_t(tt+1))*biota_t(tt)*cCDF_X_t(rho_t,g_0,PL_I2I,Omega_t,tt+1,a_3);
        end
        if (a_2 < PA_QoMS(2)/CPA_QoMS(1))
            SP_MTCDI_TQoM(tt+1) = SP_MTCDI_TQoM(tt+1)...
                  + (rho_t(tt+1))*biota_t(tt)*cCDF_X_t(rho_t,g_0,PL_I2I,Omega_t,tt+1,a_4);
        end
    end
    out = 1 - SP_MTCDI_TQoM;
end