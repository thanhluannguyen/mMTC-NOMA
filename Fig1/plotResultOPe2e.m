blue1  =[0, 0.4470, 0.7410];
orange1=[0.8500, 0.3250, 0.0980];
yellow1=[0.9290, 0.6940, 0.1250];
purple1=[0.4940, 0.1840, 0.5560];
green1 =[0.4660, 0.6740, 0.1880];
cyan1  =[0.3010, 0.7450, 0.9330];
red1   =[0.6350, 0.0780, 0.1840];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure;
% subplot(4,3,1);
% semilogy(P0dBm_ANA,OPe2e_TQoM_MTCD_II_ANA(1,:),'-','color',red1); hold on;
% semilogy(P0dBm_SIM,OPe2e_TQoM_MTCD_II_SIM(1,:),'+','color',red1); hold on;
% semilogy(P0dBm_ANA,OPe2e_PQoM_MTCD_II_ANA(1,:),'--','color',blue1); hold on;
% semilogy(P0dBm_SIM,OPe2e_PQoM_MTCD_II_SIM(1,:),'+','color',blue1); hold on;
% title('$\mathrm{D}^{[\mathrm{II}]}_{1,k^\ast}$','Interpreter','LaTex');
% xlabel('$P_0$ (dBm)','Interpreter','LaTex');
% ylabel('e2e OP','Interpreter','LaTex');
% 
% subplot(4,3,2);
% semilogy(P0dBm_ANA,OPe2e_TQoM_MTCD_II_ANA(2,:),'-','color',red1); hold on;
% semilogy(P0dBm_SIM,OPe2e_TQoM_MTCD_II_SIM(2,:),'+','color',red1); hold on;
% semilogy(P0dBm_ANA,OPe2e_PQoM_MTCD_II_ANA(2,:),'--','color',blue1); hold on;
% semilogy(P0dBm_SIM,OPe2e_PQoM_MTCD_II_SIM(2,:),'+','color',blue1); hold on;
% title('$\mathrm{D}^{[\mathrm{II}]}_{2,k^\ast}$','Interpreter','LaTex');
% xlabel('$P_0$ (dBm)','Interpreter','LaTex');
% ylabel('e2e OP','Interpreter','LaTex');
% 
% subplot(4,3,3);
% semilogy(P0dBm_ANA,OPe2e_TQoM_MTCD_II_ANA(3,:),'-','color',red1); hold on;
% semilogy(P0dBm_SIM,OPe2e_TQoM_MTCD_II_SIM(3,:),'+','color',red1); hold on;
% semilogy(P0dBm_ANA,OPe2e_PQoM_MTCD_II_ANA(3,:),'--','color',blue1); hold on;
% semilogy(P0dBm_SIM,OPe2e_PQoM_MTCD_II_SIM(3,:),'+','color',blue1); hold on;
% title('$\mathrm{D}^{[\mathrm{II}]}_{3,k^\ast}$','Interpreter','LaTex');
% xlabel('$P_0$ (dBm)','Interpreter','LaTex');
% ylabel('e2e OP','Interpreter','LaTex');
% 
% subplot(4,3,4);
% semilogy(P0dBm_ANA,squeeze(OPe2e_TCoM_MTCD_II_ANA(1,1,:)),'-','color',yellow1,'linewidth',1); hold on;
% semilogy(P0dBm_SIM,squeeze(OPe2e_TCoM_MTCD_II_SIM(1,1,:)),'+','color',yellow1);
% semilogy(P0dBm_ANA,squeeze(OPe2e_PCoM_MTCD_II_ANA(1,1,:)),'--','color',green1,'linewidth',1); hold on;
% semilogy(P0dBm_SIM,squeeze(OPe2e_PCoM_MTCD_II_SIM(1,1,:)),'+','color',green1);
% xlabel('$P_0$ (dBm)','Interpreter','LaTex');
% ylabel('e2e OP','Interpreter','LaTex');       
% title('$\mathrm{D}^{[\mathrm{II}]}_{1,1}$','Interpreter','LaTex');
% 
% subplot(4,3,7);
% semilogy(P0dBm_ANA,squeeze(OPe2e_TCoM_MTCD_II_ANA(1,2,:)),'-','color',yellow1,'linewidth',1); hold on;
% semilogy(P0dBm_SIM,squeeze(OPe2e_TCoM_MTCD_II_SIM(1,2,:)),'+','color',yellow1);
% semilogy(P0dBm_ANA,squeeze(OPe2e_PCoM_MTCD_II_ANA(1,2,:)),'--','color',green1,'linewidth',1); hold on;
% semilogy(P0dBm_SIM,squeeze(OPe2e_PCoM_MTCD_II_SIM(1,2,:)),'+','color',green1);
% xlabel('$P_0$ (dBm)','Interpreter','LaTex');
% ylabel('e2e OP','Interpreter','LaTex');       
% title('$\mathrm{D}^{[\mathrm{II}]}_{1,1}$','Interpreter','LaTex');
% 
% subplot(4,3,5);
% semilogy(P0dBm_ANA,squeeze(OPe2e_TCoM_MTCD_II_ANA(2,1,:)),'-','color',yellow1,'linewidth',1); hold on;
% semilogy(P0dBm_SIM,squeeze(OPe2e_TCoM_MTCD_II_SIM(2,1,:)),'+','color',yellow1);
% semilogy(P0dBm_ANA,squeeze(OPe2e_PCoM_MTCD_II_ANA(2,1,:)),'--','color',green1,'linewidth',1); hold on;
% semilogy(P0dBm_SIM,squeeze(OPe2e_PCoM_MTCD_II_SIM(2,1,:)),'+','color',green1);
% xlabel('$P_0$ (dBm)','Interpreter','LaTex');
% ylabel('e2e OP','Interpreter','LaTex');       
% title('$\mathrm{D}^{[\mathrm{II}]}_{1,1}$','Interpreter','LaTex');
% 
% subplot(4,3,8);
% semilogy(P0dBm_ANA,squeeze(OPe2e_TCoM_MTCD_II_ANA(2,2,:)),'-','color',yellow1,'linewidth',1); hold on;
% semilogy(P0dBm_SIM,squeeze(OPe2e_TCoM_MTCD_II_SIM(2,2,:)),'+','color',yellow1);
% semilogy(P0dBm_ANA,squeeze(OPe2e_PCoM_MTCD_II_ANA(2,2,:)),'--','color',green1,'linewidth',1); hold on;
% semilogy(P0dBm_SIM,squeeze(OPe2e_PCoM_MTCD_II_SIM(2,2,:)),'+','color',green1);
% xlabel('$P_0$ (dBm)','Interpreter','LaTex');
% ylabel('e2e OP','Interpreter','LaTex');       
% title('$\mathrm{D}^{[\mathrm{II}]}_{1,1}$','Interpreter','LaTex');
% 
% subplot(4,3,6);
% semilogy(P0dBm_ANA,squeeze(OPe2e_TCoM_MTCD_II_ANA(3,1,:)),'-','color',yellow1,'linewidth',1); hold on;
% semilogy(P0dBm_SIM,squeeze(OPe2e_TCoM_MTCD_II_SIM(3,1,:)),'+','color',yellow1);
% semilogy(P0dBm_ANA,squeeze(OPe2e_PCoM_MTCD_II_ANA(3,1,:)),'--','color',green1,'linewidth',1); hold on;
% semilogy(P0dBm_SIM,squeeze(OPe2e_PCoM_MTCD_II_SIM(3,1,:)),'+','color',green1);
% xlabel('$P_0$ (dBm)','Interpreter','LaTex');
% ylabel('e2e OP','Interpreter','LaTex');       
% title('$\mathrm{D}^{[\mathrm{II}]}_{1,1}$','Interpreter','LaTex');
% 
% subplot(4,3,10:12);
% semilogy(P0dBm_ANA,OPe2e_BTEH_MTCD_I_ANA,'-r','color',red1); hold on;
% semilogy(P0dBm_ANA,OPe2e_BPEH_MTCD_I_ANA,'-b','color',blue1); hold on;
% semilogy(P0dBm_SIM,OPe2e_BTEH_MTCD_I_SIM,'+r','color',red1); hold on;
% semilogy(P0dBm_SIM,OPe2e_BPEH_MTCD_I_SIM,'+b','color',blue1); hold on;
% legend('TQoM/TCoM (ana.)','PQoM/PCoM (ana.)',...
%        'TQoM/TCoM (sim.)','PQoM/PCoM (sim.)');
% title('$\mathrm{D}^{[\mathrm{I}]}_M$','Interpreter','LaTex');
% xlabel('$P_0$ (dBm)','Interpreter','LaTex');
% ylabel('e2e OP','Interpreter','LaTex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data_OPe2e_BXEH_MTCD_I_ANA = cell2mat(struct2cell(load('data_OPe2e_BXEH_MTCD_I_ANA.mat')));
data_OPe2e_BXEH_MTCD_I_SIM = cell2mat(struct2cell(load('data_OPe2e_BXEH_MTCD_I_SIM.mat')));
OPe2e_BTEH_MTCD_I_noNOMA = OPe2e_BXEH_MTCD_I(M,OP_BTEH_MTCD_I_noNOMA);

figure;

semilogy(P0dBm_ANA,OPe2e_BTEH_MTCD_I_ANA,'-','color',red1,'linewidth',1); hold on;
semilogy(P0dBm_SIM,OPe2e_BTEH_MTCD_I_SIM,'o','color',red1,'linewidth',1); hold on;
% semilogy(P0dBm_ANA,OPe2e_BPEH_MTCD_I_ANA,'-','color',red1,'linewidth',1); hold on;
% semilogy(P0dBm_SIM,OPe2e_BPEH_MTCD_I_SIM,'o','color',red1,'linewidth',1); hold on;

semilogy(P0dBm_ANA,data_OPe2e_BXEH_MTCD_I_ANA(1,:),'-','color',blue1,'linewidth',1); hold on;
semilogy(P0dBm_ANA,data_OPe2e_BXEH_MTCD_I_ANA(2,:),'--','color',blue1,'linewidth',1); hold on;
semilogy(P0dBm_SIM,data_OPe2e_BXEH_MTCD_I_SIM(1,:),'o','color',blue1,'linewidth',1); hold on;
semilogy(P0dBm_SIM,data_OPe2e_BXEH_MTCD_I_SIM(2,:),'x','color',blue1,'linewidth',1); hold on;

semilogy(P0dBm_SIM,OPe2e_BTEH_MTCD_I_noNOMA,'-^k','linewidth',1); hold on;
legend( 'QoM/CoM w/o EH (ana.)',...
        'QoM/CoM w/o EH (sim.)',...
        'TQoM/TCoM (ana.)',...
        'PQoM/PCoM (ana.)',...
        'TQoM/TCoM (sim.)',...
        'PQoM/PCoM (sim.)',...
        'w/o CoM, QoM, EH',...
        'Location','Best');
xlabel('$P_0$ (dBm)','Interpreter','LaTex','FontSize',14);
ylabel('e2e Outage Probability','FontSize',14);
axis([0 Inf 10^(-2) 1]);
set(gca, 'LooseInset', get(gca, 'TightInset'));

% data_OPe2e_BXEH_MTCD_I_ANA = [OPe2e_BTEH_MTCD_I_ANA;OPe2e_BPEH_MTCD_I_ANA];
% data_OPe2e_BXEH_MTCD_I_SIM = [OPe2e_BTEH_MTCD_I_SIM;OPe2e_BPEH_MTCD_I_SIM];
% save('data_OPe2e_BXEH_MTCD_I_ANA.mat','data_OPe2e_BXEH_MTCD_I_ANA');
% save('data_OPe2e_BXEH_MTCD_I_SIM.mat','data_OPe2e_BXEH_MTCD_I_SIM');