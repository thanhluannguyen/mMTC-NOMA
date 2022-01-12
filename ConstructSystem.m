clear all;
M = 3;
iS = zeros(1,M+1);
xS = zeros(1,M+1);
yS = zeros(1,M+1);

lamdaS = 5e-5;
L = 1000;

NS = poissrnd(lamdaS*L^2);
xSArray = rand(1,NS)*L-L/2;
ySArray = rand(1,NS)*L-L/2;

for m = 1:(M+1)
    if (m >= 2)
        dS = sqrt( (xSArray-xS(m-1)).^2 + (ySArray-yS(m-1)).^2 ); 
    else, dS = sqrt(xSArray.^2+ySArray.^2);
    end
    [~,iS(m)] = min(dS);
    xS(m) = xSArray(iS(m));
    yS(m) = ySArray(iS(m));
        xSArray(iS(m)) = Inf;
        ySArray(iS(m)) = Inf;
end
for m = 1:(M+1)
    xSArray(iS(m)) = xS(m);
    ySArray(iS(m)) = yS(m);
end

numberOfuser = 250;
xUser = rand(1,numberOfuser)*L-L/2;
yUser = rand(1,numberOfuser)*L-L/2;
userInAc = plot(xUser,yUser,'ok',...
            'MarkerFaceColor','r','MarkerSize',4); hold on;

theta = linspace(0,2*pi,50);
circleX = zeros(M,50);
circleY = zeros(M,50);
radius = zeros(1,M);
for m = 1:M
    p = setdiff(1:M+1,m);
    
    radius(m) = min(sqrt( (xS(m)-xS(p)).^2 + (yS(m)-yS(p)).^2 ))/2; 
    circleX(m,:) = radius(m)*cos(theta) + xS(m);
    circleY(m,:) = radius(m)*sin(theta) + yS(m);
end
voronoi(xSArray,ySArray); hold on;
for m = 1:(M+1)
    %%% Source/Destination
    if (m <= M)
        source = plot(xSArray(iS(m)),ySArray(iS(m)),'sk',...
                      'MarkerFaceColor','b','MarkerSize',6);
    else
        destination = plot(xSArray(iS(m)),ySArray(iS(m)),'sk',...
                      'MarkerFaceColor','b','MarkerSize',6);
    end
    if (m <= M)
        theta = linspace(0,2*pi,50); 
        K = [1 2 3];%randi([1,3],[1,M+1]);
        for k = 1:(K(m)-1)
            r = radius(m)*k/K(m);
            xx = r*cos(theta) + xS(m);
            yy = r*sin(theta) + yS(m);
            plot(xx,yy,'--k');
        end
    end
    if (m <= M)
        plot(circleX(m,:),circleY(m,:),'--k');
        plot([xSArray(iS(m)) xSArray(iS(m+1))],...
             [ySArray(iS(m)) ySArray(iS(m+1))],'-k');
        
        N = poissrnd(5*10^(-4)*radius(m)^2*2*pi);
        thetaRNG = 2*pi*rand(1,N);
        xRNG = radius(m)*sqrt(rand(1,N)).*cos(thetaRNG) + xS(m);
        yRNG = radius(m)*sqrt(rand(1,N)).*sin(thetaRNG) + yS(m);
        userAc = plot(xRNG,yRNG,'ok',...
            'MarkerFaceColor','g','MarkerSize',5); hold on;
    end
end
legend([source userInAc,userAc],...
       {'Type-I MTCD','Inactive Type-II MTCD','Active Type-II MTCD'},...
       'Interpreter','Latex');
xlabel('$x$ ($m$)', 'Interpreter','Latex');
ylabel('$y$ ($m$)', 'Interpreter','Latex');
set(gca,'FontSize',13);
set(gca, 'LooseInset', get(gca, 'TightInset'));

axis([-250 250 -250 250]);
axis equal

x0=100;
y0=100;
width=400;
height=250;
set(gcf, 'position', [x0, y0, width, height])