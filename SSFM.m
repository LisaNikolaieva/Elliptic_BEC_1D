function [Psi, mu, dE] = SSFM(eD_hp_itp,dt_itp,No,Fi,kk,dV,Psi)

    Psi = ifftn(eD_hp_itp.*fftn(Psi));
    Psi = exp(-(Fi)*dt_itp).*Psi;
    Psi = ifftn(eD_hp_itp.*fftn(Psi));
    
    exp_mu = sqrt(No/(sum((abs(Psi).^2))*dV));
    Psi = Psi*exp_mu;

    mu = log(exp_mu)/dt_itp;
    H_Psi=HPsi(kk,Fi,Psi);
    dE=dV*sum(abs(H_Psi).^2)-(dV*sum(conj(Psi).*H_Psi)).^2;


end