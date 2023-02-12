figure;
hold on
ax1 = gca;
ax1.FontSize=24;
ax1.LabelFontSizeMultiplier = 1.5;
ax1.TickLabelInterpreter='latex';
ax1.Box='on';
xlabel('$\epsilon$','FontSize',45,'Interpreter','latex');
ylabel('$\eta$','FontSize',45,'Interpreter','latex');

load('eps_eta_g=0.mat','eps', 'eta')
p2=plot(eps,eta,'.-'); p2.LineWidth=3; p2.MarkerSize=35; p2.Color='black';
load('eps_eta_g=1.mat','eps', 'eta')
p2=plot(eps,eta,'d-'); p2.LineWidth=3; p2.MarkerSize=10; p2.Color = 'magenta';

legend('$g = 0$','$g =g$1D','FontSize',45,'Interpreter','latex');