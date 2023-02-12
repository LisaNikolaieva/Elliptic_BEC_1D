
h2=figure('visible', 'on',  'Position', [50 -50 2000 1000]);
figure(h2);
h2.Color='k';
set(gca,'Color','k');
set(gca,'xcolor','[0.55 0.55 0.55]') 
set(gca,'ycolor','[0.55 0.55 0.55]') 
set(gcf, 'InvertHardCopy', 'off');
ax = gca;
ax.FontSize=20;
ax.LabelFontSizeMultiplier = 2.5;
ax.TickLabelInterpreter='latex';
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
hold on
% daspect([10 1 1])

% p11=plot(x,Psi,'.-');
% p11.MarkerSize=10;
p11=plot(x/L,a*abs(Psi).^2,'.-');
p11.MarkerSize=10;

% p21=plot(x,Fi,'.-');
% p21.MarkerSize=10;

% 
% p12=plot(x/L,abs(DeltaPsi),'.-');
% p12.MarkerSize=10;




% p22=plot(x,DeltaFi,'.-');
% p22.MarkerSize=10;
xlabel('s/L','FontSize',30,'Interpreter','latex');
% l=legend({'$|\Psi|$','$\Phi$','$|\Delta\Psi|$','$\Delta\Phi$'},'FontSize',30,'Interpreter','latex');
% l.TextColor = '[0.65 0.65 0.65]';
l=legend({'$a|\Psi|^2$','$|\Delta\Psi|$'},'FontSize',30,'Interpreter','latex');
l.TextColor = '[0.65 0.65 0.65]';
% tit=title(['$\frac{|\Delta\Psi|_{max}}{|\Psi|_{max}}$ = ',num2str(max(max(max(abs(DeltaPsi))))/max(max(max(abs(Psi))))),',      $\frac{|\Delta\Phi|_{max}}{|\Phi|_{max}}$ = ',num2str(max(max(max(abs(DeltaFi))))/max(max(max(abs(Fi)))))],'FontSize',30,'Interpreter','latex');
% tit.Color = '[0.65 0.65 0.65]';