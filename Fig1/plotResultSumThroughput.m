%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
blue1  =[0, 0.4470, 0.7410];
orange1=[0.8500, 0.3250, 0.0980];
yellow1=[0.9290, 0.6940, 0.1250];
purple1=[0.4940, 0.1840, 0.5560];
green1 =[0.4660, 0.6740, 0.1880];
cyan1  =[0.3010, 0.7450, 0.9330];
red1   =[0.6350, 0.0780, 0.1840];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
OPe2e_BTEH_MTCD_I_SIM = OPe2e_BXEH_MTCD_I(M,OP_BTEH_MTCD_I_SIM);
OPe2e_BPEH_MTCD_I_SIM = OPe2e_BXEH_MTCD_I(M,OP_BPEH_MTCD_I_SIM);
OPe2e_TQoM_MTCD_II_SIM= OPe2e_XQoM_MTCD_II(OP_TQoM_MTCD_II_SIM,M,OP_BTEH_MTCD_I_SIM);
OPe2e_PQoM_MTCD_II_SIM= OPe2e_XQoM_MTCD_II(OP_PQoM_MTCD_II_SIM,M,OP_BPEH_MTCD_I_SIM);
OPe2e_TCoM_MTCD_II_SIM= OPe2e_XCoM_MTCD_II(K_t,OP_TCoM_MTCD_II_SIM,M,OP_BTEH_MTCD_I_SIM);
OPe2e_PCoM_MTCD_II_SIM= OPe2e_XCoM_MTCD_II(K_t,OP_PCoM_MTCD_II_SIM,M,OP_BPEH_MTCD_I_SIM);
OPe2e_BTEH_MTCD_I_noNOMA = OPe2e_BXEH_MTCD_I(M,OP_BTEH_MTCD_I_noNOMA);
OPe2e_BPEH_MTCD_I_noNOMA = OPe2e_BXEH_MTCD_I(M,OP_BPEH_MTCD_I_noNOMA);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ========= XQoM ===========%
ST_TQoM_SIM = (1-OPe2e_BTEH_MTCD_I_SIM)*R_M_TQoMS/(M-1);
ST_TQoM_ANA = (1-OPe2e_BTEH_MTCD_I_ANA)*R_M_TQoMS/(M-1);
for tt = 1:(M-1)
    ST_TQoM_SIM = ST_TQoM_SIM + (1-OPe2e_TQoM_MTCD_II_SIM(tt,:))*R_t_TQoMS/(M-1);
    ST_TQoM_ANA = ST_TQoM_ANA + (1-OPe2e_TQoM_MTCD_II_ANA(tt,:))*R_t_TQoMS/(M-1);
end
ST_PQoM_SIM = (1-OPe2e_BPEH_MTCD_I_SIM)*R_M_PQoMS/(M-1);
ST_PQoM_ANA = (1-OPe2e_BPEH_MTCD_I_ANA)*R_M_PQoMS/(M-1);
for tt = 1:(M-1)
    ST_PQoM_SIM = ST_PQoM_SIM + (1-OPe2e_PQoM_MTCD_II_SIM(tt,:))*R_t_PQoMS/(M-1);
    ST_PQoM_ANA = ST_PQoM_ANA + (1-OPe2e_PQoM_MTCD_II_ANA(tt,:))*R_t_PQoMS/(M-1);
end
% ========= XCoM ===========%
ST_TCoM_SIM = (1-OPe2e_BTEH_MTCD_I_SIM)*R_M_TCoMS/(M-1);
ST_TCoM_ANA = (1-OPe2e_BTEH_MTCD_I_ANA)*R_M_TCoMS/(M-1);
for tt = 1:(M-1)
    for kk = 1:K_t(tt)
        ST_TCoM_SIM = ST_TCoM_SIM + (1-squeeze(OPe2e_TCoM_MTCD_II_SIM(tt,kk,:))')*R_tk_TCoMS(tt,kk)/(M-1);
        ST_TCoM_ANA = ST_TCoM_ANA + (1-squeeze(OPe2e_TCoM_MTCD_II_ANA(tt,kk,:))')*R_tk_TCoMS(tt,kk)/(M-1);
    end
end
ST_PCoM_SIM = (1-OPe2e_BPEH_MTCD_I_SIM)*R_M_PCoMS/(M-1);
ST_PCoM_ANA = (1-OPe2e_BPEH_MTCD_I_ANA)*R_M_PCoMS/(M-1);
for tt = 1:(M-1)
    for kk = 1:K_t(tt)
        ST_PCoM_SIM = ST_PCoM_SIM + (1-squeeze(OPe2e_PCoM_MTCD_II_SIM(tt,kk,:))')*R_tk_PCoMS(tt,kk)/(M-1);
        ST_PCoM_ANA = ST_PCoM_ANA + (1-squeeze(OPe2e_PCoM_MTCD_II_ANA(tt,kk,:))')*R_tk_PCoMS(tt,kk)/(M-1);
    end
end
% ========= noNOMA ===========%
ST_BTEH_noNOMA = (1-OPe2e_BTEH_MTCD_I_noNOMA)*RateQoS*maxRateQoS/(M-1);
ST_BPEH_noNOMA = (1-OPe2e_BPEH_MTCD_I_noNOMA)*RateQoS*maxRateQoS/(M-1);
% ==========================%
blue1  =[0, 0.4470, 0.7410];
orange1=[0.8500, 0.3250, 0.0980];
yellow1=[0.9290, 0.6940, 0.1250];
purple1=[0.4940, 0.1840, 0.5560];
green1 =[0.4660, 0.6740, 0.1880];
cyan1  =[0.3010, 0.7450, 0.9330];
red1   =[0.6350, 0.0780, 0.1840];

data4SIM = cell2mat(struct2cell(load('data4SIM_rho_0_0.mat')));
data4ANA = cell2mat(struct2cell(load('data4ANA_rho_0_0.mat')));
data0NOMA= cell2mat(struct2cell(load('data0NOMA_rho_0_0.mat')));

figure;
plot(P0dBm_ANA,ST_TQoM_ANA,'-','color',red1,'linewidth',1); hold on;
plot(P0dBm_ANA,ST_TCoM_ANA,'--','color',red1,'linewidth',1); hold on;
plot(P0dBm_ANA,ST_PQoM_ANA,'-','color',blue1,'linewidth',1); hold on;
plot(P0dBm_ANA,ST_PCoM_ANA,'--','color',blue1,'linewidth',1); hold on;

plot(P0dBm_ANA,data4ANA(1,:),'-','color',yellow1,'linewidth',1); hold on;
plot(P0dBm_ANA,data4ANA(3,:),'--','color',yellow1,'linewidth',1); hold on;

plot(P0dBm_SIM,ST_TQoM_SIM,'o','color',orange1,'linewidth',1); hold on;
plot(P0dBm_SIM,ST_TCoM_SIM,'o','color',green1,'linewidth',1); hold on;
plot(P0dBm_SIM,data0NOMA(1,:),'-^k','linewidth',1); hold on;

plot(P0dBm_SIM,ST_PQoM_SIM,'o','color',orange1,'linewidth',1); hold on;
plot(P0dBm_SIM,ST_PCoM_SIM,'o','color',green1,'linewidth',1); hold on;
plot(P0dBm_SIM,data4SIM(1,:),'o','color',orange1,'linewidth',1); hold on;
plot(P0dBm_SIM,data4SIM(3,:),'o','color',green1,'linewidth',1); hold on;

legend('TQoM (ana.)','TCoM (ana.)',...
       'PQoM (ana.)','PCoM (ana.)',...
       'QoM w/o EH (ana.)',...
       'CoM w/o EH (ana.)',...
       'QoM (sim.)',...
       'CoM (sim.)',...
       'w/o CoM, QoM, EH',... 
       'Location','NorthWest');
xlabel('$P_0$ (dBm)','Interpreter','LaTex','FontSize',14);
ylabel('Throughput (bits/s/Hz)','FontSize',14);
axis([-Inf Inf 0 1.2]);
set(gca, 'LooseInset', get(gca, 'TightInset'));

% data4SIM = [ST_TQoM_SIM;ST_PQoM_SIM;ST_TCoM_SIM;ST_PCoM_SIM];
% data4ANA = [ST_TQoM_ANA;ST_PQoM_ANA;ST_TCoM_ANA;ST_PCoM_ANA];
% data0NOMA= [ST_BTEH_noNOMA;ST_BPEH_noNOMA];
% save('data4SIM_rho_0_0.mat','data4SIM');
% save('data4ANA_rho_0_0.mat','data4ANA');
% save('data0NOMA_rho_0_0.mat','data0NOMA');