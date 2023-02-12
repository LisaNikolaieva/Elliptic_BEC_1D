Config;
u=linspace(-5,5,256);
v=linspace(-5,5,256);
[U,V] = meshgrid(u,v);

load('Psi/g=0/Psi_DeltaPsi_e=0.995.mat');

% sigma=sqrt(sqrt(1+gamma*abs(Psi).^2));
sigma=1;
Psi_x=max(abs(Psi_mult*Psi))*exp(-(U.^2+V.^2)/(2*max(sigma)^2))/(sqrt(pi)*max(x_mult*sigma)); %1/m^(3/2)

Psi_y=min(abs(Psi_mult*Psi))*exp(-(U.^2+V.^2)/(2*min(sigma)^2))/(sqrt(pi)*min(x_mult*sigma)); %1/m^(3/2)

figure;
s1=subplot(1,2,1)
hold on
ax1 = gca;
ax1.FontSize=24;
ax1.LabelFontSizeMultiplier = 1.5;
ax1.TickLabelInterpreter='latex';
ax1.Box='on';
xlabel('$z, \mu m$','FontSize',45,'Interpreter','latex');
ylabel('$x, \mu m$','FontSize',45,'Interpreter','latex');
ss=surf(u*x_mult*1e6,v*x_mult*1e6,1e-6*abs(Psi_x).^2); ss.EdgeColor='none'; daspect([1 1 1]); view(2)
cb=colorbar;
cb.TickLabelInterpreter='latex';
    cb.Location='eastoutside';
    cb.Label.String='$\rho$, $1/$cm$^3$';
    cb.Label.Interpreter='latex';
    cb.Label.FontSize=16;
    cb.Label.Position=[1 -3.1 0];
    cb.Label.Rotation=0;
caxis([0 1.99*1e9])
%     xlim([-Lz/2*r_mult_microm,Lz/2*r_mult_microm]);
%     ylim([-Lx/2*r_mult_microm,Lx/2*r_mult_microm]);

s2 = subplot(1,2,2) 
hold on
ax1 = gca;
ax1.FontSize=24;
ax1.LabelFontSizeMultiplier = 1.5;
ax1.TickLabelInterpreter='latex';
ax1.Box='on';
xlabel('$z, \mu m$','FontSize',45,'Interpreter','latex');
ylabel('$y, \mu m$','FontSize',45,'Interpreter','latex');
ss=surf(u*x_mult*1e6,v*x_mult*1e6,1e-6*abs(Psi_y).^2); ss.EdgeColor='none'; daspect([1 1 1]); view(2)
cb=colorbar;
cb.TickLabelInterpreter='latex';
    cb.Location='eastoutside';
    cb.Label.String='$\rho$, $1/$cm$^3$';
    cb.Label.Interpreter='latex';
    cb.Label.FontSize=16;
    cb.Label.Position=[1 -3.1 0];
    cb.Label.Rotation=0;
caxis([0 1.99*1e9])
%     xlim([-Lz/2*r_mult_microm,Lz/2*r_mult_microm]);
%     ylim([-Lx/2*r_mult_microm,Lx/2*r_mult_microm]);
