% for mult=0;%[0.05 0.1 0.2 0.5 1]; 
% e=0.99999;

Config;
niter=350;
h1=figure;



%% ITP
tic

    PsiL=Psi;
    PsiR=Psi;
    khi=0.5;
    dt_itp=1;
    dt=0.1;
    eD_hp_itp = exp(0.5*dt*(0.5)*kk/(1i));
    
for i=1:niter
    I(i)=i;
    

    
    [PsiL, MUL(i), dEL(i)]=SSFM(eD_hp_itp,dt_itp,No,Fi(gamma,kappa,Psi),kk,dx,Psi);
    [PsiS, MUS(i), dES(i)]=SSFM(eD_hp_itp,khi*dt_itp,No,Fi(gamma,kappa,Psi),kk,dx,Psi);
    
    if (MUL(i)<MUS(i))||(dEL(i)<dES(i))
        Psi=PsiL;
        khi=sqrt(khi);
        MU(i)=MUL(i);
    else
        Psi=PsiS;
        dt_itp=khi*dt_itp;
        eD_hp_itp = exp(0.5*dt_itp*(-0.5)*kk);
        khi=khi^2;
        MU(i)=MUS(i);
    end
    
    

     

    
    
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
    xlabel('i','FontSize',40,'Interpreter','latex');
    ylabel('$\mu$','FontSize',40,'Interpreter','latex');
    hold on
    p=plot(I,MU,'c.-');
    p.MarkerSize=15;
    
    
    
    
    
    
    
    
    
end
toc
MU(end)


%% Residual
muF=sum(HPsi(kk,Fi(gamma,kappa,Psi),Psi).*conj(Psi))/sum(abs(Psi.^2))
DeltaPsi=ifftn(0.5*kk.*fftn(Psi))+(Fi(gamma,kappa,Psi)-muF).*Psi;


mu=real(muF);
disp(mu);

Results;

save(['Psi_DeltaPsi_e=',num2str(e),'_mult=',num2str(mult),'.mat'],'Psi','DeltaPsi')
clear
% end