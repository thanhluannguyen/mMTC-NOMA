clear all;
M = 5;
l_q = [Inf 50*ones(1,M-1)]; % meter - Distance Between Type-I MTCDs
x_q = [0]; % [0 50 100 150];
y_q = [0];% [0  0   0   0];
for tt = 2:M
    teta= -pi/4+(pi/4+pi/4)*rand;    
    x_q = [x_q l_q(tt)*cos(teta)+x_q(tt-1)];
    y_q = [y_q l_q(tt)*sin(teta)+y_q(tt-1)];
end

r_t = 25*ones(1,M-1); % meter - Coverage Radius Per DI
K_t = 2*ones(1,M-1); % MTCD - maximumActive_MTCDTypeII_CoMS len(K_m) <= M-1

lambda_t = (1e-3)*ones(1,M-1); % Type-II MTCDs/m^2 - Per Hop Type-II MTCDs Density

figure(1);
subplot(2,2,3:4);
% figure;
edgecolor_b = [  0  43 202]/255;
facecolor_b = [  0  80 239]/255;
edgecolor_r = [248 206 204]/255;
facecolor_r = [184  84  80]/255;
edgecolor_g = [213 232 212]/255;
facecolor_g = [130 179 102]/255;
source = plot(x_q,y_q,'^','markeredgecolor',edgecolor_b,'markersize',7,'markerfacecolor',facecolor_b); hold on;
plot(x_q,y_q,'-k'); hold on;
for tt = 1:(M-1)
    teta = linspace(0,2*pi,50);
    plot(r_t(tt)*sin(teta)+x_q(tt), r_t(tt)*cos(teta)+y_q(tt),':k','linewidth',1.5);
    
    for kk = 1:(K_t(tt)-1)
        rout=   (kk)/K_t(tt)*r_t(tt);
        
        plot(rout*sin(teta)+x_q(tt), rout*cos(teta)+y_q(tt),'--k');
    end
    
    N = poissrnd(2.5*lambda_t(tt)*pi*r_t(tt)^2);
    teta = 2*pi*rand(1,N);
    r_tk = r_t(tt)*sqrt(rand(1,N));    
    active = plot(r_tk.*sin(teta)+x_q(tt), r_tk.*cos(teta)+y_q(tt),'o','markeredgecolor',edgecolor_g,'markersize',5,'markerfacecolor',facecolor_g); hold on;
    
    N = poissrnd(2.5*lambda_t(tt)*pi*r_t(tt)^2);
    teta = 2*pi*rand(1,N);
    r_tk = r_t(tt)*sqrt(rand(1,N));
    inactive = plot(r_tk.*sin(teta)+x_q(tt), r_tk.*cos(teta)+y_q(tt),'o','markeredgecolor',edgecolor_r,'markersize',5,'markerfacecolor',facecolor_r); hold on;
end

legend([source active inactive],...
    {'${\rm D}^{\rm [I]}$',...
     '${\rm D}^{\rm [II]} \in \Phi^{[1]}_t$',...
     '${\rm D}^{\rm [II]} \in \Phi^{[0]}_t$'},...
     'Interpreter','LaTex',...
     'Orientation','Horizontal',...
     'Location','southoutside',...
     'FontSize',12);
set(gca,'fontsize',15);
x0=100;
y0=100;
width=400;
height=250;
set(gcf, 'position', [x0, y0, width, height]);
% axis equal
% axis([-65 (M+1)*30+15 -Inf Inf]);
set(gca, 'LooseInset', get(gca, 'TightInset'));