blue1  =[0, 0.4470, 0.7410];
orange1=[0.8500, 0.3250, 0.0980];
yellow1=[0.9290, 0.6940, 0.1250];
purple1=[0.4940, 0.1840, 0.5560];
green1 =[0.4660, 0.6740, 0.1880];
cyan1  =[0.3010, 0.7450, 0.9330];
red1   =[0.6350, 0.0780, 0.1840];

figure;
semilogy(P0dBm_ANA,OP_TQoM_MTCD_II_ANA(1,:),'-','color',red1,'linewidth',1); hold on;
semilogy(P0dBm_ANA,OP_TQoM_MTCD_II_ANA(2,:),'-','color',blue1,'linewidth',1); hold on;
semilogy(P0dBm_ANA,OP_TQoM_MTCD_II_ANA(3,:),'-','color',orange1,'linewidth',1); hold on;
semilogy(P0dBm_SIM,OP_TQoM_MTCD_II_SIM(1,:),'+k','linewidth',1); hold on;
semilogy(P0dBm_SIM,OP_TQoM_MTCD_II_SIM(2,:),'+k','linewidth',1); hold on;
semilogy(P0dBm_SIM,OP_TQoM_MTCD_II_SIM(3,:),'+k','linewidth',1); hold on;
legend('$\mathrm{D}^{[\mathrm{I}]}_{1}$',...
       '$\mathrm{D}^{[\mathrm{I}]}_{2}$',...
       '$\mathrm{D}^{[\mathrm{I}]}_{3}$','Simulation',...
       'Interpreter','LaTex');
title('OP BTEH-QoM');
xlabel('$P_0$ (dBm)','Interpreter','LaTex');
ylabel('Per-Hop Outage Probability','Interpreter','LaTex');

figure;
for tt = 1:(M-1)
    for kk = 1:K_t(tt)
        subplot(M-1,max(K_t),(tt-1)*max(K_t)+kk);
        semilogy(P0dBm_ANA,squeeze(OP_TCoM_MTCD_II_ANA(tt,kk,:)),'-','color',red1,'linewidth',1); hold on;
        semilogy(P0dBm_SIM,squeeze(OP_TCoM_MTCD_II_SIM(tt,kk,:)),'+','color',red1,'linewidth',1);
        
        xlabel('$P_0$ (dBm)','Interpreter','LaTex');
        ylabel('Per-Hop OP','Interpreter','LaTex');        
        str = sprintf('$\\mathrm{D}^{[\\mathrm{II}]}_{%d,%d}$',tt,kk);
        title(str,'Interpreter','LaTex');
    end
end
legend('BTEH-CoM','Simulation');

figure;
semilogy(P0dBm_ANA,OP_PQoM_MTCD_II_ANA(1,:),'-','color',red1,'linewidth',1); hold on;
semilogy(P0dBm_ANA,OP_PQoM_MTCD_II_ANA(2,:),'-','color',blue1,'linewidth',1); hold on;
semilogy(P0dBm_ANA,OP_PQoM_MTCD_II_ANA(3,:),'-','color',orange1,'linewidth',1); hold on;
semilogy(P0dBm_SIM,OP_PQoM_MTCD_II_SIM(1,:),'+k','linewidth',1); hold on;
semilogy(P0dBm_SIM,OP_PQoM_MTCD_II_SIM(2,:),'+k','linewidth',1); hold on;
semilogy(P0dBm_SIM,OP_PQoM_MTCD_II_SIM(3,:),'+k','linewidth',1); hold on;
legend('$\mathrm{D}^{[\mathrm{I}]}_{1}$',...
       '$\mathrm{D}^{[\mathrm{I}]}_{2}$',...
       '$\mathrm{D}^{[\mathrm{I}]}_{3}$','Simulation',...
       'Interpreter','LaTex');
title('OP BPEH-QoM');
xlabel('$P_0$ (dBm)','Interpreter','LaTex');
ylabel('Per-Hop Outage Probability','Interpreter','LaTex');

figure;
for tt = 1:(M-1)
    for kk = 1:K_t(tt)
        subplot(M-1,max(K_t),(tt-1)*max(K_t)+kk);
        semilogy(P0dBm_ANA,squeeze(OP_PCoM_MTCD_II_ANA(tt,kk,:)),'-','color',red1,'linewidth',1); hold on;
        semilogy(P0dBm_SIM,squeeze(OP_PCoM_MTCD_II_SIM(tt,kk,:)),'+','color',red1,'linewidth',1);
        
        xlabel('$P_0$ (dBm)','Interpreter','LaTex');
        ylabel('Per-Hop OP','Interpreter','LaTex');        
        str = sprintf('$\\mathrm{D}^{[\\mathrm{II}]}_{%d,%d}$',tt,kk);
        title(str,'Interpreter','LaTex');
    end
end
legend('BPEH-CoM','Simulation');