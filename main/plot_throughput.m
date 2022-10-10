%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
blue1  =[0, 0.4470, 0.7410];
orange1=[0.8500, 0.3250, 0.0980];
yellow1=[0.9290, 0.6940, 0.1250];
purple1=[0.4940, 0.1840, 0.5560];
green1 =[0.4660, 0.6740, 0.1880];
cyan1  =[0.3010, 0.7450, 0.9330];
red1   =[0.6350, 0.0780, 0.1840];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ========= XQoM ===========%
ST_TQoM_SIM = (1-OPe2e_BTEH_MTCD_I_SIM)*R_M_TQoMS/(M-1);
ST_TQoM_ANA = (1-OPe2e_BTEH_MTCD_I_ANA)*R_M_TQoMS/(M-1);
ST_PQoM_SIM = (1-OPe2e_BPEH_MTCD_I_SIM)*R_M_PQoMS/(M-1);
ST_PQoM_ANA = (1-OPe2e_BPEH_MTCD_I_ANA)*R_M_PQoMS/(M-1);
for tt = 1:(M-1)
    ST_TQoM_SIM = ST_TQoM_SIM + (1-OPe2e_TQoM_MTCD_II_SIM(tt,:))*R_t_TQoMS/(M-1);
    ST_TQoM_ANA = ST_TQoM_ANA + (1-OPe2e_TQoM_MTCD_II_ANA(tt,:))*R_t_TQoMS/(M-1);
    ST_PQoM_SIM = ST_PQoM_SIM + (1-OPe2e_PQoM_MTCD_II_SIM(tt,:))*R_t_PQoMS/(M-1);
    ST_PQoM_ANA = ST_PQoM_ANA + (1-OPe2e_PQoM_MTCD_II_ANA(tt,:))*R_t_PQoMS/(M-1);
end
% ========= XCoM ===========%
ST_TCoM_SIM = (1-OPe2e_BTEH_MTCD_I_SIM)*R_M_TCoMS/(M-1);
ST_TCoM_ANA = (1-OPe2e_BTEH_MTCD_I_ANA)*R_M_TCoMS/(M-1);
ST_PCoM_SIM = (1-OPe2e_BPEH_MTCD_I_SIM)*R_M_PCoMS/(M-1);
ST_PCoM_ANA = (1-OPe2e_BPEH_MTCD_I_ANA)*R_M_PCoMS/(M-1);
for tt = 1:(M-1)
    for kk = 1:K_t(tt)
        ST_TCoM_SIM = ST_TCoM_SIM + (1-squeeze(OPe2e_TCoM_MTCD_II_SIM(tt,kk,:))')*R_tk_TCoMS(tt,kk)/(M-1);
        ST_TCoM_ANA = ST_TCoM_ANA + (1-squeeze(OPe2e_TCoM_MTCD_II_ANA(tt,kk,:))')*R_tk_TCoMS(tt,kk)/(M-1);
        ST_PCoM_SIM = ST_PCoM_SIM + (1-squeeze(OPe2e_PCoM_MTCD_II_SIM(tt,kk,:))')*R_tk_PCoMS(tt,kk)/(M-1);
        ST_PCoM_ANA = ST_PCoM_ANA + (1-squeeze(OPe2e_PCoM_MTCD_II_ANA(tt,kk,:))')*R_tk_PCoMS(tt,kk)/(M-1);
    end
end
%% ========================================================================
figure;
tqom_ana = plot(P0dBm_ANA,ST_TQoM_ANA,'-','color',   red1,'linewidth',1); hold on;
tcom_ana = plot(P0dBm_ANA,ST_TCoM_ANA,'-','color',  blue1,'linewidth',1); hold on;
pqom_ana = plot(P0dBm_ANA,ST_PQoM_ANA,'-','color', green1,'linewidth',1); hold on;
pcom_ana = plot(P0dBm_ANA,ST_PCoM_ANA,'-','color',purple1,'linewidth',1); hold on;
% 
SIM = 1:2:length(P0dBm_SIM);
tqom_sim = plot(P0dBm_SIM(SIM),ST_TQoM_SIM(SIM),'o','color','k',...
    'markerfacecolor','None','markersize',5,'linewidth',0.5); hold on;
tcom_sim = plot(P0dBm_SIM(SIM),ST_TCoM_SIM(SIM),'o','color','k',...
    'markerfacecolor','None','markersize',5,'linewidth',0.5); hold on;
pqom_sim = plot(P0dBm_SIM(SIM),ST_PQoM_SIM(SIM),'o','color','k',...
    'markerfacecolor','None','markersize',5,'linewidth',0.5); hold on;
pcom_sim = plot(P0dBm_SIM(SIM),ST_PCoM_SIM(SIM),'o','color','k',...
    'markerfacecolor','None','markersize',5,'linewidth',0.5); hold on;
leg = legend([tqom_ana tcom_ana pqom_ana pcom_ana tqom_sim],...
       {'TQoM (ana.)','TCoM (ana.)',...
        'PQoM (ana.)','PCoM (ana.)',...
        'sim'},...
        'NumColumns',3,...
        'Location','NorthOutside');
xlabel('$P_0$ [dBm]','Interpreter','LaTex');
ylabel('Throughput [bits/s/Hz]');
axis([-50 50 0 1.2]);
set(gcf,'Position',[100 100 340 330]);
set(gca, 'LooseInset', get(gca, 'TightInset'));
leg.ItemTokenSize = [15,18];