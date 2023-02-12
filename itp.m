for e= 0.995%[0.93, 0.94, 0.95, 0.955, 0.96, 0.965, 0.97, 0.975, 0.98, 0.984, 0.987, 0.99, 0.992, 0.994, 0.995]
    
Config;
nitp=350;      % number of iterations

%%

h1 = figure;
figure(h1);


for i=1:nitp
    i
 
    
    Psi = ifftn(eD_itp.*fftn(Psi));                     % a half of the linear step
    Psi = exp((Fi(gamma,kappa,Psi))*dt_itp).*Psi;         % nonlinear step
    Psi = ifftn(eD_itp.*fftn(Psi));                     % a half of the linear step

    exp_mu = sqrt(No/(sum(abs(Psi).^2)*dx));  % multiplier for normalization
    Psi = Psi*exp_mu;                                   % normalization

    MU(i) = log(exp_mu)/(-dt_itp);                         % chemical potential
    I(i)=i;                                             % number of iteration
    


    %% Figure 
    figure(h1);
    h1.Color='k';
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
    ax.Box='on';
    xlabel('$i$','FontSize',40,'Interpreter','latex');
    ylabel('$\mu$','FontSize',40,'Interpreter','latex');
    hold on
    p=plot(I,MU,'c.-');
    p.MarkerSize=15;
    
    

end

MU(end)                                                                                                     % the last obtained chemical potential
muF=sum(HPsi(kk,Fi(gamma,kappa,Psi),Psi).*conj(Psi))/sum(abs(Psi.^2))
DeltaPsi=ifftn(0.5*kk.*fftn(Psi))+(Fi(gamma,kappa,Psi)-muF).*Psi;                      % residual of Fi

%% Figures and saving
Results;                                                        
% save(['Psi/g=',num2str(mult),'/Psi_DeltaPsi_e=',num2str(e),'.mat'],'Psi','DeltaPsi','e')
clear  

end
