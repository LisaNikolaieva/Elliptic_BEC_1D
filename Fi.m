function [Fi] = Fi(gamma,kappa,Psi)

sigma=sqrt(sqrt(1+gamma*abs(Psi).^2));

Fi=-(kappa.^2)/8+0.5./(sigma.^2)+0.5*(sigma.^2)+gamma.*(abs(Psi).^2)./(sigma.^2);

end


 